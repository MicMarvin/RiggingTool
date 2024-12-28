import maya.cmds as cmds
import RiggingTool.Modules.System.blueprint as blueprintMod
import RiggingTool.Modules.Blueprint.singleOrientableJoint as singleOrientableJoint
import RiggingTool.Modules.System.utils as utils
import importlib
import os
importlib.reload(blueprintMod)
importlib.reload(singleOrientableJoint)
importlib.reload(utils)

CLASS_NAME = "RootTransform"

TITLE = "Root Transform"
DESCRIPTION = "Create a single joint with control for position and orientation. Once created (locked) the joint can rotate, translate and scale. Ideal use: global/master control"
ICON = os.environ["RIGGING_TOOL_ROOT"] + "/RiggingTool/Icons/rootTransform.svg"

class RootTransform(singleOrientableJoint.SingleOrientableJoint):
    def __init__(self, userSpecifiedName, hookObject):
        jointInfo = [["joint", [0.0, 0.0, 0.0]]]

        blueprintMod.Blueprint.__init__(self, CLASS_NAME, userSpecifiedName, jointInfo, hookObject)

    def lock_phase1(self):
        moduleInfo = list(singleOrientableJoint.SingleOrientableJoint.lock_phase1(self))
        moduleInfo[5] = True
        return moduleInfo
