CLASS_NAME = "InterpolatingStretchySpline"

TITLE = "Interpolation-based Stretchy Spline"

DESCRIPTION = "This module provides root and end controls for translation and rotation [root control is optional], with fine-tuning interpolation controls for specific spline shapes."

import System.utils as utils
import importlib
importlib.reload(utils)

import maya.cmds as cmds

from PySide2 import QtWidgets

import System.controlObject as controlObject
importlib.reload(controlObject)

import System.controlModule as controlModule
importlib.reload(controlModule)
import System.animation_UI as animation_UI
importlib.reload(animation_UI)


class InterpolatingStretchySpline(controlModule.ControlModule):
    def __init__(self, moduleNamespace):
        controlModule.ControlModule.__init__(self, moduleNamespace)

    def compatibleBlueprintModules(self):
        return ("Spline",)

    def install_requirements(self):
        blueprintJointsGrp = self.blueprintNamespace + ":blueprint_joints_grp"
        blueprintJoints = utils.findJointChain(blueprintJointsGrp)

        if len(blueprintJoints) >= 6:
            return True
        else:
            QtWidgets.QMessageBox.warning(
                QtWidgets.QApplication.activeWindow(),
                TITLE,
                "This control module can only be installed on spline blueprints with 5 joints or more.",
            )
            return False

    def _prompt_root_control_choice(self):
        parent = QtWidgets.QApplication.activeWindow()
        dialog = QtWidgets.QMessageBox(QtWidgets.QMessageBox.Question, TITLE, "Please specify the root control type:", parent=parent)

        translation_rotation_btn = dialog.addButton("Translation and Rotation", QtWidgets.QMessageBox.AcceptRole)
        rotation_only_btn = dialog.addButton("Rotation Only", QtWidgets.QMessageBox.ActionRole)
        none_btn = dialog.addButton("None", QtWidgets.QMessageBox.RejectRole)

        dialog.setDefaultButton(translation_rotation_btn)
        dialog.exec_()

        clicked = dialog.clickedButton()
        if clicked == translation_rotation_btn:
            return "Translation and Rotation"
        elif clicked == rotation_only_btn:
            return "Rotation Only"
        elif clicked == none_btn:
            return "None"

        # Treat dialog close as no root control.
        return "None"

    def install_custom(self, joints, moduleGrp, moduleContainer):
        result = self._prompt_root_control_choice()
        rootControlTranslation = (result == "Translation and Rotation")
        createRootControl = not (result == "None")

        containedNodes = []

        creationPoseJoints = []
        for joint in joints:
            jointName = utils.stripAllNamespaces(joint)[1]
            createPoseJoint = self.blueprintNamespace + ":creationPose_" + jointName
            creationPoseJoints.append(createPoseJoint)

        rootControlObject = moduleGrp
        if createRootControl:
            rootControlObjectInfo = self.createRootEndControl("rootControl", creationPoseJoints[1], creationPoseJoints[1], rootControlTranslation, containedNodes, moduleGrp)
            rootControlObject = rootControlObjectInfo[0]
            rootControlParent = rootControlObjectInfo[1]

            if not rootControlTranslation:
                containedNodes.append(cmds.pointConstraint(moduleGrp, rootControlParent, maintainOffset=True)[0])

        endControlObjectInfo = self.createRootEndControl("endControl", creationPoseJoints[len(creationPoseJoints)-2], creationPoseJoints[len(creationPoseJoints)-1], True, containedNodes, moduleGrp)
        endControlObject = endControlObjectInfo[0]

        stretchyIKJoints = cmds.duplicate(joints, renameChildren=True)
        index = 0
        for joint in stretchyIKJoints:
            stretchyIKJoints[index] = cmds.rename(joint, joints[index] + "_stretchyIKJoint")
            index += 1

        containedNodes.extend(stretchyIKJoints)

        rootJoint = stretchyIKJoints[1]
        endJoint = stretchyIKJoints[len(stretchyIKJoints)-1]
        secondJoint = stretchyIKJoints[2]
        secondToLastJoint = stretchyIKJoints[len(stretchyIKJoints) - 2]

        rootPos = cmds.xform(rootJoint, q=True, worldSpace=True, translation=True)
        endPos = cmds.xform(endJoint, q=True, worldSpace=True, translation=True)

        rootLocator = cmds.spaceLocator(n=stretchyIKJoints[0] + "_systemStretch_rootLocator")[0]
        cmds.xform(rootLocator, worldSpace=True, absolute=True, translation=rootPos)
        containedNodes.append(rootLocator)

        endLocator = cmds.spaceLocator(n=stretchyIKJoints[0] + "_systemStretch_endLocator")[0]
        cmds.xform(endLocator, worldSpace=True, absolute=True, translation=endPos)
        containedNodes.append(endLocator)

        for loc in [rootLocator, endLocator]:
            cmds.setAttr(loc + ".visibility", 0)

        cmds.parent(rootLocator, rootControlObject, absolute=True)
        cmds.parent(endLocator, endControlObject, absolute=True)

        index = 0
        for joint in stretchyIKJoints:
            if index > 2 and index < len(stretchyIKJoints)-1:
                cmds.select(stretchyIKJoints[index], replace=True)
                cmds.addAttr(at="float", longName="originalLength")
                originalLength = cmds.getAttr(stretchyIKJoints[index] + ".translateX")
                cmds.setAttr(stretchyIKJoints[index] + ".originalLength", originalLength)

            index += 1

        scaleFactorAttr = self.createDistanceCalculations(rootLocator, endLocator, containedNodes)

        rootScaler = self.createScaler(rootLocator, scaleFactorAttr, containedNodes)
        endScaler = self.createScaler(endLocator, scaleFactorAttr, containedNodes)

        rootIKLocators = self.setupBasicStretchyIK(rootJoint, secondJoint, creationPoseJoints[1], rootControlObject, moduleContainer, moduleGrp)
        rootIK_rootLocator = rootIKLocators[0]
        rootIK_endLocator = rootIKLocators[1]

        cmds.parent(rootIK_endLocator, rootScaler, absolute=True)

        endIKLocators = self.setupBasicStretchyIK(secondToLastJoint, endJoint, creationPoseJoints[len(creationPoseJoints)-2], endControlObject, moduleContainer, moduleGrp)
        endIK_rootLocator = endIKLocators[0]
        endIK_endLocator = endIKLocators[1]

        cmds.parent(endIK_endLocator, endControlObject, absolute=True)

        ikNodes = cmds.ikHandle(sj=secondJoint, ee=secondToLastJoint, n=rootJoint + "_splineIKHandle", sol="ikSplineSolver", rootOnCurve=False, createCurve=True)

        ikNodes[1] = cmds.rename(ikNodes[1], secondJoint + "_splineIKEffector")
        ikNodes[2] = cmds.rename(ikNodes[2], secondJoint + "_splineIKCurve")

        splineIKhandle = ikNodes[0]
        splineIKCurve = ikNodes[2]
        
        containedNodes.extend(ikNodes)

        cmds.parent(splineIKhandle, moduleGrp, absolute=True)
        cmds.setAttr(splineIKhandle + ".visibility", 0)
        cmds.setAttr(splineIKCurve + ".visibility", 0)

        cmds.parent(splineIKCurve, world=True, absolute=True)
        cmds.setAttr(splineIKCurve + ".inheritsTransform", 0)
        cmds.parent(splineIKCurve, moduleGrp, relative=True)

        # Create clusters
        curve_shape = cmds.listRelatives(splineIKCurve, shapes=True, fullPath=True)[0]
        cv_root = curve_shape + ".cv[0:1]"
        cv_end  = curve_shape + ".cv[2:3]"
        
        root_cluster_nodes = cmds.cluster(cv_root)
        end_cluster_nodes  = cmds.cluster(cv_end)

        rootClusterHandle = root_cluster_nodes[1]
        endClusterHandle  = end_cluster_nodes[1]

        for handle in [rootClusterHandle, endClusterHandle]:
            cmds.setAttr(handle + ".visibility", 0)

        cmds.parent(rootClusterHandle, rootScaler, absolute=True)
        cmds.parent(endClusterHandle, endScaler, absolute=True)

        containedNodes.append(cmds.parentConstraint(rootControlObject, rootJoint, maintainOffset=True)[0])

        targetLocatorNodes = cmds.duplicate(endIK_rootLocator, name=endIK_rootLocator + "_duplicateTarget")
        targetLocator = targetLocatorNodes[0]
        cmds.delete(targetLocatorNodes[1])
        cmds.parent(targetLocator, endScaler, absolute=True)

        splineScaleFactorAttr = self.createDistanceCalculations(rootIK_endLocator, targetLocator, containedNodes)

        index = 0
        for joint in stretchyIKJoints:
            if index > 2 and index < len(stretchyIKJoints)-1:
                multNode = cmds.shadingNode("multiplyDivide", asUtility=True, n=joint + "_jointScale")
                containedNodes.append(multNode)
                cmds.connectAttr(splineScaleFactorAttr, multNode + ".input1X")
                cmds.setAttr(multNode + ".input2X", cmds.getAttr(joint + ".originalLength"))

                cmds.connectAttr(multNode + ".outputX", joint + ".translateX")
            index += 1

        cmds.setAttr(splineIKhandle + ".dTwistControlEnable", 1)
        cmds.setAttr(splineIKhandle + ".dWorldUpType", 4)
        cmds.setAttr(splineIKhandle + ".dWorldUpAxis", 5)

        cmds.setAttr(splineIKhandle + ".dWorldUpVector", 0.0, 0.0, 1.0, type="double3")
        cmds.setAttr(splineIKhandle + ".dWorldUpVectorEnd", 0.0, 0.0, 1.0, type="double3")

        if createRootControl:
            cmds.connectAttr(rootControlObject + ".worldMatrix[0]", splineIKhandle + ".dWorldUpMatrix")
        else:
            dummyNode = cmds.duplicate(rootJoint, parentOnly=True, n=rootJoint + "_dummyDuplicate")[0]
            containedNodes.append(dummyNode)
            cmds.parent(dummyNode, moduleGrp, absolute=True)
            cmds.connectAttr(dummyNode + ".worldMatrix[0]", splineIKhandle + ".dWorldUpMatrix")

        cmds.connectAttr(endControlObject + ".worldMatrix[0]", splineIKhandle + ".dWorldUpMatrixEnd")

        cmds.select(moduleGrp)
        cmds.addAttr(at="float", defaultValue=0.0, softMinValue=-10.0, softMaxValue=10.0, keyable=True, longName="offsetY")
        cmds.addAttr(at="float", defaultValue=0.0, softMinValue=-10.0, softMaxValue=10.0, keyable=True, longName="offsetZ")

        self.publishNameToModuleContainer(moduleGrp + ".offsetY", "interpolator_offsetY", publishToOuterContainers=True)
        self.publishNameToModuleContainer(moduleGrp + ".offsetZ", "interpolator_offsetZ", publishToOuterContainers=True)

        inverseNode = cmds.shadingNode("multiplyDivide", asUtility=True, n=moduleGrp + "_offsetInverse")
        containedNodes.append(inverseNode)

        cmds.connectAttr(moduleGrp + ".offsetY", inverseNode + ".input1Y")
        cmds.connectAttr(moduleGrp + ".offsetZ", inverseNode + ".input1Z")
        cmds.setAttr(inverseNode + ".input2Y", -1)
        cmds.setAttr(inverseNode + ".input2Z", -1)

        numStretchyIKJoints = len(stretchyIKJoints)-1

        interpolators_ikParents = []
        aimChildren = []

        for i in range(1, numStretchyIKJoints):
            if i > 1:
                jointFollower = cmds.group(empty=True, n=stretchyIKJoints[i] + "_follower")
                containedNodes.append(jointFollower)
                cmds.parent(jointFollower, moduleGrp, relative=True)
                containedNodes.append(cmds.parentConstraint(stretchyIKJoints[i], jointFollower, maintainOffset=False, n=jointFollower + "_parentConstraint")[0])

                offset = cmds.group(empty=True, n=stretchyIKJoints[i] + "_interpolatorOffset")
                containedNodes.append(offset)
                cmds.parent(offset, jointFollower, relative=True)

                cmds.connectAttr(moduleGrp + ".offsetY", offset + ".translateY")
                cmds.connectAttr(moduleGrp + ".offsetZ", offset + ".translateZ")

                name = utils.stripAllNamespaces(joints[i])[1] + "_offsetControl"
                controlObjectInstance = controlObject.ControlObject()
                offsetControlObject = controlObjectInstance.create(name, "cube.shape", self, lod=2, translation=True, rotation=False, globalScale=False, spaceSwitching=False, colorIndex=None)[0]

                cmds.parent(offsetControlObject, offset, relative=True)

                offsetCancelation = cmds.group(empty=True, n=stretchyIKJoints[i] + "_interpolatorOffsetCancelation")
                containedNodes.append(offsetCancelation)
                cmds.parent(offsetCancelation, offsetControlObject, relative=True)

                cmds.connectAttr(inverseNode + ".outputY", offsetCancelation + ".translateY")
                cmds.connectAttr(inverseNode + ".outputZ", offsetCancelation + ".translateZ")

                interpolators_ikParents.append(offsetCancelation)

            aimChild = cmds.group(empty=True, n=stretchyIKJoints[i] + "_aimChild")
            containedNodes.append(aimChild)
            aimChildren.append(aimChild)

            if i > 1:
                cmds.parent(aimChild, offsetCancelation, relative=True)
            else:
                cmds.parent(aimChild, stretchyIKJoints[i], relative=True)

            cmds.setAttr(aimChild + ".translateY", -1)

        for i in range(1, numStretchyIKJoints):
            ikNodes = utils.basic_stretchy_IK(joints[i], joints[i+1], container=moduleContainer, scaleCorrectionAttribute=self.blueprintNamespace + ":module_grp.hierarchicalScale", lockMinimumLength=False, poleVectorObject=aimChildren[i-1])
            ikHandle = ikNodes["ikHandle"]
            rootLocator = ikNodes["rootLocator"]
            endLocator = ikNodes["endLocator"]

            for loc in (ikHandle, rootLocator):
                cmds.parent(loc, moduleGrp, absolute=True)

            #utils.matchTwistAngle(ikHandle + ".twist", [joints[i],], [stretchyIKJoints[i],])

            if i == 1:
                if createRootControl:
                    containedNodes.append(cmds.pointConstraint(rootControlObject, joints[i], maintainOffset=False, n=joints[i] + "_pointConstraint")[0])

            cmds.setAttr(endLocator + ".translate", 0.0, 0.0, 0.0, type="double3")
            if i < numStretchyIKJoints - 1:
                cmds.parent(endLocator, interpolators_ikParents[i-1], relative=True)
            else:
                cmds.parent(endLocator, endControlObject, relative=True)

        cmds.setAttr(moduleGrp + ".lod", 2)

        utils.addNodeToContainer(moduleContainer, containedNodes, ihb=True)

        for joint in stretchyIKJoints:
            jointName = utils.stripAllNamespaces(joint)[1]
            self.publishNameToModuleContainer(joint + ".rotate", jointName + "_R", publishToOuterContainers=False)
            self.publishNameToModuleContainer(joint + ".translate", jointName + "_T", publishToOuterContainers=False)

    def setupBasicStretchyIK(self, sJoint, eJoint, creationPose_sJoint, controlObject, moduleContainer, moduleGrp):
        ikNodes = utils.basic_stretchy_IK(sJoint, eJoint, container=moduleContainer, scaleCorrectionAttribute=self.blueprintNamespace + ":module_grp.hierarchicalScale", lockMinimumLength=False)
        ikHandle = ikNodes["ikHandle"]
        rootLocator = ikNodes["rootLocator"]
        endLocator = ikNodes["endLocator"]
        poleVectorLocator = ikNodes["poleVectorObject"]

        for loc in [rootLocator, ikHandle]:
            cmds.parent(loc, moduleGrp, absolute=True)

        cmds.parent(poleVectorLocator, creationPose_sJoint)
        cmds.setAttr(poleVectorLocator + ".translateX", 0)
        cmds.setAttr(poleVectorLocator + ".translateY", 10)
        cmds.setAttr(poleVectorLocator + ".translateZ", 0)

        #utils.matchTwistAngle(ikHandle + ".twist", [sJoint,], [creationPose_sJoint,])

        cmds.parent(poleVectorLocator, controlObject, absolute=True)

        return (rootLocator, endLocator)

    def createScaler(self, parentLocator, scaleFactorAttr, containedNodes):
        scaler = cmds.group(empty=True, n=parentLocator + "_scaler")
        containedNodes.append(scaler)
        cmds.parent(scaler, parentLocator, relative=True)

        for attr in [".scaleX", ".scaleY",  ".scaleZ"]:
            cmds.connectAttr(scaleFactorAttr, scaler + attr)

        return scaler

    def createDistanceCalculations(self, rootLocator, endLocator, containedNodes):
        rootLocatorName = utils.stripAllNamespaces(rootLocator)[1]
        endLocatorName = utils.stripAllNamespaces(endLocator)[1]
        distNode = cmds.shadingNode("distanceBetween", asUtility=True, n=self.blueprintNamespace + ":" + self.moduleNamespace + ":distanceBetween_" + rootLocatorName + "__" + endLocatorName)
        containedNodes.append(distNode)

        rootLocShape = rootLocator + "Shape"
        endLocShape = endLocator + "Shape"

        cmds.connectAttr(rootLocShape + ".worldPosition[0]", distNode + ".point1")
        cmds.connectAttr(endLocShape + ".worldPosition[0]", distNode + ".point2")

        totalOriginalLength = cmds.getAttr(distNode + ".distance")
        totalOriginalLength /= cmds.getAttr(self.blueprintNamespace + ":module_grp.hierarchicalScale")

        scaleFactor = cmds.shadingNode("multiplyDivide", asUtility=True, n=distNode + "_scaleFactor")
        containedNodes.append(scaleFactor)

        cmds.setAttr(scaleFactor + ".operation", 2)  # Divide
        cmds.connectAttr(distNode + ".distance", scaleFactor + ".input1X")
        cmds.setAttr(scaleFactor + ".input2X", totalOriginalLength)

        scaleCorrection = cmds.shadingNode("multiplyDivide", asUtility=True, n=scaleFactor + "_correction")
        containedNodes.append(scaleCorrection)

        cmds.setAttr(scaleCorrection + ".operation", 2)  # Divide
        cmds.connectAttr(scaleFactor + ".outputX", scaleCorrection + ".input1X")
        cmds.connectAttr(self.blueprintNamespace + ":module_grp.hierarchicalScale", scaleCorrection + ".input2X")

        return scaleCorrection + ".outputX"

    def createRootEndControl(self, name, orientJoint, posJoint, translation, containedNodes, moduleGrp):
        controlObjectInstance = controlObject.ControlObject()
        controlObjectInfo = controlObjectInstance.create(name, "flattenedCube.shape", self, lod=1, translation=translation, rotation=True, globalScale=False, spaceSwitching=True, colorIndex=32)
        controlObj = controlObjectInfo[0]
        controlParent = controlObjectInfo[1]

        preTransform = cmds.group(empty=True, n=controlObj + "_preTransform")
        containedNodes.append(preTransform)

        cmds.parent(controlObj, preTransform, relative=True)
        cmds.parent(preTransform, controlParent, relative=True)

        tempOrientationLocator = cmds.spaceLocator()[0]
        tempOrientConstraint = cmds.orientConstraint(orientJoint, tempOrientationLocator, maintainOffset=False)[0]

        targetOrientation = cmds.xform(tempOrientationLocator, q=True, worldSpace=True, rotation=True)

        cmds.delete(tempOrientConstraint)
        cmds.delete(tempOrientationLocator)

        cmds.xform(preTransform, worldSpace=True, absolute=True, rotation=targetOrientation)

        cmds.parent(controlParent, moduleGrp, relative=True)
        cmds.setAttr(controlObj + ".rotateOrder", cmds.getAttr(orientJoint + ".rotateOrder"))

        cmds.xform(controlObj, worldSpace=True, absolute=True, translation=cmds.xform(posJoint, q=True, worldSpace=True, translation=True))

        return (controlObj, controlParent)

    def UI(self, parentLayout):
        rootControl = self.blueprintNamespace + ":" + self.moduleNamespace + ":rootControl"
        if cmds.objExists(rootControl):
            controlObjectInstance = controlObject.ControlObject(rootControl)
            controlObjectInstance.UI(parentLayout)

        jointGrp = self.blueprintNamespace + ":" + self.moduleNamespace + ":joints_grp"
        joints = utils.findJointChain(jointGrp)

        joints.pop(0)
        joints.pop(0)
        joints.pop()

        for joint in joints:
            offsetControl = joint + "_offsetControl"
            controlObjectInstance = controlObject.ControlObject(offsetControl)
            controlObjectInstance.UI(parentLayout)

        endControl = self.blueprintNamespace + ":" + self.moduleNamespace + ":endControl"
        controlObjectInstance = controlObject.ControlObject(endControl)
        controlObjectInstance.UI(parentLayout)

    def UI_preferences(self, parentLayout):
        moduleGrp = self.blueprintNamespace + ":" + self.moduleNamespace + ":module_grp"
        if not cmds.objExists(moduleGrp):
            return

        for attr, label in ((".offsetY", "Offset Y"), (".offsetZ", "Offset Z")):
            plug = moduleGrp + attr
            try:
                current = cmds.getAttr(plug)
            except Exception:
                current = 0.0

            widget = animation_UI.FloatAttrControlWidget(
                plug,
                label + ":",
                -10.0,
                10.0,
                current,
                conversion=1,
                decimals=2,
                singleStep=0.1,
                callback=lambda v, p=plug: cmds.setAttr(p, v),
            )
            parentLayout.addWidget(widget)

    def match(self, *args):
        blueprintJointsGrp = self.blueprintNamespace + ":blueprint_joints_grp"
        blueprintJoints = utils.findJointChain(blueprintJointsGrp)
        blueprintJoints.pop(0)

        jointsGrp = self.blueprintNamespace + ":" + self.moduleNamespace + ":joints_grp"
        joints = utils.findJointChain(jointsGrp)
        joints.pop(0)

        rootControl = self.blueprintNamespace + ":" + self.moduleNamespace + ":rootControl"
        if cmds.objExists(rootControl):
            controlObjectInstance = controlObject.ControlObject(rootControl)

            if controlObjectInstance.translation == [True, True, True]:
                cmds.xform(rootControl, worldSpace=True, absolute=True, translation=cmds.xform(blueprintJoints[0], q=True, worldSpace=True, translation=True))

            cmds.xform(rootControl, worldSpace=True, absolute=True, rotation=cmds.xform(blueprintJoints[0], q=True, worldSpace=True, rotation=True))


        endControl = self.blueprintNamespace + ":" + self.moduleNamespace + ":endControl"
        endJoint = blueprintJoints[len(blueprintJoints)-1]
        secondToLastJoint = blueprintJoints[len(blueprintJoints) - 2]
        cmds.xform(endControl, worldSpace=True, absolute=True, translation=cmds.xform(endJoint, q=True, worldSpace=True, translation=True))
        cmds.xform(endControl, worldSpace=True, absolute=True, rotation=cmds.xform(secondToLastJoint, q=True, worldSpace=True, rotation=True))

        joints.pop(0)
        joints.pop()
        blueprintJoints.pop(0)

        moduleGrp = self.blueprintNamespace + ":" + self.moduleNamespace + ":module_grp"
        offsetY = cmds.getAttr(moduleGrp + ".offsetY")
        offsetZ = cmds.getAttr(moduleGrp + ".offsetZ")

        index = 0
        for joint in joints:
            offsetControl = joint + "_offsetControl"
            cmds.xform(offsetControl,worldSpace=True, absolute=True, translation=cmds.xform(blueprintJoints[index], q=True, worldSpace=True, translation=True))
            cmds.xform(offsetControl, objectSpace=True, relative=True, translation=[0, offsetY, offsetZ])

            index += 1
