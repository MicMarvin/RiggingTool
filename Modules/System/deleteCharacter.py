import maya.cmds as cmds
from PySide2 import QtWidgets
import System.utils as utils
import importlib

importlib.reload(utils)

class DeleteCharacter_ShelfTool:
    def __init__(self):
        character = self.findSelectedCharacter()

        if character == None:
            return

        niceName = character.partition("__")[2]
        result = QtWidgets.QMessageBox.question(None, "Delete Character", f'Are you sure you want to delete the character "{niceName}"?\nCharacter deletion cannot be undone.', QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.Cancel, QtWidgets.QMessageBox.Yes)
        
        if result == QtWidgets.QMessageBox.Cancel:
            return

        characterContainer = character + ":character_container"

        cmds.delete(characterContainer)

        cmds.namespace(setNamespace=character)
        blueprintNamespaces = cmds.namespaceInfo(listOnlyNamespaces=True)

        for blueprintNamespace in blueprintNamespaces:
            cmds.namespace(setNamespace=":")
            cmds.namespace(setNamespace=blueprintNamespace)

            moduleNamespaces = cmds.namespaceInfo(listOnlyNamespaces=True)
            cmds.namespace(setNamespace=":")
            if moduleNamespaces != None:
                for moduleNamespace in moduleNamespaces:
                    cmds.namespace(removeNamespace=moduleNamespace)

            cmds.namespace(removeNamespace=blueprintNamespace)

        cmds.namespace(removeNamespace=character)

    def findSelectedCharacter(self):
        selection = cmds.ls(selection=True, transforms=True)
        character = None

        if len(selection) > 0:
            selected = selection[0]

            selectedNamespaceInfo = utils.stripLeadingNamespace(selected)

            if selectedNamespaceInfo != None:
                selectedNamespace = selectedNamespaceInfo[0]
                if selectedNamespace.find("Character__") == 0:
                    character = selectedNamespace

        return character
