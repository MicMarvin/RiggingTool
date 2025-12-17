# **TASKS.md — Feature Spec Template for AI Agents**

Use this file only when adding a **new feature**.
For bug fixing, use focused prompts in the Agent panel instead.

Keep sections short, concrete, and testable.
Codex reads all sections, so avoid repetition.

---

## **1. Feature Summary**

A short statement of *what* the feature is and *why* it’s needed.

**Example:**
“Add a control-shape thumbnail picker so animators can swap curve shapes without altering Module LOD visibility behavior.”

---

## **2. Goals and Non-Goals**

Specify exactly what is in-scope and what is intentionally out-of-scope.

**Goals:**

* What the feature *will* accomplish.
* Key user interactions or behaviors.

**Non-Goals:**

* Intentional exclusions to prevent scope creep.
* Behaviors Codex should not change.

**Example:**

* **In-scope:** Thumbnail picker UI, loading `.shape` files, updating per-LOD control appearance.
* **Out-of-scope:** Any changes to Module LOD visibility or naming conventions.

---

## **3. Touchpoints and Constraints**

List the specific files, modules, and systems Codex is allowed to modify, and which must remain stable.

**Touchpoints:**

* Primary Python files
* UI components
* Helper utilities
* Data structures

**Constraints:**

* Follow naming conventions
* Use PySide2 for UI
* Maintain reloadability
* Preserve API stability and Maya version compatibility

**Example:**

* Modify: `Modules/System/animation_UI.py`, `Modules/System/controlObject.py`
* Preserve: Module LOD visibility logic, animation modules’ public interfaces

---

## **4. Required Behavior (Core Logic)**

The core behaviors the system *must* perform.
Use bullet points. Include fallbacks and error handling.

**Example:**

* Selecting a thumbnail updates only the active LOD’s shape.
* Missing `.shape` file falls back to original control file and logs a warning.
* UI changes should reapply immediately to visible controls.

---

## **5. UI / UX Requirements (If Applicable)**

Define the layout, widgets, labels, and interactions.

**Example:**
Controls panel layout:

1. **Control Level** dropdown
2. **Shape Thumbnail + Name** (clickable → opens gallery)
3. Scale
4. Color
5. Line Width
6. Rotation X / Y / Z

Gallery behavior:

* Scrollable grid
* Hover border highlight
* Clicking selects shape & closes gallery

---

## **6. Data Structures & Compatibility**

Describe new data formats and defaults.
Explain how to handle missing or old data.
Clarify backward compatibility.

**Example:**

```python
lodSettings[lod] = {
    "scale": float,
    "color": (r, g, b),
    "lineWidth": float,
    "rotation": (rx, ry, rz),
    "shapeFile": "cube.shape"
}
```

Backward compatibility:

* Missing LODs auto-populated from module-wide defaults.
* Existing rigs remain unaffected.

---

## **7. Verification Plan**

Describe how to test and confirm the feature works.

**Example:**

* Switching Module LOD 0 → 3 leaves visibility unchanged.
* Changing shape for LOD 2 affects only LOD 2 controls.
* UI fields correctly reflect the selected LOD.
* Fallback to `.ma` is triggered when no `.shape` exists.

---

## **8. Guardrails (Do Not Change)**

Explicit rules Codex must not violate.

**Example:**

* Do not modify Module LOD visibility behavior.
* Do not rename modules or folders.
* Do not alter Maya module loading paths.
* Do not change unrelated Blueprint UI components.

---

## **9. Open Questions / Pending Decisions**

Optional section for unresolved decisions or future refinements.
Codex should not implement these automatically.

**Example:**

* Should shape thumbnails be cached?
* Should per-LOD settings be saved to character JSON on export?

---

# **End of Template**