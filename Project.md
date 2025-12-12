# RiggingTool – Project Notes (AI Reference)

## Purpose
- Guidance for AI-assisted changes (new modules, UI tweaks, bug fixes) without breaking existing behavior.

## Tech Stack
- Maya 2022, Python 3.7, PySide2.

## Key Areas
- Entry point: Modules/System/blueprint_UI.py (main launcher).
- High-priority folders: Modules/Animation, Modules/Blueprint.
- Supporting assets: ControlObjects, Icons, Templates, Shelves.

## Coding Expectations
- Follow Maya/game-dev Python norms; prefer small, targeted diffs.
- Avoid renaming variables/files/classes/methods; preserve existing logic where possible.
- Keep modules reloadable (importlib.reload friendly).
- Respect current naming conventions and directory structure.

## Constraints & Risks
- Avoid full rewrites; focus on minimal, safe changes.
- Be cautious when touching Modules/Animation and Modules/Blueprint—high-impact areas.

## Backlog/Focus Areas
- Add new modules.
- UI tweaks/quality-of-life improvements.
- Bug fixes while maintaining behavior.
