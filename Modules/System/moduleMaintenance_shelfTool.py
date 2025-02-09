import maya.cmds as cmds
from PySide2 import QtWidgets
import importlib

scriptJobNum = None

class ModuleMaintenance_shelfTool():
    def __init__(self):
        global scriptJobNum
        
        import System.moduleMaintenance as moduleMaintenance
        importlib.reload(moduleMaintenance)
        
        modMaintenance = moduleMaintenance.ModuleMaintenance(self)

        if scriptJobNum == None:
            modMaintenance.setModuleMaintenanceVisibility(True)

            modMaintenance.objectSelected()

        else:
            modMaintenance.setModuleMaintenanceVisibility(False)

            for widget in QtWidgets.QApplication.allWidgets():
                if widget.objectName() == "modMaintain_UI_window":
                    widget.close()
                    
            if cmds.scriptJob(exists=scriptJobNum):
                cmds.scriptJob(kill=scriptJobNum)
            scriptJobNum = None

    def setScriptJobNum(self, num):
        global scriptJobNum
        scriptJobNum = num

    def getScriptJobNum(self):
        global scriptJobNum
        return scriptJobNum