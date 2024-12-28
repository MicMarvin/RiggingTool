import maya.cmds as cmds
import RiggingTool.Modules.System.blueprint as blueprintMod
import importlib
import RiggingTool.Modules.Blueprint.finger as finger
import RiggingTool.Modules.System.utils as utils
import os
from PySide2 import QtWidgets
importlib.reload(blueprintMod)
importlib.reload(utils)

CLASS_NAME = "Thumb"

TITLE = "Thumb"
DESCRIPTION = "Create 4 joints, defining a thumb. Ideal use: thumb"
ICON = os.environ["RIGGING_TOOL_ROOT"] + "/RiggingTool/Icons/thumb.svg"

class Thumb(finger.Finger):
    def __init__(self, userSpecifiedName, hookObject):
        jointInfo = [["root_joint", [0.0, 0.0, 0.0]], ["knuckle_1_joint", [4.0, 0.0, 0.0]], ["knuckle_2_joint", [8.0, 0.0, 0.0]], ["end_joint", [12.0, 0.0, 0.0]]]

        blueprintMod.Blueprint.__init__(self, CLASS_NAME, userSpecifiedName, jointInfo, hookObject)

    # def UI_custom(self):
    #     joints = self.getJoints()
    #     joints.pop()
    #
    #     column01Label = QtWidgets.QLabel("Rotation Order(s)")
    #     column02Label = QtWidgets.QLabel("Preferred Angle(s)")
    #
    #     self.parentColumn01Layout.addRow(column01Label)
    #     for joint in joints:
    #         self.createRotationOrderUIControl(joint)
    #
    #     self.parentColumn03Layout.addRow(column02Label)
    #     for joint in joints:
    #         self.createPreferredAngleUIControl(self.getPreferredAngleControl(joint))