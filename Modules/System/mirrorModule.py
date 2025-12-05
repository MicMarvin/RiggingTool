from PySide2 import QtWidgets, QtCore
import maya.cmds as cmds
import RiggingTool.Modules.System.utils as utils
import importlib
importlib.reload(utils)


class ProgressDialog(QtWidgets.QDialog):
    def __init__(self, title="Processing...", parent=None):
        super().__init__(parent)
        self.setWindowTitle(title)
        self.setModal(True)
        self.setMinimumSize(300, 100)

        self.layout = QtWidgets.QVBoxLayout(self)

        self.label = QtWidgets.QLabel("Initializing...", self)
        self.progressBar = QtWidgets.QProgressBar(self)
        self.progressBar.setMinimum(0)
        self.progressBar.setMaximum(100)

        self.layout.addWidget(self.label)
        self.layout.addWidget(self.progressBar)

        # Optional: Remove close button to prevent closing
        self.setWindowFlags(self.windowFlags() & ~QtCore.Qt.WindowCloseButtonHint)

class MirrorModule:
    def __init__(self, parent=None):
        self.parent = parent
        self.UIElements = {}  # Initialize the UIElements dictionary

        selection = cmds.ls(selection=True, transforms=True)
        if len(selection) == 0:
            return

        firstSelected = selection[0]

        self.modules = []
        self.group = None
        if firstSelected.find("Group__") == 0:
            self.group = firstSelected
            self.modules = self.findSubModules(firstSelected)
        else:
            moduleNamespaceInfo = utils.stripLeadingNamespace(firstSelected)
            if moduleNamespaceInfo != None:
                self.modules.append(moduleNamespaceInfo[0])

        tempModuleList = []
        for module in self.modules:
            if self.isModuleAMirror(module):
                QtWidgets.QMessageBox.critical(self.parent, "Mirror Module(s)", "Cannot mirror a previously mirrored module!")
                return

            if not self.canModuleBeMirrored(module):
                print(f"Module '{module}' is of a module type that cannot be mirrored... skipping module.")
            else:
                tempModuleList.append(module)

        self.modules = tempModuleList

        if len(self.modules) > 0:
            self.mirrorModule_UI()

    def findSubModules(self, group):
        returnModules = []

        children = cmds.listRelatives(group, children=True)
        children = cmds.ls(children, transforms=True)

        for child in children:
            if child.find("Group__") == 0:
                returnModules.extend(self.findSubModules(child))
            else:
                namespaceInfo = utils.stripAllNamespaces(child)
                if namespaceInfo != None and namespaceInfo[1] == "module_transform":
                    module = namespaceInfo[0]
                    returnModules.append(module)

        return returnModules

    def isModuleAMirror(self, module):
        moduleGroup = module + ":module_grp"
        return cmds.attributeQuery("mirrorLinks", node=moduleGroup, exists=True)

    def canModuleBeMirrored(self, module):
        moduleNameInfo = utils.findAllModuleNames("/Modules/Blueprint")
        validModules = moduleNameInfo[0]
        validModuleNames = moduleNameInfo[1]

        moduleName = module.partition("__")[0]

        if not moduleName in validModuleNames:
            return False

        index = validModuleNames.index(moduleName)
        mod = __import__("Blueprint." + validModules[index], {}, {}, validModules[index])
        importlib.reload(mod)

        moduleClass = getattr(mod, mod.CLASS_NAME)
        moduleInst = moduleClass("null", None)

        return moduleInst.canModuleBeMirrored()

    def mirrorModule_UI(self):
        self.moduleNames = []
        for module in self.modules:
            self.moduleNames.append(module.partition("__")[2])

        # Check if the same mirror settings are applied for all
        self.sameMirrorSettingsForAll = False
        if len(self.modules) > 1:
            result = QtWidgets.QMessageBox.question(
                self.parent, "Mirror Multiple Modules",
                f"{len(self.modules)} modules selected for mirror.\nWould you like to use same settings for all?",
                QtWidgets.QMessageBox.StandardButton.Yes | QtWidgets.QMessageBox.StandardButton.No | QtWidgets.QMessageBox.StandardButton.Cancel,
                QtWidgets.QMessageBox.StandardButton.Yes
            )
            if result == QtWidgets.QMessageBox.StandardButton.Cancel:
                return
            elif result == QtWidgets.QMessageBox.StandardButton.Yes:
                self.sameMirrorSettingsForAll = True
            elif result == QtWidgets.QMessageBox.StandardButton.No:
                self.sameMirrorSettingsForAll = False

        # Create a window
        self.mirrorWindow = QtWidgets.QDialog(self.parent)
        self.mirrorWindow.setWindowTitle("Mirror Module(s)")
        self.mirrorWindow.setMinimumWidth(400)
        self.mirrorWindow.setMinimumHeight(510)
        self.separator1 = self.parent.create_separator()
        self.separator2 = self.parent.create_separator()
        self.separator3 = self.parent.create_separator()

        # Create layouts
        main_layout = QtWidgets.QVBoxLayout(self.mirrorWindow)
        scroll_area = QtWidgets.QScrollArea(self.mirrorWindow)
        scroll_area.setWidgetResizable(True)
        scroll_widget = QtWidgets.QWidget()
        scroll_layout = QtWidgets.QVBoxLayout(scroll_widget)

        # Mirror Plane Radio Buttons
        mirror_plane_label = QtWidgets.QLabel("Mirror Plane: ")
        main_layout.addWidget(mirror_plane_label)

        mirror_plane_layout = QtWidgets.QHBoxLayout()
        self.mirror_plane_buttons = QtWidgets.QButtonGroup(self.mirrorWindow)

        xy_radio = QtWidgets.QRadioButton("XY")
        yz_radio = QtWidgets.QRadioButton("YZ")
        xz_radio = QtWidgets.QRadioButton("XZ")

        yz_radio.setChecked(True)  # Default option

        self.mirror_plane_buttons.addButton(xy_radio)
        self.mirror_plane_buttons.addButton(yz_radio)
        self.mirror_plane_buttons.addButton(xz_radio)

        mirror_plane_layout.addWidget(xy_radio)
        mirror_plane_layout.addWidget(yz_radio)
        mirror_plane_layout.addWidget(xz_radio)

        main_layout.addLayout(mirror_plane_layout)
        main_layout.addWidget(self.separator1)

        # Mirrored Names
        main_layout.addWidget(QtWidgets.QLabel("Mirrored Name(s):"))
        name_layout = QtWidgets.QGridLayout()
        for i, module in enumerate(self.moduleNames):
            name_layout.addWidget(QtWidgets.QLabel(f"{module} --> "), i, 0)
            text_field = QtWidgets.QLineEdit(f"{module}_mirror")
            name_layout.addWidget(text_field, i, 1)

            self.UIElements["moduleName_"+module] = text_field


        scroll_layout.addLayout(name_layout)

        # Mirror Settings
        mirror_settings_layout = QtWidgets.QVBoxLayout()
        mirror_settings_layout.addWidget(self.separator2)
        mirror_settings_layout.addSpacing(10)
        mirror_settings_label = QtWidgets.QLabel("Mirror Settings: ")
        mirror_settings_layout.addWidget(mirror_settings_label)

        if self.sameMirrorSettingsForAll:
            mirrorSettingsLayout = self.generateMirrorFunctionControls(None)
            mirror_settings_layout.addLayout(mirrorSettingsLayout)
        else:
            settings_scroll_area = QtWidgets.QScrollArea()
            settings_scroll_area.setWidgetResizable(True)
            settings_scroll_widget = QtWidgets.QWidget()
            settings_scroll_layout = QtWidgets.QVBoxLayout(settings_scroll_widget)

            for module in self.moduleNames:
                mirrorSettingsLayout = self.generateMirrorFunctionControls(module)
                settings_scroll_layout.addLayout(mirrorSettingsLayout)

            # Set the widget for the scroll area
            settings_scroll_widget.setLayout(settings_scroll_layout)
            settings_scroll_area.setWidget(settings_scroll_widget)
            mirror_settings_layout.addWidget(settings_scroll_area)


        # Accept/Cancel buttons
        button_layout = QtWidgets.QHBoxLayout()
        accept_button = QtWidgets.QPushButton("Accept")
        cancel_button = QtWidgets.QPushButton("Cancel")
        button_layout.addWidget(accept_button)
        button_layout.addWidget(cancel_button)

        scroll_area.setWidget(scroll_widget)

        main_layout.addWidget(scroll_area)
        main_layout.addSpacing(10)
        main_layout.addLayout(mirror_settings_layout)
        main_layout.addSpacing(10)
        main_layout.addWidget(self.separator3)
        main_layout.addSpacing(10)
        main_layout.addLayout(button_layout)

        # Connect buttons to actions
        accept_button.clicked.connect(self.acceptWindow)
        cancel_button.clicked.connect(self.cancelWindow)

        # Show window
        self.mirrorWindow.exec_()

    def generateMirrorFunctionControls(self, moduleName):
        # Create a dictionary to store widget references uniquely for each module
        self.UIElements[moduleName] = {}

        rotationRadioCollection = "rotation_radioCollection_all"
        translationRadioCollection = "translation_radioCollection_all"
        textLabel = "* all modules"

        behaviorName = "behavior__"
        orientationName = "orientation__"
        mirroredName = "mirrored__"
        worldSpaceName = "worldSpace__"

        if moduleName != None:
            rotationRadioCollection = "rotation_radioCollection_" + moduleName
            translationRadioCollection = "translation_radioCollection_" + moduleName
            textLabel = moduleName

            behaviorName = "behavior__" + moduleName
            orientationName = "orientation__" + moduleName
            mirroredName = "mirrored__" + moduleName
            worldSpaceName = "worldSpace__" + moduleName

        # Create a layout for the mirror settings controls (rotation and translation settings)
        layout = QtWidgets.QVBoxLayout()

        # Add the text label for the mirror settings
        mirrorSettingsLabel = QtWidgets.QLabel(textLabel)
        layout.addSpacing(20)
        layout.addWidget(mirrorSettingsLabel)

        # Create a grid layout for rotation and translation options
        gridLayout = QtWidgets.QGridLayout()
        layout.addLayout(gridLayout)

        # Row 1: Rotation label and radio buttons
        rotationLabel = QtWidgets.QLabel("Rotation: ")
        gridLayout.addWidget(rotationLabel, 0, 0)

        # Create unique radio buttons for rotation settings
        rotationBehaviorButton = QtWidgets.QRadioButton("Behavior")
        rotationOrientationButton = QtWidgets.QRadioButton("Orientation")

        # Set "Behavior" as the default selected option
        rotationBehaviorButton.setChecked(True)

        # Add to the UIElements dictionary to keep track of the widgets for this module
        self.UIElements[rotationRadioCollection] = QtWidgets.QButtonGroup(self.mirrorWindow)
        self.UIElements[rotationRadioCollection].addButton(rotationBehaviorButton)
        self.UIElements[rotationRadioCollection].addButton(rotationOrientationButton)

        gridLayout.addWidget(rotationBehaviorButton, 0, 1)
        gridLayout.addWidget(rotationOrientationButton, 0, 2)

        # Row 2: Translation label and radio buttons
        translationLabel = QtWidgets.QLabel("Translation: ")
        gridLayout.addWidget(translationLabel, 1, 0)

        # Create unique radio buttons for translation settings
        translationMirroredButton = QtWidgets.QRadioButton("Mirrored")
        translationWorldSpaceButton = QtWidgets.QRadioButton("World Space")

        # Set "Mirrored" as the default selected option
        translationMirroredButton.setChecked(True)

        # Add to the UIElements dictionary to keep track of the widgets for this module
        self.UIElements[translationRadioCollection] = QtWidgets.QButtonGroup(self.mirrorWindow)
        self.UIElements[translationRadioCollection].addButton(translationMirroredButton)
        self.UIElements[translationRadioCollection].addButton(translationWorldSpaceButton)

        gridLayout.addWidget(translationMirroredButton, 1, 1)
        gridLayout.addWidget(translationWorldSpaceButton, 1, 2)

        # Return the constructed layout so it can be added to the main UI
        return layout


    def cancelWindow(self, *args):
        self.mirrorWindow.close()

    def acceptWindow(self, *args):
        # a moduleInfo entry = (originalModule, mirroredModuleName, mirrorPlane, rotationFunction, translationFunction)
        self.moduleInfo = []

        checked_button = self.mirror_plane_buttons.checkedButton()
        self.mirrorPlane = checked_button.text()

        for i in range(len(self.modules)):
            originalModule = self.modules[i]
            originalModuleName = self.moduleNames[i]

            originalModulePrefix = originalModule.partition("__")[0]
            mirroredModuleUserSpecifiedName = self.UIElements["moduleName_" + originalModuleName].text()
            mirroredModuleName = originalModulePrefix + "__" + mirroredModuleUserSpecifiedName

            if utils.doesBlueprintUserSpecifiedNameExist(mirroredModuleUserSpecifiedName):
                QtWidgets.QMessageBox.critical(self.parent, "Name Conflict", f"Name '{mirroredModuleUserSpecifiedName}' already exists, aborting mirror.")
                return

            rotationFunction = ""
            translationFunction = ""

            if self.sameMirrorSettingsForAll == True:
                rotation_checked_button = self.UIElements["rotation_radioCollection_all"].checkedButton()
                translation_checked_button = self.UIElements["translation_radioCollection_all"].checkedButton()
                rotationFunction = rotation_checked_button.text()
                translationFunction = translation_checked_button.text()
            else:
                rotation_checked_button = self.UIElements["rotation_radioCollection_" + originalModuleName].checkedButton()
                translation_checked_button = self.UIElements["translation_radioCollection_" + originalModuleName].checkedButton()
                rotationFunction = rotation_checked_button.text()
                translationFunction = translation_checked_button.text()

            self.moduleInfo.append([originalModule, mirroredModuleName, self.mirrorPlane, rotationFunction, translationFunction])

        self.mirrorWindow.close()

        self.mirrorModules()

    def mirrorModules(self):
        # Create the progress dialog
        progress_dialog = ProgressDialog(title="Mirroring Module(s)", parent=self.parent)
        progress_dialog.show()

        QtWidgets.QApplication.processEvents()

        total_progress = 100
        current_progress = 0

        # Define the proportions for each stage
        stage1_proportion = 15
        stage2_proportion = 60
        stage3_proportion = 10
        stage4_proportion = 10
        stage5_proportion = 5 # Remaining percentage to complete 100%

        # Calculate the progress increments
        stage1_increment = stage1_proportion / len(self.moduleInfo) if self.moduleInfo else 0
        stage2_increment = stage2_proportion / len(self.moduleInfo) if self.moduleInfo else 0
        stage3_increment = stage3_proportion / len(self.moduleInfo) if self.moduleInfo else 0
        stage4_increment = stage4_proportion / len(self.moduleInfo) if self.moduleInfo else 0

        # Stage 1: Prepare modules
        moduleNameInfo = utils.findAllModuleNames("/Modules/Blueprint")
        validModules = moduleNameInfo[0]
        validModuleNames = moduleNameInfo[1]

        for module in self.moduleInfo:
            progress_dialog.label.setText("Preparing modules...")
            QtWidgets.QApplication.processEvents()

            moduleName = module[0].partition("__")[0]

            if moduleName in validModuleNames:
                index = validModuleNames.index(moduleName)
                module.append(validModules[index])

            current_progress += stage1_increment
            progress_dialog.progressBar.setValue(int(current_progress))
            QtWidgets.QApplication.processEvents()

        # Stage 2: Mirror modules
        for module in self.moduleInfo:
            progress_dialog.label.setText(f"Mirroring module: {module[1]}")
            QtWidgets.QApplication.processEvents()

            userSpecifiedName = module[0].partition("__")[2]
            mod = __import__("Blueprint." + module[5], (), (), [module[5]])
            importlib.reload(mod)

            moduleClass = getattr(mod, mod.CLASS_NAME)
            moduleInst = moduleClass(userSpecifiedName, None)

            hookObject = moduleInst.findHookObject()

            newHookObject = None

            hookModule = utils.stripLeadingNamespace(hookObject)[0]

            hookFound = False
            for m in self.moduleInfo:
                if hookModule == m[0]:
                    hookFound = True

                    if m == module:
                        continue

                    hookObjectName = utils.stripLeadingNamespace(hookObject)[1]
                    newHookObject = m[1] + ":" + hookObjectName

            if not hookFound:
                newHookObject = hookObject

            module.append(newHookObject)

            hookConstrained = moduleInst.isRootConstrained()
            module.append(hookConstrained)

            current_progress += stage2_increment
            progress_dialog.progressBar.setValue(int(current_progress))
            QtWidgets.QApplication.processEvents()

        # Stage 3: Rehook modules
        for module in self.moduleInfo:
            progress_dialog.label.setText(f"Rehooking module: {module[1]}")
            QtWidgets.QApplication.processEvents()

            newUserSpecifiedName = module[1].partition("__")[2]

            mod = __import__("Blueprint." + module[5], (), (), [module[5]])
            importlib.reload(mod)

            moduleClass = getattr(mod, mod.CLASS_NAME)
            moduleInst = moduleClass(newUserSpecifiedName, None)

            moduleInst.mirror(module[0], module[2], module[3], module[4])

            current_progress += stage3_increment
            progress_dialog.progressBar.setValue(int(current_progress))
            QtWidgets.QApplication.processEvents()

        # Stage 4: Process groups
        for module in self.moduleInfo:
            progress_dialog.label.setText("Processing groups...")
            QtWidgets.QApplication.processEvents()

            newUserSpecifiedName = module[1].partition("__")[2]

            mod = __import__("Blueprint." + module[5], (), (), [module[5]])
            importlib.reload(mod)

            moduleClass = getattr(mod, mod.CLASS_NAME)
            moduleInst = moduleClass(newUserSpecifiedName, None)

            moduleInst.rehook(module[6])

            hookConstrained = module[7]
            if hookConstrained:
                moduleInst.constrainRootToHook()

            current_progress += stage4_increment
            progress_dialog.progressBar.setValue(int(current_progress))
            QtWidgets.QApplication.processEvents()

        # Stage 5: Process groups
        if self.group != None:
            progress_dialog.label.setText("Finishing up...")
            QtWidgets.QApplication.processEvents()

            groupParent = cmds.listRelatives(self.group, parent=True)

            if groupParent != None:
                groupParent = groupParent[0]

            self.processGroup(self.group, groupParent)

            cmds.select(clear=True)

        # Complete the progress bar
        progress_dialog.progressBar.setValue(total_progress)
        progress_dialog.label.setText("Mirroring completed.")
        QtWidgets.QApplication.processEvents()

        # Close the progress dialog
        progress_dialog.close()

        utils.forceSceneUpdate()

    def processGroup(self, group, parent):
        import RiggingTool.Modules.System.groupSelected as groupSelected
        importlib.reload(groupSelected)

        tempGroup = cmds.duplicate(group, parentOnly=True, inputConnections=True)[0]
        emptyGroup = cmds.group(empty=True)
        cmds.parent(tempGroup, emptyGroup, absolute=True)

        scaleAxis = ".scaleX"
        if self.mirrorPlane == "XZ":
            scaleAxis = ".scaleY"
        elif self.mirrorPlane == "XY":
            scaleAxis = ".scaleZ"

        cmds.setAttr(emptyGroup + scaleAxis, -1)

        instance = groupSelected.GroupSelected(parent=self.parent)
        groupSuffix = group.partition("__")[2]
        newGroup = instance.createGroupAtSpecified(groupSuffix + "_mirror", tempGroup, parent)

        cmds.delete(emptyGroup)

        for moduleLink in ((group, newGroup), (newGroup, group)):
            attributeValue = moduleLink[1] + "__"

            if self.mirrorPlane == "YZ":
                attributeValue += "X"
            elif self.mirrorPlane == "XZ":
                attributeValue += "Y"
            elif self.mirrorPlane == "XY":
                attributeValue += "Z"

            cmds.select(moduleLink[0])
            cmds.addAttr(dt="string", longName="mirrorLinks", k=False)
            cmds.setAttr(moduleLink[0] + ".mirrorLinks", attributeValue, type="string")

        cmds.select(clear=True)

        children = cmds.listRelatives(group, children=True)
        children = cmds.ls(children, transforms=True)

        for child in children:
            if child.find("Group__") == 0:
                self.processGroup(child, newGroup)
            else:
                childNamespaces = utils.stripAllNamespaces(child)
                if childNamespaces != None and childNamespaces[1] == "module_transform":
                    for module in self.moduleInfo:
                        if childNamespaces[0] == module[0]:
                            moduleContainer = module[1] + ":module_container"
                            moduleTransform = module[1] + ":module_transform"
                            cmds.parent(moduleTransform, newGroup, absolute=True)
