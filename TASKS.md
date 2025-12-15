# Refined Specification for Codex Agent Development (January 2025)

---

## Task Group: Control System Overhaul (Module LOD-Based Controls)

### Goal

Migrate the rig control system to a new shape-based architecture and allow animators to configure **per-LOD control display preferences** inside the Animation UI. This includes replacing `.ma` control objects with `.shape` files, adding thumbnails, and expanding what can be customized per-LOD.

The feature **must preserve all current Module LOD visibility behavior** while enabling finer control over how rig controls appear and behave.

---

## 0. Terminology (Do Not Change Behavior)

- **Module LOD (Visibility Control):**  
  Existing UI control labeled `Module LOD:` in `animation_UI.py`.  
  Its behavior must remain exactly as it is today:  
  - 0: show no controls  
  - 1: show only level 1 controls  
  - 2: show levels 2 and 1  
  - 3: show levels 3, 2, and 1  
  - and so on, for however many levels exist for that module.  
  This is a **visibility control only** and must not be repurposed for editing preferences.

- **Control Level (New Setting Target Selector):**  
  New dropdown in the **Preferences -> Controls** section.  
  It determines **which LOD level's settings are being edited**, independent of what is currently visible via `Module LOD:`.  
  It should be populated dynamically with the actual LOD levels used by the selected animation module (e.g., 1, 2, 3, ...).

---

## 1. Replace `.ma` Control Files With `.shape` + `.png` Thumbnails

### Requirements

Source directory to replace:
- `ControlObjects/Animation/*.ma`

New system uses:
- `ControlObjects/Animation/*.shape`
- `ControlObjects/Animation/*.png`

Rules:
- PNG filenames must match the shape filename (e.g., `cube.shape` + `cube.png`).
- `.shape` files store the NURBS curve data (JSON format).
- Thumbnails are square images (e.g., 256x256) showing a preview of the control.

### Implementation

- Add or extend loader logic in `Modules/System/controlObject.py`:
  - Replace or supersede `cmds.file(controlFile, i=True, ...)` behavior with `.shape` loading.
  - Create a NURBS curve using the `.shape` data:
    - Use `degree`, `knots`, `cvs`, `form`, and any display override fields.
  - Parent resulting shapes under the correct control transform.

- Maintain compatibility:
  - If a `.ma` file is requested, log a warning and attempt fallback to a `.shape` file with a matching base name if it exists.
  - Do **not** delete or remove existing `.ma` loading yet; only extend the loader to prefer `.shape`.

### Acceptance Criteria

- Animation modules (e.g., `fk.py`, `legIKReverseFoot.py`) continue to work but now pull `.shape`-based controls transparently.
- Controls load at least as fast as before and visually match previous `.ma`-based designs.
- Thumbnails exist and are correctly named for each `.shape`.

---

## 2. Add Per-LOD Control Preferences

### Current Behavior

- The UI has a `Module LOD` slider (in `Modules/System/animation_UI.py`).
  - LOD currently controls **visibility only**, as described in section 0.
- The `Preferences` section contains a group labeled **Icons**.
  - Scale + color are applied **to all controls in the module**, not per-LOD.

### New Behavior

- Rename the `Icons` group to **Controls**.
- Add a **new dropdown** inside the Controls group:
  - Label: `Control Level`
  - Type: `QComboBox` (or similar)
  - Values: the set of LOD levels currently used by the selected module (e.g., `1, 2, 3, ...`).
  - Behavior:
    - Selecting a value chooses which LOD level's settings are being viewed/edited.
    - This is independent from the `Module LOD` visibility slider.

- Preferences are now stored **per-LOD level**, keyed by the LOD integer.

Supported **per-LOD** settings:

- `scale`
- `color` (RGB or Maya color index, consistent with current system)
- `lineWidth`
- `rotation` (x, y, z)
- `shapeFile` (the selected `.shape` file name)

### Implementation Notes

- Internal data structure (example):
  ```python
  moduleInstance.lodSettings[lod] = {
      "scale": float,
      "color": (r, g, b) or index,
      "lineWidth": float,
      "rotation": (rx, ry, rz),
      "shapeFile": "cube.shape"
  }
  ```
- **Initialization for existing rigs:**  
  On first use, if `lodSettings` is missing or incomplete, populate each existing LOD with the previous module-wide defaults (scale, color, etc.), and a sensible default shape.

- **When Module LOD slider changes (visibility control):**  
  Do not change which LOD is being edited.  
  Only update which controls are visible in the viewport, exactly as the current behavior.

- **When Control Level dropdown changes:**  
  Update the UI fields in the Controls group to show that LOD level's stored values.  
  Update the preview thumbnail and label for the current shape.

- **When a UI control (scale, color, etc.) is modified:**  
  Only update the settings for the currently selected Control Level.  
  Trigger re-application of control appearance for that LOD (and any visible LODs affected as needed).

### Acceptance Criteria

- Changing Module LOD continues to affect only visibility, with the same 0/1/2/3 behavior as before.
- Changing Control Level only switches which LOD's preferences are edited, without changing visibility by itself.
- Editing scale/color/line width/rotation/shape updates only the active Control Level's settings.
- Control shapes regenerate correctly using the new per-LOD data.

---

## 3. Add Shape Picker UI (Thumbnail + Selection Window)

### Requirements

In the Controls group, show:

- Current shape label (e.g., `cube.shape` or user-friendly name).
- Current shape thumbnail (from `ControlObjects/Animation/<shape>.png`).
- Thumbnail acts as a clickable button.

Clicking the thumbnail opens a new scrollable shape gallery window.

**Shape gallery behavior:**

- Scans `ControlObjects/Animation/` for `.png` (with matching `.shape` files).
- Displays all thumbnails in a grid layout.
- Shows the shape name below each thumbnail.
- Hovering over an item highlights it with a colored border.
- Clicking an item:
  - Assigns that shape to the currently selected Control Level.
  - Closes the gallery window.
  - Updates the thumbnail and label in the Controls group.
  - Triggers re-creation or re-shaping of module controls for that LOD.

### Implementation Notes

- New PySide2 dialog class (suggested):  
  `ShapeGalleryWindow(QtWidgets.QDialog)`  
  Contains a scrollable area and a grid of clickable thumbnail widgets.

- New thumbnail widget in Controls section:  
  e.g., `ShapeThumbnailButton(QtWidgets.QPushButton)` or subclass.

- Helper utility:  
  Enumerate `.shape` + `.png` pairs from `ControlObjects/Animation/`.  
  Return list of `{name, shapePath, thumbPath}`.

### Acceptance Criteria

- Thumbnail in Controls group updates immediately when a new shape is chosen.
- Gallery can comfortably display dozens of shapes and remains responsive.
- Hover highlight and click-to-select behaviors work as described.
- Assigned shape visually takes effect on the active Control Level's controls in Maya.

---

## 4. Modify `controlObjectInstance.create()`

### Requirements

**Current behavior:**  
Signature receives `controlFile` and `lod`.

**New behavior:**  
If `moduleInstance.lodSettings[lod]["shapeFile"]` is defined:

- Use that shape instead of the `controlFile` parameter when creating controls.
- Convert `shapeFile` to full `.shape` path under `ControlObjects/Animation/`.
- Apply these attributes using the active Control Level's settings (which correspond to the same `lod`):
  - `scale`
  - `color`
  - `lineWidth`
  - `rotation` (x, y, z)

### Acceptance Criteria

- Animation modules do not need API changes; they still call `create(controlFile, lod)`.
- Passing `lod = N` yields controls fully styled according to `lodSettings[N]`.
- If no per-LOD shape exists, falls back to original `controlFile` behavior.

---

## 5. UI Renaming + Layout Cleanup

### Requirements

- Rename the Icons group to **Controls** in `animation_UI.py`.
- Inside the Controls group, final layout order should be:
  1. Control Level (dropdown listing available LODs: 1, 2, 3, ...)
  2. Shape Thumbnail + Shape Name
  3. Scale (float)
  4. Color (RGB or Maya index, consistent with existing system)
  5. Line Width
  6. Rotation (X, Y, Z)

Values must be synchronized on:

- Module selection change
- Control Level dropdown change
- Shape gallery selection

(Visibility changes via Module LOD should not change Control Level, but UI should remain consistent.)

### Acceptance Criteria

- UI updates feel instant and logically consistent.
- Renaming the group and adding the Control Level dropdown does not break any existing callbacks or module selection logic.
- Module LOD slider and Control Level dropdown are clearly separate and behave independently as described.

---

## 6. Backward Compatibility

### Requirements

- Existing rigs with only module-wide preferences still work without manual migration.
- If `lodSettings` is missing or incomplete:
  - Auto-populate per-LOD settings from previous module-wide defaults.
- No animation module code (`fk.py`, `legIKReverseFoot.py`, etc.) should break or require manual changes, unless explicitly listed in this document.

---

## 7. Files Likely Modified

**Primary**

- `Modules/System/animation_UI.py`
- `Modules/System/controlObject.py`

**Secondary**

- `Modules/System/blueprint_UI.py` (only if needed for wiring or state storage)
- `Modules/Animation/*.py` (only if adjustments are truly required to pass in LOD-related data in a more explicit way)
- Any helper responsible for rebuilding/updating controls when preferences change

---

## 8. What Codex Must Not Change

- Public API of Animation module files unless absolutely necessary and explicitly documented.
- Namespace, naming conventions, or file/directory structure except where required by this spec.
- Maya module loading system (.mod environment) or plugin paths.
- Any unrelated parts of Blueprint UI.
- The existing runtime behavior of Module LOD visibility logic, beyond using it as read-only input when necessary.

---

## 9. Completion Criteria

This feature is complete when:

- `.shape` files fully replace `.ma` files as the primary control source, with safe fallback behavior.
- Per-LOD preferences (scale, color, line width, rotation, shape) display correctly in the Controls UI.
- Editing preferences via the Controls section affects only the LOD chosen in the Control Level dropdown.
- Controls in the viewport visually reflect each LOD's configured shape, thickness, scale, rotation, and color.
- The shape gallery window works smoothly and updates the Controls UI and scene as described.
- Module LOD visibility behavior is unchanged (0 = none, 1 = level 1, 2 = 1 + 2, 3 = 1 + 2 + 3, etc.).
- All existing Animation modules continue functioning normally without manual rig migration.
