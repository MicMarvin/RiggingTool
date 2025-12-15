# TASKS

## Update Module LOD Control Preferences
Goal: make control display preferences configurable per Module LOD (not per whole module) and expand the settings available in the Animation UI.

### Requirements
- Scope: Animation UI preferences section at the bottom of the module view.
- Preferences must be stored/applied per LOD level instead of globally per module.
- Supported per-LOD settings: scale, color, line width, rotation (x, y, z), and curve shape selection.
- Show the currently assigned curve shape with a label and thumbnail icon.
- Clicking the shape thumbnail opens a scrollable gallery window showing all available curve shape PNGs with names below each image.
- Gallery interactions: hover highlights an item with a colored border; clicking selects a shape, applies it to the current Module LOD, and closes the window.
- Existing Module LOD behavior (show/hide controls by level) must remain intact.

### Implementation Notes
- Likely touchpoints: `Modules/System/blueprint_UI.py` (Animation UI), any data structures that track Module LOD state, and control display settings.
- Add per-LOD storage for preferences; ensure backward compatibility and sensible defaults for existing rigs.
- Preferences UI should update when switching LOD levels and when the gallery selection changes.
- Applying preferences should respect the active LOD when generating or updating controls.
- Gallery: grid or list layout, scrollable, sized for dozens of square PNGs; hover border color can reuse existing UI palette.

### Acceptance Criteria
- Changing LOD switches the preference UI to that level's values.
- Adjusting scale/color/line width/rotation updates only the active LOD's controls.
- Shape thumbnail reflects the active LOD and opens the gallery on click.
- Selecting a shape in the gallery sets it for the active LOD, updates the thumbnail/label, closes the gallery, and re-applies controls.
- No regression to existing Module LOD visibility behavior.
