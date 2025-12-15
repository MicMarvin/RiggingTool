# RiggingTool

RiggingTool is a modular character rigging framework for Autodesk Maya. It streamlines building and maintaining complex rigs by combining reusable modules, templates, and a PySide2 interface.

## What It Does
- Modular rig building with blueprint and animation layers
- Reusable control objects with metadata for display and selection
- Template saving/loading for consistent rigs across characters
- PySide2 UI for assembling, previewing, and publishing rigs

## Requirements
- Autodesk Maya 2022 or newer
- Python 3.7+ (bundled with Maya)

## Installation
1. Clone or download the repository to a local path.
2. Set `RIGGING_TOOL_ROOT` to that path.
3. Add the project to your Maya `.mod` file:
   ```
   + RiggingTool 1.0 W:/path/to/your/project
   RIGGING_TOOL_ROOT = W:/path/to/your/project
   PYTHONPATH += W:/path/to/your/project
   MAYA_PLUG_IN_PATH += W:/path/to/your/project/RiggingTool/plug-ins
   MAYA_SHELF_PATH += Shelves
   ```

## Launch
Run from Maya's script editor or a shelf button:
```python
import os
import sys

root = os.environ["RIGGING_TOOL_ROOT"]
if root not in sys.path:
    sys.path.insert(0, root)

from RiggingTool.Modules.System import blueprint_UI
import importlib
importlib.reload(blueprint_UI)
UI = blueprint_UI.Blueprint_UI()
UI.show()
```

## Using RiggingTool
- Create a blueprint: lay out modules and joints for the character.
- Install modules: drop predefined components (FK, leg/foot, hinge, etc.) into the blueprint.
- Build animation controls: generate animator-facing controls from the blueprint data.
- Refine and publish: adjust settings, then save as a character file for animation use.

## Contributing
1. Fork the repository and create a feature branch.
2. Keep changes small and Maya-reloadable.
3. Submit a pull request with a clear summary and test notes.

## License
MIT License (see `LICENSE`).

---
Built with Python and PySide2 for Autodesk Maya.
