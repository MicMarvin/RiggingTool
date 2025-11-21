###########
# Imports #
###########
# All the libraries we need to do stuff
from PySide2 import QtCore
from PySide2 import QtWidgets, QtGui
from functools import partial
import maya.cmds as cmds
import maya.utils as mayautils
import importlib
import os
import sys
import shutil

# Need these libraries to tie our window to Maya's "main window"
from shiboken2 import wrapInstance
import maya.OpenMayaUI as omui
import maya.api.OpenMaya as om

# Internal modules we need
import RiggingTool.Modules.System.utils as utils
importlib.reload(utils)


#################
# Helper Method #
#################
# Helper method for tying our window to Maya's "main window" so our window is on-top and visible
def maya_main_window():
    main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(int(main_window_ptr), QtWidgets.QWidget)


###########
# Classes #
###########
# A custom class to color widgets
class Color(QtWidgets.QWidget):

    def __init__(self, color):
        super().__init__()
        self.setAutoFillBackground(True)

        palette = self.palette()
        palette.setColor(QtGui.QPalette.Window, QtGui.QColor(color))
        self.setPalette(palette)


###########
#   GUI   #
###########
# A custom class to extend QDialog, so we can create our own window
class Blueprint_UI(QtWidgets.QDialog):
    
    ##################
    # Window display #
    ##################
    # Used for keeping track of created window after it is closed
    dialog_instance = None

    @classmethod
    def display(cls):
        if not cls.dialog_instance:
            cls.dialog_instance = Blueprint_UI()

        if cls.dialog_instance.isHidden():
            cls.dialog_instance.show()

        else:
            cls.dialog_instance.raise_()
            cls.dialog_instance.activateWindow()

    # The "init method" that initializes the creation of our window
    def __init__(self, parent=maya_main_window()):
        # Super passes parameters to the parent class
        super().__init__(parent)

        custom_button_style = """
            QPushButton {
                border: 1px solid black;
                border-radius: 5px;
                padding: 8px 12px;
                background-color: #5d5d5d;
                color: #efefef;
                font-size: 16px;
            }
            QPushButton:hover {
                border: 1px solid #000000;
                background-color: #707070;
            }
            QPushButton:pressed {
                border: 2px solid #f9aa26;
                background-color: #373737;
                color: #808080;
            }
            QPushButton:disabled {
                border: 1px solid #444444;
                background-color: #4b4b4b;
                color: #808080;
            }
        """
        self.setStyleSheet(custom_button_style)

        # Initialize the timer for debounce
        self.modifySelectedTimer = QtCore.QTimer()
        self.modifySelectedTimer.setSingleShot(True)
        self.modifySelectedTimer.timeout.connect(self.executeModifySelected)

        self.moduleInstance = None

        self.deleteSymmetryMoveExpressions()

        self.scenePublished = cmds.objExists("Scene_Published")
        self.sceneUnlocked = not cmds.objExists("Scene_Locked") and not self.scenePublished

        # Set a unique object name for the window (important for parenting the script job)
        self.setObjectName("UI")

        self.setWindowTitle("RiggingTool")
        #self.setFixedSize(400, 600)
        self.setMinimumWidth(525)
        self.setMinimumHeight(825)
        # self.setMaximumWidth(400)
        # self.setMaximumHeight(600)

        self.create_widgets()
        self.create_layouts()
        self.create_connections()
        self.initialiseTemplatesTab()

        # Script job ID
        self.callbackId = None
        # Initialize last_selected to an empty list to track selection changes
        self.last_selected = []
        # Tracks whether symmetry move is active for the current selection
        self.symmetryMoveActive = False
        # Tracks the current selection for symmetry move
        self.currentSymmetrySelection = None

    def createScriptJob(self):
        """Start the callback to track selection changes."""
        # Check if a callback already exists, and remove it first if it does
        if self.callbackId is not None:
            print(
                f"Attempting to create a callback, but callbackId {self.callbackId} already exists. Deleting existing callback first.")
            self.deleteScriptJob()

        # Add the new selection change callback
        self.callbackId = om.MEventMessage.addEventCallback("SelectionChanged", self.modifySelected)
        print(f"Selection Callback Created: {self.callbackId}")

    def deleteScriptJob(self):
        """Stop the selection callback if it exists."""
        if self.callbackId is not None:
            om.MMessage.removeCallback(self.callbackId)
            print(f"Selection Callback Removed: {self.callbackId}")
            self.callbackId = None
        else:
            print("No callbackId found to delete.")

    def create_separator(self):
        """Provide module dialogs a separator widget via the parent UI."""
        return utils.create_separator()

    def _cleanup_tmp_folder(self, tmp_folder):
        if not os.path.isdir(tmp_folder):
            return
        try:
            shutil.rmtree(tmp_folder)
            print(f"Deleted temp folder: {tmp_folder}")
        except Exception as e:
            print(f"Failed to delete temp folder {tmp_folder}: {e}")

    def _resolve_icon_path(self, icon_path):
        """Return an absolute icon path from stored text (supports relative or legacy absolute)."""
        if not icon_path:
            return icon_path
        icon_path = icon_path.strip()
        program_root = os.path.join(os.environ["RIGGING_TOOL_ROOT"], "RiggingTool")

        if not os.path.isabs(icon_path):
            return os.path.normpath(os.path.join(program_root, icon_path))

        if os.path.exists(icon_path):
            return os.path.normpath(icon_path)

        # Legacy absolute path that no longer exists: fall back to current Templates folder + basename
        fallback = os.path.join(program_root, "Templates", os.path.basename(icon_path))
        return os.path.normpath(fallback)

    def _to_relative_icon_path(self, icon_path):
        """Store icon paths relative to the RiggingTool root when possible."""
        if not icon_path:
            return icon_path
        icon_path = os.path.normpath(icon_path.strip())
        program_root = os.path.join(os.environ["RIGGING_TOOL_ROOT"], "RiggingTool")

        try:
            relative = os.path.relpath(icon_path, program_root)
            # If relpath climbs out (e.g., startswith '..'), keep original
            if not relative.startswith(".."):
                return relative.replace("\\", "/")
        except ValueError:
            # relpath can fail on different drives on Windows
            pass

        return icon_path.replace("\\", "/")

    def showEvent(self, event):
        super().showEvent(event)
        self.createScriptJob()  # Create the script job when the window is shown

    def closeEvent(self, event):
        self.deleteScriptJob()  # Delete the script job when the window is closed
        super().closeEvent(event)

    def update_label_font_sizes(self, event):
        # Get the width of each label
        label_one_width = self.label_one.width()
        label_two_width = self.label_two.width()

        # Calculate font size based on the smaller width to keep fonts consistent
        min_width = min(label_one_width, label_two_width)

        # Define minimum and maximum font sizes
        min_font_size = self.initial_font_size
        max_font_size = 42  # Replace with your desired maximum font size

        # Calculate font size within the defined range
        font_size = max(min_font_size, min(max_font_size, min_width // 20))  # Adjust the divisor as needed

        # Create a font with the calculated size
        font = QtGui.QFont()
        font.setPointSize(font_size)

        # Apply the font to both labels
        self.label_one.setFont(font)
        self.label_two.setFont(font)

        # Call the base class resizeEvent
        super().resizeEvent(event)

    def create_widgets(self):
        logo_path = os.environ["RIGGING_TOOL_ROOT"] + "/RiggingTool/Icons/mascot.svg"
        # First Column - Fixed size image
        self.first_column_widget = Color('#003057')  # Background color
        self.first_column_layout = QtWidgets.QVBoxLayout()
        self.first_column_widget.setLayout(self.first_column_layout)
        self.first_column_widget.setFixedWidth(125)  # Fixed width for the first column
        self.first_column_widget.setMaximumHeight(160)
        self.first_column_widget.setSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Maximum)

        self.first_column_image_label = QtWidgets.QLabel()
        self.first_column_image_label.setPixmap(QtGui.QPixmap(logo_path))
        self.first_column_image_label.setAlignment(QtCore.Qt.AlignCenter)
        self.first_column_image_label.setScaledContents(True)
        self.first_column_image_label.setFixedWidth(100)  # Match the column width
        self.first_column_image_label.setFixedHeight(100)

        # Add stretches to center the image vertically
        self.first_column_layout.addStretch()
        self.first_column_layout.addWidget(self.first_column_image_label)
        self.first_column_layout.addStretch()

        # Second Column - Stretching text
        self.second_column_widget = Color('#003057')  # Background color
        self.second_column_layout = QtWidgets.QHBoxLayout()
        self.second_column_layout.setSpacing(0)
        self.second_column_layout.setContentsMargins(0, 0, 0, 0)
        self.second_column_widget.setLayout(self.second_column_layout)
        self.second_column_widget.setMaximumHeight(160)
        self.second_column_widget.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Maximum)

        self.label_one = QtWidgets.QLabel("probably")
        self.label_one.setStyleSheet("color: #f9aa26;font-weight: bold;")
        self.label_two = QtWidgets.QLabel("MONSTERS")
        self.label_two.setStyleSheet("color: #ffffff;font-weight: bold;")

        # Desired starting font size
        self.initial_font_size = 18  # Replace with your desired starting font size

        # Create a QFont object with the desired font size
        initial_font = QtGui.QFont()
        initial_font.setPointSize(self.initial_font_size)

        # Apply the font to the labels
        self.label_one.setFont(initial_font)
        self.label_two.setFont(initial_font)

        self.label_one.setAlignment(QtCore.Qt.AlignRight | QtCore.Qt.AlignVCenter)
        self.label_two.setAlignment(QtCore.Qt.AlignLeft | QtCore.Qt.AlignVCenter)
        self.label_one.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Preferred)
        self.label_two.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Preferred)
        self.second_column_layout.addWidget(self.label_one, stretch=1)
        self.second_column_layout.addWidget(self.label_two, stretch=1)

        # Third Column - Placeholder (customize as needed)
        self.third_column_widget = Color('#003057')  # Background color
        self.third_column_layout = QtWidgets.QVBoxLayout()
        self.third_column_widget.setLayout(self.third_column_layout)
        self.third_column_widget.setMaximumHeight(160)
        self.third_column_widget.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Maximum)

        # Connect resize event for dynamic font sizing
        self.second_column_widget.resizeEvent = self.update_label_font_sizes

        self.tab = QtWidgets.QTabWidget(self, movable=True, tabShape=QtWidgets.QTabWidget.TabShape.Rounded, tabPosition=QtWidgets.QTabWidget.TabPosition.North)
        self.tab.setEnabled(self.sceneUnlocked)
        self.moduleInstallButton_layout = QtWidgets.QVBoxLayout()
        self.templatesInstall_layout = QtWidgets.QVBoxLayout()
        self.lockBtn = QtWidgets.QPushButton("LOCK")
        self.lockBtn.setEnabled(self.sceneUnlocked)
        self.publishBtn = QtWidgets.QPushButton("PUBLISH")
        self.publishBtn.setEnabled(not self.sceneUnlocked and not self.scenePublished)
        self.moduleName_lineedit = QtWidgets.QLineEdit()
        self.moduleName_lineedit.setEnabled(False)
        self.rehookBtn = QtWidgets.QPushButton("Re-Hook")
        self.rehookBtn.setEnabled(False)
        self.snapRootBtn = QtWidgets.QPushButton("Snap Root > Hook")
        self.snapRootBtn.setEnabled(False)
        self.constrainRootBtn = QtWidgets.QPushButton("Constrain Root --> Hook")
        self.constrainRootBtn.setEnabled(False)
        self.groupSelectedBtn = QtWidgets.QPushButton("Group Selected")
        self.groupSelectedBtn.setEnabled(True)
        self.ungroupBtn = QtWidgets.QPushButton("Ungroup")
        self.ungroupBtn.setEnabled(False)
        self.mirrorModuleBtn = QtWidgets.QPushButton("Mirror Module")
        self.mirrorModuleBtn.setEnabled(False)
        self.deleteModuleBtn = QtWidgets.QPushButton("Delete")
        self.deleteModuleBtn.setEnabled(False)
        self.duplicateModuleBtn = QtWidgets.QPushButton("Duplicate")
        self.duplicateModuleBtn.setEnabled(True)
        self.symmetryMoveCheckBox = QtWidgets.QCheckBox("Symmetry Move")
        self.symmetryMoveCheckBox.setEnabled(True)
        self.noModuleLabel = QtWidgets.QLabel("No module selected.")
        self.noModuleLabel.show()
        self.prepareTemplateBtn = QtWidgets.QPushButton("Prepare for Template")
        self.saveCurrentBtn = QtWidgets.QPushButton("Save Current as Template")

    def create_layouts(self):
        for module in utils.findAllModules("Modules/Blueprint"):
            self.createModuleInstallButton(module)

        # Top Layout with Three Columns
        top_layout = QtWidgets.QHBoxLayout()
        top_layout.addWidget(self.first_column_widget)
        top_layout.addWidget(self.second_column_widget)
        top_layout.addWidget(self.third_column_widget)

        # Set stretch factors
        top_layout.setStretch(0, 0)  # First column doesn't stretch
        top_layout.setStretch(1, 2)  # Second column stretches
        top_layout.setStretch(2, 1)  # Third column doesn't stretch
        # Remove padding between columns
        top_layout.setSpacing(0)
        top_layout.setContentsMargins(0, 0, 0, 0)

        # Create a QFrame to hold the top layout
        top_widget = QtWidgets.QFrame()
        top_widget.setLayout(top_layout)

        # Set the frame shape and shadow
        top_widget.setFrameShape(QtWidgets.QFrame.Box)
        top_widget.setFrameShadow(QtWidgets.QFrame.Raised)
        top_widget.setLineWidth(1)  # Border width

        tab_layout = QtWidgets.QVBoxLayout()
        tab_layout.addWidget(self.tab)
        tab_layout.setContentsMargins(0, 0, 0, 0)
        tab_layout.setSpacing(0)

        moduleScroll_container = QtWidgets.QWidget()
        moduleScroll_container.setLayout(self.moduleInstallButton_layout)

        modulesScroll = QtWidgets.QScrollArea()
        modulesScroll.setWidget(moduleScroll_container)
        modulesScroll.setWidgetResizable(True)
        modulesScroll.setFocusPolicy(QtCore.Qt.NoFocus)

        modules_layout = QtWidgets.QVBoxLayout(self)
        modules_layout.addWidget(modulesScroll, stretch=4)
        modules_layout.setContentsMargins(0, 0, 0, 0)
        modules_layout.setSpacing(0)

        self.templatesScroll_container = QtWidgets.QWidget()
        self.templatesScroll_container.setLayout(self.templatesInstall_layout)

        templatesScroll = QtWidgets.QScrollArea()
        templatesScroll.setWidget(self.templatesScroll_container)
        templatesScroll.setWidgetResizable(True)
        templatesScroll.setFocusPolicy(QtCore.Qt.NoFocus)

        templatesBtn_layout = QtWidgets.QVBoxLayout(self)
        templatesBtn_layout.setContentsMargins(25, 25, 25, 50)
        templatesBtn_layout.setSpacing(10)
        templatesBtn_layout.addWidget(self.prepareTemplateBtn)
        templatesBtn_layout.addWidget(utils.create_separator())
        templatesBtn_layout.addWidget(self.saveCurrentBtn)
        templatesBtn_layout.addWidget(utils.create_separator())
        templatesBtn_layout.addStretch()

        templates_layout = QtWidgets.QVBoxLayout(self)
        templates_layout.setContentsMargins(0, 0, 0, 0)
        templates_layout.setSpacing(0)
        templates_layout.addWidget(templatesScroll, stretch=0)
        templates_layout.addLayout(templatesBtn_layout)

        moduleName_widget = QtWidgets.QWidget()
        moduleBtn_layout = QtWidgets.QGridLayout()
        moduleName_layout = QtWidgets.QFormLayout()
        moduleName_layout.addRow("Module Name:", self.moduleName_lineedit)
        moduleName_widget.setLayout(moduleName_layout)
        moduleBtn_layout.addWidget(moduleName_widget, 0, 0, 1, 3)
        moduleBtn_layout.addWidget(self.rehookBtn, 1, 0)
        moduleBtn_layout.addWidget(self.snapRootBtn, 1, 1)
        moduleBtn_layout.addWidget(self.constrainRootBtn, 1, 2)
        moduleBtn_layout.addWidget(self.groupSelectedBtn, 2, 0)
        moduleBtn_layout.addWidget(self.ungroupBtn, 2, 1)
        moduleBtn_layout.addWidget(self.mirrorModuleBtn, 2, 2)
        moduleBtn_layout.addWidget(self.duplicateModuleBtn, 3, 0)
        moduleBtn_layout.addWidget(self.deleteModuleBtn, 3, 1)
        moduleBtn_layout.addWidget(self.symmetryMoveCheckBox, 3, 2)

        self.moduleSpecificGrid_layout = QtWidgets.QGridLayout()
        self.moduleSpecificTopRow_layout = QtWidgets.QVBoxLayout()
        self.moduleSpecificColumn01_layout = QtWidgets.QFormLayout()
        self.moduleSpecificColumn02_layout = QtWidgets.QFormLayout()
        self.moduleSpecificColumn03_layout = QtWidgets.QFormLayout()
        self.moduleSpecificBottomRow_layout = QtWidgets.QVBoxLayout()
        self.moduleSpecificColumn01_layout.addWidget(self.noModuleLabel)
        self.moduleSpecificGrid_layout.addLayout(self.moduleSpecificTopRow_layout, 0, 0, 1, 3)
        self.moduleSpecificGrid_layout.addLayout(self.moduleSpecificColumn01_layout, 1, 0)
        self.moduleSpecificGrid_layout.addLayout(self.moduleSpecificColumn02_layout, 1, 1)
        self.moduleSpecificGrid_layout.addLayout(self.moduleSpecificColumn03_layout, 1, 2)
        self.moduleSpecificGrid_layout.addLayout(self.moduleSpecificBottomRow_layout, 2, 0, 1, 3)

        moduleSpecificCtrls_container = QtWidgets.QWidget()
        moduleSpecificCtrls_container.setLayout(self.moduleSpecificGrid_layout)
        moduleSpecificCtrls_scroll = QtWidgets.QScrollArea()
        moduleSpecificCtrls_scroll.setWidget(moduleSpecificCtrls_container)
        moduleSpecificCtrls_scroll.setWidgetResizable(True)
        moduleSpecificCtrls_scroll.setEnabled(True)
        moduleSpecificCtrls_scroll.setFocusPolicy(QtCore.Qt.NoFocus)

        moduleBtn_container = QtWidgets.QWidget()
        moduleBtn_container.setLayout(moduleBtn_layout)

        button_layout = QtWidgets.QVBoxLayout()
        button_layout.addWidget(utils.create_separator())
        button_layout.addWidget(self.lockBtn)
        button_layout.addWidget(utils.create_separator())
        button_layout.addWidget(self.publishBtn)
        button_layout.addWidget(utils.create_separator())

        modules_layout.addWidget(moduleBtn_container)
        modules_layout.addWidget(moduleSpecificCtrls_scroll, stretch=1)

        modules_page = QtWidgets.QWidget(self)
        modules_page.setLayout(modules_layout)
        templates_page = QtWidgets.QWidget(self)
        templates_page.setLayout(templates_layout)
        self.tab.addTab(modules_page, "Modules")
        self.tab.addTab(templates_page, "Templates")
        self.tab.setStyleSheet("QTabWidget { border: none; }")

        main_layout = QtWidgets.QVBoxLayout(self)
        main_layout.addWidget(top_widget)
        main_layout.addLayout(tab_layout)
        main_layout.addLayout(button_layout)

    def createModuleInstallButton(self, module):
        mod = __import__("RiggingTool.Modules.Blueprint." + module, {}, {}, [module])
        #

        title = mod.TITLE
        description = mod.DESCRIPTION
        icon = mod.ICON

        # Create the individual widgets
        moduleInstall_text = QtWidgets.QTextEdit()
        moduleInstall_text.setPlainText(description)
        moduleInstall_text.setFixedHeight(80)  # Adjust this value for text height
        moduleInstall_label = QtWidgets.QLabel(title)
        moduleInstall_label.setFixedHeight(30)  # Fixed height for alignment
        moduleInstall_btn = QtWidgets.QPushButton("", self)
        moduleInstall_btn.setContentsMargins(0, 0, 0, 0)
        moduleInstall_btn.setFixedHeight(110)  # Fixed height for button
        moduleInstall_btn.setFixedWidth(110)  # Consistent button width
        moduleInstall_btn.clicked.connect(partial(self.installModule, module))
        moduleInstall_btn.setIcon(QtGui.QIcon(icon))
        moduleInstall_btn.setIconSize(QtCore.QSize(110, 110))

        # Layout for the module components
        moduleInstallButton_HorizontalLayout = QtWidgets.QGridLayout()
        moduleInstallButton_HorizontalLayout.addWidget(moduleInstall_btn, 0, 0, QtCore.Qt.AlignCenter)

        moduleInstallButton_VerticalLayout = QtWidgets.QVBoxLayout()
        moduleInstallButton_VerticalLayout.addWidget(moduleInstall_label, QtCore.Qt.AlignTop)
        moduleInstallButton_VerticalLayout.addWidget(moduleInstall_text, QtCore.Qt.AlignBottom)

        moduleInstallButton_HorizontalLayout.addLayout(moduleInstallButton_VerticalLayout, 0, 1)

        # Encapsulate the layout into a QWidget
        module_widget = QtWidgets.QWidget()
        module_widget.setLayout(moduleInstallButton_HorizontalLayout)
        module_widget.setFixedHeight(150)  # Fixed height for the entire module

        # Add the encapsulated module to the main layout
        self.moduleInstallButton_layout.addWidget(module_widget)
        self.moduleInstallButton_layout.addStretch()
        self.moduleInstallButton_layout.addWidget(utils.create_separator())
        self.moduleInstallButton_layout.addStretch()

    ##################
    # Signal Methods #
    ##################
    def create_connections(self):
        self.lockBtn.clicked.connect(self.lock)
        self.publishBtn.clicked.connect(self.publish)
        self.deleteModuleBtn.clicked.connect(self.deleteModule)
        self.moduleName_lineedit.editingFinished.connect(self.renameModule)
        self.rehookBtn.clicked.connect(self.rehookModule_setup)
        self.snapRootBtn.clicked.connect(self.snapRootToHook)
        self.constrainRootBtn.clicked.connect(self.constrainRootToHook)
        self.groupSelectedBtn.clicked.connect(self.groupSelected)
        self.ungroupBtn.clicked.connect(self.ungroupSelected)
        self.mirrorModuleBtn.clicked.connect(self.mirrorSelection)
        self.duplicateModuleBtn.clicked.connect(self.duplicateModule)
        self.symmetryMoveCheckBox.stateChanged.connect(self.setupSymmetryMoveExpressions_CheckBox)
        self.prepareTemplateBtn.clicked.connect(self.prepareForTemplate)
        self.saveCurrentBtn.clicked.connect(self.saveCurrentAsTemplate)

    ################
    # Slot Methods #
    ################
    def installModule(self, module, *args):
        basename = "instance_"

        cmds.namespace(setNamespace=":")
        namespaces = cmds.namespaceInfo(listOnlyNamespaces=True)

        for i in range(len(namespaces)):
            if namespaces[i].find("__") != -1:
                namespaces[i] = namespaces[i].partition("__")[2]


        newSuffix = utils.findHighestTrailingNumber(namespaces, basename) + 1

        userSpecName = basename + str(newSuffix)

        hookObj = self.findHookObjectFromSelection()

        mod = __import__("Blueprint." + module, {}, {}, [module])
        #

        moduleClass = getattr(mod, mod.CLASS_NAME)
        moduleInstance = moduleClass(userSpecName, hookObj)
        moduleInstance.install()

        moduleTransform = mod.CLASS_NAME + "__" + userSpecName + ":module_transform"
        cmds.select(moduleTransform, replace=True)
        cmds.setToolTo("moveSuperContext")

    def isRootTransformInstalled(self):
        cmds.namespace(setNamespace=":")
        namespaces = cmds.namespaceInfo(listOnlyNamespaces=True)

        for namespace in namespaces:
            if namespace.find("RootTransform__") == 0:
                return True

        return False

    def lock(self, *args):
        if not self.isRootTransformInstalled():
            result = QtWidgets.QMessageBox.question(self, "Lock Character", "We have detected that you don't have a root transform (global control) instance. \n\nWould you like to go back and edit your blueprint setup?\n(It is recommended that all rigs have at least one global control module).", QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No)
            if result == QtWidgets.QMessageBox.Yes:
                return

        result = QtWidgets.QMessageBox.question(self, "Lock Blueprints", "The action of locking a character will convert the current blueprint modules to joints.\n\nThis action cannot be undone.\nModifications to blueprint system cannot be made after this point.\n\nDo you want to continue?", QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No)
        if result != QtWidgets.QMessageBox.Yes:
            return

        self.deleteSymmetryMoveExpressions()
        self.symmetryMoveCheckBox.setEnabled(False)

        self.deleteScriptJob()

        moduleInfo = [] # Store (module, userSpecifiedName) pairs

        cmds.namespace(setNamespace=":")
        namespaces = cmds.namespaceInfo(listOnlyNamespaces=True)

        moduleNameInfo = utils.findAllModuleNames("/Modules/Blueprint")
        validModules = moduleNameInfo[0]
        validModuleNames = moduleNameInfo[1]

        for n in namespaces:
            splitString = n.partition("__")

            if splitString[1] != "":
                module = splitString[0]
                userSpecifiedName = splitString[2]

                if module in validModuleNames:
                    index = validModuleNames.index(module)
                    moduleInfo.append([validModules[index], userSpecifiedName])

        if len (moduleInfo) == 0:
            QtWidgets.QMessageBox.critical(self, "Lock Blueprint", "There are no blueprint module instances in the current scene.\n\nAborting lock.")
            return

        moduleInstances = []
        for module in moduleInfo:
            mod = __import__("Blueprint." + module[0], {}, {}, [module[0]])
            #

            moduleClass = getattr(mod, mod.CLASS_NAME)
            moduleInst = moduleClass(module[1], None)

            moduleInfo = moduleInst.lock_phase1()

            moduleInstances.append((moduleInst, moduleInfo))

        for module in moduleInstances:
            module[0].lock_phase2(module[1])

        groupContainer = "Group_container"
        if cmds.objExists(groupContainer):
            cmds.delete(groupContainer)

        for module in moduleInstances:
            hookObject = module[1][4]
            module[0].lock_phase3(hookObject)

        sceneLockedLocator = cmds.spaceLocator(n="Scene_Locked")[0]
        cmds.setAttr(sceneLockedLocator + ".visibility", 0)
        # cmds.lockNode(sceneLockedLocator, lock=True, lockUnpublished=True)

        cmds.select(clear=True)
        self.modifySelected()

        self.tab.setEnabled(False)
        self.lockBtn.setEnabled(False)
        self.publishBtn.setEnabled(True)

    def modifySelected(self, *args):
        # Check if the selection has actually changed
        current_selection = cmds.ls(selection=True)
        if self.last_selected == current_selection:
            print("Selection unchanged; modifySelected not re-triggered.")
            return

        # Update last selected to current
        self.last_selected = current_selection

        # Reset and start the debounce timer
        self.modifySelectedTimer.start(100)  # Delay set to 100ms; adjust as needed

    def executeModifySelected(self):
        print(f"modifySelected called for instance {id(self)} with selection: {self.last_selected}")

        if not self.last_selected or not self.last_selected[0]:
            print("Selection is empty or invalid; skipping execution.")
            self.moduleInstance = None
            self.createModuleSpecificControls()  # Show "No module selected."
            return

        selectedNodes = self.last_selected

        if self.symmetryMoveCheckBox.isChecked():
            # Handle symmetry move dynamically
            if selectedNodes != self.currentSymmetrySelection:
                # Selection has changed; update symmetry move expressions
                print(f"Updating symmetry move for new selection: {selectedNodes}")
                self.deleteSymmetryMoveExpressions()
                self.setupSymmetryMoveExpressions()
                self.currentSymmetrySelection = selectedNodes
            else:
                print("Symmetry move is already set up for the current selection; no changes made.")
        else:
            # If symmetry move is disabled, clean up and reset
            if self.symmetryMoveActive:
                print("Symmetry move disabled; cleaning up expressions.")
                self.deleteSymmetryMoveExpressions()
                self.symmetryMoveActive = False
                self.currentSymmetrySelection = None
            else:
                print("Symmetry move is not active; no changes made.")

        if len(selectedNodes) <= 1:
            self.moduleInstance = None
            selectedModuleNamespace = None
            currentModuleFile = None

            self.ungroupBtn.setEnabled(False)
            self.mirrorModuleBtn.setEnabled(False)

            if len(selectedNodes) == 1:
                lastSelected = selectedNodes[0]

                if lastSelected.startswith("Group__"):
                    self.ungroupBtn.setEnabled(True)
                    self.mirrorModuleBtn.setEnabled(True)
                    self.mirrorModuleBtn.setText("Mirror Group")

                namespaceAndNode = utils.stripLeadingNamespace(lastSelected)
                if namespaceAndNode is not None:
                    namespace = namespaceAndNode[0]

                    moduleNameInfo = utils.findAllModuleNames("/Modules/Blueprint")
                    validModules, validModuleNames = moduleNameInfo

                    for index, moduleName in enumerate(validModuleNames):
                        moduleNameIncSuffix = moduleName + "__"
                        if namespace.startswith(moduleNameIncSuffix):
                            currentModuleFile = validModules[index]
                            selectedModuleNamespace = namespace
                            break

            controlEnable = selectedModuleNamespace is not None
            userSpecifiedName = selectedModuleNamespace.partition("__")[2] if controlEnable else ""
            constrainCommand = self.constrainRootToHook
            constrainLabel = "Constrain Root --> Hook"

            if controlEnable:
                mod = __import__("Blueprint." + currentModuleFile, {}, {}, [currentModuleFile])
                moduleClass = getattr(mod, mod.CLASS_NAME)
                self.moduleInstance = moduleClass(userSpecifiedName, None)

                self.mirrorModuleBtn.setEnabled(True)
                self.mirrorModuleBtn.setText("Mirror Module")

                if self.moduleInstance.isRootConstrained():
                    constrainCommand = self.unconstrainRootFromHook
                    constrainLabel = "Unconstrain Root"

            self.rehookBtn.setEnabled(controlEnable)
            self.snapRootBtn.setEnabled(controlEnable)
            self.constrainRootBtn.setEnabled(controlEnable)
            self.constrainRootBtn.setText(constrainLabel)
            self.constrainRootBtn.clicked.connect(constrainCommand)
            self.deleteModuleBtn.setEnabled(controlEnable)

            self.moduleName_lineedit.setEnabled(controlEnable)
            self.moduleName_lineedit.setText(userSpecifiedName)

            self.createModuleSpecificControls()

    def createModuleSpecificControls(self):
        # List of layouts to clear
        layouts_to_clear = [
            self.moduleSpecificTopRow_layout,
            self.moduleSpecificColumn01_layout,
            self.moduleSpecificColumn02_layout,
            self.moduleSpecificColumn03_layout,
            self.moduleSpecificBottomRow_layout
        ]

        # Clear all layouts except for self.noModuleLabel
        for layout in layouts_to_clear:
            while layout.count():
                item = layout.takeAt(0)
                widget = item.widget()
                if widget and widget != self.noModuleLabel:
                    widget.deleteLater()

        # If a module instance exists, let it populate the layout with custom controls
        if self.moduleInstance is not None:
            # Hide the "No module selected." label since we are adding module-specific controls
            self.noModuleLabel.hide()
            self.moduleInstance.UI(
                self,
                self.moduleSpecificTopRow_layout,
                self.moduleSpecificColumn01_layout,
                self.moduleSpecificColumn02_layout,
                self.moduleSpecificColumn03_layout,
                self.moduleSpecificBottomRow_layout
            )
        else:
            # Show the "No module selected." label
            self.noModuleLabel.show()

    def deleteModule(self, *args):
        if self.symmetryMoveCheckBox.isChecked():
            self.deleteSymmetryMoveExpressions()

        self.moduleInstance.delete()
        cmds.select(clear=True)

        if self.symmetryMoveCheckBox.isChecked():
            self.setupSymmetryMoveExpressions_CheckBox(QtCore.Qt.Checked)

    def renameModule(self, *args):
        newName = self.moduleName_lineedit.text()

        if self.symmetryMoveCheckBox.isChecked():
            self.deleteSymmetryMoveExpressions()

        self.moduleInstance.renameModuleInstance(newName)

        if self.symmetryMoveCheckBox.isChecked():
            self.setupSymmetryMoveExpressions_CheckBox(QtCore.Qt.Checked)

        previousSelection = cmds.ls(selection=True)

        if len(previousSelection) > 0:
            cmds.select(previousSelection, replace=True)
        else:
            cmds.select(clear=True)

    def findHookObjectFromSelection(self, *args):
        selectedObjects = cmds.ls(selection=True, transforms=True)

        numberOfObjects = len(selectedObjects)

        hookObj = None

        if numberOfObjects != 0:
            hookObj = selectedObjects[numberOfObjects - 1]

        return hookObj

    def rehookModule_setup(self, *args):
        selectedNodes = cmds.ls(selection=True, transforms=True)
        if len(selectedNodes) == 2:
            newHook = self.findHookObjectFromSelection()
            self.moduleInstance.rehook(newHook)
        else:
            self.deleteScriptJob()

            currentSelection = cmds.ls(selection=True)

            cmds.headsUpMessage("Please select the joint you wish to rehook to. Clear selection to un-hook.")

            cmds.scriptJob(event=["SelectionChanged", partial(self.rehookModule_callback, currentSelection)], runOnce=True)

    def rehookModule_callback(self, currentSelection):
        newHook = self.findHookObjectFromSelection()

        self.moduleInstance.rehook(newHook)

        if len(currentSelection) > 0:
            cmds.select(currentSelection, replace=True)
        else:
            cmds.select(clear=True)

        self.createScriptJob()

    def snapRootToHook(self, *args):
        self.moduleInstance.snapRootToHook()

    def constrainRootToHook(self, *args):
        self.moduleInstance.constrainRootToHook()
        self.constrainRootBtn.setText("Unconstrain Root")
        self.constrainRootBtn.clicked.connect(self.unconstrainRootToHook)

    def unconstrainRootToHook(self, *args):
        self.moduleInstance.unconstrainRootFromHook()
        self.constrainRootBtn.setText("Constrain Root --> Hook")
        self.constrainRootBtn.clicked.connect(self.constrainRootToHook)

    def groupSelected(self, *args):
        import RiggingTool.Modules.System.groupSelected as groupSelected
        importlib.reload(groupSelected)

        group_window = groupSelected.GroupSelected(parent=self)
        group_window.show_UI()

    def ungroupSelected(self, *args):
        import RiggingTool.Modules.System.groupSelected as groupSelected
        importlib.reload(groupSelected)

        groupSelected.UngroupSelected()

    def mirrorSelection(self, *args):
        import RiggingTool.Modules.System.mirrorModule as mirrorModule
        importlib.reload(mirrorModule)
        mirrorModule.MirrorModule(parent=self)

    def setupSymmetryMoveExpressions_CheckBox(self, state):
        if state == QtCore.Qt.Checked:
            print("Symmetry Move Checked: Setting up initial connections.")
            self.deleteScriptJob()  # Stop any active callbacks to avoid conflicts
            self.setupSymmetryMoveExpressions()
            self.createScriptJob()
            self.symmetryMoveActive = True
        else:
            print("Symmetry Move Unchecked: Cleaning up connections.")
            self.deleteSymmetryMoveExpressions()
            self.symmetryMoveActive = False
            self.currentSymmetrySelection = None

    def setupSymmetryMoveExpressions(self, *args):
        cmds.namespace(setNamespace=":")
        selection = cmds.ls(selection=True, transforms=True)
        expressionContainer = cmds.container(n="symmetryMove_container")

        if len(selection) == 0:
            return

        linkedObjs = []
        for obj in selection:
            if obj in linkedObjs:
                continue

            if obj.find("Group__") == 0:
                if cmds.attributeQuery("mirrorLinks", n=obj, exists=True):
                    mirrorLinks = cmds.getAttr(obj + ".mirrorLinks")
                    groupInfo = mirrorLinks.rpartition("__")
                    mirrorObj = groupInfo[0]
                    axis = groupInfo[2]

                    linkedObjs.append(mirrorObj)

                    self.setupSymmetryMoveForObjects(obj, mirrorObj, axis, translation=True, orientation=True, globalScale=True)
            else:
                objNamespaceInfo = utils.stripLeadingNamespace(obj)
                if objNamespaceInfo != None:
                    if cmds.attributeQuery("mirrorLinks", n=objNamespaceInfo[0] + ":module_grp", exists=True):
                        mirrorLinks = cmds.getAttr(objNamespaceInfo[0] + ":module_grp.mirrorLinks")
                        moduleInfo = mirrorLinks.rpartition("__")
                        module = moduleInfo[0]
                        axis = moduleInfo[2]

                        if objNamespaceInfo[1].find("translation_control") != -1:
                            mirrorObj = module + ":" + objNamespaceInfo[1]
                            linkedObjs.append(mirrorObj)
                            self.setupSymmetryMoveForObjects(obj, mirrorObj, axis, translation=True, orientation=False, globalScale=False)
                        elif objNamespaceInfo[1].find("module_transform") == 0:
                            mirrorObj = module + ":module_transform"
                            linkedObjs.append(mirrorObj)
                            self.setupSymmetryMoveForObjects(obj, mirrorObj, axis, translation=True, orientation=True, globalScale=True)
                        elif objNamespaceInfo[1].find("orientation_control") != -1:
                            mirrorObj = module + ":" + objNamespaceInfo[1]
                            linkedObjs.append(mirrorObj)

                            expressionString = mirrorObj + ".rotateX = " + obj + ".rotateX;\n"
                            expression = cmds.expression(n=mirrorObj + "_symmetryMoveExpression", string=expressionString)
                            utils.addNodeToContainer(expressionContainer, expression)

                        elif objNamespaceInfo[1].find("singleJointOrientation_control") != -1:
                            mirrorObj = module + ":" + objNamespaceInfo[1]
                            linkedObjs.append(mirrorObj)

                            expressionString = mirrorObj + ".rotateX = " + obj + ".rotateX;\n"
                            expressionString += mirrorObj + ".rotateY = " + obj + ".rotateY;\n"
                            expressionString += mirrorObj + ".rotateZ = " + obj + ".rotateZ;\n"

                            expression = cmds.expression(n=mirrorObj + "_symmetryMoveExpression", string=expressionString)
                            utils.addNodeToContainer(expressionContainer, expression)

        cmds.select(selection, replace=True)

    def setupSymmetryMoveForObjects(self, obj, mirrorObj, axis, translation=True, orientation=False, globalScale=False):
        # Create a helper node (this is like your mirror helper)
        duplicateObject = cmds.duplicate(obj, parentOnly=True, inputConnections=True, name=obj + "_mirrorHelper")[0]
        emptyGroup = cmds.group(empty=True, name=obj + "_mirror_scale_grp")
        cmds.parent(duplicateObject, emptyGroup, absolute=True)

        scaleAttribute = ".scale" + axis
        cmds.setAttr(emptyGroup + scaleAttribute, -1)

        # Decompose the worldMatrix of the obj to get its world space translation
        decompMatrix = cmds.createNode('decomposeMatrix', name=obj + "_decompMatrix")
        cmds.connectAttr(obj + ".worldMatrix[0]", decompMatrix + ".inputMatrix")

        if translation:
            cmds.connectAttr(decompMatrix + ".outputTranslate", duplicateObject + ".translate")

        if orientation:
            cmds.connectAttr(decompMatrix + ".outputRotate", duplicateObject + ".rotate")

        if globalScale:
            cmds.connectAttr(obj + ".globalScale", duplicateObject + ".globalScale")

        constraint = None
        if translation and orientation:
            constraint = cmds.parentConstraint(duplicateObject, mirrorObj, maintainOffset=False, n=mirrorObj + "_symmetryMoveConstraint")[0]
        elif translation:
            constraint = cmds.pointConstraint(duplicateObject, mirrorObj, maintainOffset=False, n=mirrorObj + "_symmetryMoveConstraint")[0]
        elif orientation:
            # Check which rotation axes are unlocked on the mirrorObj
            lockedAxes = []
            if cmds.getAttr(mirrorObj + ".rotateX", lock=True):
                lockedAxes.append("x")
            if cmds.getAttr(mirrorObj + ".rotateY", lock=True):
                lockedAxes.append("y")
            if cmds.getAttr(mirrorObj + ".rotateZ", lock=True):
                lockedAxes.append("z")

            # Apply the orientConstraint, skipping any locked axes
            constraint = cmds.orientConstraint(duplicateObject, mirrorObj, maintainOffset=False, skip=lockedAxes, n=mirrorObj + "_symmetryMoveConstraint")[0]

        # Handle global scale mirroring if needed
        if globalScale:
            cmds.connectAttr(duplicateObject + ".globalScale", mirrorObj + ".globalScale")

        # Add nodes to the symmetry container
        utils.addNodeToContainer("symmetryMove_container", [duplicateObject, emptyGroup, decompMatrix, constraint], ihb=True)

    def deleteSymmetryMoveExpressions(self, *args):
        container = "symmetryMove_container"

        # Check if the container exists before trying to access it
        if not cmds.objExists(container):
            print("No symmetry move container found.")
            return

        # List the nodes in the container
        nodes = cmds.container(container, q=True, nodeList=True)

        # If nodes is None, there's nothing to delete
        if not nodes:
            print("No nodes found in symmetry move container.")
            cmds.delete(container)
            return

        # Delete all constraints and the container
        constraint_nodes = cmds.ls(nodes, type=["parentConstraint", "pointConstraint", "orientConstraint"])
        if constraint_nodes:
            cmds.delete(constraint_nodes)

        # Delete the container itself and clean up any remaining nodes
        cmds.delete(container)
        print(f"Deleted symmetry move container: {container}")

    def initialiseTemplatesTab(self):
        for template in utils.findAllMayaFiles("Templates"):
            templateAndPath = os.environ["RIGGING_TOOL_ROOT"] + "/RiggingTool/Templates/" + template + ".ma"
            self.createTemplateInstallButton(templateAndPath)

    def prepareForTemplate(self, *args):
        cmds.select(all=True)
        rootLevelNodes = cmds.ls(selection=True, transforms=True)

        filteredNodes = []
        for node in rootLevelNodes:
            if node.startswith("Group__"):
                filteredNodes.append(node)
            else:
                nodeNamespaceInfo = utils.stripAllNamespaces(node)
                if nodeNamespaceInfo is not None:
                    if nodeNamespaceInfo[1] == "module_transform":
                        filteredNodes.append(node)

        if len(filteredNodes) > 0:
            cmds.select(filteredNodes, replace=True)
            self.groupSelected()

    def saveCurrentAsTemplate(self, *args):
        selected_objects = cmds.ls(selection=True, transforms=True)

        # Ensure something is selected
        if not selected_objects:
            QtWidgets.QMessageBox.critical(self.dialog_instance, "No Selection", "No objects selected. Please select something before attempting to save a template.")
            return

        self.saveTemplate_UI_window = QtWidgets.QDialog(self)
        self.saveTemplate_UI_window.setWindowTitle("Save Current as Template")
        self.saveTemplate_UI_window.setFixedSize(450, 225)
        self.saveTemplate_UI_window.setModal(True)

        # Layouts
        main_layout = QtWidgets.QVBoxLayout(self.saveTemplate_UI_window)
        template_layout = QtWidgets.QFormLayout()
        button_layout = QtWidgets.QHBoxLayout()

        # Widgets
        self.templateName = QtWidgets.QLineEdit()
        self.templateName.setText("01_Template_Name")
        self.templateTitle = QtWidgets.QLineEdit()
        self.templateTitle.setText("Title")
        self.templateDescription = QtWidgets.QLineEdit()
        self.templateDescription.setText("Description")
        self.templateIcon = QtWidgets.QLineEdit()
        self.templateIcon.setText("[programRoot]/Templates/icon.svg")
        self.templateScreenGrab_btn = QtWidgets.QPushButton()
        self.templateScreenGrab_btn.setIcon(QtGui.QIcon(":snapshot.svg"))
        self.templateScreenGrab_btn.setToolTip("Take a screen shot!")
        self.templateScreenGrab_btn.setFixedWidth(40)
        self.templateScreenGrab_btn.setFixedHeight(30)

        separator = utils.create_separator()
        accept_button = QtWidgets.QPushButton("Accept")
        cancel_button = QtWidgets.QPushButton("Cancel")

        # Add widgets to layout
        template_layout.addRow("Template Name :", self.templateName)
        template_layout.addRow("Title :", self.templateTitle)
        template_layout.addRow("Description :", self.templateDescription)

        # Create a widget for the icon row
        icon_row_widget = QtWidgets.QWidget()
        icon_row_layout = QtWidgets.QHBoxLayout(icon_row_widget)
        icon_row_layout.setContentsMargins(0, 0, 0, 0)  # Remove extra spacing
        icon_row_layout.addWidget(self.templateIcon)
        icon_row_layout.addWidget(self.templateScreenGrab_btn)

        # Add the icon row to the form layout
        template_layout.addRow("Icon:", icon_row_widget)

        button_layout.addWidget(accept_button)
        button_layout.addWidget(cancel_button)

        main_layout.addLayout(template_layout)
        main_layout.addWidget(separator)
        main_layout.addLayout(button_layout)

        # Connect button signals
        self.templateScreenGrab_btn.clicked.connect(self.saveCurrentAsTemplate_Icon)
        accept_button.clicked.connect(self.saveCurrentAsTemplate_AcceptWindow)
        cancel_button.clicked.connect(self.saveCurrentAsTemplate_CancelWindow)

        self.saveTemplate_UI_window.show()

    def saveCurrentAsTemplate_Icon(self, *args):
        templateName = self.templateName.text()
        programRoot = os.environ["RIGGING_TOOL_ROOT"] + "/RiggingTool"
        iconFilePath = programRoot + "/Templates/"
        iconFileName = templateName + ".png"

        self.render_with_custom_camera(iconFilePath, iconFileName, templateName)

    def render_with_custom_camera(self, output_folder, image_name, templateName):
        camera_name = "custom_render_camera"
        try:
            # Ensure the output folder exists
            os.makedirs(output_folder, exist_ok=True)

            # Backup the original workspace settings
            original_images_rule = cmds.workspace(fileRuleEntry="images")
            cmds.workspace(fileRule=("images", output_folder))

            # Create and configure the custom camera
            if not cmds.objExists(camera_name):
                camera_name = cmds.camera(name=camera_name)[0]
            cmds.setAttr(f"{camera_name}.translateX", 10)
            cmds.setAttr(f"{camera_name}.translateY", 10)
            cmds.setAttr(f"{camera_name}.translateZ", 10)
            cmds.setAttr(f"{camera_name}.rotateX", -35)
            cmds.setAttr(f"{camera_name}.rotateY", 45)
            cmds.setAttr(f"{camera_name}.rotateZ", 0)
            cmds.setAttr(f"{camera_name}.orthographic", 1)  # Orthographic camera

            # Frame the selected objects
            cmds.viewFit(camera_name, all=False, fitFactor=0.9)

            # Set render settings
            cmds.setAttr("defaultResolution.deviceAspectRatio", 1.0)
            cmds.setAttr("hardwareRenderingGlobals.multiSampleEnable", 1)
            cmds.setAttr("hardwareRenderingGlobals.multiSampleCount", 8)
            cmds.setAttr("hardwareRenderingGlobals.transparencyAlgorithm", 1)
            cmds.setAttr("hardwareRenderingGlobals.transparencyQuality", 1)
            cmds.setAttr("hardwareRenderingGlobals.floatingPointRTEnable", 1)
            cmds.setAttr("defaultRenderGlobals.imageFormat", 32)  # PNG
            cmds.setAttr("defaultRenderGlobals.animation", 0)
            cmds.setAttr("defaultRenderGlobals.imageFilePrefix", templateName, type="string")

            # Perform the render
            cmds.ogsRender(camera=camera_name, currentFrame=True, width=200, height=200)
            print(f"Rendered image saved (initially) at: {os.path.join(output_folder, image_name)}")

            rendered_icon = os.path.join(output_folder, image_name)
            self.templateIcon.setText(self._to_relative_icon_path(rendered_icon))

        except Exception as e:
            QtWidgets.QMessageBox.critical(None, "Render Error", f"An error occurred during rendering:\n{e}")

        finally:
            # Delete the custom camera
            if cmds.objExists(camera_name):
                cmds.delete(camera_name)

            # Restore workspace settings
            cmds.workspace(fileRule=("images", original_images_rule))
            cmds.workspace(saveWorkspace=True)
            print(f"Restored Workspace Images Path: {cmds.workspace(fileRuleEntry='images')}")

    def saveCurrentAsTemplate_CancelWindow(self, *args):
        programRoot = os.environ["RIGGING_TOOL_ROOT"] + "/RiggingTool"
        tmp_folder = programRoot + "/Templates/tmp"

        self._cleanup_tmp_folder(tmp_folder)

        self.saveTemplate_UI_window.close()

    def saveCurrentAsTemplate_AcceptWindow(self, *args):
        templateName = self.templateName.text()
        programRoot = os.environ["RIGGING_TOOL_ROOT"] + "/RiggingTool"
        templateFileName = os.path.join(programRoot, "Templates", f"{templateName}.ma")
        title = self.templateTitle.text()
        description = self.templateDescription.text()
        icon_input = self.templateIcon.text()
        icon_abs = self._resolve_icon_path(icon_input)
        icon_to_store = self._to_relative_icon_path(icon_abs)

        if os.path.exists(templateFileName):
            QtWidgets.QMessageBox.warning(self.saveTemplate_UI_window, "Save Current as Template", "Template already exists with that name. Aborting save.", QtWidgets.QMessageBox.Ok)
            return

        try:
            # Select the appropriate nodes for export
            cmds.select("Group_container", replace=True) if cmds.objExists("Group_container") else cmds.select(clear=True)
            cmds.namespace(setNamespace=":")
            namespaces = cmds.namespaceInfo(listOnlyNamespaces=True)

            for n in namespaces:
                if n.find("__") != -1:
                    cmds.select(f"{n}:module_container", add=True)

            # Export the template
            cmds.file(templateFileName, exportSelected=True, type="mayaAscii")
            cmds.select(clear=True)

            # Move the rendered image from the 'tmp' folder if it exists
            tmp_folder = os.path.join(os.path.dirname(icon_abs), "tmp")
            if os.path.isdir(tmp_folder):
                files = os.listdir(tmp_folder)
                if files:
                    src = os.path.join(tmp_folder, files[0])
                    os.rename(src, icon_abs)
                    print(f"Moved and renamed: {src} -> {icon_abs}")
                self._cleanup_tmp_folder(tmp_folder)

            # Save description file
            templateDescriptionFileName = os.path.join(programRoot, "Templates", f"{templateName}.txt")
            with open(templateDescriptionFileName, "w") as f:
                f.write(f"{title}\n{description}\n{icon_to_store}\n")

            self.createTemplateInstallButton(templateFileName)
        except Exception as e:
            QtWidgets.QMessageBox.critical(None, "Save Error", f"An error occurred while saving the template:\n{e}")
        finally:
            self.saveTemplate_UI_window.close()

    def createTemplateInstallButton(self, templateAndPath):
        templateDescriptionFile = templateAndPath.partition(".ma")[0] + ".txt"

        f = open(templateDescriptionFile, "r")
        title = f.readline()[0:-1]
        description = f.readline()[0:-1]
        icon = f.readline()[0:-1]
        icon = self._resolve_icon_path(icon)

        f.close()

        templatesInstall_text = QtWidgets.QTextEdit()
        templatesInstall_text.setPlainText(description)
        templatesInstall_text.setFixedHeight(80)  # Adjust this value for text height
        templatesInstall_label = QtWidgets.QLabel(title)
        templatesInstall_label.setFixedHeight(30)  # Fixed height for alignment
        templatesInstall_btn = QtWidgets.QPushButton("", self)
        templatesInstall_btn.setContentsMargins(0, 0, 0, 0)
        templatesInstall_btn.setFixedHeight(110)  # Fixed height for button
        templatesInstall_btn.setFixedWidth(110)  # Consistent button width
        templatesInstall_btn.clicked.connect(partial(self.installTemplate, templateAndPath))
        templatesInstall_btn.setIcon(QtGui.QIcon(icon))
        templatesInstall_btn.setIconSize(QtCore.QSize(110, 110))

        templatesInstallButton_HorizontalLayout = QtWidgets.QGridLayout()
        templatesInstallButton_HorizontalLayout.addWidget(templatesInstall_btn, 0, 0, QtCore.Qt.AlignCenter)

        templatesInstallButton_VerticalLayout = QtWidgets.QVBoxLayout()
        templatesInstallButton_VerticalLayout.addWidget(templatesInstall_label, QtCore.Qt.AlignTop)
        templatesInstallButton_VerticalLayout.addWidget(templatesInstall_text, QtCore.Qt.AlignBottom)

        templatesInstallButton_HorizontalLayout.addLayout(templatesInstallButton_VerticalLayout, 0, 1)

        templates_widget = QtWidgets.QWidget()
        templates_widget.setLayout(templatesInstallButton_HorizontalLayout)
        templates_widget.setFixedHeight(150)  # Fixed height for the entire module

        self.templatesInstall_layout.addWidget(templates_widget)
        self.templatesInstall_layout.addWidget(utils.create_separator())

    def installTemplate(self, templateAndPath, *args):
        cmds.file(templateAndPath, i=True, namespace="TEMPLATE_1")

        self.resolveNamespaceClashes("TEMPLATE_1")

        groupContainer = "TEMPLATE_1:Group_container"
        if cmds.objExists(groupContainer):
            self.resolveGroupNameClashes("TEMPLATE_1")

            oldGroupContainer = "Group_container"
            if cmds.objExists(oldGroupContainer):
                nodeList = cmds.container(groupContainer, q=True, nodeList=True)
                utils.addNodeToContainer(oldGroupContainer, nodeList, force=True)

                cmds.delete(groupContainer)
            else:
                cmds.rename(groupContainer, oldGroupContainer)

        cmds.namespace(setNamespace=":")
        cmds.namespace(moveNamespace=("TEMPLATE_1", ":"), force=True)
        cmds.namespace(removeNamespace="TEMPLATE_1")

    def resolveNamespaceClashes(self, tempNamespace):
        returnNames = []

        cmds.namespace(setNamespace=tempNamespace)
        namespaces = cmds.namespaceInfo(listOnlyNamespaces=True)
        cmds.namespace(setNamespace=":")
        existingNamespaces = cmds.namespaceInfo(listOnlyNamespaces=True)

        for i in range(len(namespaces)):
            namespaces[i] = namespaces[i].partition(tempNamespace + ":")[2]

        for name in namespaces:
            newName = str(name)
            oldName = tempNamespace + ":" + name

            if name in existingNamespaces:
                highestSuffix = utils.findHighestTrailingNumber(existingNamespaces, name + "_")
                highestSuffix += 1

                newName = str(name) + "_" + str(highestSuffix)

            returnNames.append([oldName, newName])

        self.resolveNameChangeMirrorLinks(returnNames, tempNamespace)

        self.renameNamespaces(returnNames)

        return returnNames

    def renameNamespaces(self, names):
        for name in names:
            oldName = name[0]
            newName = name[1]

            cmds.namespace(setNamespace=":")
            cmds.namespace(add=newName)
            cmds.namespace(moveNamespace=[oldName, newName])
            cmds.namespace(removeNamespace=oldName)

    def resolveNameChangeMirrorLinks(self, names, tempNamespace):
        moduleNamespaces = False
        firstOldNode = names[0][0]
        if utils.stripLeadingNamespace(firstOldNode)[1].find("Group__") == -1:
            moduleNamespaces = True

        for n in names:
            oldNode = n[0]
            if moduleNamespaces:
                oldNode += ":module_grp"

            if cmds.attributeQuery("mirrorLinks", n=oldNode, exists=True):
                mirrorLink = cmds.getAttr(oldNode + ".mirrorLinks")
                mirrorLinkInfo = mirrorLink.rpartition("__")
                mirrorNode = mirrorLinkInfo[0]
                mirrorAxis = mirrorLinkInfo[2]

                found = False

                container = ""
                if moduleNamespaces:
                    oldNodeNamespace = n[0]
                    container = oldNodeNamespace + ":module_container"
                else:
                    container = tempNamespace + ":Group_container"

                for nm in names:
                    oldLink = nm[0].partition(tempNamespace + ":")[2]
                    if oldLink == mirrorNode:
                        newLink = nm[1]

                        cmds.setAttr(oldNode + ".mirrorLinks", newLink + "__" + mirrorAxis, type="string")

                        found = True
                        break

                if not found:
                    cmds.deleteAttr(oldNode, at="mirrorLinks")

    def resolveGroupNameClashes(self, tempNamespace):
        cmds.namespace(setNamespace=tempNamespace)
        dependencyNodes = cmds.namespaceInfo(listOnlyDependencyNodes=True)

        cmds.namespace(setNamespace=":")

        transforms = cmds.ls(dependencyNodes, transforms=True)

        groups = []
        for node in transforms:
            if node.find(tempNamespace + ":Group__") == 0:
                groups.append(node)

        if len(groups) == 0:
            return groups

        groupNames = []
        for group in groups:
            groupName = group.partition(tempNamespace + ":")[2]
            newGroupName = str(groupName)

            if cmds.objExists(newGroupName):
                existingGroups = cmds.ls("Group__*", transforms=True)

                highestSuffix = utils.findHighestTrailingNumber(existingGroups, groupName + "_")
                highestSuffix += 1

                newGroupName = str(groupName) + "_" + str(highestSuffix)

            groupNames.append([group, newGroupName])

        self.resolveNameChangeMirrorLinks(groupNames, tempNamespace)

        for name in groupNames:
            cmds.rename(name[0], name[1])

        return groupNames

    def duplicateModule(self, *args):
        modules = set([])
        groups = set([])

        selection = cmds.ls(selection=True, transforms=True)

        if len(selection) == 0:
            return

        for node in selection:
            selectionNamespaceInfo = utils.stripLeadingNamespace(node)
            if selectionNamespaceInfo != None:
                if selectionNamespaceInfo[0].find("__") != -1:
                    modules.add(selectionNamespaceInfo[0])
            else:
                if node.find("Group__") == 0:
                    groups.add(node)

        for group in groups:
            moduleInfo = self.duplicateModule_processGroup(group)
            for module in moduleInfo:
                modules.add(module)

        if len(groups) > 0:
            groupSelection = list(groups)
            cmds.select(groupSelection, replace=True, hi=True)

        else:
            cmds.select(clear=True)

        for module in modules:
            cmds.select(module + ":module_container", add=True)

        if len(modules) == 0:
            return

        duplicateFileName = os.environ["RIGGING_TOOL_ROOT"] + "/RiggingTool/__duplicationCache.ma"
        cmds.file(duplicateFileName, exportSelected=True, type="mayaAscii", force=True)

        self.installDuplicate(duplicateFileName, selection)

        cmds.setToolTo("moveSuperContext")

    def installDuplicate(self, duplicatePath, selection, *args):
        cmds.file(duplicatePath, i=True, namespace="TEMPLATE_1")

        moduleNames = self.resolveNamespaceClashes("TEMPLATE_1")

        groupNames = self.resolveGroupNameClashes("TEMPLATE_1")

        groups = []
        for name in groupNames:
            groups.append(name[1])

        if len(groups) > 0:
            sceneGroupContainer = "Group_container"
            utils.addNodeToContainer(sceneGroupContainer, groups, includeShapes=True, force=True)

            for group in groups:
                groupNiceName = group.partition("__")[2]
                cmds.container(sceneGroupContainer, edit=True, publishAndBind=[group + ".translate", groupNiceName + "_t"])
                cmds.container(sceneGroupContainer, edit=True, publishAndBind=[group + ".rotate", groupNiceName + "_r"])
                cmds.container(sceneGroupContainer, edit=True, publishAndBind=[group + ".globalScale", groupNiceName + "_globalScale"])

        cmds.namespace(setNamespace=":")
        cmds.namespace(moveNamespace=("TEMPLATE_1", ":"), force=True)
        cmds.namespace(removeNamespace="TEMPLATE_1")

        newSelection = []
        for node in selection:
            found = False
            for group in groupNames:
                oldName = group[0].partition("TEMPLATE_1:")[2]
                newName = group[1]

                if node == oldName:
                    newSelection.append(newName)
                    found = True
                    break

            if not found:
                nodeNamespaceInfo = utils.stripLeadingNamespace(node)
                if nodeNamespaceInfo != None:
                    nodeNamespace = nodeNamespaceInfo[0]
                    nodeName = nodeNamespaceInfo[1]

                    searchName = "TEMPLATE_1:" + nodeNamespace

                    for module in moduleNames:
                        if module[0] == searchName:
                            newSelection.append(module[1] + ":" + nodeName)

        if len(newSelection) > 0:
            cmds.select(newSelection, replace=True)

    def duplicateModule_processGroup(self, group):
        returnModules = []

        children = cmds.listRelatives(group, children=True, type="transform")

        for c in children:
            selectionNamespaceInfo = utils.stripLeadingNamespace(c)
            if selectionNamespaceInfo != None:
                returnModules.append(selectionNamespaceInfo[0])

            else:
                if c.find("Group__") == 0:
                    returnModules.extend(self.duplicateModule_processGroup(c))

        return returnModules

    def publish(self, *args):
        result = cmds.confirmDialog(messageAlign="center", title="Publish Character",
                                    message="The action of publishing cannot be undone. Are you sure you wish to continue?",
                                    button=["Accept", "Cancel"], defaultButton="Accept", cancelButton="Cancel",
                                    dismissString="Cancel")

        if result != "Accept":
            return

        result = cmds.promptDialog(title="Publish Character",
                                   message="Please specify a character name ([a-z] [A-Z] [0-9] and _ only) :",
                                   button=["Accept", "Cancel"], defaultButton="Accept", cancelButton="Cancel",
                                   dismissString="Cancel")
        if result == "Accept":
            characterName = cmds.promptDialog(q=True, text=True)

            characterFileName = os.environ["RIGGING_TOOL_ROOT"] + "/RiggingTool/Characters/" + characterName + ".ma"

            if os.path.exists(characterFileName):
                cmds.confirmDialog(title="Publish Character",
                                   message="Character already exists with that name. Aborting publish",
                                   button=["Accept"], defaultButton="Accept")
                return

            # cmds.lockNode("Scene_Locked", lock=False, lockUnpublished=False)
            cmds.delete("Scene_Locked")

            cmds.namespace(setNamespace=":")
            namespaces = cmds.namespaceInfo(listOnlyNamespaces=True)

            moduleNameInfo = utils.findAllModuleNames("/Modules/Blueprint")
            validModules = moduleNameInfo[0]
            validModuleNames = moduleNameInfo[1]

            foundModuleInstances = []
            for n in namespaces:
                splitString = n.partition("__")
                if splitString[1] != "":
                    module = splitString[0]
                    if module in validModuleNames:
                        foundModuleInstances.append(n)

            moduleGroups = []
            moduleContainers = []

            for moduleInstance in foundModuleInstances:
                moduleGroups.append(moduleInstance + ":module_grp")
                moduleContainers.append(moduleInstance + ":module_container")

            # for container in moduleContainers:
            #     cmds.lockNode(container, lock=False, lockUnpublished=False)

            characterGroup = cmds.group(empty=True, name="character_grp")
            for group in moduleGroups:
                cmds.parent(group, characterGroup, absolute=True)

            cmds.select(characterGroup, replace=True)
            cmds.addAttr(at="bool", defaultValue=0, keyable=False, longName="moduleMaintenanceVisibility")
            cmds.addAttr(at="bool", defaultValue=1, keyable=True, longName="animationControlVisibility")

            invertModuleMaintenanceVisibility = cmds.shadingNode("reverse", n="reverse_moduleMaintenanceVisibility",
                                                                 asUtility=True)
            cmds.connectAttr(characterGroup + ".moduleMaintenanceVisibility",
                             invertModuleMaintenanceVisibility + ".inputX", force=True)

            moduleVisibilityMultiply = cmds.shadingNode("multiplyDivide", n="moduleVisibilityMultiply", asUtility=True)
            cmds.connectAttr(invertModuleMaintenanceVisibility + ".outputX", moduleVisibilityMultiply + ".input1X")
            cmds.connectAttr(characterGroup + ".animationControlVisibility", moduleVisibilityMultiply + ".input2X")

            characterNodes = list(moduleContainers)
            characterNodes.append(characterGroup)
            characterNodes.append(invertModuleMaintenanceVisibility)
            characterNodes.append(moduleVisibilityMultiply)

            characterContainer = cmds.container(name="character_container")
            utils.addNodeToContainer(characterContainer, characterNodes)

            cmds.container(characterContainer, edit=True,
                           publishAndBind=[characterGroup + ".animationControlVisibility", "animControlVis"])

            for container in moduleContainers:
                moduleNamespace = utils.stripLeadingNamespace(container)[0]
                blueprintJointsGrp = moduleNamespace + ":blueprint_joints_grp"

                cmds.connectAttr(characterGroup + ".moduleMaintenanceVisibility", blueprintJointsGrp + ".visibility")
                cmds.setAttr(blueprintJointsGrp + ".overrideEnabled", 1)

                publishedNames = cmds.container(container, q=True, publishName=True)
                userSpecifiedName = moduleNamespace.partition("__")[2]

                for name in publishedNames:
                    cmds.container(characterContainer, edit=True,
                                   publishAndBind=[container + "." + name, userSpecifiedName + "_" + name])

            characterContainers = list(moduleContainers)
            characterContainers.append(characterContainer)

            cmds.select(all=True)
            topLevelTransforms = cmds.ls(sl=True, transforms=True)
            cmds.select(clear=True)

            topLevelTransforms.remove(characterGroup)

            if len(topLevelTransforms) != 0:
                nonBlueprintGroup = cmds.group(topLevelTransforms, absolute=True, parent=characterGroup,
                                               name="non_blueprint_grp")
                cmds.setAttr(nonBlueprintGroup + ".overrideEnabled", 1)
                cmds.setAttr(nonBlueprintGroup + ".overrideDisplayType", 2)  # Reference display type

                cmds.select(nonBlueprintGroup, replace=True)
                cmds.addAttr(at="bool", defaultValue=1, longName="display", k=True)

                visibilityMultiply = cmds.shadingNode("multiplyDivide", n="non_blueprint_visibilityMultiply",
                                                      asUtility=True)
                cmds.connectAttr(invertModuleMaintenanceVisibility + ".outputX", visibilityMultiply + ".input1X",
                                 force=True)
                cmds.connectAttr(nonBlueprintGroup + ".display", visibilityMultiply + ".input2X", force=True)
                cmds.connectAttr(visibilityMultiply + ".outputX", nonBlueprintGroup + ".visibility", force=True)

                nonBlueprintContainer = cmds.container(addNode=nonBlueprintGroup, ihb=True, includeNetwork=True,
                                                       includeShapes=True, name="non_blueprint_container")
                utils.addNodeToContainer(characterContainer, nonBlueprintContainer)
                characterContainers.append(nonBlueprintContainer)

                publishedName = "displayNonBlueprintNodes"
                cmds.container(nonBlueprintContainer, edit=True,
                               publishAndBind=[nonBlueprintGroup + ".display", publishedName])
                cmds.container(characterContainer, edit=True,
                               publishAndBind=[nonBlueprintContainer + "." + publishedName, publishedName])

            # for container in characterContainers:
            #     cmds.lockNode(container, lock=True, lockUnpublished=True)

            cmds.select(characterContainer)
            cmds.file(characterFileName, exportSelected=True, type="mayaAscii")

            scenePublished = cmds.spaceLocator(n="Scene_Published")[0]
            cmds.setAttr(scenePublished + ".visibility", 0)
            # cmds.lockNode(scenePublished, lock=True, lockUnpublished=True)

            cmds.select(clear=True)

            self.publishBtn.setEnabled(False)

#################
# Create Window #
#################
# Main method for testing? I don't fully understand this.
if __name__ == "__main__":
    try:
        open_dialog.close()
        open_dialog.deleteLater()
    except:
        pass

    open_dialog = Blueprint_UI()
    open_dialog.show()
