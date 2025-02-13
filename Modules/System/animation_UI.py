import os
import importlib
from pathlib import Path
from functools import partial

# Maya and PySide2 imports
import maya.cmds as cmds
import maya.OpenMayaUI as omui
from PySide2 import QtWidgets, QtCore, QtGui
from shiboken2 import wrapInstance

import System.utils as utils
import System.controlObject as controlObject
importlib.reload(utils)
importlib.reload(controlObject)

# Helper to attach our window to Maya's main window.
def maya_main_window():
    main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(int(main_window_ptr), QtWidgets.QWidget)

#---------------------------------------------------------------------
# Animation_UI class using PySide2.
#---------------------------------------------------------------------
class Animation_UI(QtWidgets.QDialog):

    instance = None
    
    @classmethod
    def show_ui(cls):
        """
        Create and show the Animation_UI window if it was properly initialized.
        """
        instance = cls()
        if not instance.valid:
            # If the UI wasn't properly initialized, delete the instance and do not show it.
            instance.deleteLater()
            return None
        instance.show()
        cls.instance = instance  # Optionally, store the instance.
        return instance
    
    def __init__(self, parent=maya_main_window()):
        super(Animation_UI, self).__init__(parent)
        self.setObjectName("Animation_UI_window")
        self.setMinimumSize(450, 730)  # Set a minimum size to avoid UI breaking
        
        self.previousBlueprintListEntry = None
        self.previousBlueprintModule = None
        self.previousAnimationModule = None
        
        # Flag to indicate whether the UI was initialized properly.
        self.valid = True

        # Base directory for icons.
        baseIconsDir = Path(os.environ["RIGGING_TOOL_ROOT"]) / "RiggingTool" / "Icons"
        
        # Determine the selected character.
        self.selectedCharacter = self.findSelectedCharacter()
        if self.selectedCharacter is None:
            QtWidgets.QMessageBox.warning(self, "No Character!", "Please select a character.")
            self.valid = False
            self.close()
            return
        
        self.characterName = self.selectedCharacter.partition("__")[2]
        self.windowName = self.characterName + "_window"
        self.setWindowTitle("Animation UI: " + self.characterName)
        
        # Dictionary to store our UI widgets.
        self.UIElements = {}
        
        # Create the main vertical layout.
        main_layout = QtWidgets.QVBoxLayout(self)
        
        # ------------------------------------------------------------------
        # Top Column Layout (vertical)
        self.UIElements["topColumnLayout"] = QtWidgets.QVBoxLayout()
        main_layout.addLayout(self.UIElements["topColumnLayout"])
        
        # ------------------------------------------------------------------
        # Row layout for the two list boxes and the button column.
        self.UIElements["listBoxRowLayout"] = QtWidgets.QHBoxLayout()
        self.UIElements["topColumnLayout"].addLayout(self.UIElements["listBoxRowLayout"])
        
        # Calculate approximate widths.
        buttonWidth = 40
        columnOffset = 5
        buttonColumnWidth = buttonWidth + (2 * columnOffset)
        textScrollWidth = (420 - buttonColumnWidth - 8) / 2
        
        # Blueprint Module List (replacing cmds.textScrollList).
        self.UIElements["blueprintModule_textScroll"] = QtWidgets.QListWidget()
        self.UIElements["blueprintModule_textScroll"].setFixedHeight(225)
        self.UIElements["blueprintModule_textScroll"].setMinimumWidth(textScrollWidth)
        # When the selection changes, refresh the animation module list.
        self.UIElements["blueprintModule_textScroll"].itemSelectionChanged.connect(self.refreshAnimationModuleList)
        self.UIElements["listBoxRowLayout"].addWidget(self.UIElements["blueprintModule_textScroll"])
        
        # Animation Module List.
        self.UIElements["animationModule_textScroll"] = QtWidgets.QListWidget()
        self.UIElements["animationModule_textScroll"].setFixedHeight(225)
        self.UIElements["animationModule_textScroll"].setMinimumWidth(textScrollWidth)
        self.UIElements["listBoxRowLayout"].addWidget(self.UIElements["animationModule_textScroll"])
        
        # Button Column Layout.
        self.UIElements["buttonColumnLayout"] = QtWidgets.QVBoxLayout()
        self.UIElements["listBoxRowLayout"].addLayout(self.UIElements["buttonColumnLayout"])
        
        # Define a common style sheet for all our tool buttons.
        toolButtonStyle = """
        QToolButton {
            border: 1px solid #2b2b2b;
            border-radius: 5px;
            background: transparent;
            padding: 3px;
        }
        QToolButton:checked {
            border: 2px solid #f9aa26;
            padding: 2px;
        }
        QToolButton:hover {
            border: 2px solid #f9aa26;
            padding: 2px;
        }
        """

        # Pin Button using QToolButton.
        self.UIElements["pinButton"] = QtWidgets.QToolButton()
        self.UIElements["pinButton"].setCheckable(True)
        self.UIElements["pinButton"].setFixedSize(buttonWidth, buttonWidth)
        self.UIElements["pinButton"].setSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Fixed)
        # Load the icons for the two states.
        pinIcon = QtGui.QIcon(os.path.join(baseIconsDir, "pinned.svg"))
        unpinnedIcon = QtGui.QIcon(os.path.join(baseIconsDir, "unpinned.svg"))
        # Set the initial state; here we assume unchecked.
        self.UIElements["pinButton"].setChecked(False)
        self.UIElements["pinButton"].setIcon(unpinnedIcon)
        self.UIElements["pinButton"].setIconSize(QtCore.QSize(buttonWidth, buttonWidth))
        self.UIElements["pinButton"].setStyleSheet(toolButtonStyle)
        # When toggled, update the icon and call your functions.
        self.UIElements["pinButton"].toggled.connect(
            lambda state: (
                self.UIElements["pinButton"].setIcon(pinIcon if state else unpinnedIcon),
                self.deleteScriptJob() if state else self.setupScriptJob()
            )
        )
        self.UIElements["buttonColumnLayout"].addWidget(self.UIElements["pinButton"])

        # Non-Blueprint Visibility using QToolButton.
        if cmds.objExists(self.selectedCharacter + ":non_blueprint_grp"):
            value = cmds.getAttr(self.selectedCharacter + ":non_blueprint_grp.display")
            self.UIElements["nonBlueprintVisibility"] = QtWidgets.QToolButton()
            self.UIElements["nonBlueprintVisibility"].setCheckable(True)
            self.UIElements["nonBlueprintVisibility"].setFixedSize(buttonWidth, buttonWidth)
            self.UIElements["nonBlueprintVisibility"].setSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Fixed)
            # Load the icons for the two states.
            nonBpCheckedIcon = QtGui.QIcon(os.path.join(baseIconsDir, "nonBlueprint_on.svg"))
            nonBpUncheckedIcon = QtGui.QIcon(os.path.join(baseIconsDir, "nonBlueprint_off.svg"))
            initialState = bool(value)
            self.UIElements["nonBlueprintVisibility"].setChecked(initialState)
            self.UIElements["nonBlueprintVisibility"].setIcon(nonBpCheckedIcon if initialState else nonBpUncheckedIcon)
            self.UIElements["nonBlueprintVisibility"].setIconSize(QtCore.QSize(buttonWidth, buttonWidth))
            self.UIElements["nonBlueprintVisibility"].setStyleSheet(toolButtonStyle)
            self.UIElements["nonBlueprintVisibility"].toggled.connect(
                lambda state: (
                    self.UIElements["nonBlueprintVisibility"].setIcon(nonBpCheckedIcon if state else nonBpUncheckedIcon),
                    self.toggleNonBlueprintVisibility()
                )
            )
            self.UIElements["buttonColumnLayout"].addWidget(self.UIElements["nonBlueprintVisibility"])

        # Animation Control Visibility using QToolButton.
        value = cmds.getAttr(self.selectedCharacter + ":character_grp.animationControlVisibility")
        self.UIElements["animControlVisibility"] = QtWidgets.QToolButton()
        self.UIElements["animControlVisibility"].setCheckable(True)
        self.UIElements["animControlVisibility"].setFixedSize(buttonWidth, buttonWidth)
        self.UIElements["animControlVisibility"].setSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Fixed)
        # Load the icons for the two states.
        animCheckedIcon = QtGui.QIcon(os.path.join(baseIconsDir, "visibility_on.svg"))
        animUncheckedIcon = QtGui.QIcon(os.path.join(baseIconsDir, "visibility_off.svg"))
        initialState = bool(value)
        self.UIElements["animControlVisibility"].setChecked(initialState)
        self.UIElements["animControlVisibility"].setIcon(animCheckedIcon if initialState else animUncheckedIcon)
        self.UIElements["animControlVisibility"].setIconSize(QtCore.QSize(buttonWidth, buttonWidth))
        self.UIElements["animControlVisibility"].setStyleSheet(toolButtonStyle)
        self.UIElements["animControlVisibility"].toggled.connect(
            lambda state: (
                self.UIElements["animControlVisibility"].setIcon(animCheckedIcon if state else animUncheckedIcon),
                self.toggleAnimControlVisibility()
            )
        )
        self.UIElements["buttonColumnLayout"].addWidget(self.UIElements["animControlVisibility"])

        # Delete Module Button as a QToolButton.
        self.UIElements["deleteModuleButton"] = QtWidgets.QToolButton()
        deleteIcon = QtGui.QIcon(os.path.join(baseIconsDir, "trashcan.svg"))
        self.UIElements["deleteModuleButton"].setIcon(deleteIcon)
        self.UIElements["deleteModuleButton"].setFixedSize(buttonWidth, buttonWidth)
        self.UIElements["deleteModuleButton"].setSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Fixed)
        self.UIElements["deleteModuleButton"].setIconSize(QtCore.QSize(buttonWidth, buttonWidth))
        self.UIElements["deleteModuleButton"].setStyleSheet(toolButtonStyle)
        self.UIElements["deleteModuleButton"].setEnabled(False)
        self.UIElements["deleteModuleButton"].clicked.connect(self.deleteSelectedModule)
        self.UIElements["buttonColumnLayout"].addWidget(self.UIElements["deleteModuleButton"])

        # Duplicate Module Button as a QToolButton.
        self.UIElements["duplicateModuleButton"] = QtWidgets.QToolButton()
        duplicateIcon = QtGui.QIcon(os.path.join(baseIconsDir, "duplicate.svg"))
        self.UIElements["duplicateModuleButton"].setIcon(duplicateIcon)
        self.UIElements["duplicateModuleButton"].setFixedSize(buttonWidth, buttonWidth)
        self.UIElements["duplicateModuleButton"].setSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Fixed)
        self.UIElements["duplicateModuleButton"].setIconSize(QtCore.QSize(buttonWidth, buttonWidth))
        self.UIElements["duplicateModuleButton"].setStyleSheet(toolButtonStyle)
        self.UIElements["duplicateModuleButton"].setEnabled(False)
        self.UIElements["duplicateModuleButton"].clicked.connect(self.duplicateSelectedModule)
        self.UIElements["buttonColumnLayout"].addWidget(self.UIElements["duplicateModuleButton"])

        # Separator.
        sep1 = QtWidgets.QFrame()
        sep1.setFrameShape(QtWidgets.QFrame.HLine)
        self.UIElements["topColumnLayout"].addWidget(sep1)
        
        # Active Module Column – we use a QVBoxLayout.
        self.UIElements["activeModuleColumn"] = QtWidgets.QVBoxLayout()
        # self.setupActiveModuleControls()
        self.UIElements["topColumnLayout"].addLayout(self.UIElements["activeModuleColumn"])
        
        # Separator.
        sep2 = QtWidgets.QFrame()
        sep2.setFrameShape(QtWidgets.QFrame.HLine)
        self.UIElements["topColumnLayout"].addWidget(sep2)
        
        # Matching Button.
        self.UIElements["matchingButton"] = QtWidgets.QPushButton("Match Controls to Result")
        self.UIElements["matchingButton"].setEnabled(False)
        self.UIElements["topColumnLayout"].addWidget(self.UIElements["matchingButton"])
        
        # Separator.
        sep3 = QtWidgets.QFrame()
        sep3.setFrameShape(QtWidgets.QFrame.HLine)
        self.UIElements["topColumnLayout"].addWidget(sep3)
        
        # Space Switching Column.
        self.UIElements["spaceSwitchingColumn"] = QtWidgets.QVBoxLayout()
        # self.setupSpaceSwitchingControls()
        self.UIElements["topColumnLayout"].addLayout(self.UIElements["spaceSwitchingColumn"])
        
        # Separator.
        sep4 = QtWidgets.QFrame()
        sep4.setFrameShape(QtWidgets.QFrame.HLine)
        self.UIElements["topColumnLayout"].addWidget(sep4)
        
        # Module Specified Controls Scroll.
        self.UIElements["moduleSpecifiedControlsScroll"] = QtWidgets.QScrollArea()
        self.UIElements["moduleSpecifiedControlsScroll"].setMinimumWidth(420)
        self.UIElements["moduleSpecifiedControlsScroll"].setWidgetResizable(True)
        moduleSpecWidget = QtWidgets.QWidget()
        self.UIElements["moduleSpecificControlsColumn"] = QtWidgets.QVBoxLayout(moduleSpecWidget)
        self.UIElements["moduleSpecifiedControlsScroll"].setWidget(moduleSpecWidget)
        self.UIElements["topColumnLayout"].addWidget(self.UIElements["moduleSpecifiedControlsScroll"])
        
        # Initialize blueprint module list and refresh animation module list.
        self.initializeBlueprintModuleList()
        self.refreshAnimationModuleList()
        
        # Setup the script job (we still use cmds.scriptJob here for selection changes).
        self.setupScriptJob()
        
        # Call selectionChanged to update UI based on current Maya selection.
        self.selectionChanged()
  
    def closeEvent(self, event):
        if hasattr(self, 'scriptJobNum'):
            try:
                cmds.scriptJob(kill=self.scriptJobNum)
                print(f"...KILLED Script Job!")
            except Exception:
                pass
        event.accept()

    def initializeBlueprintModuleList(self):
        cmds.namespace(setNamespace=self.selectedCharacter)
        blueprintNamespaces = cmds.namespaceInfo(listOnlyNamespaces=True) or []
        cmds.namespace(setNamespace=":")
        self.blueprintModules = {}
        for namespace in blueprintNamespaces:
            blueprintModule = utils.stripLeadingNamespace(namespace)[1]
            userSpecifiedName = blueprintModule.partition("__")[2]
            self.UIElements["blueprintModule_textScroll"].addItem(userSpecifiedName)
            self.blueprintModules[userSpecifiedName] = namespace
        if self.UIElements["blueprintModule_textScroll"].count() > 0:
            self.UIElements["blueprintModule_textScroll"].setCurrentRow(0)
            selectedBlprnModule = self.UIElements["blueprintModule_textScroll"].currentItem().text()
            self.selectedBlueprintModule = self.blueprintModules[selectedBlprnModule]
            print(f"BLUEPRINT MODULE: {self.selectedBlueprintModule}")
            
    def refreshAnimationModuleList(self, index=1):
        self.UIElements["animationModule_textScroll"].clear()
        self.UIElements["deleteModuleButton"].setEnabled(False)
        self.UIElements["duplicateModuleButton"].setEnabled(False)
        
        selectedItems = self.UIElements["blueprintModule_textScroll"].selectedItems()
        if selectedItems:
            selectedBlprnModule = selectedItems[0].text()
            self.selectedBlueprintModule = self.blueprintModules[selectedBlprnModule]
        # self.setupActiveModuleControls()
        
        cmds.namespace(setNamespace=self.selectedBlueprintModule)
        controlModuleNamespaces = cmds.namespaceInfo(listOnlyNamespaces=True) or []
        cmds.namespace(setNamespace=":")
        for module in controlModuleNamespaces:
            moduleName = utils.stripAllNamespaces(module)[1]
            self.UIElements["animationModule_textScroll"].addItem(moduleName)
        if self.UIElements["animationModule_textScroll"].count() > 0:
            self.UIElements["animationModule_textScroll"].setCurrentRow(index)
            self.UIElements["deleteModuleButton"].setEnabled(True)
            self.UIElements["duplicateModuleButton"].setEnabled(True)
        # self.setupModuleSpecificControls()
        if selectedItems:
            self.previousBlueprintListEntry = selectedItems[0].text()
        else:
            self.previousBlueprintListEntry = None
        
    def findSelectedCharacter(self):
        selection = cmds.ls(selection=True, transforms=True)
        character = None
        if selection:
            selected = selection[0]
            selectedNamespaceInfo = utils.stripLeadingNamespace(selected)
            if selectedNamespaceInfo and selectedNamespaceInfo[0].startswith("Character__"):
                character = selectedNamespaceInfo[0]
        return character
        
    def toggleNonBlueprintVisibility(self, *args):
        visibility = not cmds.getAttr(self.selectedCharacter + ":non_blueprint_grp.display")
        cmds.setAttr(self.selectedCharacter + ":non_blueprint_grp.display", visibility)
        
    def toggleAnimControlVisibility(self, *args):
        visibility = not cmds.getAttr(self.selectedCharacter + ":character_grp.animationControlVisibility")
        cmds.setAttr(self.selectedCharacter + ":character_grp.animationControlVisibility", visibility)
        
    def setupScriptJob(self, *args):
        print(f"CREATE Script Job...")
        # Attach the script job to a variable name we can explicitly kill by overriding the closeEvent() on the GUI
        self.scriptJobNum = cmds.scriptJob(event=["SelectionChanged", self.selectionChanged])
        
    def deleteScriptJob(self, *args):
        if hasattr(self, 'scriptJobNum'):
            cmds.scriptJob(kill=self.scriptJobNum)
            print(f"DELETE Script Job: {self.scriptJobNum}")

            
    def selectionChanged(self):
        selection = cmds.ls(selection=True, transforms=True)
        if selection:
            selectedNode = selection[0]
            characterNamespaceInfo = utils.stripLeadingNamespace(selectedNode)
            if characterNamespaceInfo and characterNamespaceInfo[0] == self.selectedCharacter:
                blueprintNamespaceInfo = utils.stripLeadingNamespace(characterNamespaceInfo[1])
                if blueprintNamespaceInfo:
                    listEntry = blueprintNamespaceInfo[0].partition("__")[2]
                    allEntries = [self.UIElements["blueprintModule_textScroll"].item(i).text() for i in range(self.UIElements["blueprintModule_textScroll"].count())]
                    if listEntry in allEntries:
                        items = self.UIElements["blueprintModule_textScroll"].findItems(listEntry, QtCore.Qt.MatchExactly)
                        if items:
                            self.UIElements["blueprintModule_textScroll"].setCurrentItem(items[0])
                        if listEntry != self.previousBlueprintListEntry:
                            self.refreshAnimationModuleList()
                        moduleNamespaceInfo = utils.stripLeadingNamespace(blueprintNamespaceInfo[1])
                        if moduleNamespaceInfo:
                            allAnimEntries = [self.UIElements["animationModule_textScroll"].item(i).text() for i in range(self.UIElements["animationModule_textScroll"].count())]
                            if moduleNamespaceInfo[0] in allAnimEntries:
                                items = self.UIElements["animationModule_textScroll"].findItems(moduleNamespaceInfo[0], QtCore.Qt.MatchExactly)
                                if items:
                                    self.UIElements["animationModule_textScroll"].setCurrentItem(items[0])
        # self.setupModuleSpecificControls()
        # self.setupSpaceSwitchingControls()
        
    def setupActiveModuleControls(self):
        # Clear any existing widgets in activeModuleColumn.
        layout = self.UIElements["activeModuleColumn"]
        while layout.count():
            child = layout.takeAt(0)
            if child.widget():
                child.widget().deleteLater()
        
        # Create a container widget for active module controls.
        activeModuleWidget = QtWidgets.QWidget()
        activeModuleLayout = QtWidgets.QHBoxLayout(activeModuleWidget)
        
        largeButtonSize = 100
        enumOptionWidth = self.width() - 2 * largeButtonSize
        
        self.settingsLocator = self.selectedBlueprintModule + ":SETTINGS"
        activeModuleAttribute = self.settingsLocator + ".activeModule"
        
        currentEntries = cmds.attributeQuery("activeModule", n=self.settingsLocator, listEnum=True)
        enable = True
        if currentEntries and currentEntries[0] == "None":
            enable = False
        
        # Use QComboBox as a placeholder for the enum option menu.
        self.UIElements["activeModule"] = QtWidgets.QComboBox()
        self.UIElements["activeModule"].setFixedWidth(enumOptionWidth)
        # (Populate the combo box as needed.)
        self.UIElements["activeModule"].setEnabled(enable)
        self.UIElements["activeModule"].currentTextChanged.connect(partial(self.activeModule_enumCallback, []))  # Pass empty weightAttributes for now.
        activeModuleLayout.addWidget(self.UIElements["activeModule"])
        
        self.UIElements["keyModuleWeights"] = QtWidgets.QPushButton("Key All")
        self.UIElements["keyModuleWeights"].setEnabled(enable)
        self.UIElements["keyModuleWeights"].clicked.connect(partial(self.keyModuleWeights, []))
        activeModuleLayout.addWidget(self.UIElements["keyModuleWeights"])
        
        self.UIElements["graphModuleWeights"] = QtWidgets.QPushButton("Graph Weights")
        self.UIElements["graphModuleWeights"].setEnabled(enable)
        self.UIElements["graphModuleWeights"].clicked.connect(self.graphModuleWeights)
        activeModuleLayout.addWidget(self.UIElements["graphModuleWeights"])
        
        layout.addWidget(activeModuleWidget)
        
        # Module Weights Section (using QGroupBox).
        moduleWeightsFrame = QtWidgets.QGroupBox("Module Weights")
        moduleWeightsLayout = QtWidgets.QVBoxLayout(moduleWeightsFrame)
        # A placeholder slider for creationPoseWeight.
        creationPoseSlider = QtWidgets.QSlider(QtCore.Qt.Horizontal)
        creationPoseSlider.setEnabled(False)
        creationPoseValue = cmds.getAttr(self.settingsLocator + ".creationPoseWeight")
        creationPoseSlider.setValue(int(creationPoseValue * 100))
        moduleWeightsLayout.addWidget(creationPoseSlider)
        # For each weight attribute, create a slider.
        attributes = cmds.listAttr(self.settingsLocator, keyable=False) or []
        weightAttributes = [attr for attr in attributes if "_weight" in attr]
        for attr in weightAttributes:
            slider = QtWidgets.QSlider(QtCore.Qt.Horizontal)
            slider.setMinimum(0)
            slider.setMaximum(100)
            value = cmds.getAttr(self.settingsLocator + "." + attr)
            slider.setValue(int(value * 100))
            slider.valueChanged.connect(partial(self.moduleWeights_sliderCallback, attr, weightAttributes))
            moduleWeightsLayout.addWidget(slider)
            self.UIElements[attr] = slider
        
        layout.addWidget(moduleWeightsFrame)
        self.moduleWeights_updateMatchingButton()
        
    def activeModule_enumCallback(self, weightAttributes, enumValue):
        # Placeholder: set attribute values based on enum selection.
        for attr in weightAttributes:
            value = 1 if (enumValue + "_weight" == attr) else 0
            cmds.setAttr(self.settingsLocator + "." + attr, value)
        cmds.setAttr(self.settingsLocator + ".creationPoseWeight", 0)
        self.moduleWeights_timeUpdateScriptJobCallback(weightAttributes)
        self.moduleWeights_updateMatchingButton()
        
    def moduleWeights_sliderCallback(self, controlledAttribute, weightAttributes, value):
        value = float(value) / 100.0
        currentTotalWeight = 0.0
        for attribute in weightAttributes:
            if attribute != controlledAttribute:
                currentTotalWeight += cmds.getAttr(self.settingsLocator + "." + attribute)
        if currentTotalWeight + value > 1.0:
            value = 1.0 - currentTotalWeight
        cmds.setAttr(self.settingsLocator + "." + controlledAttribute, value)
        slider = self.UIElements.get(controlledAttribute)
        if slider:
            slider.setValue(int(value * 100))
        newTotalWeight = currentTotalWeight + value
        creationPoseWeight = 1.0 - newTotalWeight
        cmds.setAttr(self.settingsLocator + ".creationPoseWeight", creationPoseWeight)
        self.moduleWeights_updateMatchingButton()
        
    def create_moduleWeightsScriptJob(self, parentUIElement, weightAttributes):
        cmds.scriptJob(event=["timeChanged", partial(self.moduleWeights_timeUpdateScriptJobCallback, weightAttributes)], parent=int(self.winId()))
        
    def moduleWeights_timeUpdateScriptJobCallback(self, weightAttributes):
        for attr in weightAttributes:
            value = cmds.getAttr(self.settingsLocator + "." + attr)
            slider = self.UIElements.get(attr)
            if slider:
                slider.setValue(int(value * 100))
        self.moduleWeights_updateMatchingButton()
        
    def moduleWeights_updateMatchingButton(self):
        selectedItems = self.UIElements["animationModule_textScroll"].selectedItems()
        if selectedItems:
            currentlySelectedModuleNamespace = selectedItems[0].text()
            moduleWeightValue = cmds.getAttr(self.settingsLocator + "." + currentlySelectedModuleNamespace + "_weight")
            matchButtonEnable = (moduleWeightValue == 0)
            self.UIElements["matchingButton"].setEnabled(matchButtonEnable)
        
    def keyModuleWeights(self, weightAttributes):
        for attr in weightAttributes:
            cmds.setKeyframe(self.settingsLocator, at=attr, itt="linear", ott="linear")
        cmds.setKeyframe(self.settingsLocator, at="creationPoseWeight", itt="linear", ott="linear")
        
    def graphModuleWeights(self):
        import maya.mel as mel
        cmds.select(self.settingsLocator, replace=True)
        mel.eval("tearOffPanel \"Graph Editor\" graphEditor true")
        
    def setupModuleSpecificControls(self):
        selectedItems = self.UIElements["animationModule_textScroll"].selectedItems()
        currentlySelectedModuleNamespace = None
        if selectedItems:
            currentlySelectedModuleNamespace = selectedItems[0].text()
            if (currentlySelectedModuleNamespace == self.previousAnimationModule and
                self.selectedBlueprintModule == self.previousBlueprintModule):
                return
        # Clear controls from moduleSpecificControlsColumn.
        layout = self.UIElements["moduleSpecificControlsColumn"]
        while layout.count():
            child = layout.takeAt(0)
            if child.widget():
                child.widget().deleteLater()
        self.UIElements["matchingButton"].setEnabled(False)
        # Get module names from utils.
        moduleNameInfo = utils.findAllModuleNames("/Modules/Animation")
        modules, moduleNames = moduleNameInfo
        if selectedItems:
            currentlySelectedModule = currentlySelectedModuleNamespace.rpartition("_")[0]
            if currentlySelectedModule in moduleNames:
                moduleWeightValue = cmds.getAttr(self.selectedBlueprintModule + ":SETTINGS." + currentlySelectedModuleNamespace + "_weight")
                matchButtonEnable = (moduleWeightValue == 0.0)
                moduleIndex = moduleNames.index(currentlySelectedModule)
                module = modules[moduleIndex]
                # Create a placeholder label for module LOD control.
                placeholder = QtWidgets.QLabel(f"Module LOD: {self.selectedBlueprintModule}:{currentlySelectedModuleNamespace}:module_grp.lod")
                layout.addWidget(placeholder)
                
                mod = __import__("Animation." + module, {}, {}, [module])
                importlib.reload(mod)
                moduleClass = getattr(mod, mod.CLASS_NAME)
                moduleInst = moduleClass(self.selectedBlueprintModule + ":" + currentlySelectedModuleNamespace)
                # Let moduleInst add its UI controls to the given layout.
                moduleInst.UI(layout)
                
                # Create a preferences frame.
                prefGroup = QtWidgets.QGroupBox("preferences")
                prefLayout = QtWidgets.QVBoxLayout(prefGroup)
                layout.addWidget(prefGroup)
                
                # Placeholder for icon scale control.
                iconScaleLabel = QtWidgets.QLabel("Icon Scale: " + self.selectedBlueprintModule + ":" + currentlySelectedModuleNamespace + ":module_grp.iconScale")
                prefLayout.addWidget(iconScaleLabel)
                
                # Color slider for icon color.
                value = cmds.getAttr(self.selectedBlueprintModule + ":" + currentlySelectedModuleNamespace + ":module_grp.overrideColor") + 1
                self.UIElements["iconColor"] = QtWidgets.QSlider(QtCore.Qt.Horizontal)
                self.UIElements["iconColor"].setMaximum(32)
                self.UIElements["iconColor"].setValue(value)
                self.UIElements["iconColor"].valueChanged.connect(partial(self.iconColour_callback, currentlySelectedModuleNamespace))
                prefLayout.addWidget(self.UIElements["iconColor"])
                
                moduleInst.UI_preferences(prefLayout)
                self.UIElements["matchingButton"].setEnabled(matchButtonEnable)
            self.previousBlueprintModule = self.selectedBlueprintModule
            self.previousAnimationModule = currentlySelectedModuleNamespace
        
    def iconColour_callback(self, currentlySelectedModuleNamespace, value):
        cmds.setAttr(self.selectedBlueprintModule + ":" + currentlySelectedModuleNamespace + ":module_grp.overrideColor", value - 1)
        
    def deleteSelectedModule(self):
        selectedItems = self.UIElements["animationModule_textScroll"].selectedItems()
        if not selectedItems:
            return
        selectedModule = selectedItems[0].text()
        selectedModuleNamespace = self.selectedBlueprintModule + ":" + selectedModule
        moduleNameInfo = utils.findAllModuleNames("/Modules/Animation")
        modules, moduleNames = moduleNameInfo
        selectedModuleName = selectedModule.rpartition("_")[0]
        if selectedModuleName in moduleNames:
            moduleIndex = moduleNames.index(selectedModuleName)
            module = modules[moduleIndex]
            mod = __import__("Animation." + module, {}, {}, [module])
            importlib.reload(mod)
            moduleClass = getattr(mod, mod.CLASS_NAME)
            moduleInst = moduleClass(selectedModuleNamespace)
            moduleInst.uninstall()
            self.refreshAnimationModuleList()
        
    def duplicateSelectedModule(self):
        self.deleteScriptJob()
        result = QtWidgets.QMessageBox.question(self, "Duplicate Control Module", 
                                                  "Duplicate animation as well as controls?", 
                                                  QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No | QtWidgets.QMessageBox.Cancel, 
                                                  QtWidgets.QMessageBox.Yes)
        if result == QtWidgets.QMessageBox.Cancel:
            self.setupScriptJob()
            return
        duplicateWithAnimation = (result == QtWidgets.QMessageBox.Yes)
        selectedItems = self.UIElements["animationModule_textScroll"].selectedItems()
        if not selectedItems:
            return
        selectedModule = selectedItems[0].text()
        selectedModuleNamespace = self.selectedBlueprintModule + ":" + selectedModule
        moduleNameInfo = utils.findAllModuleNames("/Modules/Animation")
        modules, moduleNames = moduleNameInfo
        selectedModuleName = selectedModule.rpartition("_")[0]
        if selectedModuleName in moduleNames:
            moduleIndex = moduleNames.index(selectedModuleName)
            module = modules[moduleIndex]
            mod = __import__("Animation." + module, {}, {}, [module])
            importlib.reload(mod)
            moduleClass = getattr(mod, mod.CLASS_NAME)
            moduleInst = moduleClass(selectedModuleNamespace)
            previousSelection = cmds.ls(selection=True)
            moduleInst.duplicateControlModule(withAnimation=duplicateWithAnimation)
            utils.forceSceneUpdate()
            if previousSelection:
                cmds.select(previousSelection, replace=True)
            else:
                cmds.select(clear=True)
            self.refreshAnimationModuleList()
        self.setupScriptJob()
        
    def setupSpaceSwitchingControls(self):
        # Clear existing controls.
        layout = self.UIElements["spaceSwitchingColumn"]
        while layout.count():
            child = layout.takeAt(0)
            if child.widget():
                child.widget().deleteLater()
        
        largeButtonSize = 80
        smallButtonSize = 35
        enumOptionWidth = self.width() - 2*(largeButtonSize + smallButtonSize)
        enable = False
        selection = cmds.ls(selection=True, transforms=True)
        spaceSwitcher = None
        controlObj = None
        targetObject = None
        if selection:
            if cmds.attributeQuery("spaceSwitching", n=selection[0], exists=True):
                enable = True
                controlObj = selection[0]
                spaceSwitcher = selection[0] + "_spaceSwitcher"
                if len(selection) > 1:
                    targetObject = selection[1]
        if targetObject is None:
            targetObject = self.selectedBlueprintModule + ":HOOK_IN"
        # Create a horizontal layout for space switching.
        rowLayout = QtWidgets.QHBoxLayout()
        self.UIElements["spaceSwitching_rowLayout"] = rowLayout
        # Use QComboBox as a placeholder for attrEnumOptionMenu.
        self.UIElements["currentSpace"] = QtWidgets.QComboBox()
        self.UIElements["currentSpace"].setEnabled(False)
        rowLayout.addWidget(self.UIElements["currentSpace"])
        
        self.UIElements["spaceSwitching_spaceSwitch"] = QtWidgets.QPushButton("Space Switch")
        self.UIElements["spaceSwitching_spaceSwitch"].setEnabled(enable)
        self.UIElements["spaceSwitching_spaceSwitch"].clicked.connect(partial(self.spaceSwitching_spaceSwitch, controlObj, targetObject))
        rowLayout.addWidget(self.UIElements["spaceSwitching_spaceSwitch"])
        
        self.UIElements["spaceSwitching_deleteKey"] = QtWidgets.QPushButton("Delete Key")
        self.UIElements["spaceSwitching_deleteKey"].setEnabled(enable)
        self.UIElements["spaceSwitching_deleteKey"].clicked.connect(partial(self.spaceSwitching_deleteKey, spaceSwitcher))
        rowLayout.addWidget(self.UIElements["spaceSwitching_deleteKey"])
        
        self.UIElements["spaceSwitching_backKey"] = QtWidgets.QPushButton("<")
        self.UIElements["spaceSwitching_backKey"].setEnabled(enable)
        self.UIElements["spaceSwitching_backKey"].clicked.connect(partial(self.spaceSwitching_backKey, spaceSwitcher))
        rowLayout.addWidget(self.UIElements["spaceSwitching_backKey"])
        
        self.UIElements["spaceSwitching_forwardKey"] = QtWidgets.QPushButton(">")
        self.UIElements["spaceSwitching_forwardKey"].setEnabled(enable)
        self.UIElements["spaceSwitching_forwardKey"].clicked.connect(partial(self.spaceSwitching_forwardKey, spaceSwitcher))
        rowLayout.addWidget(self.UIElements["spaceSwitching_forwardKey"])
        
        layout.addLayout(rowLayout)
        
    def spaceSwitching_spaceSwitch(self, controlObj, targetObject):
        controlObjectInstance = controlObject.ControlObject(controlObj)
        controlObjectInstance.switchSpace_UI(targetObject)
        
    def spaceSwitching_deleteKey(self, spaceSwitcher):
        animationNamespace = utils.stripLeadingNamespace(spaceSwitcher)[0]
        characterContainer = self.selectedCharacter + ":character_container"
        blueprintContainer = self.selectedBlueprintModule + ":module_container"
        animationContainer = animationNamespace + ":module_container"
        containers = [characterContainer, blueprintContainer, animationContainer]
        for c in containers:
            cmds.lockNode(c, lock=False, lockUnpublished=False)
        cmds.cutKey(spaceSwitcher, at="currentSpace", time=(cmds.currentTime(q=True),))
        for c in containers:
            cmds.lockNode(c, lock=True, lockUnpublished=True)
        print(f"THE animationNamespace EQUALS: {animationNamespace}")
        print(f"THE blueprintContainer EQUALS: {blueprintContainer}")
        print(f"THE animationContainer EQUALS: {animationContainer}")
        print(f"THE spaceSwitcher EQUALS: {spaceSwitcher}")
        
    def spaceSwitching_forwardKey(self, spaceSwitcher):
        currentTime = cmds.currentTime(q=True)
        time = cmds.findKeyframe(spaceSwitcher, at="currentSpace", time=(currentTime,), which="next")
        if currentTime < time:
            cmds.currentTime(time)
        
    def spaceSwitching_backKey(self, spaceSwitcher):
        currentTime = cmds.currentTime(q=True)
        time = cmds.findKeyframe(spaceSwitcher, at="currentSpace", time=(currentTime,), which="previous")
        if currentTime > time:
            cmds.currentTime(time)
            
#---------------------------------------------------------------------
# For testing in Maya, create a QApplication (if one does not exist) and show the UI.
#---------------------------------------------------------------------
if __name__ == "__main__":
    try:
        app = QtWidgets.QApplication.instance() or QtWidgets.QApplication([])
    except Exception:
        app = QtWidgets.QApplication([])
    ui = Animation_UI()
    ui.show()
