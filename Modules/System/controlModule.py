import System.utils as utils
import importlib
importlib.reload(utils)

import maya.cmds as cmds

class ControlModule():
    def __init__(self, moduleNamespace):
        self.moduleContainer = None

        if moduleNamespace == None:
            return

        moduleNamespaceInfo = utils.stripAllNamespaces(moduleNamespace)

        self.blueprintNamespace = moduleNamespaceInfo[0]
        self.moduleNamespace = moduleNamespaceInfo[1]
        self.characterNamespaceOnly = utils.stripLeadingNamespace(self.blueprintNamespace)[0]

        self.moduleContainer = self.blueprintNamespace + ":" + self.moduleNamespace + ":module_container"

        self.publishedNames = []

    def install_custom(self, joints, moduleGrp, moduleContainer):
        print(f"install_custom() method not implemented by derived module!")

    def install_requirements(self):
        return True

    def compatibleBlueprintModules(self):
        return ("-1",)

    def UI(self, parentLayout):
        print("No custom user interface provided!")

    def UI_preferences(self, parentLayout):
        print("No custom preferences provided!")

    def match(self, *args):
        print("No matching functionality provided!")

    def install(self):
        if self.install_requirements() == False:
            return

        nodes = self.install_init()
        joints = nodes[0]
        moduleGrp = nodes[1]
        moduleContainer = nodes[2]

        self.install_custom(joints, moduleGrp, moduleContainer)

        self.install_finalise()

    def install_init(self):
        cmds.namespace(setNamespace=self.blueprintNamespace)
        cmds.namespace(add=self.moduleNamespace)
        cmds.namespace(setNamespace=":")

        blueprintContainer = self.blueprintNamespace + ":module_container"
           
        self.joints = self.duplicateAndRenameCreationPose()
        moduleJointsGrp = self.joints[0]

        moduleGrp = cmds.group(empty=True, name=self.blueprintNamespace + ":" + self.moduleNamespace + ":module_grp")
        hookIn = self.blueprintNamespace + ":HOOK_IN"
        cmds.parent(moduleGrp, hookIn, relative=True)
        cmds.parent(moduleJointsGrp, moduleGrp, absolute=True)

        cmds.select(moduleGrp)
        cmds.addAttr(at="float", ln="iconScale", min=0.001, softMaxValue=10.0, defaultValue=1, k=True)
        cmds.setAttr(moduleGrp + ".overrideEnabled", 1)
        cmds.setAttr(moduleGrp + ".overrideColor", 6)

        utilityNodes = self.setupBlueprintWeightBasedBlending()

        self.setupModuleVisibility(moduleGrp)

        containedNodes = list(self.joints)
        containedNodes.append(moduleGrp)
        containedNodes.extend(utilityNodes)

        self.moduleContainer = cmds.container(n=self.moduleContainer)
        utils.addNodeToContainer(self.moduleContainer, containedNodes, ihb=True)
        utils.addNodeToContainer(blueprintContainer, self.moduleContainer)

        index = 0
        for joint in self.joints:
            if index > 0:
                niceJointName = utils.stripAllNamespaces(joint)[1]
                self.publishNameToModuleContainer(joint + ".rotate", niceJointName + "_R", publishToOuterContainers=False)

            index += 1

        self.publishNameToModuleContainer(moduleGrp + ".lod", "Control_LOD")
        self.publishNameToModuleContainer(moduleGrp + ".iconScale", "Icon_Scale")
        self.publishNameToModuleContainer(moduleGrp + ".overrideColor", "Icon_Colour")
        self.publishNameToModuleContainer(moduleGrp + ".visibility", "Vis", publishToOuterContainers=False)

        return(self.joints, moduleGrp, self.moduleContainer)

    def duplicateAndRenameCreationPose(self):
        joints = cmds.duplicate(self.blueprintNamespace + ":creationPose_joints_grp", renameChildren=True)

        for i in range(len(joints)):
            nameSuffix = joints[i].rpartition("creationPose_")[2]
            joints[i] = cmds.rename(joints[i], self.blueprintNamespace + ":" + self.moduleNamespace + ":" + nameSuffix)

        return joints

    def setupBlueprintWeightBasedBlending(self):
        settingsLocator = self.blueprintNamespace + ":SETTINGS"

        attributes = cmds.listAttr(settingsLocator, keyable=False)
        weightAttributes = []
        for attr in attributes:
            if attr.find("_weight") != -1:
                weightAttributes.append(attr)

        value = 0
        if len(weightAttributes) == 0:
            value = 1
            cmds.setAttr(settingsLocator + ".creationPoseWeight", 0)

        cmds.select(settingsLocator)
        weightAttributeName = self.moduleNamespace + "_weight"
        cmds.addAttr(ln=weightAttributeName, at="double", min=0, max=1, defaultValue=value, keyable=False)

        cmds.container(self.blueprintNamespace + ":module_container", edit=True, publishAndBind=[settingsLocator + "." + weightAttributeName, weightAttributeName])

        currentEntries = cmds.attributeQuery("activeModule", n=settingsLocator, listEnum=True)

        newEntry = self.moduleNamespace

        if currentEntries[0] == "None":
            cmds.addAttr(settingsLocator + ".activeModule", edit=True, enumName=newEntry)
            cmds.setAttr(settingsLocator + ".activeModule", 0)
        else:
            cmds.addAttr(settingsLocator + ".activeModule", edit=True, enumName=currentEntries[0] + ":" + newEntry)

        utilityNodes = []
        for i in range(1, len(self.joints)):
            joint = self.joints[i]

            nameSuffix = utils.stripAllNamespaces(joint)[1]
            blueprintJoint = self.blueprintNamespace + ":blueprint_" + nameSuffix

            weightNodeAttr = settingsLocator + "." + weightAttributeName

            if i < len(self.joints) - 1 or len(self.joints) == 2:
                multiplyRotations = cmds.shadingNode("multiplyDivide", n=joint + "_multiplyRotationsWeight", asUtility=True)
                utilityNodes.append(multiplyRotations)
                cmds.connectAttr(joint + ".rotate", multiplyRotations + ".input1", force=True)

                for attr in ["input2X", "input2Y", "input2Z"]:
                    cmds.connectAttr(weightNodeAttr, multiplyRotations + "." + attr, force=True)

                index = utils.findFirstFreeConnection(blueprintJoint + "_addRotations.input3D")
                cmds.connectAttr(multiplyRotations + ".output", blueprintJoint + "_addRotations.input3D[" + str(index) + "]")

            if i == 1:
                addNode = blueprintJoint + "_addTranslate"
                if cmds.objExists(addNode):
                    multiplyTranslation = cmds.shadingNode("multiplyDivide", n=joint + "_multiplyTranslationWeight", asUtility=True)
                    utilityNodes.append(multiplyTranslation)

                    cmds.connectAttr(joint + ".translate", multiplyTranslation + ".input1", force=True)
                    for attr in ["input2X", "input2Y", "input2Z"]:
                        cmds.connectAttr(weightNodeAttr, multiplyTranslation + "." + attr, force=True)

                    index = utils.findFirstFreeConnection(addNode + ".input3D")
                    cmds.connectAttr(multiplyTranslation + ".output", addNode + ".input3D[" + str(index) + "]", force=True)

                addNode = blueprintJoint + "_addScale"
                if cmds.objExists(addNode):
                    multiplyScale = cmds.shadingNode("multiplyDivide", n=joint + "_multiplyScaleWeight", asUtility=True)
                    utilityNodes.append(multiplyScale)

                    cmds.connectAttr(joint + ".scale", multiplyScale + ".input1", force=True)
                    for attr in ["input2X", "input2Y", "input2Z"]:
                        cmds.connectAttr(weightNodeAttr, multiplyScale + "." + attr, force=True)

                    index = utils.findFirstFreeConnection(addNode + ".input3D")
                    cmds.connectAttr(multiplyScale + ".output", addNode + ".input3D[" + str(index) + "]", force=True)
            else:
                multiplyTranslation = cmds.shadingNode("multiplyDivide", n=joint + "_multiplyTranslationWeight", asUtility=True)
                utilityNodes.append(multiplyTranslation)

                cmds.connectAttr(joint + ".translateX", multiplyTranslation + ".input1X", force=True)
                cmds.connectAttr(weightNodeAttr, multiplyTranslation + ".input2X", force=True)

                addNode = blueprintJoint + "_addTx"
                index = utils.findFirstFreeConnection(addNode + ".input1D")
                cmds.connectAttr(multiplyTranslation + ".outputX", addNode + ".input1D[" + str(index) + "]", force=True)

        return utilityNodes

    def setupModuleVisibility(self, moduleGrp):
        cmds.select(moduleGrp, replace=True)
        cmds.addAttr(at="byte", defaultValue=1, minValue=0, softMaxValue=3, longName="lod", k=True)

        moduleVisibilityMultiply = self.characterNamespaceOnly + ":moduleVisibilityMultiply"
        cmds.connectAttr(moduleVisibilityMultiply + ".outputX", moduleGrp + ".visibility", force=True)

    def publishNameToModuleContainer(self, attribute, attributeNiceName, publishToOuterContainers=True):
        if self.moduleContainer == None:
            return

        blueprintName = utils.stripLeadingNamespace(self.blueprintNamespace)[1].partition("__")[2]

        attributePrefix = blueprintName + "_" + self.moduleNamespace + "_"
        publishedName = attributePrefix + attributeNiceName

        if publishToOuterContainers:
            self.publishedNames.append(publishedName)

        cmds.container(self.moduleContainer, edit=True, publishAndBind=[attribute, publishedName])

    def install_finalise(self):
        self.publishModuleContainerNamesToOuterContainers()

        cmds.setAttr(self.blueprintNamespace + ":blueprint_joints_grp.controlModulesInstalled", True)
        
    def publishModuleContainerNamesToOuterContainers(self):
        if self.moduleContainer == None:
            return

        characterContainer = self.characterNamespaceOnly + ":character_container"
        blueprintContainer = self.blueprintNamespace + ":module_container"

        for publishedName in self.publishedNames:
            outerPublishedNames = cmds.container(blueprintContainer, q=True, publishName=True)
            if publishedName in outerPublishedNames:
                continue

            cmds.container(blueprintContainer, edit=True, publishAndBind=[self.moduleContainer + "." + publishedName, publishedName])
            cmds.container(characterContainer, edit=True, publishAndBind=[blueprintContainer + "." + publishedName, publishedName])

    def uninstall(self):
        characterContainer = self.characterNamespaceOnly + ":character_container"
        blueprintContainer = self.blueprintNamespace + ":module_container"
        moduleContainer = self.moduleContainer

        containers = [characterContainer, blueprintContainer, moduleContainer]
        
        containers.pop()

        blueprintJointsGrp = self.blueprintNamespace + ":blueprint_joints_grp"
        blueprintJoints = utils.findJointChain(blueprintJointsGrp)
        blueprintJoints.pop(0)

        settingsLocator = self.blueprintNamespace + ":SETTINGS"

        connections = cmds.listConnections(blueprintJoints[0] + "_addRotations", source=True, destination=False)
        if len(connections) == 2:
            cmds.setAttr(blueprintJointsGrp + ".controlModulesInstalled", False)

        publishedNames = cmds.container(moduleContainer, q=True, publishName=True)
        publishedNames.sort()

        for name in publishedNames:
            outerPublishedNames = cmds.container(characterContainer, q=True, publishName=True)
            if name in outerPublishedNames:
                cmds.container(characterContainer, edit=True, unbindAndUnpublish=blueprintContainer + "." + name)
                cmds.container(blueprintContainer, edit=True, unbindAndUnpublish=moduleContainer + "." + name)

        cmds.delete(moduleContainer)

        weightAttributeName = self.moduleNamespace + "_weight"
        cmds.deleteAttr(settingsLocator + "." + weightAttributeName)

        attributes = cmds.listAttr(settingsLocator, keyable=False)
        weightAttributes = []
        for attr in attributes:
            if attr.find("_weight") != -1:
                weightAttributes.append(attr)

        totalWeight = 0
        for attr in weightAttributes:
            totalWeight += cmds.getAttr(settingsLocator + "." + attr)

        cmds.setAttr(settingsLocator + ".creationPoseWeight", 1 - totalWeight)

        currentEntries = cmds.attributeQuery("activeModule", n=settingsLocator, listEnum=True)
        currentEntriesList = currentEntries[0].split(":")

        ourEntry = self.moduleNamespace

        currentEntriesString = ""
        for entry in currentEntriesList:
            if entry != ourEntry:
                currentEntriesString += entry + ":"

        if currentEntriesString == "":
            currentEntriesString = "None"

        cmds.addAttr(settingsLocator + ".activeModule", edit=True, enumName=currentEntriesString)

        cmds.setAttr(settingsLocator + ".activeModule", 0)

        cmds.namespace(setNamespace=self.blueprintNamespace)
        cmds.namespace(removeNamespace=self.moduleNamespace)
        cmds.namespace(setNamespace=":")

    def duplicateControlModule(self, withAnimation=True):
        """Duplicate this control module; optionally copy its animCurves to the duplicate."""
        # Base paths/names
        old_ns = self.moduleNamespace
        bp_ns = self.blueprintNamespace
        old_ns_prefix = f":{old_ns}:"
        module_container = self.moduleContainer
        blueprint_container = f"{bp_ns}:module_container"

        # Collect all animCurves that drive this module (inside or outside namespace)
        module_nodes = cmds.container(module_container, q=True, nodeList=True) or []

        anim_curves = set(
            cmds.listConnections(module_nodes, s=True, d=False, type="animCurve") or []
        )
        
        # Snapshot connections for all curves
        curve_in = {}
        curve_out = {}
        for curve in anim_curves:
            curve_in[curve] = cmds.listConnections(curve, plugs=True, connections=True,
                                                   source=True, destination=False) or []
            curve_out[curve] = cmds.listConnections(curve, plugs=True, connections=True,
                                                    source=False, destination=True) or []

        # Duplicate the module container without input connections (avoids sharing animCurves)
        cmds.namespace(addNamespace="TEMP")
        cmds.namespace(setNamespace="TEMP")
        cmds.duplicate(module_container, inputConnections=False)
        cmds.namespace(setNamespace=f":{bp_ns}")
        module_namespaces = cmds.namespaceInfo(listOnlyNamespaces=True)

        base = old_ns.rpartition("_")[0] + "_"
        base_full = f"{bp_ns}:{base}"
        new_suffix = utils.findHighestTrailingNumber(module_namespaces, base_full) + 1
        new_ns = f"{base}{new_suffix}"

        cmds.namespace(addNamespace=new_ns)
        cmds.namespace(setNamespace=":")
        cmds.namespace(moveNamespace=["TEMP", f"{bp_ns}:{new_ns}"])
        cmds.namespace(removeNamespace="TEMP")

        # Update internal state to new duplicate
        self.moduleNamespace = new_ns
        new_ns_prefix = f":{new_ns}:"
        new_module_container = f"{bp_ns}:{new_ns}:module_container"
        utils.addNodeToContainer(blueprint_container, new_module_container)

        # Republish names with the new namespace
        pubs = cmds.container(new_module_container, q=True, publishName=True) or []
        driven = [(n, cmds.connectionInfo(new_module_container + "." + n, getExactSource=True)) for n in pubs]
        for name, src in driven:
            cmds.container(new_module_container, edit=True, unbindAndUnpublish=src)
            new_name = name.replace(old_ns, new_ns)
            cmds.container(new_module_container, edit=True, publishAndBind=[src, new_name])

        # Refresh publishedNames cache and republish outward
        self.moduleContainer = module_container
        new_pub_names = []
        for name in self.findAllNamesPublishedToOuterContainers():
            new_pub_names.append(name.replace(old_ns, new_ns))
        self.publishedNames = new_pub_names
        self.moduleContainer = new_module_container
        self.publishModuleContainerNamesToOuterContainers()

        # Rebuild utilities
        to_delete = []
        joints_grp = f"{bp_ns}:{new_ns}:joints_grp"
        self.joints = utils.findJointChain(joints_grp)
        for j in self.joints:
            for suffix in ("_multiplyRotationsWeight", "_multiplyTranslationWeight", "_multiplyScaleWeight"):
                node = j + suffix
                if cmds.objExists(node):
                    to_delete.append(node)
        if to_delete:
            cmds.delete(to_delete, inputConnectionsAndNodes=False)
        utils.addNodeToContainer(new_module_container, self.setupBlueprintWeightBasedBlending())

        # Remove any animCurves that may have come along
        stray = cmds.ls(f"{bp_ns}:{new_ns}:*", type="animCurve") or []
        if stray:
            cmds.delete(stray)

        if withAnimation:
            duplicated = []
            for curve in anim_curves:
                leaf = (utils.stripAllNamespaces(curve) or ["", curve])[1]
                new_curve_name = curve.replace(old_ns_prefix, new_ns_prefix) if old_ns_prefix in curve \
                                 else f"{bp_ns}:{new_ns}:{leaf}"
                new_curve = cmds.duplicate(curve, name=new_curve_name)[0]
                duplicated.append(new_curve)

                # Incoming (time -> curve.input)
                for i in range(0, len(curve_in[curve]), 2):
                    src = curve_in[curve][i]
                    dst = curve_in[curve][i + 1]
                    new_dst = dst.replace(curve, new_curve) if curve in dst else dst.replace(old_ns_prefix, new_ns_prefix)
                    try:
                        cmds.connectAttr(src, new_dst, force=True)
                    except Exception as e:
                        print(f"Warning: failed to connect {src} -> {new_dst}: {e}")

                # Outgoing (curve.output -> targets)
                for i in range(0, len(curve_out[curve]), 2):
                    src = curve_out[curve][i]
                    dst = curve_out[curve][i + 1]
                    new_src = src.replace(curve, new_curve)
                    new_dst = dst.replace(old_ns_prefix, new_ns_prefix)
                    if new_dst == dst and old_ns_prefix not in dst:
                        target_leaf = (utils.stripAllNamespaces(dst) or ["", dst.split('.')[-2].split(':')[-1]])[1]
                        new_dst = f"{bp_ns}:{new_ns}:{target_leaf}"
                    try:
                        cmds.connectAttr(new_src, new_dst, force=True)
                    except Exception as e:
                        print(f"Warning: failed to connect {new_src} -> {new_dst}: {e}")

            if not duplicated:
                print("DuplicateControlModule: No animCurves found to duplicate.")
        else:
            # Strip any animCurves under the new namespace
            stray = cmds.ls(f"{bp_ns}:{new_ns}:*", type="animCurve") or []
            if stray:
                cmds.delete(stray)
       
    def findAllNamesPublishedToOuterContainers(self):
        if self.moduleContainer == None:
            return []

        blueprintContainer = self.blueprintNamespace + ":module_container"

        modulePublishedNames = cmds.container(self.moduleContainer, q=True, publishName=True)
        blueprintPublishedNames = cmds.container(blueprintContainer, q=True, publishName=True)

        returnPublishedNames = []
        for name in modulePublishedNames:
            if name in blueprintPublishedNames:
                returnPublishedNames.append(name)

        return returnPublishedNames



