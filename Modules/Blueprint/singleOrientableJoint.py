import maya.cmds as cmds
import RiggingTool.Modules.System.blueprint as blueprintMod
import importlib
import RiggingTool.Modules.System.utils as utils
import os
from PySide2 import QtWidgets
import sys
import maya.utils
import logging

importlib.reload(utils)

CLASS_NAME = "SingleOrientableJoint"

TITLE = "Single Orientable Joint"
DESCRIPTION = "Create a single joint with control for position and orientation. Once created (locked) the joint can only rotate. Ideal use: wrist"
ICON = os.environ["RIGGING_TOOL_ROOT"] + "/RiggingTool/Icons/singleOrientable.svg"

# Setup logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

# Remove any existing handlers
if logger.hasHandlers():
    logger.handlers.clear()


# Create and add the custom handler
class MayaStreamHandler(logging.StreamHandler):
    def __init__(self):
        logging.StreamHandler.__init__(self, stream=sys.stdout)

    def emit(self, record):
        msg = self.format(record)
        maya.utils.executeInMainThreadWithResult(sys.__stdout__.write, msg + '\n')


handler = MayaStreamHandler()
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
logger.addHandler(handler)


class SingleOrientableJoint(blueprintMod.Blueprint):
    def __init__(self, userSpecifiedName, hookObject):
        logger.debug(f"Initializing {CLASS_NAME} with name '{userSpecifiedName}' and hookObject '{hookObject}'")
        jointInfo = [["joint", [0.0, 0.0, 0.0]]]

        super().__init__(CLASS_NAME, userSpecifiedName, jointInfo, hookObject)

    def install_custom(self, joints):
        logger.debug(f"install_custom called for {CLASS_NAME} with joints: {joints}")
        self.createSingleJointOrientationControlAtJoint(joints[0])

    def mirror_custom(self, originalModule):
        logger.debug(f"mirror_custom called for {CLASS_NAME} from originalModule: {originalModule}")
        jointName = self.jointInfo[0][0]
        originalJoint = originalModule + ":" + jointName
        newJoint = self.moduleNamespace + ":" + jointName

        originalOrientationControl = self.getSingleJointOrientationControl(originalJoint)
        newOrientationControl = self.getSingleJointOrientationControl(newJoint)

        oldRotation = cmds.getAttr(originalOrientationControl + ".rotate")[0]
        cmds.setAttr(newOrientationControl + ".rotate", oldRotation[0], oldRotation[1], oldRotation[2], type="double3")

    def UI_custom(self):
        logger.debug(f"UI_custom called for {CLASS_NAME}")
        # Check if UI has already been initialized
        if hasattr(self, 'ui_initialized') and self.ui_initialized:
            logger.debug(f"UI already initialized for {CLASS_NAME}, skipping UI_custom")
            return

        joints = self.getJoints()
        column01Label = QtWidgets.QLabel("Rotation Order(s)")
        self.parentColumn01Layout.addRow(column01Label)
        self.createRotationOrderUIControl(joints[0])

        self.ui_initialized = True
        logger.debug(f"UI initialized for {CLASS_NAME}")

    def lock_phase1(self):
        logger.debug(f"lock_phase1 called for {CLASS_NAME}")

        jointPositions = []
        jointOrientationValues = []
        jointRotationOrders = []

        joint = self.getJoints()[0]
        logger.debug(f"Processing joint: {joint}")

        jointPositions.append(cmds.xform(joint, q=True, worldSpace=True, translation=True))
        logger.debug(f"Joint position: {jointPositions[-1]}")

        jointOrientationValues.append(
            cmds.xform(self.getSingleJointOrientationControl(joint), q=True, worldSpace=True, rotation=True))
        logger.debug(f"Joint orientation: {jointOrientationValues[-1]}")
        jointOrientations = (jointOrientationValues, None)

        jointRotationOrders.append(cmds.getAttr(joint + ".rotateOrder"))
        logger.debug(f"Joint rotation order: {jointRotationOrders[-1]}")

        jointPreferredAngles = None
        hookObject = self.findHookObjectForLock()
        logger.debug(f"Hook object: {hookObject}")
        rootTransform = False

        moduleInfo = (
        jointPositions, jointOrientations, jointRotationOrders, jointPreferredAngles, hookObject, rootTransform)
        logger.debug(f"moduleInfo: {moduleInfo}")
        return moduleInfo
