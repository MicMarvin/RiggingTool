import maya.cmds as cmds
import System.utils as utils

# PySide2 imports for the new UI:
from PySide2 import QtWidgets, QtCore, QtGui
from shiboken2 import wrapInstance
import maya.OpenMayaUI as omui

import importlib
importlib.reload(utils)

from functools import partial

def maya_main_window():
    """Return Maya's main window widget."""
    main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(int(main_window_ptr), QtWidgets.QWidget)


class ModuleMaintenance:
    # Class-level variable to keep track of the currently open window.
    currentWindow = None

    def __init__(self, shelfTool_inst):
        self.shelfTool_instance = shelfTool_inst
        self.UIElements = {}

        self.controlModuleCompatibility = self.initializeControlModuleCompatibility()

    def initializeControlModuleCompatibility(self):
        animationControlModules = utils.findAllModules("Modules/Animation")
        moduleList = []
        for module in animationControlModules:
            mod = __import__("Animation." + module, (), (), [module])
            importlib.reload(mod)
            moduleClass = getattr(mod, mod.CLASS_NAME)
            moduleInstance = moduleClass(None)
            compatibleBlueprintModules = moduleInstance.compatibleBlueprintModules()
            moduleList.append((mod, mod.CLASS_NAME, compatibleBlueprintModules))
        return moduleList

    def setModuleMaintenanceVisibility(self, vis=True):
        characters = utils.findInstalledCharacters()
        for c in characters:
            characterGroup = c + ":character_grp"
            cmds.setAttr(characterGroup + ".moduleMaintenanceVisibility", vis)

    def objectSelected(self):
        objects = cmds.ls(selection=True)
        cmds.select(clear=True)

        for widget in QtWidgets.QApplication.allWidgets():
            if widget.objectName() == "modMaintain_UI_window":
                widget.close()

        characters = utils.findInstalledCharacters()
        for character in characters:
            blueprintInstances = utils.findInstalledBlueprintInstances(character)
            for blueprintInstance in blueprintInstances:
                blueprintJointsGrp = character + ":" + blueprintInstance + ":blueprint_joints_grp"
                if cmds.objExists(blueprintJointsGrp):  # Check if the node exists
                    if cmds.getAttr(blueprintJointsGrp + ".controlModulesInstalled"):
                        # Set color to blue
                        cmds.setAttr(blueprintJointsGrp + ".overrideColor", 6)
                    else:
                        # Set color to gray
                        cmds.setAttr(blueprintJointsGrp + ".overrideColor", 2)
                else:
                    print(f"Node not found: {blueprintJointsGrp}")


        if len(objects) > 0:
            lastSelected = objects[-1]
            lastSelected_stripNamespaces = utils.stripAllNamespaces(lastSelected)
            if lastSelected_stripNamespaces is not None:
                lastSelected_withoutNamespaces = lastSelected_stripNamespaces[1]
                if lastSelected_withoutNamespaces.find("blueprint_") == 0:
                    blueprintModuleNamespace_incCharNamespace = lastSelected_stripNamespaces[0]
                    moduleContainer = blueprintModuleNamespace_incCharNamespace + ":module_container"
                    cmds.select(moduleContainer, replace=True)
                    blueprintJointsGrp = blueprintModuleNamespace_incCharNamespace + ":blueprint_joints_grp"
                    cmds.setAttr(blueprintJointsGrp + ".overrideColor", 13)  # Set color to red
                    self.createUserInterface(blueprintModuleNamespace_incCharNamespace)

        self.setupSelectionScriptJob()

    def setupSelectionScriptJob(self):
        installedCharacters = utils.findInstalledCharacters()
        for characterNamespace in installedCharacters:
            characterName = characterNamespace.partition("__")[2]
            windowName = characterName + "_window"
            if cmds.window(windowName, exists=True):
                cmds.deleteUI(windowName)

        scriptJobNum = cmds.scriptJob(event=["SelectionChanged", self.objectSelected], runOnce=True, killWithScene=True)
        self.shelfTool_instance.setScriptJobNum(scriptJobNum)

    def disableSelectionScriptJob(self):
        scriptJobNum = self.shelfTool_instance.getScriptJobNum()

        # Ensure scriptJobNum is not None before attempting to use it
        if scriptJobNum is not None:
            if cmds.scriptJob(exists=scriptJobNum):
                cmds.scriptJob(kill=scriptJobNum)
            self.shelfTool_instance.setScriptJobNum(None)  # Reset after killing
        else:
            print("No active script job to disable.")

    def createUserInterface(self, blueprintModule):
        for widget in QtWidgets.QApplication.allWidgets():
            if widget.objectName() == "modMaintain_UI_window":
                widget.close()

        # Process the blueprint module name info as before.
        self.currentBlueprintModule = blueprintModule
        characterNamespaceInfo = utils.stripLeadingNamespace(blueprintModule)
        characterNamespace = characterNamespaceInfo[0]
        blueprintModuleNamespace = characterNamespaceInfo[1]
        characterName = characterNamespace.partition("__")[2]
        blueprintModuleInfo = blueprintModuleNamespace.partition("__")
        blueprintModuleName = blueprintModuleInfo[0]
        blueprintModuleUserSpecifiedName = blueprintModuleInfo[2]

        # Create a new QDialog and attach it to Maya's main window.
        parent = maya_main_window()
        dialog = QtWidgets.QDialog(parent)
        dialog.setObjectName("modMaintain_UI_window")
        dialog.setWindowTitle(f"Module maintenance for {characterName}:{blueprintModuleUserSpecifiedName}")
        dialog.setFixedSize(600, 200)
        self.UIElements["window"] = dialog

        # Main vertical layout for the dialog.
        main_layout = QtWidgets.QVBoxLayout(dialog)

        # Top row layout with two columns.
        top_row_layout = QtWidgets.QHBoxLayout()
        self.UIElements["topRowLayout"] = top_row_layout

        # Left Column: QListWidget to mimic cmds.textScrollList.
        control_list = QtWidgets.QListWidget()
        control_list.setObjectName("controlModule_textScrollList")
        control_list.setFixedWidth(296)
        control_list.itemSelectionChanged.connect(self.UI_controlModuleSelected)
        self.UIElements["controlModule_textScrollList"] = control_list
        top_row_layout.addWidget(control_list)

        # Right Column: a container widget with a vertical layout.
        right_column_widget = QtWidgets.QWidget()
        right_layout = QtWidgets.QVBoxLayout(right_column_widget)
        right_layout.setSpacing(3)
        self.UIElements["right_columnLayout"] = right_layout

        # A label for module name.
        name_text = QtWidgets.QLabel("No Animation Modules to Install")
        self.UIElements["nameText"] = name_text
        right_layout.addWidget(name_text)

        # A read-only text edit for module description.
        description_field = QtWidgets.QTextEdit()
        description_field.setReadOnly(True)
        description_field.setFixedHeight(110)
        self.UIElements["descriptionScrollField"] = description_field
        right_layout.addWidget(description_field)

        # A separator (horizontal line).
        separator = QtWidgets.QFrame()
        separator.setFrameShape(QtWidgets.QFrame.HLine)
        separator.setFrameShadow(QtWidgets.QFrame.Sunken)
        right_layout.addWidget(separator)

        # The install button, initially disabled.
        install_btn = QtWidgets.QPushButton("Install")
        install_btn.setEnabled(False)
        self.UIElements["installBtn"] = install_btn
        right_layout.addWidget(install_btn)

        top_row_layout.addWidget(right_column_widget)
        main_layout.addLayout(top_row_layout)

        # Populate the list widget from controlModuleCompatibility.
        for controlModule in self.controlModuleCompatibility:
            if blueprintModuleName in controlModule[2]:
                if not self.isModuleInstalled(controlModule[1]):
                    control_list.addItem(controlModule[1])

        if control_list.count() != 0:
            control_list.setCurrentRow(0)
            self.UI_controlModuleSelected()

        dialog.show()
   
    def isModuleInstalled(self, moduleName):
        """Return True if an animation module with this base name is already installed under the current blueprint."""
        cmds.namespace(setNamespace=self.currentBlueprintModule)
        installedModules = cmds.namespaceInfo(listOnlyNamespaces=True) or []
        cmds.namespace(setNamespace=":")

        for ns in installedModules:
            # Strip any blueprint/character prefix: grab the leaf namespace only
            leaf = utils.stripAllNamespaces(ns)[1]

            # Typical install names look like "<moduleName>_<index>"
            if leaf.startswith(moduleName + "_"):
                return True

            # Also handle legacy names that might include "__" separators
            base = leaf.partition("__")[0]
            if base == moduleName:
                return True

        return False

    def UI_controlModuleSelected(self, *args):
        control_list = self.UIElements["controlModule_textScrollList"]
        selected_items = control_list.selectedItems()
        if not selected_items:
            self.UIElements["nameText"].setText("All Animation Modules Installed")
            self.UIElements["descriptionScrollField"].setPlainText("")
            self.UIElements["installBtn"].setEnabled(False)
            return
        else:
            moduleName = selected_items[0].text()
            mod = None
            for controlModule in self.controlModuleCompatibility:
                if controlModule[1] == moduleName:
                    mod = controlModule[0]
                    break
            if mod is not None:
                self.UIElements["nameText"].setText(mod.TITLE)
                self.UIElements["descriptionScrollField"].setPlainText(mod.DESCRIPTION)
                self.UIElements["installBtn"].setEnabled(True)
                # Disconnect previous signals to avoid duplicate connections.
                try:
                    self.UIElements["installBtn"].clicked.disconnect()
                except Exception:
                    pass
                self.UIElements["installBtn"].clicked.connect(partial(self.installModule, mod, moduleName))

    def installModule(self, mod, moduleName, *args):
        # # Temporarily supress warnings for frame rate mismatch
        # oldState = cmds.scriptEditorInfo(query=True, suppressWarnings=True)
        # cmds.scriptEditorInfo(suppressWarnings=True)

        self.disableSelectionScriptJob()
        moduleNamespace = self.currentBlueprintModule + ":" + mod.CLASS_NAME + "_1"
        moduleClass = getattr(mod, mod.CLASS_NAME)
        moduleInstance = moduleClass(moduleNamespace)
        moduleInstance.install()
        
        # Remove the installed module from the list.
        control_list = self.UIElements["controlModule_textScrollList"]
        items = control_list.findItems(moduleName, QtCore.Qt.MatchExactly)
        for item in items:
            row = control_list.row(item)
            control_list.takeItem(row)
        if control_list.count() != 0:
            control_list.setCurrentRow(0)

        self.UI_controlModuleSelected()
        utils.forceSceneUpdate()
        cmds.select(self.currentBlueprintModule + ":module_container", replace=True)
        self.setupSelectionScriptJob()
        
        # # Renable warnings for script output
        # cmds.scriptEditorInfo(suppressWarnings=oldState)
