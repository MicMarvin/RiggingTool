import maya.cmds as cmds
import RiggingTool.Modules.System.blueprint as blueprintMod
import RiggingTool.Modules.System.utils as utils
import importlib
import os
from PySide2 import QtWidgets, QtCore
importlib.reload(blueprintMod)
importlib.reload(utils)

CLASS_NAME = "Spline"

TITLE = "Spline"
DESCRIPTION = "Creates an optionally interpolating, joint-count adjustable, spline. Ideal use: spine, neck/head, tail, tentacles, etc."
ICON = os.environ["RIGGING_TOOL_ROOT"] + "/RiggingTool/Icons/spline.svg"

class Spline(blueprintMod.Blueprint):
    def __init__(self, userSpecifiedName, hookObject, numberOfJoints=None, startJointPos=None, endJointPos=None):
        if numberOfJoints == None:
            jointsGrp = CLASS_NAME + "__" + userSpecifiedName + ":joints_grp"
            if not cmds.objExists(jointsGrp):
                numberOfJoints = 5  # Default
            else:
                joints = utils.findJointChain(jointsGrp)

                # Only pop if there are more than one joints
                if len(joints) > 2:
                    joints.pop()
                numberOfJoints = len(joints)

        jointInfo = []

        if startJointPos == None:
            startJointPos = [0.0, 0.0, 0.0]
        if endJointPos == None:
            endJointPos = [0.0, 15.0, 0.0]

        # Ensure numberOfJoints is at least 2 to avoid division by zero
        if numberOfJoints <= 1:
            numberOfJoints = 2

        jointIncrement = [(endJointPos[i] - startJointPos[i]) / (numberOfJoints - 1) for i in range(3)]
        jointPos = startJointPos

        for i in range(numberOfJoints):
            jointName = "spline_" + str(i) + "_joint"

            jointInfo.append([jointName, list(jointPos)])

            jointPos = [jointPos[j] + jointIncrement[j] for j in range(3)]

        blueprintMod.Blueprint.__init__(self, CLASS_NAME, userSpecifiedName, jointInfo, hookObject)

        self.canBeMirrored = False

    def install_custom(self, joints):
        self.setup_interpolation()

        moduleGrp = self.moduleNamespace + ":module_grp"
        cmds.select(moduleGrp)

        cmds.addAttr(at="enum", enumName="y:z", longName="sao_local")
        cmds.addAttr(at="enum", enumName="+x:-x:+y:-y:+z:-z", longName="sao_world")

        for attr in ["sao_local", "sao_world"]:
            cmds.container(self.containerName, edit=True, publishAndBind=[moduleGrp + "." + attr, attr])

    def setup_interpolation(self, unlockContainer=False, *args):
        previousSelection = cmds.ls(selection=True)

        joints = self.getJoints()
        numberOfJoints = len(joints)

        startControl = self.getTranslationControl(joints[0])
        endControl = self.getTranslationControl(joints[numberOfJoints-1])

        pointConstraints = []

        for i in range(1, numberOfJoints-1):
            material = joints[i] + "_m_translation_control"
            cmds.setAttr(material + ".colorR", 0.815)
            cmds.setAttr(material + ".colorG", 0.725)
            cmds.setAttr(material + ".colorB", 0.420)

            translationControl = self.getTranslationControl(joints[i])

            endWeight = 0.0 + (float(i) / (numberOfJoints - 1))
            startWeight = 1.0 - endWeight

            pointConstraints.append(cmds.pointConstraint(startControl, translationControl, maintainOffset=False, weight=startWeight)[0])
            pointConstraints.append(cmds.pointConstraint(endControl, translationControl, maintainOffset=False, weight=endWeight)[0])

            for attr in [".translateX", ".translateY", ".translateZ"]:
                cmds.setAttr(translationControl + attr, lock=True)

        interpolationContainer = cmds.container(n=self.moduleNamespace + ":interpolation_container")
        utils.addNodeToContainer(interpolationContainer, pointConstraints)
        utils.addNodeToContainer(self.containerName, interpolationContainer)

        if len(previousSelection) > 0:
            cmds.select(previousSelection, replace=True)
        else:
            cmds.select(clear=True)

    def UI_custom(self):
        # Check if UI has already been initialized
        if hasattr(self, 'ui_initialized') and self.ui_initialized:
            return

        # Ensure that module_grp exists
        module_grp = f"{self.moduleNamespace}:module_grp"
        if not cmds.objExists(module_grp):
            # Defer execution and return
            if not hasattr(self, 'ui_deferred'):
                self.ui_deferred = True
                cmds.evalDeferred(self.UI_custom)
            return

        # Ensure that joints exist
        joints = self.getJoints()
        if not joints:
            # Defer execution and return
            if not hasattr(self, 'ui_deferred_joints'):
                self.ui_deferred_joints = True
                cmds.evalDeferred(self.UI_custom)
            return

        # Proceed with UI setup
        self.ui_deferred = False
        self.ui_deferred_joints = False

        numJoints = len(self.jointInfo)
        self.numberOfJointsField = QtWidgets.QSpinBox()
        topRowLabel = QtWidgets.QLabel("Orientation: Local will be oriented towards World direction")
        column01Label = QtWidgets.QLabel("")
        column02Label = QtWidgets.QLabel("")
        sao_local_options = self.get_enum_options(module_grp, "sao_local")
        sao_world_options = self.get_enum_options(module_grp, "sao_world")
        local_combo = QtWidgets.QComboBox()
        local_combo.addItems(sao_local_options)
        local_combo.currentIndexChanged.connect(lambda: self.set_enum_value(module_grp, "sao_local", local_combo.currentText()))
        sao_local_index = cmds.getAttr(f"{module_grp}.sao_local")
        local_combo.setCurrentIndex(sao_local_index)
        world_combo = QtWidgets.QComboBox()
        world_combo.addItems(sao_world_options)
        world_combo.currentIndexChanged.connect(lambda: self.set_enum_value(module_grp, "sao_world", world_combo.currentText()))
        sao_world_index = cmds.getAttr(f"{module_grp}.sao_world")
        world_combo.setCurrentIndex(sao_world_index)
        self.numberOfJointsField.setMinimum(2)
        self.numberOfJointsField.setValue(numJoints)
        self.numberOfJointsField.valueChanged.connect(self.changeNumberOfJoints)
        interpolate_checkbox = QtWidgets.QCheckBox()

        interpolating = False
        if cmds.objExists(self.moduleNamespace + ":interpolation_container"):
            interpolating = True

        interpolate_checkbox.setChecked(interpolating)

        self.parentTopRowLayout.addWidget(topRowLabel)
        self.parentColumn01Layout.addRow("Local:", local_combo)
        self.parentColumn01Layout.addWidget(column01Label)
        self.parentColumn02Layout.addRow("World:", world_combo)
        self.parentColumn02Layout.addWidget(column02Label)
        self.createRotationOrderUIControl(joints[0])
        self.parentColumn02Layout.addRow("Joints:", self.numberOfJointsField)
        self.parentColumn03Layout.addRow("Interpolate:", interpolate_checkbox)

        interpolate_checkbox.stateChanged.connect(self.handle_interpolation_state)

    def get_enum_options(self, object_name, attribute_name):
        """Retrieve enum options from a Maya attribute."""
        if cmds.attributeQuery(attribute_name, node=object_name, exists=True):
            enum_str = cmds.attributeQuery(attribute_name, node=object_name, listEnum=True)[0]
            return enum_str.split(":")
        else:
            return ["Attribute not found"]

    def set_enum_value(self, object_name, attribute_name, value):
        """Set the value of an enum attribute on a Maya object."""
        enum_string = cmds.attributeQuery(attribute_name, node=object_name, listEnum=True)[0]
        enum_options = enum_string.split(":")
        index = enum_options.index(value)
        cmds.setAttr(f"{object_name}.{attribute_name}", index)

    def handle_interpolation_state(self, state):
        if state == QtCore.Qt.Checked:
            self.setup_interpolation(True)
        else:
            self.delete_interpolation()

    def delete_interpolation(self, *args):
        joints = self.getJoints()

        for i in range(1, len(joints)-1):
            translationControl = self.getTranslationControl(joints[i])
            for attr in [".translateX", ".translateY", ".translateZ"]:
                cmds.setAttr(translationControl + attr, l=False)

            material = joints[i] + "_m_translation_control"
            cmds.setAttr(material + ".colorR", 0.973)
            cmds.setAttr(material + ".colorG", 0.667)
            cmds.setAttr(material + ".colorB", 0.149)

        cmds.delete(self.moduleNamespace + ":interpolation_container")

    def changeNumberOfJoints(self, *args):
        self.blueprint_UI_instance.deleteScriptJob()

        joints = self.getJoints()
        numJoints = len(joints)
        newNumJoints = self.numberOfJointsField.value()

        startPos = cmds.xform(self.getTranslationControl(joints[0]), q=True, worldSpace=True, translation=True)
        endPos = cmds.xform(self.getTranslationControl(joints[numJoints-1]), q=True, worldSpace=True, translation=True)

        hookObject = self.findHookObjectForLock()

        rotationOrder = cmds.getAttr(joints[0] + ".rotateOrder")
        sao_local = cmds.getAttr(self.moduleNamespace + ":module_grp.sao_local")
        sao_world = cmds.getAttr(self.moduleNamespace + ":module_grp.sao_world")

        self.delete()

        newInstance = Spline(self.userSpecifiedName, hookObject, newNumJoints, startPos, endPos)
        newInstance.install()

        newJoints = newInstance.getJoints()

        cmds.setAttr(newJoints[0] + ".rotateOrder", rotationOrder)

        cmds.setAttr(newInstance.moduleNamespace + ":module_grp.sao_local", sao_local)
        cmds.setAttr(newInstance.moduleNamespace + ":module_grp.sao_world", sao_world)

        self.blueprint_UI_instance.createScriptJob()

        cmds.select(newInstance.moduleNamespace + ":module_transform", replace=True)

    def lock_phase1(self):
        # Gather and return all required information from this module's control objects

        # jointPositions = list of joint positions from root down the hierarchy
        # jointOrientations = a list of orientations, or a list of axis information (orientJoint and secondaryAxisOrient for joint command)
        #            # These are passed in the following tuple: (orientations, None) or (None, axisInfo)
        # jointRotationOrders = a list of joint rotation orders (integer valuesgathered with getAttr)
        # jointPreferredAngles = a list of joint preferred angles, optional (can pass None)
        # hookObject = self.findHookObjectForLock()
        # rootTransform = a bool, either True or False. True = R, T, and S on root joint. False = R only
        #
        # moduleInfo = (jointPositions, jointOrientations, jointRotationOrders, jointPreferredAngles, hookObject, rootTransform)
        # return moduleInfo

        jointPositions = []
        jointOrientationValues = []
        jointRotationOrders = []
        jointPreferredAngles = []

        joints = self.getJoints()

        jointOrientationSettings = []
        moduleGrp = self.moduleNamespace + ":module_grp"

        localAxis = cmds.getAttr(moduleGrp + ".sao_local")
        if localAxis == 0:
            jointOrientationSettings.append("xyz")
        else:
            jointOrientationSettings.append("xzy")

        worldAxis = cmds.getAttr(moduleGrp + ".sao_world")
        if worldAxis == 0:
            jointOrientationSettings.append("xup")
        elif worldAxis == 1:
            jointOrientationSettings.append("xdown")
        elif worldAxis == 2:
            jointOrientationSettings.append("yup")
        elif worldAxis == 3:
            jointOrientationSettings.append("ydown")
        elif worldAxis == 4:
            jointOrientationSettings.append("zup")
        elif worldAxis == 5:
            jointOrientationSettings.append("zdown")

        for joint in joints:
            jointPositions.append(cmds.xform(joint, q=True, worldSpace=True, translation=True))
            jointRotationOrders.append(cmds.getAttr(joints[0] + ".rotateOrder"))
            jointOrientationValues.append(jointOrientationSettings)

        jointOrientations = (None, jointOrientationValues)

        hookObject = self.findHookObjectForLock()
        rootTransform = True

        moduleInfo = (jointPositions, jointOrientations, jointRotationOrders, jointPreferredAngles, hookObject, rootTransform)
        return moduleInfo
