import System.utils as utils
import importlib
importlib.reload(utils)

import maya.cmds as cmds
import os
from pathlib import Path
from functools import partial
from PySide2 import QtWidgets, QtCore, QtGui


class ControlObject:
    def __init__(self, controlObject=None):
        if controlObject != None:
            self.controlObject = controlObject

            self.translation = []
            self.translation.append(not cmds.getAttr(self.controlObject + ".translateX", l=True))
            self.translation.append(not cmds.getAttr(self.controlObject + ".translateY", l=True))
            self.translation.append(not cmds.getAttr(self.controlObject + ".translateZ", l=True))

            self.rotation = []
            self.rotation.append(not cmds.getAttr(self.controlObject + ".rotateX", l=True))
            self.rotation.append(not cmds.getAttr(self.controlObject + ".rotateY", l=True))
            self.rotation.append(not cmds.getAttr(self.controlObject + ".rotateZ", l=True))

            self.globalScale = not cmds.getAttr(self.controlObject + ".scaleY", l=True)

    def create(self, name, controlFile, animationModuleInstance, lod=1, translation=True, rotation=True, globalScale=True, spaceSwitching=False):
        if translation == True or translation == False:
            translation = [translation, translation, translation]

        if rotation == True or rotation == False:
            rotation = [rotation, rotation, rotation]

        self.translation = translation
        self.rotation = rotation
        self.globalScale = globalScale

        animationModuleName = animationModuleInstance.moduleNamespace
        blueprintModuleNamespace = animationModuleInstance.blueprintNamespace
        blueprintModuleUserSpecifiedName = utils.stripAllNamespaces(blueprintModuleNamespace)[1].partition("__")[2]

        animationModuleNamespace = blueprintModuleNamespace + ":" + animationModuleName

        controlObjectFile = Path(os.environ["RIGGING_TOOL_ROOT"]) / "RiggingTool" / "ControlObjects" / "Animation" / controlFile
        cmds.file(controlObjectFile, i=True)

        self.controlObject = cmds.rename("control", animationModuleNamespace + ":" + name)
        self.rootParent = self.controlObject

        self.setupIconScale(animationModuleNamespace)

        cmds.setAttr(self.controlObject + ".overrideEnabled", 1)
        cmds.setAttr(self.controlObject + ".overrideShading", 0)
        cmds.connectAttr(animationModuleNamespace + ":module_grp.overrideColor", self.controlObject + ".overrideColor")

        cmds.container(animationModuleNamespace + ":module_container", edit=True, addNode=self.controlObject, ihb=True, includeNetwork=True)

        # Lock/hide channels that were flagged off so the UI can discover the intended controls.
        def _set_channel(attrSuffix, enabled):
            attr = self.controlObject + attrSuffix
            try:
                cmds.setAttr(attr, lock=not enabled, keyable=enabled, channelBox=enabled)
            except Exception:
                pass

        for axis, enabled in zip(["X", "Y", "Z"], self.translation):
            _set_channel(".translate" + axis, enabled)
        for axis, enabled in zip(["X", "Y", "Z"], self.rotation):
            _set_channel(".rotate" + axis, enabled)

        if globalScale:
            cmds.connectAttr(self.controlObject + ".scaleY", self.controlObject + ".scaleX")
            cmds.connectAttr(self.controlObject + ".scaleY", self.controlObject + ".scaleZ")
            cmds.aliasAttr("globalScale", self.controlObject + ".scaleY")
        else:
            _set_channel(".scaleY", False)

        attributes = []

        if self.translation == [True, True, True]:
            attributes.append([True, ".translate", "T"])
        else:
            attributes.extend([[translation[0], ".translateX", "TX"], [translation[1], ".translateY", "TY"], [translation[2], ".translateZ", "TZ"]])

        if self.rotation == [True, True, True]:
            attributes.append([True, ".rotate", "R"])
        else:
            attributes.extend([[rotation[0], ".rotateX", "RX"], [rotation[1], ".rotateY", "RY"], [rotation[2], ".rotateZ", "RZ"]])

        attributes.append([globalScale, ".globalScale", "scale"])

        for attrInfo in attributes:
            if attrInfo[0]:
                attributeNiceName = name + "_" + attrInfo[2]
                animationModuleInstance.publishNameToModuleContainer(self.controlObject + attrInfo[1], attributeNiceName, publishToOuterContainers=True)

        cmds.select(self.controlObject, replace=True)
        cmds.addAttr(at="bool", defaultValue=1, k=True, ln="display")
        animationModuleInstance.publishNameToModuleContainer(self.controlObject + ".display", "display", publishToOuterContainers=False)

        moduleGrp = animationModuleNamespace + ":module_grp"
        visibilityExpression = self.controlObject + ".visibility =" + self.controlObject + ".display * (" + moduleGrp + ".lod >= " + str(lod) + ");"
        expression = cmds.expression(n=self.controlObject + "_visibility_expression", string=visibilityExpression)
        utils.addNodeToContainer(animationModuleNamespace + ":module_container", expression)

        axisInverse = cmds.spaceLocator(name=self.controlObject + "_axisInverse")[0]
        cmds.parent(axisInverse, self.controlObject, relative=True)
        cmds.setAttr(axisInverse + ".visibility", 0)
        utils.addNodeToContainer(animationModuleNamespace + ":module_container", axisInverse, ihb=True)

        spaceSwitchTarget = cmds.spaceLocator(name=self.controlObject + "_spaceSwitchTarget")[0]
        cmds.parent(spaceSwitchTarget, axisInverse, relative=True)
        cmds.setAttr(spaceSwitchTarget + ".visibility", 0)
        utils.addNodeToContainer(animationModuleNamespace + ":module_container", spaceSwitchTarget, ihb=True)

        if self.rotation == [False, False, False]:
            self.setupMirroring(blueprintModuleNamespace, animationModuleNamespace, axisInverse)

        if spaceSwitching:
            self.setupSpaceSwitching(blueprintModuleNamespace, animationModuleNamespace, animationModuleInstance)

        return (self.controlObject, self.rootParent)

    def setupIconScale(self, animationModuleNamespace):
        clusterNodes = cmds.cluster(self.controlObject, n=self.controlObject + "_icon_scale_cluster", relative=True)
        cmds.container(animationModuleNamespace + ":module_container", edit=True, addNode=clusterNodes, ihb=True, includeNetwork=True)

        clusterHandle = clusterNodes[1]

        cmds.setAttr(clusterHandle + ".scalePivotX", 0)
        cmds.setAttr(clusterHandle + ".scalePivotY", 0)
        cmds.setAttr(clusterHandle + ".scalePivotZ", 0)

        cmds.connectAttr(animationModuleNamespace + ":module_grp.iconScale", clusterHandle + ".scaleX")
        cmds.connectAttr(animationModuleNamespace + ":module_grp.iconScale", clusterHandle + ".scaleY")
        cmds.connectAttr(animationModuleNamespace + ":module_grp.iconScale", clusterHandle + ".scaleZ")

        cmds.parent(clusterHandle, self.controlObject, absolute=True)
        cmds.setAttr(clusterHandle + ".visibility", 0)

    def setupMirroring(self, blueprintModuleNamespace, animationModuleNamespace, axisInverse):
        moduleGrp = blueprintModuleNamespace + ":module_grp"

        if cmds.attributeQuery("mirrorInfo", n=moduleGrp, exists=True):
            enumValue = cmds.getAttr(moduleGrp + ".mirrorInfo")

            if enumValue == 0: # "None"
                return

            mirrorAxis = ""

            if enumValue == 1:
                mirrorAxis = "X"
            elif enumValue == 2:
                mirrorAxis = "Y"
            elif enumValue == 3:
                mirrorAxis = "Z"

            mirrorGrp = cmds.group(empty=True, name=self.controlObject + "_mirror_grp")
            self.rootParent = mirrorGrp

            cmds.parent(self.controlObject, mirrorGrp, absolute=True)

            cmds.setAttr(mirrorGrp + ".scale" + mirrorAxis, -1)
            cmds.setAttr(axisInverse + ".scale" + mirrorAxis, -1)

            utils.addNodeToContainer(animationModuleNamespace + ":module_container", mirrorGrp)

    def setupSpaceSwitching(self, blueprintModuleNamespace, animationModuleNamespace, animationModuleInstance):
        cmds.select(self.controlObject, replace=True)
        cmds.addAttr(at="bool", defaultValue=True, keyable=False, longName="spaceSwitching")
        cmds.addAttr(at="bool", defaultValue=False, keyable=False, longName="switchOrientationOnly")

        spaceSwitcher = cmds.group(empty=True, name=self.controlObject + "_spaceSwitcher")

        if self.translation != [True, True, True]:
            cmds.setAttr(self.controlObject + ".switchOrientationOnly", True)

        cmds.parent(self.rootParent, spaceSwitcher, absolute=True)
        self.rootParent = spaceSwitcher

        utils.addNodeToContainer(animationModuleNamespace + ":module_container", spaceSwitcher)

        self.switchSpace(blueprintModuleNamespace + ":HOOK_IN", "Module Hook")

        controlObjectName = utils.stripAllNamespaces(self.controlObject)[1]
        animationModuleInstance.publishNameToModuleContainer(spaceSwitcher + ".currentSpace", controlObjectName + "_currentSpace", publishToOuterContainers=True)

    def switchSpace(self, targetObject, spaceName, index=-1, maintainOffset=False, setKeyframes=False):
        if cmds.objExists(targetObject + "_spaceSwitchTarget"):
            targetObject = targetObject + "_spaceSwitchTarget"

        setKeyframes = setKeyframes and maintainOffset

        currentPosition = cmds.xform(self.controlObject, q=True, worldSpace=True, translation=True)
        currentOrientation = cmds.xform(self.controlObject, q=True, worldSpace=True, rotation=True)
        currentScale = self.getCurrentScale()

        spaceSwitcher = self.controlObject + "_spaceSwitcher"
        animModuleNamespace = utils.stripAllNamespaces(self.controlObject)[0]

        if index == -1:
            cmds.select(spaceSwitcher)
            enumIndex = 0

            if cmds.attributeQuery("currentSpace", n=spaceSwitcher, exists=True):
                currentEntries = cmds.attributeQuery("currentSpace", n=spaceSwitcher, listEnum=True)[0]
                newEntry = currentEntries + ":" + spaceName
                cmds.addAttr(spaceSwitcher + ".currentSpace", edit=True, enumName=newEntry)

                enumIndex = len(currentEntries.split(":"))

            else:
                cmds.addAttr(at="enum", enumName=spaceName, keyable=True, longName="currentSpace")

            if self.globalScale:
                scaleConstraint = cmds.scaleConstraint(targetObject, spaceSwitcher, n=spaceSwitcher + "_scaleConstraint", maintainOffset=False)[0]

            skipTranslate = "none"
            if cmds.getAttr(self.controlObject + ".switchOrientationOnly"):
                skipTranslate = ["x", "y", "z"]

            parentConstraint = cmds.parentConstraint(targetObject, spaceSwitcher, n=spaceSwitcher + "_parentConstraint", maintainOffset=False, skipTranslate=skipTranslate)[0]
            parentWeightList = cmds.parentConstraint(parentConstraint, q=True, weightAliasList=True)
            parentWeight = parentConstraint + "." + parentWeightList[len(parentWeightList)-1]

            attrs = [(parentWeight, "parent")]
            containedNodes = [parentConstraint]

            if self.globalScale:
                scaleWeightList = cmds.scaleConstraint(scaleConstraint, q=True, weightAliasList=True)
                scaleWeight = scaleConstraint + "." + scaleWeightList[len(scaleWeightList)-1]

                attrs.append((scaleWeight, "scale"))
                containedNodes.append(scaleConstraint)

            for attr in attrs:
                expressionString = attr[0] + " = (" + spaceSwitcher + ".currentSpace == " + str(enumIndex) + ");\n"
                expressionName = spaceSwitcher + "_" + attr[1] + "WeightExpression_" + str(enumIndex)
                containedNodes.append(cmds.expression(name=expressionName, string=expressionString))

            utils.addNodeToContainer(animModuleNamespace + ":module_container", containedNodes)

            index = enumIndex

        transformAttributes = ([self.translation[0], "translateX"], [self.translation[1], "translateY"], [self.translation[2], "translateZ"], [self.rotation[0], "rotateX"], [self.rotation[1], "rotateY"], [self.rotation[2], "rotateZ"], [self.globalScale, "globalScale"])
        currentTime = cmds.currentTime(q=True)
        if setKeyframes:
            for attribute in transformAttributes:
                if attribute[0]:
                    if not cmds.selectKey(self.controlObject, attribute=attribute[1], time=(currentTime-1,)) > 0:
                        value = cmds.getAttr(self.controlObject + "." + attribute[1], time=currentTime-1)
                        cmds.setKeyframe(self.controlObject, attribute=attribute[1], time=currentTime-1, value=value, outTangentType="step")

        cmds.setAttr(spaceSwitcher + ".currentSpace", index)
        cmds.setKeyframe(spaceSwitcher, at="currentSpace", ott="step")

        # Adding this try/except loop for compatibility with older versions of Maya - MIC
        try:
            animCurveName = utils.stripAllNamespaces(spaceSwitcher)[1]  # Adding this to get proper name because Maya no longer automatically names anim curves with namespace - MIC
            utils.addNodeToContainer(animModuleNamespace + ":module_container", animCurveName + "_currentSpace")
        except TypeError:
            utils.addNodeToContainer(animModuleNamespace + ":module_container", spaceSwitcher + "_currentSpace")

        if maintainOffset:
            if self.globalScale == True:
                newScale = self.getCurrentScale()
                scaleRatio = newScale/currentScale
                newScaleAttributeValue = cmds.getAttr(self.controlObject + ".scaleY") / scaleRatio
                cmds.setAttr(self.controlObject + ".scaleY", newScaleAttributeValue)

            if self.rotation == [True, True, True]:
                cmds.xform(self.controlObject, worldSpace=True, absolute=True, rotation=currentOrientation)

            if self.translation == [True, True, True]:
                cmds.xform(self.controlObject, worldSpace=True, absolute=True, translation=currentPosition)

        if setKeyframes:
            for attribute in transformAttributes:
                if attribute[0]:
                    cmds.setKeyframe(self.controlObject, attribute=attribute[1])

    def getCurrentScale(self):
        locator = cmds.spaceLocator()[0]
        cmds.scaleConstraint(self.controlObject, locator)
        scale = cmds.getAttr(locator + ".scaleY")
        cmds.delete(locator)
        return scale

    def UI(self, parentLayout, extraContentBuilder=None):
        """
        Build a PySide UI for this control object.
        The UI is built inside a CollapsibleWidget whose header contains a bold label (the control's name)
        and a visibility checkbox. The content area contains three groups for Translate, Rotate, and (if applicable) Scale.
        In each group the X, Y, and Z controls (label + spin box) are arranged horizontally with a spacer between each.
        If extraContentBuilder is provided, it will be called with the content layout so callers can append custom controls inside the collapsible.
        """
        import System.animation_UI
        importlib.reload(System.animation_UI)
        from System.animation_UI import CollapsibleWidget, ClickToScrollDoubleSpinBox, FloatAttrControlWidget

        # Create a custom header widget
        headerWidget = QtWidgets.QWidget()
        headerLayout = QtWidgets.QHBoxLayout(headerWidget)
        headerLayout.setContentsMargins(5, 5, 5, 5)
        niceName = utils.stripAllNamespaces(self.controlObject)[1]
        nameLabel = QtWidgets.QLabel(niceName)
        nameLabel.setStyleSheet("font-weight: bold;")
        headerLayout.addWidget(nameLabel)
        headerLayout.addStretch(1)
        # Create a visibility checkbox.
        visCheckbox = QtWidgets.QCheckBox("Visibility")
        try:
            visVal = cmds.getAttr(self.controlObject + ".display")
        except Exception:
            visVal = True
        visCheckbox.setChecked(bool(visVal))
        visCheckbox.stateChanged.connect(lambda state: cmds.setAttr(self.controlObject + ".display", bool(state)))
        headerLayout.addWidget(visCheckbox)

        # Create the collapsible widget using our custom header.
        # (Assuming CollapsibleWidget is imported from our animation_UI module.)
        collapsible = CollapsibleWidget(headerWidget=headerWidget, settingsKey="ControlObject/" + niceName)
        contentLayout = QtWidgets.QVBoxLayout()
        collapsible.setContentLayout(contentLayout)

        # --- Translate Controls Group (only if any axis is enabled) ---
        self._transControls = {}
        translateAxes = [("X", self.translation[0]), ("Y", self.translation[1]), ("Z", self.translation[2])]
        if any(flag for _, flag in translateAxes):
            transGroup = QtWidgets.QGroupBox("Translate")
            transLayout = QtWidgets.QHBoxLayout(transGroup)
            transLayout.setSpacing(10)
            for axis, enabled in translateAxes:
                if not enabled:
                    continue
                axisLayout = QtWidgets.QHBoxLayout()
                lbl = QtWidgets.QLabel(axis + ":")
                spin = ClickToScrollDoubleSpinBox()
                spin.setRange(-100, 100)
                spin.setDecimals(3)
                try:
                    val = cmds.getAttr(self.controlObject + ".translate" + axis)
                except Exception:
                    val = 0.0
                spin.setValue(val)
                # When changed, update the Maya attribute.
                spin.valueChanged.connect(lambda v, a=axis: cmds.setAttr(self.controlObject + ".translate" + a, v))
                axisLayout.addWidget(lbl)
                axisLayout.addWidget(spin)
                axisLayout.addStretch(1)
                transLayout.addLayout(axisLayout)
                self._transControls[axis] = spin
            contentLayout.addWidget(transGroup)

        # --- Rotate Controls Group (only if any axis is enabled) ---
        self._rotControls = {}
        rotateAxes = [("X", self.rotation[0]), ("Y", self.rotation[1]), ("Z", self.rotation[2])]
        if any(flag for _, flag in rotateAxes):
            rotGroup = QtWidgets.QGroupBox("Rotate")
            rotLayout = QtWidgets.QHBoxLayout(rotGroup)
            rotLayout.setSpacing(10)
            for axis, enabled in rotateAxes:
                if not enabled:
                    continue
                axisLayout = QtWidgets.QHBoxLayout()
                lbl = QtWidgets.QLabel(axis + ":")
                spin = ClickToScrollDoubleSpinBox()
                spin.setRange(-360, 360)
                spin.setDecimals(3)
                try:
                    val = cmds.getAttr(self.controlObject + ".rotate" + axis)
                except Exception:
                    val = 0.0
                spin.setValue(val)
                spin.valueChanged.connect(lambda v, a=axis: cmds.setAttr(self.controlObject + ".rotate" + a, v))
                axisLayout.addWidget(lbl)
                axisLayout.addWidget(spin)
                axisLayout.addStretch(1)
                rotLayout.addLayout(axisLayout)
                self._rotControls[axis] = spin
            contentLayout.addWidget(rotGroup)

        # --- Global Scale Control (if enabled) ---
        if self.globalScale:
            fullAttr = self.controlObject + ".globalScale"
            try:
                val = cmds.getAttr(fullAttr)
            except Exception:
                val = 1.0
            # Create the float control widget with the desired range and conversion factor.
            scaleControl = FloatAttrControlWidget(fullAttr, "Global Scale:", 0.1, 10, val, conversion=1000, callback=lambda v: cmds.setAttr(fullAttr, v))
            contentLayout.addWidget(scaleControl)
            self._scaleControl = scaleControl

        # Allow callers to add additional content inside this collapsible.
        if extraContentBuilder is not None:
            try:
                extraContentBuilder(contentLayout)
            except Exception as e:
                print(f"Error building extra content for control {self.controlObject}: {e}")

        parentLayout.addWidget(collapsible)
        
        # separator
        parentLayout.addWidget(utils.create_separator())

        # Create a QTimer to refresh values periodically so that external changes are reflected.
        self.refreshTimer = QtCore.QTimer(collapsible)
        self.refreshTimer.timeout.connect(self._refreshValues)
        self.refreshTimer.start(100)

    def _refreshValues(self):
        # If the control object no longer exists, just return.
        if not cmds.objExists(self.controlObject):
            return

        # Refresh translation values.
        for axis, spin in self._transControls.items():
            attr = self.controlObject + ".translate" + axis
            if cmds.objExists(attr) and not spin.hasFocus():
                try:
                    val = cmds.getAttr(attr)
                    spin.setValue(val)
                except Exception as e:
                    print("Error refreshing translate" + axis + ":", e)

        # Refresh rotation values.
        for axis, spin in self._rotControls.items():
            attr = self.controlObject + ".rotate" + axis
            if cmds.objExists(attr) and not spin.hasFocus():
                try:
                    val = cmds.getAttr(attr)
                    spin.setValue(val)
                except Exception as e:
                    print("Error refreshing rotate" + axis + ":", e)

        # Refresh global scale (if enabled).
        if self.globalScale and hasattr(self, "_scaleControl") and not self._scaleControl.hasFocus():
            attr = self.controlObject + ".globalScale"
            if cmds.objExists(attr):
                try:
                    val = cmds.getAttr(attr)
                    self._scaleControl.setValue(val)
                except Exception as e:
                    print("Error refreshing global scale:", e)

    # def switchSpace_UI(self, targetObject):
    #     constraint = self.controlObject + "_spaceSwitcher_scaleConstraint"
    #     if not cmds.objExists(constraint):
    #         constraint = self.controlObject + "_spaceSwitcher_parentConstraint"
    #         if not cmds.objExists(constraint):
    #             print("ERROR: Control object appears to have no space switching capabilities")
    #             return

    #     spaceNameText = "[a-z] [A-Z] [0-9] or _ only"
    #     spaceNameEnable = True

    #     enumIndex = -1
    #     index = 0
    #     done = False

    #     while not done:
    #         attribute = constraint + ".target[" + str(index) + "].targetScale"
    #         if cmds.connectionInfo(attribute, isDestination=True):
    #             connection = cmds.listConnections(attribute)[0]

    #             if connection == targetObject + "_spaceSwitchTarget" or connection == targetObject:
    #                 enumIndex = index

    #                 enumEntries = cmds.attributeQuery("currentSpace", n=self.controlObject + "_spaceSwitcher", listEnum=True)[0]
    #                 enumEntriesList = enumEntries.split(":")

    #                 spaceNameText = enumEntriesList[index]
    #                 spaceNameEnable = False

    #                 done =True

    #         else:
    #             done = True

    #         index += 1

    #     self.windowName = "switchSpace_UI_window"

    #     self.UIElements = {}

    #     if cmds.window(self.windowName, exists=True):
    #         cmds.deleteUI(self.windowName)

    #     self.windowWidth = 300
    #     self.windowHeight = 200
    #     self.UIElements["window"] = cmds.window(self.windowName, width=self.windowWidth, height=self.windowHeight, title="Switch Space", sizeable=False)

    #     self.UIElements["topColumnLayout"] = cmds.columnLayout(adj=True, rs=3)

    #     self.UIElements["spaceName_rowColumn"] = cmds.rowColumnLayout(nc=2, columnAttach=(1, "right", 0), columnWidth=[(1,80), (2, self.windowWidth-90)])
    #     cmds.text(label="Space Name :")
    #     self.UIElements["spaceName"] = cmds.textField(enable=spaceNameEnable, text=spaceNameText)

    #     cmds.setParent(self.UIElements["topColumnLayout"])

    #     cmds.separator()
    #     self.UIElements["maintainOffset_checkBox"] = cmds.checkBox(label="Maintain Offset?", value=True)
    #     self.UIElements["setKeyframes_checkBox"] = cmds.checkBox(label="Set Keyframes on Control?", value=True)
    #     cmds.separator()

    #     columnWidth = (self.windowWidth/2) - 5
    #     self.UIElements["button_row"] = cmds.rowLayout(nc=2, columnWidth=[(1, columnWidth), (2, columnWidth)], cat=[(1, "both", 10), (2, "both", 10)], columnAlign=[(1, "center"), (2, "center")])
    #     cmds.button(label="Accept", c=partial(self.acceptWindow, targetObject, enumIndex))
    #     cmds.button(label="Cancel", c=self.cancelWindow)

    #     cmds.showWindow(self.UIElements["window"])

    # def acceptWindow(self, targetObject, enumIndex, *args):
    #     spaceName = cmds.textField(self.UIElements["spaceName"], q=True, text=True)
    #     maintainOffset = cmds.checkBox(self.UIElements["maintainOffset_checkBox"], q=True, value=True)
    #     setKeyframes = cmds.checkBox(self.UIElements["setKeyframes_checkBox"], q=True, value=True)

    #     cmds.deleteUI(self.UIElements["window"])

    #     animModuleNamespace = utils.stripAllNamespaces(self.controlObject)[0]
    #     blueprintModuleNamespace = utils.stripAllNamespaces(animModuleNamespace)[0]
    #     characterNamespace = utils.stripAllNamespaces(blueprintModuleNamespace)[0]

    #     containers = (characterNamespace + ":character_container", blueprintModuleNamespace + ":module_container", animModuleNamespace + ":module_container")

    #     for c in containers:
    #         cmds.lockNode(c, lock=False, lockUnpublished=False)

    #     self.switchSpace(targetObject, spaceName, index=enumIndex, maintainOffset=maintainOffset, setKeyframes=setKeyframes)

    #     for c in containers:
    #         cmds.lockNode(c, lock=True, lockUnpublished=True)

    #     cmds.select(self.controlObject, replace=True)

    # def cancelWindow(self, *args):
    #     cmds.deleteUI(self.UIElements["window"])
