# RiggingTool

A modular character rigging framework for Autodesk Maya, designed for efficient and flexible rig creation with a focus on reusability and maintainability.

## Overview

RiggingTool is a comprehensive rigging system that provides a modular approach to character rigging in Maya. It offers a structured framework for building rigs with reusable components, making it easy to create, modify, and maintain complex character rigs.

## Features

### Modular Architecture
- **Blueprint System**: Define rig components with joint placement, module hierarchy, and hooks
- **Animation System**: Build animator-facing controls from blueprint data
- **ControlObject System**: Manage transform widgets with display attributes and metadata
- **Custom PySide2 GUI**: Intuitive interface for interacting with rig components

### Core Components
- **Blueprint Modules**: Predefined rig components (finger, legFoot, hingeJoint, etc.)
- **Animation Modules**: Control systems (FK, globalControl, etc.)
- **System Tools**: Utilities for character installation, mirroring, grouping, and more
- **Template System**: Save and load rig templates for consistent workflows

## Project Structure

```
RiggingTool/
├── Characters          # Character files
├── ControlObjects      # Control object templates
│   ├── Animation       # Animation control templates
│   └── Blueprint       # Blueprint control templates
├── Icons               # SVG icons for UI elements
├── Modules/
│   ├── Blueprint       # Blueprint module definitions
│   ├── Animation       # Animation control modules
│   └── System          # System utilities and core tools
└── Templates           # Rig templates
```

## Installation

### Prerequisites
- Autodesk Maya 2022 or higher
- Python 3.7+ (bundled with Maya)

### Setup
1. Clone or download the repository to your desired location
2. Set the `RIGGING_TOOL_ROOT` environment variable to point to your project directory
3. Add the project directory to your Maya `.mod` file:
   ```
   + RiggingTool 1.0 W:/path/to/your/project
   RIGGING_TOOL_ROOT = W:/path/to/your/project
   PYTHONPATH += W:/path/to/your/project
   MAYA_PLUG_IN_PATH += W:/path/to/your/project/RiggingTool/plug-ins
   MAYA_SHELF_PATH += Shelves
   ```

## Usage

### Launching the Tool
The tool can be launched from Maya's script editor or shelf button:
```python
import os
import sys

# Ensure proper path setup
riggingToolRoot = os.environ["RIGGING_TOOL_ROOT"]
if riggingToolRoot not in sys.path:
    sys.path.insert(0, riggingToolRoot)

import RiggingTool.Modules.System.blueprint_UI as blueprint_UI
import importlib
importlib.reload(blueprint_UI)
UI = blueprint_UI.Blueprint_UI()
UI.show()
```

### Workflow
1. **Create Blueprint**: Use the Blueprint UI to define rig components
2. **Install Modules**: Add blueprint modules to your scene
3. **Build Animation Controls**: Create animator-facing controls from blueprint data
4. **Refine**: Adjust controls and settings as needed
5. **Publish**: Save your completed rig as a character file

## Key Modules

### Blueprint Modules
- `finger.py` - Finger rigging component
- `legFoot.py` - Leg and foot rigging component  
- `hingeJoint.py` - Hinge joint component
- `rootTransform.py` - Root transform control
- `singleJointSegment.py` - Single joint segment
- `singleOrientableJoint.py` - Orientable single joint
- `spline.py` - Spline IK component
- `thumb.py` - Thumb rigging component

### Animation Modules
- `fk.py` - Forward kinematics controls
- `globalControl.py` - Global control system

### System Tools
- `blueprint_UI.py` - Main blueprint interface
- `controlObject.py` - Control object management
- `groupSelected.py` - Grouping utilities
- `mirrorModule.py` - Module mirroring
- `utils.py` - Utility functions

## Development

### Code Structure
The tool follows a modular architecture where:
- **Blueprint modules** define structure and joint placement
- **Animation modules** create controls from blueprint data
- **System modules** provide core functionality and utilities
- **UI components** handle user interaction

### Best Practices
- All modules are designed to be reloadable with `importlib.reload()`
- Consistent naming conventions for namespaces and objects
- Modular design allows for easy extension and customization
- Full compatibility with Maya's embedded Python interpreter

## Contributing

Contributions are welcome! Please follow these guidelines:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request with clear descriptions

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please open an issue on the GitHub repository or contact the maintainers.

---
*Built with Python and PySide2 for Autodesk Maya*
