CLASS_NAME = "FK"

TITLE = "Forward Kinematics"

DESCRIPTION = "This module provides FK rotational controls for every joint in the blueprint it is installed on."

import System.utils as utils
import importlib
importlib.reload(utils)

import maya.cmds as cmds

# import System.controlObject as controlObject
# importlib.reload(controlObject)

# import System.controlModule as controlModule
#reload(controlModule)

class FK():
    def __init__(self, moduleNamespace):
        # controlModule.ControlModule.__init__(self, moduleNamespace)

        self.moduleContainer = None

        if moduleNamespace == None:
            return
        
        moduleNamespaceInfo = utils.stripAllNamespaces(moduleNamespace)
        self.blueprintNamespace = moduleNamespaceInfo[0]
        self.moduleNamespace = moduleNamespaceInfo[1]
        self.characterNamespace = utils.stripLeadingNamespace(self.blueprintNamespace)[0]

        self.moduleContainer = self.blueprintNamespace + ":" + self.moduleNamespace + ":module_container"

        self.publishedNames = []

    def compatibleBlueprintModules(self):
        return ("Finger", "HingeJoint", "LegFoot", "SingleJointSegment", "SingleOrientableJoint", "Spline", "Thumb",)

    def install(self):
        self.install_init()

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

        # self.setupModuleVisibility(moduleGrp)

        # containedNodes = list(self.joints)
        # containedNodes.append(moduleGrp)
        # containedNodes.extend(utilityNodes)

        # self.moduleContainer = cmds.container(n=self.moduleContainer)
        # utils.addNodeToContainer(self.moduleContainer, containedNodes, ihb=True)
        # utils.addNodeToContainer(blueprintContainer, self.moduleContainer)

        # index = 0
        # for joint in self.joints:
        #     if index > 0:
        #         niceJointName = utils.stripAllNamespaces(joint)[1]
        #         self.publishNameToModuleContainer(joint + ".rotate", niceJointName + "_R", publishToOuterContainers=False)

        #     index += 1

        # self.publishNameToModuleContainer(moduleGrp + ".lod", "Control_LOD")
        # self.publishNameToModuleContainer(moduleGrp + ".iconScale", "Icon_Scale")
        # self.publishNameToModuleContainer(moduleGrp + ".overrideColor", "Icon_Colour")
        # self.publishNameToModuleContainer(moduleGrp + ".visibility", "Vis", publishToOuterContainers=False)

        # return(self.joints, moduleGrp, self.moduleContainer)

    def duplicateAndRenameCreationPose(self):
        joints = cmds.duplicate(self.blueprintNamespace + ":creationPose_joints_grp", renameChildren=True)

        for i in range(len(joints)):
            nameSuffix = joints[i].rpartition("creationPose_")[2]
            joints[i] = cmds.rename(joints[i], self.blueprintNamespace + ":" + self.moduleNamespace + ":" + nameSuffix)

        return joints

    # def setupBlueprintWeightBasedBlending(self):
    #     settingsLocator = self.blueprintNamespace + ":SETTINGS"
    #     print(f"SETTINGS LOCATOR: {settingsLocator}")

    #     attributes = cmds.listAttr(settingsLocator, keyable=False) or []
    #     print(f"ATTRIBUTES: {attributes}")

    #     weightAttributes = [attr for attr in attributes if "_weight" in attr]
    #     print(f"WEIGHT ATTRIBUTES: {weightAttributes}")

    #     value = 0
    #     if not weightAttributes:
    #         value = 1
    #         cmds.setAttr(settingsLocator + ".creationPoseWeight", 0)

    #     cmds.select(settingsLocator)
    #     weightAttributeName = self.moduleNamespace + "_weight"
    #     print(f"WEIGHT ATTRIBUTE NAME: {weightAttributeName}")

    #     # Check if attribute exists before adding
    #     if not cmds.attributeQuery(weightAttributeName, node=settingsLocator, exists=True):
    #         cmds.addAttr(settingsLocator, ln=weightAttributeName, at="double", min=0, max=1, defaultValue=value, keyable=False)
    #         print(f"Attribute {weightAttributeName} added successfully.")
    #     else:
    #         print(f"Attribute {weightAttributeName} already exists.")

    #     # Verify that the attribute was created
    #     if cmds.attributeQuery(weightAttributeName, node=settingsLocator, exists=True):
    #         attr_value = cmds.getAttr(f"{settingsLocator}.{weightAttributeName}")
    #         print(f"Successfully created {weightAttributeName} with value: {attr_value}")
    #     else:
    #         print(f"Failed to create {weightAttributeName}")

    #     # Check if the container exists before modifying
    #     container_node = self.blueprintNamespace + ":module_container"
    #     if not cmds.objExists(container_node):
    #         print(f"Error: Container {container_node} does not exist!")
    #         return

    #     # Check published attributes before publishing
    #     existing_published_attrs = cmds.container(container_node, query=True, publishName=True) or []
    #     print(f"Published attributes in {container_node}: {existing_published_attrs}")

    #     # Check if the attribute is already published before publishing it
    #     if weightAttributeName not in existing_published_attrs:
    #         cmds.container(container_node, edit=True, publishAndBind=[f"{settingsLocator}.{weightAttributeName}", weightAttributeName])
    #         print(f"Published {weightAttributeName} to {container_node}.")
    #     else:
    #         print(f"Attribute {weightAttributeName} is already published.")
        
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

                # index = utils.findFirstFreeConnection(blueprintJoint + "_addRotations.input3D")
                index = 1
                cmds.connectAttr(multiplyRotations + ".output", blueprintJoint + "_addRotations.input3D[" + str(index) + "]")

            if i == 1:
                print("CHECK ROOT TRANSFORM")
                # addNode = blueprintJoint + "_addTranslate"
                # if cmds.objExists(addNode):
                #     multiplyTranslation = cmds.shadingNode("multiplyDivide", n=joint + "_multiplyTranslationWeight", asUtility=True)
                #     utilityNodes.append(multiplyTranslation)

                #     cmds.connectAttr(joint + ".translate", multiplyTranslation + ".input1", force=True)
                #     for attr in ["input2X", "input2Y", "input2Z"]:
                #         cmds.connectAttr(weightNodeAttr, multiplyTranslation + "." + attr, force=True)

                #     index = utils.findFirstFreeConnection(addNode + ".input3D")
                #     cmds.connectAttr(multiplyTranslation + ".output", addNode + ".input3D[" + str(index) + "]", force=True)

                # addNode = blueprintJoint + "_addScale"
                # if cmds.objExists(addNode):
                #     multiplyScale = cmds.shadingNode("multiplyDivide", n=joint + "_multiplyScaleWeight", asUtility=True)
                #     utilityNodes.append(multiplyScale)

                #     cmds.connectAttr(joint + ".scale", multiplyScale + ".input1", force=True)
                #     for attr in ["input2X", "input2Y", "input2Z"]:
                #         cmds.connectAttr(weightNodeAttr, multiplyScale + "." + attr, force=True)

                #     index = utils.findFirstFreeConnection(addNode + ".input3D")
                #     cmds.connectAttr(multiplyScale + ".output", addNode + ".input3D[" + str(index) + "]", force=True)
            else:
                multiplyTranslation = cmds.shadingNode("multiplyDivide", n=joint + "_multiplyTranslationWeight", asUtility=True)
                utilityNodes.append(multiplyTranslation)

                cmds.connectAttr(joint + ".translateX", multiplyTranslation + ".input1X", force=True)
                cmds.connectAttr(weightNodeAttr, multiplyTranslation + ".input2X", force=True)

                addNode = blueprintJoint + "_addTx"
                # index = utils.findFirstFreeConnection(addNode + ".input1D")
                index = 1
                cmds.connectAttr(multiplyTranslation + ".outputX", addNode + ".input1D[" + str(index) + "]", force=True)

        return utilityNodes
    
    # def install_custom(self, joints, moduleGrp, moduleContainer):
    #     controlsGrp = cmds.group(empty=True, name=self.blueprintNamespace + ":" + self.moduleNamespace + ":controls_grp")
    #     cmds.parent(controlsGrp, moduleGrp, absolute=True)
    #     utils.addNodeToContainer(moduleContainer, controlsGrp)

    #     numJoints = len(joints)-1

    #     for i in range(1, len(joints)):
    #         if i < numJoints or numJoints == 1:
    #             self.createFKControl(joints[i], controlsGrp, moduleContainer)

    # def createFKControl(self, joint, parent, moduleContainer):
    #     containedNodes = []

    #     fkControlInfo = self.initFKControl(joint, spaceSwitchable=False)
    #     fkControl = fkControlInfo[0]
    #     translationControl = fkControlInfo[2]

    #     orientGrp = cmds.group(n=fkControl + "_orientGrp", empty=True, parent=parent)
    #     containedNodes.append(orientGrp)

    #     orientGrp_parentConstraint = cmds.parentConstraint(joint, orientGrp, maintainOffset=False)[0]
    #     cmds.delete(orientGrp_parentConstraint)

    #     jointParent = cmds.listRelatives(joint, parent=True)[0]

    #     orientGrp_parentConstraint = cmds.parentConstraint(jointParent, orientGrp, maintainOffset=True, skipTranslate=["x", "y", "z"], n=orientGrp + "_parentConstraint")[0]

    #     pointConstraint_parent = joint
    #     if translationControl:
    #         pointConstraint_parent = jointParent

    #     orientGrp_pointConstraint = cmds.pointConstraint(pointConstraint_parent, orientGrp, maintainOffset=False, n=orientGrp + "_pointConstraint")[0]

    #     orientGrp_scaleConstraint = cmds.scaleConstraint(jointParent, orientGrp, maintainOffset=True, n=orientGrp + "_scaleConstraint")[0]

    #     containedNodes.extend([orientGrp_parentConstraint, orientGrp_pointConstraint, orientGrp_scaleConstraint])

    #     cmds.parent(fkControl, orientGrp, relative=True)

    #     orientConstraint = cmds.orientConstraint(fkControl, joint, maintainOffset=False, n=joint + "_orientConstraint")[0]
    #     containedNodes.append(orientConstraint)

    #     if translationControl:
    #         cmds.xform(fkControl, worldSpace=True, absolute=True, translation=cmds.xform(joint, q=True, worldSpace=True, translation=True))
    #         pointConstraint = cmds.pointConstraint(fkControl, joint, maintainOffset=False, n=joint + "_pointConstraint")[0]
    #         containedNodes.append(pointConstraint)

    #     utils.addNodeToContainer(moduleContainer, containedNodes)

    #     return fkControl

    # def initFKControl(self, joint, spaceSwitchable=False):
    #     translationControl = False
    #     jointName = utils.stripAllNamespaces(joint)[1]
    #     blueprintJoint = self.blueprintNamespace + ":blueprint_" + jointName
    #     if cmds.objExists(blueprintJoint + "_addTranslate"):
    #         translationControl = True

    #     name = jointName + "_fkControl"

    #     controlObjectInstance = controlObject.ControlObject()

    #     fkControlInfo = controlObjectInstance.create(name, "sphere.ma", self, lod=1, translation=translationControl, rotation=True, globalScale=False, spaceSwitching=spaceSwitchable)
    #     fkControl = fkControlInfo[0]

    #     cmds.connectAttr(joint + ".rotateOrder", fkControl + ".rotateOrder")

    #     return (fkControlInfo[0], fkControlInfo[1], translationControl)


    # def UI(self, parentLayout):
    #     jointsGrp = self.blueprintNamespace + ":" + self.moduleNamespace + ":joints_grp"

    #     joints = utils.findJointChain(jointsGrp)
    #     joints.pop(0)

    #     numJoints = len(joints)
    #     if numJoints > 1:
    #         numJoints -= 1

    #     for i in range(numJoints):
    #         fkControl = joints[i] + "_fkControl"
    #         controlObjectInstance = controlObject.ControlObject(fkControl)
    #         controlObjectInstance.UI(parentLayout)

    # def match(self, *args):
    #     jointsGrp = self.blueprintNamespace + ":blueprint_joints_grp"
    #     joints = utils.findJointChain(jointsGrp)
    #     joints.pop(0)

    #     jointsGrp = self.blueprintNamespace + ":" + self.moduleNamespace + ":joints_grp"
    #     moduleJoints = utils.findJointChain(jointsGrp)
    #     moduleJoints.pop(0)

    #     if len(moduleJoints) > 1:
    #         moduleJoints.pop()

    #     index = 0
    #     fkControls = []
    #     for joint in moduleJoints:
    #         fkControl = joint + "_fkControl"
    #         fkControls.append(fkControl)

    #         if not cmds.getAttr(fkControl + ".translateX", l=True):
    #             cmds.xform(fkControl, worldSpace=True, absolute=True, translation=cmds.xform(joints[index], q=True, worldSpace=True, translation=True))


    #         cmds.xform(fkControl, worldSpace=True, absolute=True, rotation=cmds.xform(joints[index], q=True, worldSpace=True, rotation=True))
    #         index += 1

    #     return (joints, fkControls)

