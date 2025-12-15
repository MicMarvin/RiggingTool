# AGENTS - RiggingTool

Guidance for AI-assisted changes with minimal risk to existing rigs and workflows.

## Purpose
- Summarize architecture, entry points, and conventions for safe modifications.
- Track high-impact areas and current focus items.

## Stack and Entry Points
- Maya 2022, Python 3.7, PySide2.
- Primary UI: `Modules/System/blueprint_UI.py` (launcher and core dialogs).
- High-impact folders: `Modules/Animation`, `Modules/Blueprint`.
- Supporting assets: `ControlObjects`, `Icons`, `Templates`, `Shelves`.

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

## Workflow
1. Create Blueprint: define rig components via the Blueprint UI.
2. Install Modules: add blueprint modules to the scene.
3. Build Animation Controls: generate animator-facing controls from blueprint data.
4. Refine: adjust controls and settings as needed.
5. Publish: save the completed rig as a character file.

## Key Modules
- Blueprint Modules: `finger.py`, `legFoot.py`, `hingeJoint.py`, `rootTransform.py`, `singleJointSegment.py`, `singleOrientableJoint.py`, `spline.py`, `thumb.py`.
- Animation Modules: `fk.py`, `globalControl.py`.
- System Tools: `blueprint_UI.py`, `controlObject.py`, `groupSelected.py`, `mirrorModule.py`, `utils.py`.

## Development Notes
- Modular architecture:
  - Blueprint modules define structure and joint placement.
  - Animation modules create controls from blueprint data.
  - System modules provide core functionality and utilities.
  - UI components handle user interaction.
- Best practices:
  - Keep modules reloadable (`importlib.reload` friendly).
  - Preserve naming conventions, namespaces, and directory layout.
  - Avoid renaming files/classes/methods unless required.
  - Prefer small, targeted diffs; avoid full rewrites.
- Risks:
  - Changes in `Modules/Animation` and `Modules/Blueprint` can break rigs; tread carefully.
  - Maintain compatibility with Maya's embedded Python interpreter.

## Backlog / Focus Areas
- Add or extend modules.
- UI tweaks and quality-of-life improvements.
- Bug fixes while preserving current behavior.
