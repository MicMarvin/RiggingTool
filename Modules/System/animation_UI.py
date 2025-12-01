# coding: utf-8
import os
import time
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

def clearLayout(layout):
    while layout.count():
        item = layout.takeAt(0)
        widget = item.widget()
        if widget is not None:
            widget.setParent(None)

MAYA_INDEX_COLORS = [
    QtGui.QColor(0, 0, 0),           #  1: Black
    QtGui.QColor(64, 64, 64),        #  2: Dark Gray (0.25,0.25,0.25)
    QtGui.QColor(153, 153, 153),     #  3: Gray (0.6,0.6,0.6)
    QtGui.QColor(155, 0, 40),        #  4: Reddish (0.608,0,0.157)
    QtGui.QColor(0, 4, 96),          #  5: Deep Blue (≈0,0.016,0.376)
    QtGui.QColor(0, 0, 255),         #  6: Blue (0,0,1)
    QtGui.QColor(0, 70, 25),         #  7: Dark Green (0,0.275,0.098)
    QtGui.QColor(38, 0, 67),         #  8: Purple-ish (0.149,0,0.263)
    QtGui.QColor(200, 0, 200),       #  9: Magenta (0.784,0,0.784)
    QtGui.QColor(138, 72, 51),       # 10: Brown (0.541,0.282,0.200)
    QtGui.QColor(63, 35, 31),        # 11: Dark Brown (0.247,0.137,0.122)
    QtGui.QColor(153, 38, 0),        # 12: Orange-ish (0.6,0.149,0)
    QtGui.QColor(255, 0, 0),         # 13: Red (1,0,0)
    QtGui.QColor(0, 255, 0),         # 14: Green (0,1,0)
    QtGui.QColor(0, 65, 153),        # 15: Blue-ish (0,0.255,0.6)
    QtGui.QColor(255, 255, 255),     # 16: White (1,1,1)
    QtGui.QColor(255, 255, 0),       # 17: Yellow (1,1,0)
    QtGui.QColor(100, 220, 255),     # 18: Light Blue (0.392,0.863,1)
    QtGui.QColor(67, 255, 163),      # 19: Aqua (0.263,1,0.639)
    QtGui.QColor(255, 176, 176),     # 20: Pink (1,0.69,0.69)
    QtGui.QColor(228, 172, 121),     # 21: Tan (0.894,0.675,0.475)
    QtGui.QColor(255, 255, 99),      # 22: Light Yellow (1,1,0.388)
    QtGui.QColor(0, 153, 84),        # 23: Greenish (0,0.6,0.329)
    QtGui.QColor(160, 105, 48),      # 24: Brownish (0.63,0.414,0.189)
    QtGui.QColor(158, 160, 48),      # 25: Olive (0.621,0.63,0.189)
    QtGui.QColor(104, 160, 48),      # 26: Olive Green (0.41,0.63,0.189)
    QtGui.QColor(48, 160, 93),       # 27: Teal (0.189,0.63,0.365)
    QtGui.QColor(48, 160, 160),      # 28: Cyan (0.189,0.63,0.63)
    QtGui.QColor(48, 103, 160),      # 29: Blue (0.189,0.405,0.63)
    QtGui.QColor(111, 48, 160),      # 30: Purple (0.436,0.189,0.63)
    QtGui.QColor(160, 48, 105),      # 31: Reddish Purple (0.63,0.189,0.414)
    QtGui.QColor(249, 170, 38),      # 32: Yellowish Orange 
]

#---------------------------------------------------------------------
# ClickToScrollDoubleSpinBox class fix for scroll wheel.
#---------------------------------------------------------------------
class ClickToScrollDoubleSpinBox(QtWidgets.QDoubleSpinBox):
    def wheelEvent(self, event):
        event.ignore()

#---------------------------------------------------------------------
# AttrControlWidget class using PySide2.
#---------------------------------------------------------------------
class AttrControlWidget(QtWidgets.QWidget):
    def __init__(self, attrName, labelText, minVal=0, maxVal=100, initialValue=0, callback=None, scale=True, parent=None):
        """
        attrName: full Maya attribute name (e.g. "Character__Foo:SETTINGS.weight1")
        labelText: text to display in the label.
        minVal, maxVal: numeric range for the UI controls.
        initialValue: initial integer value for the UI (e.g. 50 for 0.5 if scale=True).
        callback: callable to receive the new integer value when changed.
        scale: if True (default), the widget assumes the UI is 0–100 and will divide by 100 before setting the attribute.
            If False, it will set the attribute directly.
        """
        super(AttrControlWidget, self).__init__(parent)
        self.attrName = attrName
        self.callback = callback
        self.scale = scale

        layout = QtWidgets.QHBoxLayout(self)
        layout.setContentsMargins(2,2,2,2)

        self.label = QtWidgets.QLabel(labelText)
        self.label.setFixedWidth(180)

        self.spinBox = QtWidgets.QSpinBox()
        self.spinBox.setRange(minVal, maxVal)
        self.spinBox.setValue(initialValue)

        self.slider = QtWidgets.QSlider(QtCore.Qt.Horizontal)
        self.slider.setRange(minVal, maxVal)
        self.slider.setValue(initialValue)

        layout.addWidget(self.label)
        layout.addWidget(self.spinBox)
        layout.addWidget(self.slider)

        # Synchronize spinBox and slider.
        self.spinBox.valueChanged.connect(self.slider.setValue)
        self.slider.valueChanged.connect(self.spinBox.setValue)

        # Connect slider value changes to our on_value_changed.
        self.slider.valueChanged.connect(self.on_value_changed)

    def on_value_changed(self, newValue):
        try:
            if self.scale:
                # For attributes that need scaling (0-100 UI to 0.0-1.0 attribute)
                cmds.setAttr(self.attrName, newValue / 100.0)
            else:
                # For attributes that are not scaled (like moduleLOD)
                cmds.setAttr(self.attrName, newValue)
        except Exception as e:
            print(f"Error setting attribute {self.attrName}: {e}")
        if self.callback is not None:
            self.callback(newValue)

#---------------------------------------------------------------------
# FloatAttrControlWidget class using PySide2.
#---------------------------------------------------------------------
class FloatAttrControlWidget(QtWidgets.QWidget):
    """
    A widget for controlling a float Maya attribute using a QDoubleSpinBox and a QSlider.
    Because QSlider only supports integers, we map the float range into an integer range
    by using a conversion factor. For example, if conversion=1000 then:
    float_value = slider_value / 1000.
    """
    def __init__(self, attrName, labelText, minVal, maxVal, initialValue, conversion=1000, callback=None, decimals=1, singleStep=None, parent=None):
        super(FloatAttrControlWidget, self).__init__(parent)
        self.attrName = attrName
        self.callback = callback
        self.conversion = conversion  # conversion factor for mapping float->int
        layout = QtWidgets.QHBoxLayout(self)
        layout.setContentsMargins(2,2,2,2)

        self.label = QtWidgets.QLabel(labelText)
        self.label.setFixedWidth(180)

        self.doubleSpin = ClickToScrollDoubleSpinBox()
        self.doubleSpin.setRange(minVal, maxVal)
        self.doubleSpin.setDecimals(decimals)
        # Pick a sensible default singleStep based on requested decimals if none provided.
        if singleStep is None:
            singleStep = 1.0 / (10 ** decimals)
        self.doubleSpin.setSingleStep(singleStep)
        self.doubleSpin.setValue(initialValue)

        # Set up the slider using the conversion factor.
        self.slider = QtWidgets.QSlider(QtCore.Qt.Horizontal)
        self.slider.setRange(int(minVal * conversion), int(maxVal * conversion))
        self.slider.setValue(int(round(initialValue * conversion)))

        layout.addWidget(self.label)
        layout.addWidget(self.doubleSpin)
        layout.addWidget(self.slider)

        # Synchronize the two controls.
        self.doubleSpin.valueChanged.connect(self.syncSlider)
        self.slider.valueChanged.connect(self.syncSpinBox)

        # When the slider changes, trigger our on_value_changed.
        self.slider.valueChanged.connect(self.on_value_changed)

    def syncSlider(self, newVal):
        # Allow slider signal to fire so on_value_changed updates the Maya attr when spinbox is edited.
        self.slider.setValue(int(round(newVal * self.conversion)))

    def syncSpinBox(self, sliderVal):
        self.doubleSpin.blockSignals(True)
        self.doubleSpin.setValue(sliderVal / self.conversion)
        self.doubleSpin.blockSignals(False)

    def on_value_changed(self, sliderVal):
        floatVal = sliderVal / self.conversion
        try:
            cmds.setAttr(self.attrName, floatVal)
        except Exception as e:
            print(f"Error setting {self.attrName}: {e}")
        if self.callback is not None:
            self.callback(floatVal)

#---------------------------------------------------------------------
# ColorControlWidget class using PySide2.
#---------------------------------------------------------------------
class ColorControlWidget(QtWidgets.QWidget):
    """
    A widget for controlling a Maya color attribute (an index from 0–31).
    The UI displays a label, a button showing the current color, and a slider (range 1–32).
    Clicking the color button opens a dialog with a grid of swatch buttons.
    When the slider or a swatch is used, the attribute is set (via cmds.setAttr) and an optional callback is called.
    """
    def __init__(self, attrName, labelText, minVal=1, maxVal=32, initialValue=1, callback=None, parent=None):
        super(ColorControlWidget, self).__init__(parent)
        self.attrName = attrName
        self.callback = callback
        # Use our updated Maya index colors.
        self.indexColors = MAYA_INDEX_COLORS

        layout = QtWidgets.QHBoxLayout(self)
        layout.setContentsMargins(2, 2, 2, 2)
        self.label = QtWidgets.QLabel(labelText)
        self.label.setFixedWidth(180)

        # A button that displays the current color.
        self.colorButton = QtWidgets.QPushButton()
        self.colorButton.setFixedSize(40, 20)
        self.colorButton.clicked.connect(self.openSwatchDialog)

        # A slider for selecting an index (1–32).
        self.slider = QtWidgets.QSlider(QtCore.Qt.Horizontal)
        self.slider.setRange(minVal, maxVal)
        self.slider.setValue(initialValue)
        self.slider.valueChanged.connect(self.on_slider_changed)

        layout.addWidget(self.label)
        layout.addWidget(self.colorButton)
        layout.addWidget(self.slider)

        # Initialize the displayed color.
        self.updateColorButton(initialValue)

    def updateColorButton(self, value):
        # Convert slider value (1–32) to a 0–31 index.
        index = value - 1
        if 0 <= index < len(self.indexColors):
            color = self.indexColors[index]
            # Set the button's background to the color.
            self.colorButton.setStyleSheet("background-color: %s" % color.name())
        else:
            self.colorButton.setStyleSheet("")

    def on_slider_changed(self, value):
        self.updateColorButton(value)
        try:
            # Maya’s attribute is 0-indexed, so subtract 1.
            cmds.setAttr(self.attrName, value - 1)
        except Exception as e:
            print(f"Error setting {self.attrName}: {e}")
        if self.callback:
            self.callback(value)

    def openSwatchDialog(self):
        # Create a dialog with a grid of swatch buttons.
        dialog = QtWidgets.QDialog(self)
        dialog.setWindowTitle("Select Icon Color")
        grid = QtWidgets.QGridLayout(dialog)
        rows = 4
        cols = 8
        for i, color in enumerate(self.indexColors):
            btn = QtWidgets.QPushButton()
            btn.setFixedSize(30, 30)
            btn.setStyleSheet("background-color: %s" % color.name())
            # Connect using a lambda that accepts the extra "checked" parameter.
            btn.clicked.connect(lambda checked=False, v=i+1, d=dialog: self.setColorFromSwatch(v, d))
            grid.addWidget(btn, i // cols, i % cols)
        dialog.exec_()

    def setColorFromSwatch(self, value, dialog):
        self.slider.setValue(value)
        dialog.accept()

#---------------------------------------------------------------------
# CollapsibleWidget class using PySide2.
#---------------------------------------------------------------------
class CollapsibleWidget(QtWidgets.QWidget):
    def __init__(self, title="", settingsKey="", headerWidget=None, parent=None):
        super(CollapsibleWidget, self).__init__(parent)
        self.settingsKey = settingsKey
        self.settings = QtCore.QSettings("MicMarvin", "RiggingTool")

        # Create a separate toggle button for the arrow (icon-only)
        self.toggleButton = QtWidgets.QToolButton()
        self.toggleButton.setCheckable(True)
        self.toggleButton.setStyleSheet("QToolButton { border: none; }")
        self.toggleButton.setToolButtonStyle(QtCore.Qt.ToolButtonIconOnly)
        # Retrieve the saved state (default True)
        state = self.settings.value(self.settingsKey, True, type=bool)
        self.toggleButton.setChecked(state)
        self.toggleButton.setArrowType(QtCore.Qt.DownArrow if state else QtCore.Qt.RightArrow)
        self.toggleButton.clicked.connect(self.on_toggle)

        # Use the provided headerWidget if available; otherwise create a bold label using title.
        if headerWidget is not None:
            self.headerWidget = headerWidget
        else:
            self.headerWidget = QtWidgets.QLabel(title)
            self.headerWidget.setStyleSheet("font-weight: bold;")

        # Build a header layout that contains the arrow toggle and the header widget.
        headerLayout = QtWidgets.QHBoxLayout()
        headerLayout.setContentsMargins(0, 0, 0, 0)
        headerLayout.addWidget(self.toggleButton)
        headerLayout.addWidget(self.headerWidget)

        # The content area will contain the collapsible content.
        self.contentArea = QtWidgets.QWidget()
        self.contentArea.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Preferred)
        self.contentArea.setVisible(state)

        # Main layout
        mainLayout = QtWidgets.QVBoxLayout(self)
        mainLayout.setContentsMargins(0, 0, 0, 0)
        mainLayout.addLayout(headerLayout)
        mainLayout.addWidget(self.contentArea)

    def on_toggle(self):
        state = self.toggleButton.isChecked()
        self.toggleButton.setArrowType(QtCore.Qt.DownArrow if state else QtCore.Qt.RightArrow)
        self.contentArea.setVisible(state)
        self.settings.setValue(self.settingsKey, state)

    def setContentLayout(self, layout):
        self.contentArea.setLayout(layout)


#---------------------------------------------------------------------
# Animation_UI class using PySide2.
#---------------------------------------------------------------------
class Animation_UI(QtWidgets.QDialog):

    instances = {}  # maps character namespace -> Animation_UI instance
    
    @staticmethod
    def findSelectedCharacter():
        selection = cmds.ls(selection=True, transforms=True)
        character = None
        if selection:
            selected = selection[0]
            selectedNamespaceInfo = utils.stripLeadingNamespace(selected)
            if selectedNamespaceInfo and selectedNamespaceInfo[0].startswith("Character__"):
                character = selectedNamespaceInfo[0]
        return character

    @classmethod
    def show_ui(cls):
        """Open/raise a single window for the currently selected character."""
        character = cls.findSelectedCharacter()
        if character is None:
            QtWidgets.QMessageBox.warning(maya_main_window(), "No Character!", "Please select a character.")
            return None

        existing = cls.instances.get(character)
        if existing and existing.isVisible():
            existing.raise_()
            existing.activateWindow()
            return existing

        inst = cls()
        if not getattr(inst, "valid", True):
            inst.deleteLater()
            return None

        cls.instances[character] = inst
        inst.show()
        return inst
    
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
        self.UIElements["animationModule_textScroll"].itemSelectionChanged.connect(self.setupModuleSpecificControls)

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
        self.UIElements["matchingButton"].clicked.connect(self.matchSelectedModule)
        self.UIElements["topColumnLayout"].addWidget(self.UIElements["matchingButton"])
        
        # Separator.
        self.UIElements["topColumnLayout"].addWidget(utils.create_separator())
        
        # Space Switching Column.
        self.UIElements["spaceSwitchingColumn"] = QtWidgets.QVBoxLayout()
        # Initialize persistent space switching row (widgets are refreshed later).
        self.spaceSwitchingState = {"controlObj": None, "spaceSwitcher": None, "targetObject": None}
        spaceRow = QtWidgets.QHBoxLayout()
        self.UIElements["spaceSwitching_rowLayout"] = spaceRow

        self.UIElements["currentSpaceLabel"] = QtWidgets.QLabel("Current Space:")
        spaceRow.addWidget(self.UIElements["currentSpaceLabel"])

        self.UIElements["currentSpace"] = QtWidgets.QComboBox()
        self.UIElements["currentSpace"].setMinimumWidth(160)
        self.UIElements["currentSpace"].setEnabled(False)
        spaceRow.addWidget(self.UIElements["currentSpace"])

        self.UIElements["spaceSwitching_spaceSwitch"] = QtWidgets.QPushButton("Space Switch")
        self.UIElements["spaceSwitching_spaceSwitch"].setEnabled(False)
        self.UIElements["spaceSwitching_spaceSwitch"].clicked.connect(self.spaceSwitching_spaceSwitch)
        spaceRow.addWidget(self.UIElements["spaceSwitching_spaceSwitch"])

        self.UIElements["spaceSwitching_deleteKey"] = QtWidgets.QPushButton("Delete Key")
        self.UIElements["spaceSwitching_deleteKey"].setEnabled(False)
        self.UIElements["spaceSwitching_deleteKey"].clicked.connect(self.spaceSwitching_deleteKey)
        spaceRow.addWidget(self.UIElements["spaceSwitching_deleteKey"])

        self.UIElements["spaceSwitching_backKey"] = QtWidgets.QPushButton("<")
        self.UIElements["spaceSwitching_backKey"].setEnabled(False)
        self.UIElements["spaceSwitching_backKey"].clicked.connect(self.spaceSwitching_backKey)
        self.UIElements["spaceSwitching_backKey"].setFixedWidth(24)
        spaceRow.addWidget(self.UIElements["spaceSwitching_backKey"])

        self.UIElements["spaceSwitching_forwardKey"] = QtWidgets.QPushButton(">")
        self.UIElements["spaceSwitching_forwardKey"].setEnabled(False)
        self.UIElements["spaceSwitching_forwardKey"].clicked.connect(self.spaceSwitching_forwardKey)
        self.UIElements["spaceSwitching_forwardKey"].setFixedWidth(24)
        spaceRow.addWidget(self.UIElements["spaceSwitching_forwardKey"])

        self.UIElements["spaceSwitchingColumn"].addLayout(spaceRow)
        self.setupSpaceSwitchingControls()
        self.UIElements["topColumnLayout"].addLayout(self.UIElements["spaceSwitchingColumn"])
        
        # Separator.
        self.UIElements["topColumnLayout"].addWidget(utils.create_separator())
        
        # Module Specified Controls Scroll.
        self.UIElements["moduleSpecifiedControlsScroll"] = QtWidgets.QScrollArea()
        self.UIElements["moduleSpecifiedControlsScroll"].setMinimumWidth(420)
        self.UIElements["moduleSpecifiedControlsScroll"].setWidgetResizable(True)
       
        moduleSpecWidget = QtWidgets.QWidget()
        self.UIElements["moduleSpecWidget"] = moduleSpecWidget  # store the widget!
        self.UIElements["moduleSpecificControlsColumn"] = QtWidgets.QVBoxLayout(moduleSpecWidget)
        self.UIElements["moduleSpecifiedControlsScroll"].setWidget(moduleSpecWidget)

        # Create container widgets for Module LOD and Preferences:
        self.UIElements["moduleSpecificLODWidget"] = QtWidgets.QWidget()
        self.UIElements["moduleSpecificLOD"] = QtWidgets.QVBoxLayout(self.UIElements["moduleSpecificLODWidget"])
        self.UIElements["moduleSpecificPreferencesWidget"] = QtWidgets.QWidget()
        self.UIElements["moduleSpecificPreferences"] = QtWidgets.QVBoxLayout(self.UIElements["moduleSpecificPreferencesWidget"])

        # Then add them (in order) to the top column layout:
        self.UIElements["topColumnLayout"].addWidget(self.UIElements["moduleSpecificLODWidget"])
        self.UIElements["topColumnLayout"].addWidget(self.UIElements["moduleSpecifiedControlsScroll"])
        self.UIElements["topColumnLayout"].addWidget(self.UIElements["moduleSpecificPreferencesWidget"])

        
        # Initialize blueprint module list and refresh animation module list.
        self.initializeBlueprintModuleList()
        self.refreshAnimationModuleList()
        
        # Setup the script job (we still use cmds.scriptJob here for selection changes).
        self.setupScriptJob()
        
        # Make sure we clean up on scene close.
        self.setupSceneCloseJobs()

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
        
        character = getattr(self, "selectedCharacter", None)
        if type(self).instances.get(character) is self:
            del type(self).instances[character]
        super(Animation_UI, self).closeEvent(event)
        
        event.accept()

    def setupSceneCloseJobs(self):
        for evt in ("NewSceneOpened", "SceneOpened"):
            try:
                jobID = cmds.scriptJob(
                    event=[evt, self.closeFromSceneChange],
                    parent=self.objectName(),   # auto-kill when the UI closes
                    protected=True
                )
                self.scriptJobs.append(jobID)
            except RuntimeError as exc:
                cmds.warning(f"Could not create scene-close scriptJob for {evt}: {exc}")

    def closeFromSceneChange(self, *args):
        # Avoid re-entry if already closing
        if not self.isVisible():
            return
        try:
            self.deleteScriptJob()  # kills selection/weight jobs too
        except Exception:
            pass
        self.close()

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
            
    def refreshAnimationModuleList(self, index=0):
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

        # If there is at least one module but nothing is selected, force a default selection.
        if self.UIElements["animationModule_textScroll"].count() > 0:
            if not self.UIElements["animationModule_textScroll"].selectedItems():
                self.UIElements["animationModule_textScroll"].setCurrentRow(index)
            self.UIElements["deleteModuleButton"].setEnabled(True)
            self.UIElements["duplicateModuleButton"].setEnabled(True)

        # Now update the module specific controls.
        self.setupModuleSpecificControls()

        if selectedItems:
            self.previousBlueprintListEntry = selectedItems[0].text()
        else:
            self.previousBlueprintListEntry = None
        
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
        QtCore.QTimer.singleShot(0, self.setupModuleSpecificControls)
        self.setupSpaceSwitchingControls()
        
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
        row = 0
        
        # Creation Pose Weight row (read-only)
        creationWidget = AttrControlWidget(self.settingsLocator + ".creationPoseWeight",
                                           "Creation Pose Weight", minVal=0, maxVal=100,
                                           initialValue=int(cmds.getAttr(self.settingsLocator + ".creationPoseWeight")*100),
                                           callback=None)
        
        # Disable the entire row.
        creationWidget.setDisabled(True)

        # Save references so they can be updated later
        self.UIElements["creationSpin"] = creationWidget.spinBox
        self.UIElements["creationSlider"] = creationWidget.slider
        
        grid.addWidget(creationWidget, row, 0, 1, 1)
        row += 1

        # Add a horizontal separator after the creation row.
        separator = utils.create_separator()  # Assuming this returns a QWidget or QFrame.
        grid.addWidget(separator, row, 0, 1, 3)
        row += 1

        # --- Weight Attribute Rows ---
        # For each weight attribute, add a row with a label, spin box, and slider.
        for attr in weightAttributes:
            fullAttr = self.settingsLocator + "." + attr
            initial = int(cmds.getAttr(fullAttr)*100)
            widget = AttrControlWidget(fullAttr, attr, minVal=0, maxVal=100, initialValue=initial,
                                    callback=lambda val, a=attr, wa=weightAttributes: self.moduleWeights_sliderCallback(a, wa, val))
            grid.addWidget(widget, row, 0, 1, 1)
            # Save the widget for later use (so that we can update its slider and spinbox)
            self.UIElements[attr] = widget
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
        # Convert the new integer value (0-100) to a float 0.0-1.0.
        newValue = newIntValue / 100.0

        # Sum the values of all other weight attributes.
        currentTotal = 0.0
        for attr in weightAttributes:
            if attr != controlledAttribute:
                currentTotal += cmds.getAttr(self.settingsLocator + "." + attr)

        # Clamp the new value so the total does not exceed 1.0.
        if currentTotal + newValue > 1.0:
            newValue = 1.0 - currentTotal

        # Update the Maya attribute.
        cmds.setAttr(self.settingsLocator + "." + controlledAttribute, newValue)

        # Update the UI control for the changed attribute.
        intVal = int(round(newValue * 100))
        widget = self.UIElements[controlledAttribute]  # This is an instance of AttrControlWidget.
        widget.slider.blockSignals(True)
        widget.spinBox.blockSignals(True)
        widget.slider.setValue(intVal)
        widget.spinBox.setValue(intVal)
        widget.slider.blockSignals(False)
        widget.spinBox.blockSignals(False)

        # Update the Creation Pose Weight.
        newTotal = currentTotal + newValue
        creationPose = 1.0 - newTotal
        cmds.setAttr(self.settingsLocator + ".creationPoseWeight", creationPose)

        # Update the UI controls for Creation Pose Weight if they exist.
        if "creationSpin" in self.UIElements and "creationSlider" in self.UIElements:
            intCreation = int(round(creationPose * 100))
            self.UIElements["creationSpin"].blockSignals(True)
            self.UIElements["creationSlider"].blockSignals(True)
            self.UIElements["creationSpin"].setValue(intCreation)
            self.UIElements["creationSlider"].setValue(intCreation)
            self.UIElements["creationSpin"].blockSignals(False)
            self.UIElements["creationSlider"].blockSignals(False)

        self.moduleWeights_updateMatchingButton()

    def create_moduleWeightsScriptJob(self, weightAttributes):
        jobID = cmds.scriptJob(event=["timeChanged", partial(self.moduleWeights_timeUpdateScriptJobCallback, weightAttributes)], killWithScene=True, protected=True)
        self.scriptJobs.append(jobID)
        
    def moduleWeights_timeUpdateScriptJobCallback(self, weightAttributes):
        for attr in weightAttributes:
            try:
                # Check if the attribute exists on the settingsLocator node.
                if cmds.attributeQuery(attr, node=self.settingsLocator, exists=True):
                    value = cmds.getAttr(self.settingsLocator + "." + attr)
                    # Update the slider/spinbox (using whichever UI control you have)
                    widget = self.UIElements.get(attr)
                    if widget:
                        widget.slider.setValue(int(round(value * 100)))

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

    def setupModuleSpecificControls(self):
        selectedItems = self.UIElements["animationModule_textScroll"].selectedItems()
        currentlySelectedModuleNamespace = None
        if selectedItems:
            currentlySelectedModuleNamespace = selectedItems[0].text()
            if (currentlySelectedModuleNamespace == self.previousAnimationModule and
                self.selectedBlueprintModule == self.previousBlueprintModule):
                return

        # Clear the contents of the three container layouts.
        clearLayout(self.UIElements["moduleSpecificControlsColumn"])
        clearLayout(self.UIElements["moduleSpecificLOD"])
        clearLayout(self.UIElements["moduleSpecificPreferences"])

        # Clear controls from moduleSpecificControlsColumn.
        layout = self.UIElements["moduleSpecificControlsColumn"]
        moduleSpecificLODLayout = self.UIElements["moduleSpecificLOD"]
        moduleSpecificPreferencesLayout = self.UIElements["moduleSpecificPreferences"]
        
        # Get module names from utils.
        moduleNameInfo = utils.findAllModuleNames("/Modules/Animation")
        modules = moduleNameInfo[0]
        moduleNames = moduleNameInfo[1]
        if selectedItems:
            currentlySelectedModule = currentlySelectedModuleNamespace.rpartition("_")[0]
            if currentlySelectedModule in moduleNames:
                moduleWeightValue = cmds.getAttr(self.selectedBlueprintModule + ":SETTINGS." + currentlySelectedModuleNamespace + "_weight")
                matchButtonEnable = (moduleWeightValue == 0.0)
                moduleIndex = moduleNames.index(currentlySelectedModule)
                module = modules[moduleIndex]

                # Create widget for module LOD control.
                fullAttr = self.selectedBlueprintModule + ":" + currentlySelectedModuleNamespace + ":module_grp.lod"
                value = cmds.getAttr(fullAttr)
                moduleLOD = AttrControlWidget(fullAttr, "Module LOD:", minVal=0, maxVal=3, initialValue=value, callback=None, scale=False)
                moduleSpecificLODLayout.addWidget(moduleLOD)
                
                mod = __import__("Animation." + module, {}, {}, [module])
                importlib.reload(mod)
                moduleClass = getattr(mod, mod.CLASS_NAME)
                moduleInst = moduleClass(self.selectedBlueprintModule + ":" + currentlySelectedModuleNamespace)
                # Let moduleInst add its UI controls to the given layout.
                moduleInst.UI(layout)

                # Create a preferences section as a collapsible widget.
                preferencesWidget = CollapsibleWidget(title="Preferences", settingsKey="AnimationUI/Preferences")
                prefLayout = QtWidgets.QVBoxLayout()
                preferencesWidget.setContentLayout(prefLayout)
                moduleSpecificPreferencesLayout.addWidget(preferencesWidget)

                # Create an icon scale control using our FloatAttrControlWidget.
                fullAttrIconScale = self.selectedBlueprintModule + ":" + currentlySelectedModuleNamespace + ":module_grp.iconScale"
                currentScale = cmds.getAttr(fullAttrIconScale)
                iconScaleControl = FloatAttrControlWidget(fullAttrIconScale, "Icon Scale:", minVal=0.1, maxVal=5.0,
                                                          initialValue=currentScale, conversion=1000,
                                                          callback=lambda newVal: cmds.setAttr(fullAttrIconScale, newVal))
                prefLayout.addWidget(iconScaleControl)

                # Create an icon color control using our ColorControlWidget.
                colorAttr = self.selectedBlueprintModule + ":" + currentlySelectedModuleNamespace + ":module_grp.overrideColor"
                currentColor = cmds.getAttr(colorAttr)
                colorInitial = currentColor  # UI displays this value
                colorControl = ColorControlWidget(colorAttr, "Icon Color:",
                                                   minVal=1, maxVal=31,
                                                   initialValue=colorInitial,
                                                   callback=lambda newVal: cmds.setAttr(colorAttr, newVal))
                prefLayout.addWidget(colorControl)

                moduleInst.UI_preferences(prefLayout)
                self.UIElements["matchingButton"].setEnabled(matchButtonEnable)

        self.previousBlueprintModule = self.selectedBlueprintModule
        self.previousAnimationModule = currentlySelectedModuleNamespace
  
    def iconColour_callback(self, currentlySelectedModuleNamespace, value):
        cmds.setAttr(self.selectedBlueprintModule + ":" + currentlySelectedModuleNamespace + ":module_grp.overrideColor", value)
        
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
        
    def matchSelectedModule(self):
        selectedItems = self.UIElements["animationModule_textScroll"].selectedItems()
        if not selectedItems:
            return
        selectedModule = selectedItems[0].text()
        selectedModuleNamespace = f"{self.selectedBlueprintModule}:{selectedModule}"

        modules, moduleNames = utils.findAllModuleNames("/Modules/Animation")
        selectedModuleName = selectedModule.rpartition("_")[0]
        if selectedModuleName in moduleNames:
            moduleIndex = moduleNames.index(selectedModuleName)
            module = modules[moduleIndex]
            mod = __import__("Animation." + module, {}, {}, [module])
            importlib.reload(mod)
            moduleClass = getattr(mod, mod.CLASS_NAME)
            moduleInst = moduleClass(selectedModuleNamespace)
            moduleInst.match()

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
        enable = False
        selection = cmds.ls(selection=True, transforms=True)
        state = {"controlObj": None, "spaceSwitcher": None, "targetObject": None}
        currentSpaceItems = []
        currentSpaceIndex = 0
        if selection:
            selected = selection[0]
            if cmds.attributeQuery("spaceSwitching", n=selected, exists=True):
                enable = True
                state["controlObj"] = selected
                state["spaceSwitcher"] = selected + "_spaceSwitcher"
                if cmds.attributeQuery("currentSpace", n=state["spaceSwitcher"], exists=True):
                    enumStr = cmds.attributeQuery("currentSpace", n=state["spaceSwitcher"], listEnum=True)[0]
                    currentSpaceItems = enumStr.split(":") if enumStr else []
                    try:
                        currentSpaceIndex = cmds.getAttr(state["spaceSwitcher"] + ".currentSpace")
                    except Exception:
                        currentSpaceIndex = 0
                if len(selection) > 1:
                    state["targetObject"] = selection[1]
        if state["targetObject"] is None and self.selectedBlueprintModule:
            state["targetObject"] = self.selectedBlueprintModule + ":HOOK_IN"

        # Persist state for callbacks.
        self.spaceSwitchingState = state

        # Update the persistent UI row.
        combo = self.UIElements["currentSpace"]
        combo.blockSignals(True)
        combo.clear()
        combo.addItems(currentSpaceItems)
        if currentSpaceItems and currentSpaceIndex < len(currentSpaceItems):
            combo.setCurrentIndex(currentSpaceIndex)
        combo.blockSignals(False)
        combo.setEnabled(enable)
        if "currentSpaceLabel" in self.UIElements:
            self.UIElements["currentSpaceLabel"].setEnabled(enable)

        for key in ["spaceSwitching_spaceSwitch", "spaceSwitching_deleteKey", "spaceSwitching_backKey", "spaceSwitching_forwardKey"]:
            self.UIElements[key].setEnabled(enable)
        
    def spaceSwitching_spaceSwitch(self):
        state = getattr(self, "spaceSwitchingState", {})
        controlObj = state.get("controlObj")
        targetObject = state.get("targetObject")
        if not controlObj or not targetObject:
            return
        controlObjectInstance = controlObject.ControlObject(controlObj)
        controlObjectInstance.switchSpace_UI(targetObject)
        
    def spaceSwitching_deleteKey(self):
        state = getattr(self, "spaceSwitchingState", {})
        spaceSwitcher = state.get("spaceSwitcher")
        cmds.cutKey(spaceSwitcher, at="currentSpace", time=(cmds.currentTime(q=True),))     
        print(f"THE spaceSwitcher EQUALS: {spaceSwitcher}")
        
    def spaceSwitching_forwardKey(self):
        state = getattr(self, "spaceSwitchingState", {})
        spaceSwitcher = state.get("spaceSwitcher")
        currentTime = cmds.currentTime(q=True)
        time = cmds.findKeyframe(spaceSwitcher, at="currentSpace", time=(currentTime,), which="next")
        if currentTime < time:
            cmds.currentTime(time)
        
    def spaceSwitching_backKey(self):
        state = getattr(self, "spaceSwitchingState", {})
        spaceSwitcher = state.get("spaceSwitcher")
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

    
