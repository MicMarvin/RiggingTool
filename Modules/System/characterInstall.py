import os
from pathlib import Path
from PySide2 import QtWidgets, QtCore
import maya.cmds as cmds
from shiboken2 import wrapInstance
import maya.OpenMayaUI as omui
import System.utils as utils
import importlib

importlib.reload(utils)


def maya_main_window():
    main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(int(main_window_ptr), QtWidgets.QWidget)


class InstallCharacter_UI(QtWidgets.QDialog):
    dialog_instance = None  # Class variable to hold the singleton instance

    def __init__(self, parent=None):
        super(InstallCharacter_UI, self).__init__(parent or maya_main_window())

        self.setWindowTitle("Install Character")
        self.setFixedSize(320, 190)

        # Find all characters
        characters = utils.findAllMayaFiles("/Characters")

        if len(characters) == 0:
            QtWidgets.QMessageBox.warning(self, "Character Install",
                                          "No published characters found, aborting character install.")
            return

        # UI Elements
        self.character_list = QtWidgets.QListWidget()
        self.character_list.addItems(characters)
        self.character_list.setCurrentRow(0)

        self.new_character_button = QtWidgets.QPushButton("Create New Character")
        self.new_character_button.clicked.connect(self.installCharacter)

        # Layout
        layout = QtWidgets.QVBoxLayout(self)
        layout.addWidget(self.character_list)
        layout.addWidget(self.new_character_button)

    @classmethod
    def display(cls):
        """Display the dialog instance, ensuring it's a singleton."""
        if not cls.dialog_instance:
            cls.dialog_instance = InstallCharacter_UI()

        if cls.dialog_instance.isHidden():
            cls.dialog_instance.show()
        else:
            cls.dialog_instance.raise_()
            cls.dialog_instance.activateWindow()

    def installCharacter(self, *args):
        """Install the selected character."""
        selected_items = self.character_list.selectedItems()
        if not selected_items:
            QtWidgets.QMessageBox.warning(self, "Error", "No character selected.")
            return

        character_name = selected_items[0].text()

        character_filename = Path(os.environ["RIGGING_TOOL_ROOT"]) / "RiggingTool" / "Characters" / f"{character_name}.ma"
        print(f"THIS IS THE PATH: {character_filename}")
        base_namespace = f"Character__{character_name}_"

        cmds.namespace(setNamespace=":")
        namespaces = cmds.namespaceInfo(listOnlyNamespaces=True)
        highest_suffix = utils.findHighestTrailingNumber(namespaces, base_namespace) + 1

        character_namespace = f"{base_namespace}{highest_suffix}"
        cmds.file(character_filename, i=True, namespace=character_namespace)

        self.accept()  # Close the dialog


#################
# Create Window #
#################
# Main method for testing? I don't fully understand this.
if __name__ == "__main__":
    try:
        dialog_instance.close()
        dialog_instance.deleteLater()
    except:
        pass

    dialog_instance = InstallCharacter_UI()
    dialog_instance.show()
