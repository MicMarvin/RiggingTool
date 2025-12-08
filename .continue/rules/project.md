# RiggingTool — Project Overview (Agent Mode Rules)

This file provides core context so Continue.dev can safely navigate, refactor, and extend the RiggingTool codebase. It describes the architecture, folder layout, coding conventions, and behavioral expectations for Maya-compatible Python development.

---

# 1. Project Purpose

RiggingTool is a modular character-rigging framework for Autodesk Maya written in Python and PySide2.  
It provides:

- A **Blueprint system** for defining rig components  
- An **Animation system** for building animator-facing controls  
- A **ControlObject system** for transform widgets  
- A **custom PySide2 GUI** used for interacting with blueprint and animation modules  

The tool is designed to be modular, reloadable with `importlib.reload()`, and fully inspectable via debugging tools like Continue.dev and debugpy.

---

# 2. High-Level Architecture

RiggingTool consists of four core subsystems:

### ■ Blueprint System
Defines joint placement, module hierarchy, hooks, metadata, and naming conventions.  
Each blueprint module exists in:  
`Modules/blueprint/`

### ■ Animation System
Builds animation controls from blueprint data.  
Each animation module must provide:

- `CLASS_NAME`
- `UI(layout)`
- `UI_preferences(prefLayout)`

Modules reside in:  
`Modules/Animation/`

### ■ ControlObject System
Creates manipulators (FK, IK, spline, hinge, foot controls, etc.).  
Manages:

- Transform/rotate/scale attributes  
- Visibility  
- Color  
- Icon scaling  
- LOD features  

Implemented in:  
`Modules/system/controlObject.py`

### ■ GUI System (Animation UI)
Main PySide2 interface for interacting with animation modules.  
Provides:

- Module list  
- Preferences  
- LOD editor  
- Scroll area with dynamic rebuilding  
- Selection/time scriptJobs  
- Persistent QSettings  

Located in:  
`Modules/system/animation_UI.py`

---

# 3. File & Folder Structure

```
RiggingTool/
├── Characters
│   └── test.ma
├──ControlObjects
│   ├── Animation
│   │   ├── cubeLocator.ma
│   │   ├── flattenedCube.ma
│   │   ├── footControl.ma
│   │   ├── globalControl.ma
│   │   ├── locator.ma
│   │   └── sphere.ma
│   └── Blueprint
│       ├── controlGroup_control.ma
│       ├── hierarchy_representation.ma
│       ├── hook_representation.ma
│       ├── orientation_control.ma
│       ├── preferredAngle_representation.ma
│       ├── singleJointOrientation_control.ma
│       └── translation_control.ma
├── Icons
│       ├── attachParent.svg
│       ├── bone.svg
│       ├── finger.svg
│       ├── hand.svg
│       ├── hinge.svg
│       ├── legFoot.svg
│       └── thumb.svg
├── Modules/
│   ├── Blueprint
│   │   ├── __init__.py
│   │   ├── finger.py
│   │   ├── hingeJoint.py
│   │   ├── legFoot.py
│   │   ├── rootTransform.py
│   │   ├── singleJointSegment.py
│   │   ├── singleOrientableJoint.py
│   │   ├── spline.py
│   │   └── thumb.py
│   └── System
│       ├── __init__.py
│       ├── attachGeoToBlueprint.py
│       ├── blueprint_UI.py
│       ├── blueprint.py
│       ├── characterInstall.py
│       ├── groupSelected.py
│       ├── mirrorModule.py
│       └── utils.py
└── Templates
```

---

# 4. Key Module Responsibilities

### `animation_UI.py`

- Main PySide2 interface  
- Builds module sections dynamically  
- Manages scriptJobs (selection/time)  
- Provides LOD editor and Preferences panel  
- Uses reusable widgets such as:
  - `AttrControlWidget`
  - `FloatAttrControlWidget`
  - `ColorControlWidget`
  - `CollapsibleWidget`

### `controlObject.py`

- Defines the `ControlObject` class  
- Builds control transforms  
- Manages display attributes and metadata  
- Provides UI population functions used in `animation_UI`  

### Blueprint Modules (`Modules/blueprint/`)

- Define module structure, joint layout, and hook placement  
- Provide metadata used by animation modules to build controls  
- Participate in naming and namespace patterns described below  

### Animation Modules (`Modules/Animation/`)

- Create animator-facing controls from blueprint data  
- Define module-specific UI and preferences panels  
- Must expose:
  - `CLASS_NAME`
  - `UI(layout)`
  - `UI_preferences(prefLayout)`

---

# 5. Naming Conventions

Namespaces follow this pattern:

```text
Character__<char> : <BlueprintModule>__<instance> : <AnimationModule>__<instance>
```

Examples of control object names:

- `<jointName>_fkControl`  
- `<jointName>_ikControl`  

Blueprint containers commonly use:

- `<namespace>:module_grp`  
- `<namespace>:joints_grp`  

These conventions must be preserved for correct module loading, mirroring, and maintenance tools.

---

# 6. UI Behavior Conventions

The main Animation UI uses a consistent panel structure:

1. **LOD panel** (top)  
2. **Main scroll area** with module-specific controls  
3. **Preferences panel** (bottom)

Behavior rules:

- UI changes should flow through `animation_UI` rather than bypassing it.  
- Widgets must avoid stale references when modules are reloaded or rebuilt.  
- Updates should be debounced for performance where appropriate.  
- Layout rebuilds must be clean and idempotent to prevent duplicate widgets or scriptJobs.

---

# 7. ScriptJob Rules

`animation_UI` is responsible for creating and managing scriptJobs tied to:

- Maya selection changes  
- Maya time changes  
- Cleanup when the UI is closed  

ScriptJob rules:

- Register each scriptJob only once.  
- Remove scriptJobs reliably on UI teardown.  
- Avoid creating duplicate scriptJobs during refreshes.  
- Respect “pinning” or frozen update states where the UI should stop live-refreshing.

---

# 8. Development Workflow Guidelines (for Continue Agent)

These rules guide how automated edits should be made:

- Preserve the **modular architecture** (Blueprint ↔ Animation ↔ ControlObject ↔ UI).  
- Use **Maya-safe** patterns (`cmds`, non-blocking operations, avoid long-running loops in UI callbacks).  
- Maintain **namespace correctness** and existing naming conventions.  
- Do not create or move files outside the RiggingTool project unless explicitly requested.  
- Prefer generating **diff-based** edits so changes can be reviewed before being applied.  
- Keep compatibility with Maya’s embedded Python interpreter and bundled PySide2.  
- Follow existing class patterns for new modules and UI widgets.  

When modifying UI code:

- Ensure changes remain compatible with `animation_UI` and existing widget classes.  
- Do not introduce Qt dependencies that are not available in Maya’s PySide2 build.  

---

# 9. Debugging & Reload Workflow

Standard workflow used by the developer:

1. Open the RiggingTool project in VS Code with Continue.dev enabled.  
2. Start Maya and load the rigging shelf/tools.  
3. Attach debugpy from Maya so VS Code breakpoints function.  
4. Edit Python files in `Modules/` and related directories.  
5. Reload modified modules in Maya using:

   ```python
   import importlib
   import module_name
   importlib.reload(module_name)
   ```

6. `animation_UI` reads updated animation modules and rebuilds sections as needed.  

Continue should keep edits compatible with this hot-reload style workflow.

---

# 10. Future Expansion (Context for Proposed Changes)

The architecture is intended to support future systems such as:

- Space switching and parent/child space UI  
- Mirroring tools for controls and poses  
- Pose libraries and presets  
- Keying, zeroing, and selection helpers  
- Additional animation module types and control widgets  

When proposing new features, the agent should:

- Fit them into the existing Blueprint/Animation/UI structure.  
- Reuse current widget patterns and naming conventions where possible.  
- Avoid introducing breaking changes to public module APIs (e.g., `UI`, `UI_preferences`, `CLASS_NAME`).  

---

End of `project.md` rules file.
