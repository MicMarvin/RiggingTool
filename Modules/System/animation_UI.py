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
# CollapsibleWidget class using PySide2.
#---------------------------------------------------------------------
class CollapsibleWidget(QtWidgets.QWidget):
    def __init__(self, title="", settingsKey="", parent=None):
        super(CollapsibleWidget, self).__init__(parent)
        self.settingsKey = settingsKey  # a unique key for saving state, e.g., "AnimationUI/ModuleWeightsExpanded"
        self.settings = QtCore.QSettings("MicMarvin", "RiggingTool")  # adjust organization and application names as needed

        # Create the toggle button
        self.toggleButton = QtWidgets.QToolButton(text=title, checkable=True)
        self.toggleButton.setStyleSheet("QToolButton { border: none; }")
        self.toggleButton.setToolButtonStyle(QtCore.Qt.ToolButtonTextBesideIcon)
        # Retrieve saved state (default True)
        savedState = self.settings.value(self.settingsKey, True, type=bool)
        self.toggleButton.setChecked(savedState)
        self.toggleButton.setArrowType(QtCore.Qt.DownArrow if savedState else QtCore.Qt.RightArrow)
        self.toggleButton.clicked.connect(self.on_toggle)

        # The content area that will be shown or hidden.
        self.contentArea = QtWidgets.QWidget()
        self.contentArea.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Preferred)
        self.contentArea.setVisible(savedState)

        # Layout
        mainLayout = QtWidgets.QVBoxLayout(self)
        mainLayout.setContentsMargins(0, 0, 0, 0)
        mainLayout.addWidget(self.toggleButton)
        mainLayout.addWidget(self.contentArea)

    def on_toggle(self):
        state = self.toggleButton.isChecked()
        self.toggleButton.setArrowType(QtCore.Qt.DownArrow if state else QtCore.Qt.RightArrow)
        self.contentArea.setVisible(state)
        # Save the state so that next time the window is opened, it remembers the user's choice.
        self.settings.setValue(self.settingsKey, state)

    def setContentLayout(self, layout):
        self.contentArea.setLayout(layout)

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

        self.scriptJobs = []  # A list to store job IDs
        self.selectedBlueprintModule = None        
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
        self.UIElements["topColumnLayout"].addWidget(utils.create_separator())
        
        # Active Module Column – we use a QVBoxLayout.
        self.UIElements["activeModuleColumn"] = QtWidgets.QVBoxLayout()
        self.setupActiveModuleControls()
        self.UIElements["topColumnLayout"].addLayout(self.UIElements["activeModuleColumn"])
        
        # Separator.
        self.UIElements["topColumnLayout"].addWidget(utils.create_separator())
        
        # Matching Button.
        self.UIElements["matchingButton"] = QtWidgets.QPushButton("Match Controls to Result")
        self.UIElements["matchingButton"].setEnabled(False)
        self.UIElements["topColumnLayout"].addWidget(self.UIElements["matchingButton"])
        
        # Separator.
        self.UIElements["topColumnLayout"].addWidget(utils.create_separator())
        
        # Space Switching Column.
        self.UIElements["spaceSwitchingColumn"] = QtWidgets.QVBoxLayout()
        # self.setupSpaceSwitchingControls()
        self.UIElements["topColumnLayout"].addLayout(self.UIElements["spaceSwitchingColumn"])
        
        # Separator.
        self.UIElements["topColumnLayout"].addWidget(utils.create_separator())
        
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
        # Kill all stored script jobs
        for job in self.scriptJobs:
            try:
                cmds.scriptJob(kill=job)
                print(f"KILLED Script Job {job}!")
            except Exception:
                print(f"ERROR killing script job {job}")
                pass
        event.accept()

    def initializeBlueprintModuleList(self):
        # Set the namespace to the selected character.
        cmds.namespace(setNamespace=self.selectedCharacter)
        blueprintNamespaces = cmds.namespaceInfo(listOnlyNamespaces=True)
        cmds.namespace(setNamespace=":")

        self.blueprintModules = {}
        if blueprintNamespaces:
            for namespace in blueprintNamespaces:
                # Use the original function name: stripLeadingNamespace
                # Assuming stripLeadingNamespace(namespace) returns a tuple where index 1 is the module name.
                blueprintModule = utils.stripLeadingNamespace(namespace)[1]
                # Partition on "__" to get the user-specified name.
                userSpecifiedName = blueprintModule.partition("__")[2]
                self.UIElements["blueprintModule_textScroll"].addItem(userSpecifiedName)
                self.blueprintModules[userSpecifiedName] = namespace

        if self.UIElements["blueprintModule_textScroll"].count() > 0:
            self.UIElements["blueprintModule_textScroll"].setCurrentRow(0)
            selectedBlprnModule = self.UIElements["blueprintModule_textScroll"].currentItem().text()
            self.selectedBlueprintModule = self.blueprintModules[selectedBlprnModule]
            #print(f"BLUEPRINT MODULE: {self.selectedBlueprintModule}")
        else:
            # No blueprint modules found.
            self.selectedBlueprintModule = None
            #print(f"BLUEPRINT MODULE: {self.selectedBlueprintModule}")
            
    def refreshAnimationModuleList(self, index=1):
        self.UIElements["animationModule_textScroll"].clear()
        self.UIElements["deleteModuleButton"].setEnabled(False)
        self.UIElements["duplicateModuleButton"].setEnabled(False)
        
        selectedItems = self.UIElements["blueprintModule_textScroll"].selectedItems()
        if selectedItems:
            selectedBlprnModule = selectedItems[0].text()
            self.selectedBlueprintModule = self.blueprintModules[selectedBlprnModule]
        self.setupActiveModuleControls()
        
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

    def toggleNonBlueprintVisibility(self, *args):
        visibility = not cmds.getAttr(self.selectedCharacter + ":non_blueprint_grp.display")
        cmds.setAttr(self.selectedCharacter + ":non_blueprint_grp.display", visibility)

    def toggleAnimControlVisibility(self, *args):
        visibility = not cmds.getAttr(self.selectedCharacter + ":character_grp.animationControlVisibility")
        cmds.setAttr(self.selectedCharacter + ":character_grp.animationControlVisibility", visibility)

        
    def setupScriptJob(self, *args):
        #print(f"CREATE Script Job...")
        # Attach the script job to a variable name we can explicitly kill by overriding the closeEvent() on the GUI
        jobID = cmds.scriptJob(event=["SelectionChanged", self.selectionChanged])
        self.scriptJobs.append(jobID)
        
    def deleteScriptJob(self, *args):
        # Kill all stored script jobs
        for job in self.scriptJobs:
            try:
                cmds.scriptJob(kill=job)
                print(f"KILLED Script Job {job}!")
            except Exception:
                print(f"ERROR killing script job {job}")
                pass
            
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
        if not self.selectedBlueprintModule:
            #print("No blueprint module is available, skipping active module controls.")
            return
        
        # Clear any existing widgets from the active module area.
        layout = self.UIElements["activeModuleColumn"]
        while layout.count():
            child = layout.takeAt(0)
            if child.widget():
                child.widget().deleteLater()

        # --- Build the "active module" header row.
        activeModuleWidget = QtWidgets.QWidget()
        activeModuleLayout = QtWidgets.QHBoxLayout(activeModuleWidget)
        activeModuleLayout.setContentsMargins(0, 0, 0, 0)

        largeButtonSize = 100
        enumOptionWidth = self.width() - 2 * largeButtonSize

        # Determine the settings locator from the selected blueprint module.
        self.settingsLocator = self.selectedBlueprintModule + ":SETTINGS"

        # Query the enum values for the activeModule attribute.
        currentEntries = cmds.attributeQuery("activeModule", n=self.settingsLocator, listEnum=True)
        enable = True
        if currentEntries and currentEntries[0] == "None":
            enable = False

        # Create the QComboBox to display the enum values.
        self.UIElements["activeModule"] = QtWidgets.QComboBox()
        if currentEntries:
            enumValues = currentEntries[0].split(":")
            for value in enumValues:
                self.UIElements["activeModule"].addItem(value)
        self.UIElements["activeModule"].setEnabled(enable)

        # --- Compute the list of weight attributes.
        # These are the attributes on the settingsLocator that contain "_weight".
        attributes = cmds.listAttr(self.settingsLocator, keyable=False) or []
        weightAttributes = [attr for attr in attributes if "_weight" in attr]
        # Optionally, store this list as an instance variable so callbacks can use it.
        self.weightAttributes = weightAttributes

        # Now connect the QComboBox so that when the user changes the active module,
        # we pass our weightAttributes list into the callback.
        # (The callback will then set the _weight values accordingly.)
        self.UIElements["activeModule"].currentTextChanged.connect(
            partial(self.activeModule_enumCallback, weightAttributes)
        )

        # Also add the key and graph buttons.
        self.UIElements["keyModuleWeights"] = QtWidgets.QPushButton("Key All")
        self.UIElements["keyModuleWeights"].setEnabled(enable)
        self.UIElements["keyModuleWeights"].clicked.connect(
            partial(self.keyModuleWeights, weightAttributes)
        )

        self.UIElements["graphModuleWeights"] = QtWidgets.QPushButton("Graph Weights")
        self.UIElements["graphModuleWeights"].setEnabled(enable)
        self.UIElements["graphModuleWeights"].clicked.connect(self.graphModuleWeights)

        # Add the header row to the main active module layout.
        activeModuleLayout.addWidget(self.UIElements["activeModule"])
        activeModuleLayout.addWidget(self.UIElements["keyModuleWeights"])
        activeModuleLayout.addWidget(self.UIElements["graphModuleWeights"])

        layout.addWidget(activeModuleWidget)

        # --- Build the module weights section.
        # We use a QGridLayout so that each row has three columns:
        # (Label, a spin box showing the value, and a slider for interactive changes).
        grid = QtWidgets.QGridLayout()
        fixedLabelWidth = 180  # Set the fixed width for label column

        # --- Creation Pose Weight Row (first row) ---
        # Build a row for the "Creation Pose Weight" which will be disabled (grayed out).
        creationLabel = QtWidgets.QLabel("Creation Pose Weight")
        creationLabel.setFixedWidth(fixedLabelWidth)
        creationSpin = QtWidgets.QSpinBox()
        creationSpin.setRange(0, 100)
        creationSlider = QtWidgets.QSlider(QtCore.Qt.Horizontal)
        creationSlider.setRange(0, 100)
        creationPoseValue = cmds.getAttr(self.settingsLocator + ".creationPoseWeight")
        creationInt = int(creationPoseValue * 100)
        creationSpin.setValue(creationInt)
        creationSlider.setValue(creationInt)
        # Synchronize the two controls.
        creationSlider.valueChanged.connect(lambda val: creationSpin.setValue(val))
        creationSpin.valueChanged.connect(lambda val: creationSlider.setValue(val))
        # Create a container widget for the entire row.
        creationRowWidget = QtWidgets.QWidget()
        creationRowLayout = QtWidgets.QHBoxLayout(creationRowWidget)
        creationRowLayout.setContentsMargins(0, 0, 0, 0)
        creationRowLayout.addWidget(creationLabel)
        creationRowLayout.addWidget(creationSpin)
        creationRowLayout.addWidget(creationSlider)
        # Disable the entire row.
        creationRowWidget.setDisabled(True)
        grid.addWidget(creationRowWidget, 0, 0, 1, 3)

        # Add a horizontal separator after the creation row.
        separator = utils.create_separator()  # Assuming this returns a QWidget or QFrame.
        grid.addWidget(separator, 1, 0, 1, 3)

        # **Store these controls so the callback can update them later**
        self.UIElements["creationSpin"] = creationSpin
        self.UIElements["creationSlider"] = creationSlider

        # --- Weight Attribute Rows ---
        # For each weight attribute, add a row with a label, spin box, and slider.
        row = 2
        for attr in weightAttributes:
            label = QtWidgets.QLabel(attr)
            label.setFixedWidth(fixedLabelWidth)
            spin = QtWidgets.QSpinBox()
            spin.setRange(0, 100)
            slider = QtWidgets.QSlider(QtCore.Qt.Horizontal)
            slider.setRange(0, 100)
            val = cmds.getAttr(self.settingsLocator + "." + attr)
            intVal = int(val * 100)
            spin.setValue(intVal)
            slider.setValue(intVal)
            # Synchronize the two controls
            slider.valueChanged.connect(lambda v, s=spin: s.setValue(v))
            spin.valueChanged.connect(lambda v, s=slider: s.setValue(v))
            # Connect both signals to the update function.
            slider.valueChanged.connect(lambda v, a=attr, wa=weightAttributes: self.moduleWeights_sliderCallback(a, wa, v))
            spin.valueChanged.connect(lambda v, a=attr, wa=weightAttributes: self.moduleWeights_sliderCallback(a, wa, v))

            grid.addWidget(label, row, 0)
            grid.addWidget(spin, row, 1)
            grid.addWidget(slider, row, 2)

            # Store references for later updating
            self.UIElements[attr + "_spin"] = spin
            self.UIElements[attr] = slider
            row += 1

        # --- Wrap the grid in a collapsible widget
        collapsible = CollapsibleWidget(title="Module Weights", settingsKey="AnimationUI/ModuleWeightsCollapsible")
        collapsible.setContentLayout(grid)
        layout.addWidget(collapsible)

        self.create_moduleWeightsScriptJob(weightAttributes)
        # Finally, update the matching button state.
        self.moduleWeights_updateMatchingButton()

    def activeModule_enumCallback(self, weightAttributes, enumValue):
        for attr in weightAttributes:
            # If the current enum value with "_weight" appended matches the attribute name, set it to 1; otherwise 0.
            value = 1 if (enumValue + "_weight" == attr) else 0
            cmds.setAttr(self.settingsLocator + "." + attr, value)
        cmds.setAttr(self.settingsLocator + ".creationPoseWeight", 0)
        # Update the UI sliders from the current attribute values.
        self.moduleWeights_timeUpdateScriptJobCallback(weightAttributes)
        self.moduleWeights_updateMatchingButton()
    
    def moduleWeights_sliderCallback(self, controlledAttribute, weightAttributes, newIntValue):
        """
        Called whenever the slider or spin box for a given weight attribute changes.
        newIntValue is expected to be an integer 0-100.
        """
        # Convert the value from 0-100 to 0.0-1.0.
        newValue = newIntValue / 100.0

        # Sum the values for all other weight attributes.
        currentTotal = 0.0
        for attr in weightAttributes:
            if attr != controlledAttribute:
                currentTotal += cmds.getAttr(self.settingsLocator + "." + attr)

        # Clamp the new value so the total does not exceed 1.0.
        if currentTotal + newValue > 1.0:
            newValue = 1.0 - currentTotal

        # Set the attribute in Maya.
        cmds.setAttr(self.settingsLocator + "." + controlledAttribute, newValue)

        # Update the UI for the controlled attribute.
        intVal = int(newValue * 100)
        # Block signals to prevent recursion.
        self.UIElements[controlledAttribute].blockSignals(True)
        self.UIElements[controlledAttribute + "_spin"].blockSignals(True)
        self.UIElements[controlledAttribute].setValue(intVal)
        self.UIElements[controlledAttribute + "_spin"].setValue(intVal)
        self.UIElements[controlledAttribute].blockSignals(False)
        self.UIElements[controlledAttribute + "_spin"].blockSignals(False)

        # Now update the creationPoseWeight.
        newTotal = currentTotal + newValue
        creationPose = 1.0 - newTotal
        cmds.setAttr(self.settingsLocator + ".creationPoseWeight", creationPose)

        # If you have UI controls for creationPoseWeight (say, stored as "creationSpin" and "creationSlider"):
        if "creationSpin" in self.UIElements and "creationSlider" in self.UIElements:
            intCreation = int(creationPose * 100)
            self.UIElements["creationSpin"].blockSignals(True)
            self.UIElements["creationSlider"].blockSignals(True)
            self.UIElements["creationSpin"].setValue(intCreation)
            self.UIElements["creationSlider"].setValue(intCreation)
            self.UIElements["creationSpin"].blockSignals(False)
            self.UIElements["creationSlider"].blockSignals(False)

        # Finally, update any other UI (such as a matching button).
        self.moduleWeights_updateMatchingButton()

    def create_moduleWeightsScriptJob(self, weightAttributes):
        jobID = cmds.scriptJob(event=["timeChanged", partial(self.moduleWeights_timeUpdateScriptJobCallback, weightAttributes)])
        self.scriptJobs.append(jobID)
        
    def moduleWeights_timeUpdateScriptJobCallback(self, weightAttributes):
        for attr in weightAttributes:
            try:
                # Check if the attribute exists on the settingsLocator node.
                if cmds.attributeQuery(attr, node=self.settingsLocator, exists=True):
                    value = cmds.getAttr(self.settingsLocator + "." + attr)
                    # Update the slider/spinbox (using whichever UI control you have)
                    slider = self.UIElements.get(attr)
                    if slider:
                        slider.setValue(int(value * 100))
                else:
                    print(f"Attribute {attr} does not exist on {self.settingsLocator}")
            except Exception as e:
                print(f"Warning: Could not update attribute {attr}: {e}")
        self.moduleWeights_updateMatchingButton()

    def moduleWeights_updateMatchingButton(self):
        selectedItems = self.UIElements["animationModule_textScroll"].selectedItems()
        if selectedItems:
            currentlySelectedModuleNamespace = selectedItems[0].text()
            attrName = self.settingsLocator + "." + currentlySelectedModuleNamespace + "_weight"
            if cmds.attributeQuery(currentlySelectedModuleNamespace + "_weight", node=self.settingsLocator, exists=True):
                moduleWeightValue = cmds.getAttr(attrName)
                matchButtonEnable = (moduleWeightValue == 0)
                self.UIElements["matchingButton"].setEnabled(matchButtonEnable)
            else:
                print(f"Attribute {currentlySelectedModuleNamespace}_weight does not exist on {self.settingsLocator}")
                self.UIElements["matchingButton"].setEnabled(False)

    def keyModuleWeights(self, weightAttributes):
        for attr in weightAttributes:
            cmds.setKeyframe(self.settingsLocator, at=attr, itt="linear", ott="linear")
        cmds.setKeyframe(self.settingsLocator, at="creationPoseWeight", itt="linear", ott="linear")
        
    def graphModuleWeights(self):
        import maya.mel as mel
        cmds.select(self.settingsLocator, replace=True)
        mel.eval("tearOffPanel \"Graph Editor\" graphEditor true")
        
    # def setupModuleSpecificControls(self):
    #     selectedItems = self.UIElements["animationModule_textScroll"].selectedItems()
    #     currentlySelectedModuleNamespace = None
    #     if selectedItems:
    #         currentlySelectedModuleNamespace = selectedItems[0].text()
    #         if (currentlySelectedModuleNamespace == self.previousAnimationModule and
    #             self.selectedBlueprintModule == self.previousBlueprintModule):
    #             return
    #     # Clear controls from moduleSpecificControlsColumn.
    #     layout = self.UIElements["moduleSpecificControlsColumn"]
    #     while layout.count():
    #         child = layout.takeAt(0)
    #         if child.widget():
    #             child.widget().deleteLater()
    #     self.UIElements["matchingButton"].setEnabled(False)
    #     # Get module names from utils.
    #     moduleNameInfo = utils.findAllModuleNames("/Modules/Animation")
    #     modules, moduleNames = moduleNameInfo
    #     if selectedItems:
    #         currentlySelectedModule = currentlySelectedModuleNamespace.rpartition("_")[0]
    #         if currentlySelectedModule in moduleNames:
    #             moduleWeightValue = cmds.getAttr(self.selectedBlueprintModule + ":SETTINGS." + currentlySelectedModuleNamespace + "_weight")
    #             matchButtonEnable = (moduleWeightValue == 0.0)
    #             moduleIndex = moduleNames.index(currentlySelectedModule)
    #             module = modules[moduleIndex]
    #             # Create a placeholder label for module LOD control.
    #             placeholder = QtWidgets.QLabel(f"Module LOD: {self.selectedBlueprintModule}:{currentlySelectedModuleNamespace}:module_grp.lod")
    #             layout.addWidget(placeholder)
                
    #             mod = __import__("Animation." + module, {}, {}, [module])
    #             importlib.reload(mod)
    #             moduleClass = getattr(mod, mod.CLASS_NAME)
    #             moduleInst = moduleClass(self.selectedBlueprintModule + ":" + currentlySelectedModuleNamespace)
    #             # Let moduleInst add its UI controls to the given layout.
    #             moduleInst.UI(layout)
                
    #             # Create a preferences frame.
    #             prefGroup = QtWidgets.QGroupBox("preferences")
    #             prefLayout = QtWidgets.QVBoxLayout(prefGroup)
    #             layout.addWidget(prefGroup)
                
    #             # Placeholder for icon scale control.
    #             iconScaleLabel = QtWidgets.QLabel("Icon Scale: " + self.selectedBlueprintModule + ":" + currentlySelectedModuleNamespace + ":module_grp.iconScale")
    #             prefLayout.addWidget(iconScaleLabel)
                
    #             # Color slider for icon color.
    #             value = cmds.getAttr(self.selectedBlueprintModule + ":" + currentlySelectedModuleNamespace + ":module_grp.overrideColor") + 1
    #             self.UIElements["iconColor"] = QtWidgets.QSlider(QtCore.Qt.Horizontal)
    #             self.UIElements["iconColor"].setMaximum(32)
    #             self.UIElements["iconColor"].setValue(value)
    #             self.UIElements["iconColor"].valueChanged.connect(partial(self.iconColour_callback, currentlySelectedModuleNamespace))
    #             prefLayout.addWidget(self.UIElements["iconColor"])
                
    #             moduleInst.UI_preferences(prefLayout)
    #             self.UIElements["matchingButton"].setEnabled(matchButtonEnable)
    #         self.previousBlueprintModule = self.selectedBlueprintModule
    #         self.previousAnimationModule = currentlySelectedModuleNamespace
        
    # def iconColour_callback(self, currentlySelectedModuleNamespace, value):
    #     cmds.setAttr(self.selectedBlueprintModule + ":" + currentlySelectedModuleNamespace + ":module_grp.overrideColor", value - 1)
        
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
        
    # def setupSpaceSwitchingControls(self):
    #     # Clear existing controls.
    #     layout = self.UIElements["spaceSwitchingColumn"]
    #     while layout.count():
    #         child = layout.takeAt(0)
    #         if child.widget():
    #             child.widget().deleteLater()
        
    #     largeButtonSize = 80
    #     smallButtonSize = 35
    #     enumOptionWidth = self.width() - 2*(largeButtonSize + smallButtonSize)
    #     enable = False
    #     selection = cmds.ls(selection=True, transforms=True)
    #     spaceSwitcher = None
    #     controlObj = None
    #     targetObject = None
    #     if selection:
    #         if cmds.attributeQuery("spaceSwitching", n=selection[0], exists=True):
    #             enable = True
    #             controlObj = selection[0]
    #             spaceSwitcher = selection[0] + "_spaceSwitcher"
    #             if len(selection) > 1:
    #                 targetObject = selection[1]
    #     if targetObject is None:
    #         targetObject = self.selectedBlueprintModule + ":HOOK_IN"
    #     # Create a horizontal layout for space switching.
    #     rowLayout = QtWidgets.QHBoxLayout()
    #     self.UIElements["spaceSwitching_rowLayout"] = rowLayout
    #     # Use QComboBox as a placeholder for attrEnumOptionMenu.
    #     self.UIElements["currentSpace"] = QtWidgets.QComboBox()
    #     self.UIElements["currentSpace"].setEnabled(False)
    #     rowLayout.addWidget(self.UIElements["currentSpace"])
        
    #     self.UIElements["spaceSwitching_spaceSwitch"] = QtWidgets.QPushButton("Space Switch")
    #     self.UIElements["spaceSwitching_spaceSwitch"].setEnabled(enable)
    #     self.UIElements["spaceSwitching_spaceSwitch"].clicked.connect(partial(self.spaceSwitching_spaceSwitch, controlObj, targetObject))
    #     rowLayout.addWidget(self.UIElements["spaceSwitching_spaceSwitch"])
        
    #     self.UIElements["spaceSwitching_deleteKey"] = QtWidgets.QPushButton("Delete Key")
    #     self.UIElements["spaceSwitching_deleteKey"].setEnabled(enable)
    #     self.UIElements["spaceSwitching_deleteKey"].clicked.connect(partial(self.spaceSwitching_deleteKey, spaceSwitcher))
    #     rowLayout.addWidget(self.UIElements["spaceSwitching_deleteKey"])
        
    #     self.UIElements["spaceSwitching_backKey"] = QtWidgets.QPushButton("<")
    #     self.UIElements["spaceSwitching_backKey"].setEnabled(enable)
    #     self.UIElements["spaceSwitching_backKey"].clicked.connect(partial(self.spaceSwitching_backKey, spaceSwitcher))
    #     rowLayout.addWidget(self.UIElements["spaceSwitching_backKey"])
        
    #     self.UIElements["spaceSwitching_forwardKey"] = QtWidgets.QPushButton(">")
    #     self.UIElements["spaceSwitching_forwardKey"].setEnabled(enable)
    #     self.UIElements["spaceSwitching_forwardKey"].clicked.connect(partial(self.spaceSwitching_forwardKey, spaceSwitcher))
    #     rowLayout.addWidget(self.UIElements["spaceSwitching_forwardKey"])
        
    #     layout.addLayout(rowLayout)
        
    # def spaceSwitching_spaceSwitch(self, controlObj, targetObject):
    #     controlObjectInstance = controlObject.ControlObject(controlObj)
    #     controlObjectInstance.switchSpace_UI(targetObject)
        
    # def spaceSwitching_deleteKey(self, spaceSwitcher):
    #     animationNamespace = utils.stripLeadingNamespace(spaceSwitcher)[0]
    #     characterContainer = self.selectedCharacter + ":character_container"
    #     blueprintContainer = self.selectedBlueprintModule + ":module_container"
    #     animationContainer = animationNamespace + ":module_container"
    #     containers = [characterContainer, blueprintContainer, animationContainer]
    #     for c in containers:
    #         cmds.lockNode(c, lock=False, lockUnpublished=False)
    #     cmds.cutKey(spaceSwitcher, at="currentSpace", time=(cmds.currentTime(q=True),))
    #     for c in containers:
    #         cmds.lockNode(c, lock=True, lockUnpublished=True)
    #     print(f"THE animationNamespace EQUALS: {animationNamespace}")
    #     print(f"THE blueprintContainer EQUALS: {blueprintContainer}")
    #     print(f"THE animationContainer EQUALS: {animationContainer}")
    #     print(f"THE spaceSwitcher EQUALS: {spaceSwitcher}")
        
    # def spaceSwitching_forwardKey(self, spaceSwitcher):
    #     currentTime = cmds.currentTime(q=True)
    #     time = cmds.findKeyframe(spaceSwitcher, at="currentSpace", time=(currentTime,), which="next")
    #     if currentTime < time:
    #         cmds.currentTime(time)
        
    # def spaceSwitching_backKey(self, spaceSwitcher):
    #     currentTime = cmds.currentTime(q=True)
    #     time = cmds.findKeyframe(spaceSwitcher, at="currentSpace", time=(currentTime,), which="previous")
    #     if currentTime > time:
    #         cmds.currentTime(time)
            
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
