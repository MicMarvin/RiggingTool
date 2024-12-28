from functools import partial
import os
from PySide2 import QtWidgets, QtCore
import maya.cmds as cmds
import importlib
import RiggingTool.Modules.System.utils as utils
importlib.reload(utils)

class GroupSelected(QtWidgets.QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)

        self.blueprint_ui = parent  # Store reference to Blueprint_UI so we can use it's methods like separator

        self.setWindowTitle("Group Selected")
        self.setFixedSize(300, 225)

        self.objectsToGroup = []

        # Layouts
        self.main_layout = QtWidgets.QVBoxLayout(self)
        self.group_layout = QtWidgets.QGridLayout()
        self.button_layout = QtWidgets.QHBoxLayout(self)

        # Widgets
        self.groupName = QtWidgets.QLineEdit()
        self.groupName.setText("group")
        self.group_label = QtWidgets.QLabel("Group Name:")
        self.position_label = QtWidgets.QLabel("Position at:")
        self.lastSelected_button = QtWidgets.QPushButton("Last Selected")
        self.averagePosition_button = QtWidgets.QPushButton("Average Position")
        self.separator = self.blueprint_ui.create_separator()
        self.accept_button = QtWidgets.QPushButton("Accept")
        self.cancel_button = QtWidgets.QPushButton("Cancel")

        # Add widgets to layout
        self.group_layout.addWidget(self.group_label, 0, 0, 1, 2, alignment=QtCore.Qt.AlignmentFlag.AlignRight)
        self.group_layout.addWidget(self.groupName, 0, 2, 1, 3)
        self.group_layout.addWidget(self.position_label, 1, 0, 1, 2, alignment=QtCore.Qt.AlignmentFlag.AlignRight)

        self.group_layout.addWidget(self.lastSelected_button, 2, 3, 1, 1)
        self.group_layout.addWidget(self.averagePosition_button, 3, 3, 1, 1)
        self.group_layout.addWidget(self.separator, 4, 0, 1, 5)

        self.button_layout.addWidget(self.accept_button)
        self.button_layout.addWidget(self.cancel_button)

        self.main_layout.addLayout(self.group_layout)
        self.main_layout.addLayout(self.button_layout)

        # Connect button signals
        self.lastSelected_button.clicked.connect(self.createAtLastSelected)
        self.averagePosition_button.clicked.connect(self.createAtAveragePosition)
        self.cancel_button.clicked.connect(self.cancelWindow)
        self.accept_button.clicked.connect(self.acceptWindow)



    def show_UI(self):
        # Find the selection of objects to group
        self.findSelectionToGroup()

        if len(self.objectsToGroup) == 0:
            QtWidgets.QMessageBox.warning(self, "No Objects", "No valid objects selected for grouping.")
            return
        self.show()

        self.createTemporaryGroupRepresentation()
        self.createAtLastSelected()

        cmds.select(self.tempGroupTransform)
        cmds.setToolTo("moveSuperContext")

    def findSelectionToGroup(self):
        selectedObjects = cmds.ls(sl=True, transforms=True)

        self.objectsToGroup = []
        for obj in selectedObjects:
            valid = False

            if obj.find("module_transform") != -1:
                splitString = obj.rsplit("module_transform")
                if splitString[1] == "":
                    valid = True

            if valid == False and obj.find("Group__") == 0:
                valid = True

            if valid == True:
                self.objectsToGroup.append(obj)

    def group_selected_objects(self):
        if self.objectsToGroup:
            group_name = cmds.group(self.objectsToGroup, name="Group__" + utils.getUniqueName("group"))
            cmds.select(clear=True)
            QtWidgets.QMessageBox.information(self, "Success", f"Grouped objects into: {group_name}")
        else:
            QtWidgets.QMessageBox.warning(self, "No Objects", "No valid objects selected for grouping.")

    def createTemporaryGroupRepresentation(self):
        controlGrpFile = os.environ["RIGGING_TOOL_ROOT"] + "/RiggingTool/ControlObjects/Blueprint/controlGroup_control.ma"
        cmds.file(controlGrpFile,i=True, defaultNamespace=True)

        self.tempGroupTransform = cmds.rename("controlGroup_control", "Group__tempGroupTransform__")

        cmds.connectAttr(self.tempGroupTransform + ".scaleY", self.tempGroupTransform + ".scaleX")
        cmds.connectAttr(self.tempGroupTransform + ".scaleY", self.tempGroupTransform + ".scaleZ")

        for attr in ["scaleX", "scaleZ", "visibility"]:
            cmds.setAttr(self.tempGroupTransform + "." + attr, l=True, k=False)

        cmds.aliasAttr("globalScale", self.tempGroupTransform + ".scaleY")

    def createAtLastSelected(self, *args):
        controlPos = cmds.xform(self.objectsToGroup[len(self.objectsToGroup)-1], q=True, ws=True, translation=True)
        cmds.xform(self.tempGroupTransform, ws=True, absolute=True, translation=controlPos)

    def createAtAveragePosition(self, *args):
        controlPos = [0.0, 0.0, 0.0]
        for obj in self.objectsToGroup:
            objPos = cmds.xform(obj, q=True, ws=True, translation=True)
            controlPos[0] += objPos[0]
            controlPos[1] += objPos[1]
            controlPos[2] += objPos[2]

        numberOfObjects = len(self.objectsToGroup)
        controlPos[0] /= numberOfObjects
        controlPos[1] /= numberOfObjects
        controlPos[2] /= numberOfObjects

        cmds.xform(self.tempGroupTransform, ws=True, absolute=True, translation=controlPos)

    def cancelWindow(self, *args):
        self.close()
        cmds.delete(self.tempGroupTransform)
    def acceptWindow(self, *args):
        groupName = self.groupName.text()

        if self.createGroup(groupName) != None:
            self.close()


    def createGroup(self, groupName):
        fullGroupName = "Group__" + groupName
        if cmds.objExists(fullGroupName):
            QtWidgets.QMessageBox.warning(self, "Name Conflict", f"The group name '{groupName}' already exists.")
            return None

        groupTransform = cmds.rename(self.tempGroupTransform, fullGroupName)

        groupContainer = "Group_container"
        if not cmds.objExists(groupContainer):
            cmds.container(name=groupContainer)

        if len(self.objectsToGroup) != 0:
            tempGroup = cmds.group(self.objectsToGroup, absolute=True)

            groupParent = cmds.listRelatives(tempGroup, parent=True)

            if groupParent != None:
                cmds.parent(groupTransform, groupParent[0], absolute=True)

            cmds.parent(self.objectsToGroup, groupTransform, absolute=True)

            cmds.delete(tempGroup)

        self.addGroupToContainer(groupTransform)

        cmds.setToolTo("moveSuperContext")
        cmds.select(groupTransform, replace=True)

        return groupTransform

    def addGroupToContainer(self, group):
        groupContainer = "Group_container"
        utils.addNodeToContainer(groupContainer, group, includeShapes=True)

        groupName = group.partition("Group__")[2]

        cmds.container(groupContainer, edit=True, publishAndBind=[group + ".translate", groupName + "_t"])
        cmds.container(groupContainer, edit=True, publishAndBind=[group + ".rotate", groupName + "_r"])
        cmds.container(groupContainer, edit=True, publishAndBind=[group + ".globalScale", groupName + "_globalScale"])

    def createGroupAtSpecified(self, name, targetGroup, parent):
        self.createTemporaryGroupRepresentation()

        parentConstraint = cmds.parentConstraint(targetGroup, self.tempGroupTransform, maintainOffset=False)[0]
        cmds.delete(parentConstraint)

        scale = cmds.getAttr(targetGroup + ".globalScale")
        cmds.setAttr(self.tempGroupTransform + ".globalScale", scale)

        if parent != None:
            cmds.parent(self.tempGroupTransform, parent, absolute=True)

        newGroup = self.createGroup(name)

        return newGroup

class UngroupSelected:
    def __init__(self):
        selectedObjects = cmds.ls(selection=True, transforms=True)

        filteredGroups = []
        for obj in selectedObjects:
            if obj.find("Group__") == 0:
                filteredGroups.append(obj)

        if len(filteredGroups) == 0:
            return

        groupContainer = "Group_container"
        modules = []
        for group in filteredGroups:
            modules.extend(self.findChildModules(group))

        moduleContainers = [groupContainer]
        for module in modules:
            moduleContainer = module + ":module_container"
            moduleContainers.append(moduleContainer)

        for group in filteredGroups:
            numChildren = len(cmds.listRelatives(group, children=True))
            if numChildren > 1:
                cmds.ungroup(group, absolute=True)

            for attr in ["t", "r", "globalScale"]:
                cmds.container(groupContainer, edit=True, unbindAndUnpublish=group + "." + attr)

            parentGroup = cmds.listRelatives(group, parent=True)

            cmds.delete(group)

            if parentGroup != None:
                parentGroup = parentGroup[0]
                children = cmds.listRelatives(parentGroup, children=True)
                children = cmds.ls(children, transforms=True)

                if len(children) == 0:
                    cmds.select(parentGroup, replace=True)
                    UngroupSelected()

        # After ungrouping, check if the container is empty and remove it if needed
        self.checkAndRemoveEmptyGroupContainer()

    def findChildModules(self, group):
        modules = []
        children = cmds.listRelatives(group, children=True)

        if children != None:
            for child in children:
                moduleNamespaceInfo = utils.stripLeadingNamespace(child)
                if moduleNamespaceInfo != None:
                    modules.append(moduleNamespaceInfo[0])
                elif child.find("Group__") != -1:
                    modules.extend(self.findChildModules(child))

        return modules

    def checkAndRemoveEmptyGroupContainer(self):
        groupContainer = "Group_container"
        # Check if the container exists and if it has any children
        if cmds.objExists(groupContainer):
            children = cmds.container(groupContainer, q=True, nodeList=True)
            if not children:
                cmds.delete(groupContainer)
                print(f"{groupContainer} was empty and has been deleted.")
