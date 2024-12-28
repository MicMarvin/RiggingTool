import maya.cmds as cmds
from functools import partial
import System.utils as utils
import importlib
importlib.reload(utils)


class AttachGeoToBlueprint_ShelfTool:
    def attachWithParenting(self):
        self.parenting = True
        self.skinning = False
        #self.processInitialSelection()

        print(f"THE RESULT: {self.parenting} {self.skinning}")

    def attachWithSkinning(self):
        self.parenting = False
        self.skinning = True
        #self.processInitialSelection()

        print(f"THE RESULT: {self.parenting} {self.skinning}")

    def processInitialSelection(self):
        selection = cmds.ls(selection=True)
        self.blueprintJoints = []
        self.geometry = []

        self.blueprintJoints = self.findBlueprintJoints(selection)
        self.geometry = self.findGeometry(selection)

        if self.blueprintJoints == None:
            cmds.headsUpMessage("Please select the blueprint joint(s) you wish to attach geometry to.")
            cmds.scriptJob(event=["SelectionChanged", self.selectBlueprintJoint_callback], runOnce=True)
        elif self.geometry == None:
            cmds.headsUpMessage("Please select the geometry you wish to attach to the specified blueprint joint(s).")
            cmds.scriptJob(event=["SelectionChanged", self.selectGeometry_callback], runOnce=True)
        else:
            self.attachGeoToBlueprint_attachment()

    def selectBlueprintJoint_callback(self):
        selection = cmds.ls(selection=True)
        self.blueprintJoints = self.findBlueprintJoints(selection)
        if self.blueprintJoints == None:
            cmds.confirmDialog(title="Attach Geometry to Blueprint",
                               message="Blueprint joint selection invalid, terminating tool.", button=["Accept"],
                               defaultButton="Accept")
        elif self.geometry == None:
            cmds.headsUpMessage("Please select the geometry you wish to attach to the specified blueprint joint(s).")
            cmds.scriptJob(event=["SelectionChanged", self.selectGeometry_callback], runOnce=True)
        else:
            self.attachGeoToBlueprint_attachment()

    def selectGeometry_callback(self):
        selection = cmds.ls(selection=True)
        self.geometry = self.findGeometry(selection)

        if self.geometry == None:
            cmds.confirmDialog(title="Attach Geometry to Blueprint",
                               message="Geometry selection invalid, terminating tool", button=["Accept"],
                               defaultButton="Accept")
        else:
            self.attachGeoToBlueprint_attachment()

    def findBlueprintJoints(self, selection):
        selectedBlueprintJoints = []

        for object in selection:
            if cmds.objectType(object, isType="joint"):
                jointNameInfo = utils.stripAllNamespaces(object)
                if jointNameInfo != None:
                    jointName = jointNameInfo[1]
                    if jointName.find("blueprint_") == 0:
                        selectedBlueprintJoints.append(object)

        if len(selectedBlueprintJoints) > 0:
            return selectedBlueprintJoints
        else:
            return None

    def findGeometry(self, selection):
        selection = cmds.ls(selection, transforms=True)

        nonJointSelection = []
        for node in selection:
            if not cmds.objectType(node, isType="joint"):
                nonJointSelection.append(node)

        if len(nonJointSelection) > 0:
            return nonJointSelection
        else:
            return None

    def attachGeoToBlueprint_attachment(self):
        if self.parenting:
            self.attachGeoToBlueprint_parenting(self.blueprintJoints[0], self.geometry)
        else:
            self.attachGeoToBlueprint_skinning(self.blueprintJoints, self.geometry)

    def attachGeoToBlueprint_parenting(self, blueprintJoint, geometry):
        jointName = utils.stripAllNamespaces(blueprintJoint)[1]
        parentGroup = cmds.group(empty=True, n=jointName + "_geoAttach_parentGrp#")

        if len(geometry) == 1:
            geoParent = cmds.listRelatives(geometry, parent=True)
            if geoParent != None:
                cmds.parent(parentGroup, geoParent)

        cmds.parentConstraint(blueprintJoint, parentGroup, maintainOffset=False, n=parentGroup + "_parentConstraint")
        cmds.scaleConstraint(blueprintJoint, parentGroup, maintainOffset=False, n=parentGroup + "_scaleConstraint")

        geoParent = parentGroup

        children = cmds.listRelatives(blueprintJoint, children=True)
        children = cmds.ls(children, type="joint")

        if len(children) != 0:
            childJoint = children[0]

            scaleGroup = cmds.group(empty=True, n=jointName + "_geoAttach_scaleGrp#")
            cmds.parent(scaleGroup, parentGroup, relative=True)

            geoParent = scaleGroup

            originalTxValue = cmds.getAttr(childJoint + ".translateX")
            scaleFactor = cmds.shadingNode("multiplyDivide", asUtility=True, n=scaleGroup + "_scaleFactor")
            cmds.setAttr(scaleFactor + ".operation", 2)  # divide
            cmds.connectAttr(childJoint + ".translateX", scaleFactor + ".input1X")
            cmds.setAttr(scaleFactor + ".input2X", originalTxValue)

            cmds.connectAttr(scaleFactor + ".outputX", scaleGroup + ".scaleX")

        for geo in geometry:
            cmds.parent(geo, geoParent, absolute=True)

    def attachGeoToBlueprint_skinning(self, blueprintJoints, geometry):
        blueprintModules = set([])

        for joint in blueprintJoints:
            blueprintNamespace = utils.stripLeadingNamespace(joint)[0]
            blueprintModules.add(blueprintNamespace)

        for module in blueprintModules:
            cmds.lockNode(module + ":module_container", lock=False, lockUnpublished=False)

        for geo in geometry:
            cmds.skinCluster(blueprintJoints, geo, tsb=True, n=geo + "_skinCluster")

        for module in blueprintModules:
            cmds.lockNode(module + ":module_container", lock=True, lockUnpublished=True)