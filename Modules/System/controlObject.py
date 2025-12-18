import System.utils as utils
import importlib
importlib.reload(utils)

import maya.cmds as cmds
import os
import json
import re
from pathlib import Path
from functools import partial
from PySide2 import QtWidgets, QtCore, QtGui

# Default control shape used when a module does not specify one explicitly.
DEFAULT_SHAPE_FILE = "cube.shape"

_LOD_SETTINGS_ATTR = "lodSettings"
_DEFAULT_COLOR_RGB = (249.0 / 255.0, 170.0 / 255.0, 38.0 / 255.0)
_MAYA_INDEX_COLOR_RGB = [
    (0.0, 0.0, 0.0),                       #  1: Black
    (64.0 / 255.0, 64.0 / 255.0, 64.0 / 255.0),         #  2: Dark Gray
    (153.0 / 255.0, 153.0 / 255.0, 153.0 / 255.0),      #  3: Gray
    (155.0 / 255.0, 0.0, 40.0 / 255.0),                 #  4: Reddish
    (0.0, 4.0 / 255.0, 96.0 / 255.0),                   #  5: Deep Blue
    (0.0, 0.0, 1.0),                                     #  6: Blue
    (0.0, 70.0 / 255.0, 25.0 / 255.0),                  #  7: Dark Green
    (38.0 / 255.0, 0.0, 67.0 / 255.0),                  #  8: Purple-ish
    (200.0 / 255.0, 0.0, 200.0 / 255.0),                #  9: Magenta
    (138.0 / 255.0, 72.0 / 255.0, 51.0 / 255.0),        # 10: Brown
    (63.0 / 255.0, 35.0 / 255.0, 31.0 / 255.0),         # 11: Dark Brown
    (153.0 / 255.0, 38.0 / 255.0, 0.0),                 # 12: Orange-ish
    (1.0, 0.0, 0.0),                                     # 13: Red
    (0.0, 1.0, 0.0),                                     # 14: Green
    (0.0, 65.0 / 255.0, 153.0 / 255.0),                 # 15: Blue-ish
    (1.0, 1.0, 1.0),                                     # 16: White
    (1.0, 1.0, 0.0),                                     # 17: Yellow
    (100.0 / 255.0, 220.0 / 255.0, 1.0),                # 18: Light Blue
    (67.0 / 255.0, 1.0, 163.0 / 255.0),                 # 19: Aqua
    (1.0, 176.0 / 255.0, 176.0 / 255.0),                # 20: Pink
    (228.0 / 255.0, 172.0 / 255.0, 121.0 / 255.0),      # 21: Tan
    (1.0, 1.0, 99.0 / 255.0),                            # 22: Light Yellow
    (0.0, 153.0 / 255.0, 84.0 / 255.0),                 # 23: Greenish
    (160.0 / 255.0, 105.0 / 255.0, 48.0 / 255.0),       # 24: Brownish
    (158.0 / 255.0, 160.0 / 255.0, 48.0 / 255.0),       # 25: Olive
    (104.0 / 255.0, 160.0 / 255.0, 48.0 / 255.0),       # 26: Olive Green
    (48.0 / 255.0, 160.0 / 255.0, 93.0 / 255.0),        # 27: Teal
    (48.0 / 255.0, 160.0 / 255.0, 160.0 / 255.0),       # 28: Cyan
    (48.0 / 255.0, 103.0 / 255.0, 160.0 / 255.0),       # 29: Blue
    (111.0 / 255.0, 48.0 / 255.0, 160.0 / 255.0),       # 30: Purple
    (160.0 / 255.0, 48.0 / 255.0, 105.0 / 255.0),       # 31: Reddish Purple
    (249.0 / 255.0, 170.0 / 255.0, 38.0 / 255.0),       # 32: Yellowish Orange
]

_LOD_DEFAULTS = {
    "scale": 1.0,
    "colorRGB": _DEFAULT_COLOR_RGB,
    "lineWidth": 1.0,
    "shapeFile": DEFAULT_SHAPE_FILE,
}

_SHAPE_FILE_ATTR = "shapeFile"


def _control_objects_dir():
    """
    Return the base directory for control shapes/icons.
    This mirrors the previous behavior of pulling from RIGGING_TOOL_ROOT.
    """
    return Path(os.environ["RIGGING_TOOL_ROOT"]) / "RiggingTool" / "ControlObjects" / "Animation"


def _apply_shape_overrides(shape_node, attrs):
    """Apply display overrides stored in the .shape file onto the created shape."""
    try:
        if "overrideEnabled" in attrs:
            cmds.setAttr(shape_node + ".overrideEnabled", bool(attrs.get("overrideEnabled")))
        if "overrideRGBColors" in attrs:
            cmds.setAttr(shape_node + ".overrideRGBColors", bool(attrs.get("overrideRGBColors")))
        if "overrideColorRGB" in attrs:
            r, g, b = attrs.get("overrideColorRGB", (0, 0, 0))
            cmds.setAttr(shape_node + ".overrideColorRGB", r, g, b, type="double3")
        if "useOutlinerColor" in attrs:
            cmds.setAttr(shape_node + ".useOutlinerColor", bool(attrs.get("useOutlinerColor")))
        if "outlinerColor" in attrs:
            r, g, b = attrs.get("outlinerColor", (0, 0, 0))
            cmds.setAttr(shape_node + ".outlinerColor", r, g, b, type="double3")
    except Exception as e:
        print(f"[controlObject] Failed to apply display overrides to {shape_node}: {e}")


def _create_shapes_from_file(shape_path, parent_transform):
    """
    Build nurbsCurve shapes from a .shape JSON file and parent them under the given transform.
    Returns the list of created shape nodes.
    """
    with open(shape_path, "r") as handle:
        shape_data = json.load(handle)

    if not isinstance(shape_data, dict) or not shape_data:
        raise RuntimeError(f"[controlObject] Shape file {shape_path} is empty or malformed.")

    created_shapes = []
    for shape_name, attrs in shape_data.items():
        cvs = []
        for cv in attrs.get("cvs", []):
            if len(cv) >= 3:
                cvs.append((cv[0], cv[1], cv[2]))

        degree = int(attrs.get("degree", 1))
        knots = attrs.get("knots", [])
        form = int(attrs.get("form", 1))
        periodic = form == 3  # Maya API form enum: 1=open, 2=closed, 3=periodic

        curve_kwargs = {"d": degree, "p": cvs, "k": knots}
        if periodic:
            curve_kwargs["per"] = True

        try:
            curve_transform = cmds.curve(**curve_kwargs)
        except Exception:
            # Retry without periodic flag if the provided knot vector does not support it.
            curve_kwargs.pop("per", None)
            curve_transform = cmds.curve(**curve_kwargs)

        shape_nodes = cmds.listRelatives(curve_transform, shapes=True, fullPath=True) or []
        if not shape_nodes:
            cmds.delete(curve_transform)
            raise RuntimeError(f"[controlObject] Failed to create shape {shape_name} from {shape_path}")

        shape_node = shape_nodes[0]
        # Parent shape under our control transform and clean up the temporary transform.
        shape_node = cmds.parent(shape_node, parent_transform, relative=True, shape=True)[0]
        try:
            shape_node = cmds.rename(shape_node, shape_name)
        except Exception:
            # Keep the auto-generated name if rename fails.
            pass
        cmds.delete(curve_transform)

        _apply_shape_overrides(shape_node, attrs)
        created_shapes.append(shape_node)

    return created_shapes


def _set_shapefile_attr(control_transform, shape_file_name):
    """Store the source shape filename on the control transform for later discovery."""
    try:
        if not cmds.attributeQuery(_SHAPE_FILE_ATTR, n=control_transform, exists=True):
            cmds.addAttr(control_transform, ln=_SHAPE_FILE_ATTR, dataType="string")
        cmds.setAttr(control_transform + "." + _SHAPE_FILE_ATTR, shape_file_name, type="string")
    except Exception as e:
        print(f"[controlObject] Failed to record shape file on {control_transform}: {e}")


def get_lod_levels(module_grp):
    """
    Discover the set of LOD levels referenced by visibility expressions in this module.
    It parses expressions named '*_visibility_expression' within the same namespace.
    Falls back to [1] if none are found.
    """
    lods = set()
    ns = module_grp.rpartition(":")[0]
    expr_nodes = cmds.ls(f"{ns}:*_visibility_expression", type="expression") or []
    lod_re = re.compile(r"\.lod\s*>=\s*([0-9]+)")
    for expr in expr_nodes:
        try:
            expr_str = cmds.expression(expr, q=True, s=True) or ""
        except Exception:
            continue
        match = lod_re.search(expr_str)
        if match:
            try:
                lods.add(int(match.group(1)))
            except Exception:
                pass
    if not lods:
        lods.add(1)
    return sorted(lods)


def get_lod_settings(module_grp):
    """
    Read per-LOD settings stored on the module_grp as JSON in the 'lodSettings' string attr.
    Returns a dict keyed by string LOD numbers.
    """
    if not cmds.objExists(module_grp):
        return {}
    if not cmds.attributeQuery(_LOD_SETTINGS_ATTR, n=module_grp, exists=True):
        return {}
    try:
        raw = cmds.getAttr(f"{module_grp}.{_LOD_SETTINGS_ATTR}") or "{}"
        data = json.loads(raw)
        if isinstance(data, dict):
            return data
    except Exception:
        pass
    return {}


def save_lod_settings(module_grp, settings):
    """Persist the settings dict back onto the module_grp."""
    if not cmds.objExists(module_grp):
        return
    if not cmds.attributeQuery(_LOD_SETTINGS_ATTR, n=module_grp, exists=True):
        try:
            cmds.addAttr(module_grp, ln=_LOD_SETTINGS_ATTR, dataType="string")
        except Exception as e:
            print(f"[controlObject] Could not add {_LOD_SETTINGS_ATTR} attr to {module_grp}: {e}")
            return
    try:
        cmds.setAttr(f"{module_grp}.{_LOD_SETTINGS_ATTR}", json.dumps(settings), type="string")
    except Exception as e:
        print(f"[controlObject] Failed to save LOD settings on {module_grp}: {e}")


def ensure_lod_settings_entry(module_grp, lod):
    """
    Ensure a settings entry exists for the given LOD, seeding with defaults if missing.
    """
    settings = get_lod_settings(module_grp)
    key = str(int(lod))
    entry = settings.get(key, {})
    # Seed missing fields with defaults.
    for k, v in _LOD_DEFAULTS.items():
        entry.setdefault(k, v)

    # Migrate legacy Maya-index color to RGB color if present.
    if "color" in entry:
        idx = entry.get("color", None)
        if idx is not None:
            try:
                idx = int(idx)
            except Exception:
                idx = None
        if idx is not None and 1 <= idx <= len(_MAYA_INDEX_COLOR_RGB):
            entry["colorRGB"] = list(_MAYA_INDEX_COLOR_RGB[idx - 1])
        else:
            entry["colorRGB"] = list(_DEFAULT_COLOR_RGB)
        entry.pop("color", None)
    else:
        rgb = entry.get("colorRGB", _DEFAULT_COLOR_RGB)
        if isinstance(rgb, tuple):
            entry["colorRGB"] = list(rgb)

    # If shapeFile is still the default, attempt to discover it from an existing control.
    if entry.get("shapeFile", DEFAULT_SHAPE_FILE) == DEFAULT_SHAPE_FILE:
        ns = module_grp.rpartition(":")[0]
        expr_nodes = cmds.ls(f"{ns}:*_visibility_expression", type="expression") or []
        lod_re = re.compile(r"\.lod\s*>=\s*([0-9]+)")
        for expr in expr_nodes:
            try:
                expr_str = cmds.expression(expr, q=True, s=True) or ""
            except Exception:
                continue
            match = lod_re.search(expr_str)
            if not match or int(match.group(1)) != int(lod):
                continue
            control_name = expr.rpartition("_visibility_expression")[0]
            try:
                if cmds.attributeQuery(_SHAPE_FILE_ATTR, n=control_name, exists=True):
                    val = cmds.getAttr(control_name + "." + _SHAPE_FILE_ATTR)
                    if val:
                        entry["shapeFile"] = Path(val).name
                        break
            except Exception:
                continue
    # Strip deprecated rotation preference if present.
    entry.pop("rotation", None)
    settings[key] = entry
    save_lod_settings(module_grp, settings)
    return entry


def apply_lod_preferences(module_namespace, lod, entry):
    """
    Apply stored preferences to controls that belong to the specified LOD.
    This implementation targets appearance-only attributes on nurbsCurve shapes.
    """
    entry = dict(entry)
    entry.pop("rotation", None)  # rotation preferences are deprecated
    if "color" in entry:
        idx = entry.get("color", None)
        if idx is not None:
            try:
                idx = int(idx)
            except Exception:
                idx = None
        if idx is not None and 1 <= idx <= len(_MAYA_INDEX_COLOR_RGB):
            entry["colorRGB"] = list(_MAYA_INDEX_COLOR_RGB[idx - 1])
        else:
            entry["colorRGB"] = list(_DEFAULT_COLOR_RGB)
        entry.pop("color", None)
    else:
        rgb = entry.get("colorRGB", _DEFAULT_COLOR_RGB)
        if isinstance(rgb, tuple):
            entry["colorRGB"] = list(rgb)
    ns = module_namespace
    target_lod = int(lod)
    expr_nodes = cmds.ls(f"{ns}:*_visibility_expression", type="expression") or []
    lod_re = re.compile(r"\.lod\s*>=\s*([0-9]+)")
    for expr in expr_nodes:
        try:
            expr_str = cmds.expression(expr, q=True, s=True) or ""
        except Exception:
            continue
        match = lod_re.search(expr_str)
        if not match or int(match.group(1)) != target_lod:
            continue

        control_name = expr.rpartition("_visibility_expression")[0]
        if not cmds.objExists(control_name):
            continue

        # Refresh settings entry in case caller provided partial data.
        ensure_lod_settings_entry(f"{ns}:module_grp", target_lod)

        shapes = cmds.listRelatives(control_name, shapes=True, fullPath=True) or []

        # If a different shape is specified, rebuild the control shapes.
        shape_file = entry.get("shapeFile")
        if shape_file:
            try:
                # Remove existing non-intermediate nurbsCurve shapes.
                keep_intermediates = []
                for shape in shapes:
                    if cmds.getAttr(shape + ".intermediateObject"):
                        keep_intermediates.append(shape)
                    elif cmds.nodeType(shape) == "nurbsCurve":
                        cmds.delete(shape)
                # Create new shapes under the control transform.
                resolved = shape_file
                if not Path(shape_file).is_absolute():
                    resolved = _control_objects_dir() / shape_file
                _create_shapes_from_file(resolved, control_name)
                _set_shapefile_attr(control_name, Path(shape_file).name)
                # Keep persisted settings in sync with the applied shape.
                module_grp = f"{ns}:module_grp"
                settings = get_lod_settings(module_grp)
                key = str(target_lod)
                settings.setdefault(key, entry)
                settings[key]["shapeFile"] = Path(shape_file).name
                save_lod_settings(module_grp, settings)
            except Exception as e:
                print(f"[controlObject] Failed to apply shape '{shape_file}' to {control_name}: {e}")

        # Apply display tweaks to each nurbsCurve shape (after potential rebuild).
        shapes = cmds.listRelatives(control_name, shapes=True, fullPath=True) or []
        for shape in shapes:
            if cmds.nodeType(shape) != "nurbsCurve":
                continue
            try:
                cmds.setAttr(shape + ".lineWidth", float(entry.get("lineWidth", _LOD_DEFAULTS["lineWidth"])))
            except Exception:
                pass
            try:
                r, g, b = entry.get("colorRGB", _DEFAULT_COLOR_RGB)
                cmds.setAttr(shape + ".overrideEnabled", 1)
                cmds.setAttr(shape + ".overrideRGBColors", 1)
                cmds.setAttr(shape + ".overrideColorRGB", float(r), float(g), float(b), type="double3")
            except Exception:
                pass


class ControlObject:
    def __init__(self, controlObject=None):
        if controlObject != None:
            self.controlObject = controlObject

            self.translation = []
            self.translation.append(not cmds.getAttr(self.controlObject + ".translateX", l=True))
            self.translation.append(not cmds.getAttr(self.controlObject + ".translateY", l=True))
            self.translation.append(not cmds.getAttr(self.controlObject + ".translateZ", l=True))

            self.rotation = []
            self.rotation.append(not cmds.getAttr(self.controlObject + ".rotateX", l=True))
            self.rotation.append(not cmds.getAttr(self.controlObject + ".rotateY", l=True))
            self.rotation.append(not cmds.getAttr(self.controlObject + ".rotateZ", l=True))

            self.globalScale = not cmds.getAttr(self.controlObject + ".scaleY", l=True)

    def _create_control_from_shape(self, shape_path):
        """
        Create a fresh transform named 'control' and attach shapes defined in the .shape file.
        """
        transform = cmds.createNode("transform", name="control")
        _create_shapes_from_file(shape_path, transform)
        _set_shapefile_attr(transform, Path(shape_path).name)
        return transform

    def _load_control_transform(self, controlFile):
        """
        Resolve and load the requested control file.
        Prefers .shape files; falls back to legacy .ma import for compatibility.
        """
        controlPath = Path(controlFile)
        if not controlPath.is_absolute():
            controlPath = _control_objects_dir() / controlPath

        suffix = controlPath.suffix.lower()
        if suffix == ".shape":
            if controlPath.exists():
                return self._create_control_from_shape(controlPath)
            ma_candidate = controlPath.with_suffix(".ma")
            if ma_candidate.exists():
                print(f"[controlObject] Shape file missing ({controlPath.name}); falling back to legacy {ma_candidate.name}")
                cmds.file(str(ma_candidate), i=True)
                return "control"
            raise RuntimeError(f"[controlObject] Control shape not found: {controlPath}")

        if suffix == ".ma":
            shape_candidate = controlPath.with_suffix(".shape")
            if shape_candidate.exists():
                print(f"[controlObject] Requested legacy .ma ({controlPath.name}); using {shape_candidate.name} instead.")
                return self._create_control_from_shape(shape_candidate)
            print(f"[controlObject] Loading legacy control file {controlPath.name}")
            cmds.file(str(controlPath), i=True)
            return "control"

        # If no/unknown extension, prefer .shape when available.
        shape_fallback = controlPath.with_suffix(".shape")
        if shape_fallback.exists():
            return self._create_control_from_shape(shape_fallback)
        ma_fallback = controlPath.with_suffix(".ma")
        if ma_fallback.exists():
            print(f"[controlObject] Loading legacy control file {ma_fallback.name}")
            cmds.file(str(ma_fallback), i=True)
            return "control"

        if controlPath.exists():
            print(f"[controlObject] Loading control from {controlPath}")
            cmds.file(str(controlPath), i=True)
            return "control"

        raise RuntimeError(f"[controlObject] Control file not found: {controlPath}")

    def create(self, name, controlFile, animationModuleInstance, lod=1, translation=True, rotation=True, globalScale=True, spaceSwitching=False):
        if translation == True or translation == False:
            translation = [translation, translation, translation]

        if rotation == True or rotation == False:
            rotation = [rotation, rotation, rotation]

        self.translation = translation
        self.rotation = rotation
        self.globalScale = globalScale

        animationModuleName = animationModuleInstance.moduleNamespace
        blueprintModuleNamespace = animationModuleInstance.blueprintNamespace
        blueprintModuleUserSpecifiedName = utils.stripAllNamespaces(blueprintModuleNamespace)[1].partition("__")[2]

        animationModuleNamespace = blueprintModuleNamespace + ":" + animationModuleName

        controlTransform = self._load_control_transform(controlFile)

        self.controlObject = cmds.rename(controlTransform, animationModuleNamespace + ":" + name)
        self.rootParent = self.controlObject

        # Persist the initial shape choice onto the control and the module's LOD settings for UI discovery.
        shape_file_name = Path(controlFile).name
        _set_shapefile_attr(self.controlObject, shape_file_name)
        module_grp = animationModuleNamespace + ":module_grp"
        settings = get_lod_settings(module_grp)
        key = str(int(lod))
        entry = settings.get(key, {})
        if not entry.get("shapeFile") or entry.get("shapeFile") == DEFAULT_SHAPE_FILE:
            entry["shapeFile"] = shape_file_name
            settings[key] = entry
            save_lod_settings(module_grp, settings)

        self.setupIconScale(animationModuleNamespace)

        cmds.setAttr(self.controlObject + ".overrideEnabled", 1)
        cmds.setAttr(self.controlObject + ".overrideShading", 0)
        cmds.connectAttr(animationModuleNamespace + ":module_grp.overrideColor", self.controlObject + ".overrideColor")

        cmds.container(animationModuleNamespace + ":module_container", edit=True, addNode=self.controlObject, ihb=True, includeNetwork=True)

        # Lock/hide channels that were flagged off so the UI can discover the intended controls.
        def _set_channel(attrSuffix, enabled):
            attr = self.controlObject + attrSuffix
            try:
                cmds.setAttr(attr, lock=not enabled, keyable=enabled, channelBox=enabled)
            except Exception:
                pass

        for axis, enabled in zip(["X", "Y", "Z"], self.translation):
            _set_channel(".translate" + axis, enabled)
        for axis, enabled in zip(["X", "Y", "Z"], self.rotation):
            _set_channel(".rotate" + axis, enabled)

        if globalScale:
            cmds.connectAttr(self.controlObject + ".scaleY", self.controlObject + ".scaleX")
            cmds.connectAttr(self.controlObject + ".scaleY", self.controlObject + ".scaleZ")
            cmds.aliasAttr("globalScale", self.controlObject + ".scaleY")
        else:
            _set_channel(".scaleY", False)

        attributes = []

        if self.translation == [True, True, True]:
            attributes.append([True, ".translate", "T"])
        else:
            attributes.extend([[translation[0], ".translateX", "TX"], [translation[1], ".translateY", "TY"], [translation[2], ".translateZ", "TZ"]])

        if self.rotation == [True, True, True]:
            attributes.append([True, ".rotate", "R"])
        else:
            attributes.extend([[rotation[0], ".rotateX", "RX"], [rotation[1], ".rotateY", "RY"], [rotation[2], ".rotateZ", "RZ"]])

        attributes.append([globalScale, ".globalScale", "scale"])

        for attrInfo in attributes:
            if attrInfo[0]:
                attributeNiceName = name + "_" + attrInfo[2]
                animationModuleInstance.publishNameToModuleContainer(self.controlObject + attrInfo[1], attributeNiceName, publishToOuterContainers=True)

        cmds.select(self.controlObject, replace=True)
        cmds.addAttr(at="bool", defaultValue=1, k=True, ln="display")
        animationModuleInstance.publishNameToModuleContainer(self.controlObject + ".display", "display", publishToOuterContainers=False)

        moduleGrp = animationModuleNamespace + ":module_grp"
        visibilityExpression = self.controlObject + ".visibility =" + self.controlObject + ".display * (" + moduleGrp + ".lod >= " + str(lod) + ");"
        expression = cmds.expression(n=self.controlObject + "_visibility_expression", string=visibilityExpression)
        utils.addNodeToContainer(animationModuleNamespace + ":module_container", expression)

        axisInverse = cmds.spaceLocator(name=self.controlObject + "_axisInverse")[0]
        cmds.parent(axisInverse, self.controlObject, relative=True)
        cmds.setAttr(axisInverse + ".visibility", 0)
        utils.addNodeToContainer(animationModuleNamespace + ":module_container", axisInverse, ihb=True)

        spaceSwitchTarget = cmds.spaceLocator(name=self.controlObject + "_spaceSwitchTarget")[0]
        cmds.parent(spaceSwitchTarget, axisInverse, relative=True)
        cmds.setAttr(spaceSwitchTarget + ".visibility", 0)
        utils.addNodeToContainer(animationModuleNamespace + ":module_container", spaceSwitchTarget, ihb=True)

        if self.rotation == [False, False, False]:
            self.setupMirroring(blueprintModuleNamespace, animationModuleNamespace, axisInverse)

        if spaceSwitching:
            self.setupSpaceSwitching(blueprintModuleNamespace, animationModuleNamespace, animationModuleInstance)

        return (self.controlObject, self.rootParent)

    def setupIconScale(self, animationModuleNamespace):
        clusterNodes = cmds.cluster(self.controlObject, n=self.controlObject + "_icon_scale_cluster", relative=True)
        cmds.container(animationModuleNamespace + ":module_container", edit=True, addNode=clusterNodes, ihb=True, includeNetwork=True)

        clusterHandle = clusterNodes[1]

        cmds.setAttr(clusterHandle + ".scalePivotX", 0)
        cmds.setAttr(clusterHandle + ".scalePivotY", 0)
        cmds.setAttr(clusterHandle + ".scalePivotZ", 0)

        cmds.connectAttr(animationModuleNamespace + ":module_grp.iconScale", clusterHandle + ".scaleX")
        cmds.connectAttr(animationModuleNamespace + ":module_grp.iconScale", clusterHandle + ".scaleY")
        cmds.connectAttr(animationModuleNamespace + ":module_grp.iconScale", clusterHandle + ".scaleZ")

        cmds.parent(clusterHandle, self.controlObject, absolute=True)
        cmds.setAttr(clusterHandle + ".visibility", 0)

    def setupMirroring(self, blueprintModuleNamespace, animationModuleNamespace, axisInverse):
        moduleGrp = blueprintModuleNamespace + ":module_grp"

        if cmds.attributeQuery("mirrorInfo", n=moduleGrp, exists=True):
            enumValue = cmds.getAttr(moduleGrp + ".mirrorInfo")

            if enumValue == 0: # "None"
                return

            mirrorAxis = ""

            if enumValue == 1:
                mirrorAxis = "X"
            elif enumValue == 2:
                mirrorAxis = "Y"
            elif enumValue == 3:
                mirrorAxis = "Z"

            mirrorGrp = cmds.group(empty=True, name=self.controlObject + "_mirror_grp")
            self.rootParent = mirrorGrp

            cmds.parent(self.controlObject, mirrorGrp, absolute=True)

            cmds.setAttr(mirrorGrp + ".scale" + mirrorAxis, -1)
            cmds.setAttr(axisInverse + ".scale" + mirrorAxis, -1)

            utils.addNodeToContainer(animationModuleNamespace + ":module_container", mirrorGrp)

    def setupSpaceSwitching(self, blueprintModuleNamespace, animationModuleNamespace, animationModuleInstance):
        cmds.select(self.controlObject, replace=True)
        cmds.addAttr(at="bool", defaultValue=True, keyable=False, longName="spaceSwitching")
        cmds.addAttr(at="bool", defaultValue=False, keyable=False, longName="switchOrientationOnly")

        spaceSwitcher = cmds.group(empty=True, name=self.controlObject + "_spaceSwitcher")

        if self.translation != [True, True, True]:
            cmds.setAttr(self.controlObject + ".switchOrientationOnly", True)

        cmds.parent(self.rootParent, spaceSwitcher, absolute=True)
        self.rootParent = spaceSwitcher

        utils.addNodeToContainer(animationModuleNamespace + ":module_container", spaceSwitcher)

        self.switchSpace(blueprintModuleNamespace + ":HOOK_IN", "Module Hook")

        controlObjectName = utils.stripAllNamespaces(self.controlObject)[1]
        animationModuleInstance.publishNameToModuleContainer(spaceSwitcher + ".currentSpace", controlObjectName + "_currentSpace", publishToOuterContainers=True)

    def switchSpace(self, targetObject, spaceName, index=-1, maintainOffset=False, setKeyframes=False):
        if cmds.objExists(targetObject + "_spaceSwitchTarget"):
            targetObject = targetObject + "_spaceSwitchTarget"

        setKeyframes = setKeyframes and maintainOffset

        currentPosition = cmds.xform(self.controlObject, q=True, worldSpace=True, translation=True)
        currentOrientation = cmds.xform(self.controlObject, q=True, worldSpace=True, rotation=True)
        currentScale = self.getCurrentScale()

        spaceSwitcher = self.controlObject + "_spaceSwitcher"
        animModuleNamespace = utils.stripAllNamespaces(self.controlObject)[0]

        if index == -1:
            cmds.select(spaceSwitcher)
            enumIndex = 0

            if cmds.attributeQuery("currentSpace", n=spaceSwitcher, exists=True):
                currentEntries = cmds.attributeQuery("currentSpace", n=spaceSwitcher, listEnum=True)[0]
                newEntry = currentEntries + ":" + spaceName
                cmds.addAttr(spaceSwitcher + ".currentSpace", edit=True, enumName=newEntry)

                enumIndex = len(currentEntries.split(":"))

            else:
                cmds.addAttr(at="enum", enumName=spaceName, keyable=True, longName="currentSpace")

            if self.globalScale:
                scaleConstraint = cmds.scaleConstraint(targetObject, spaceSwitcher, n=spaceSwitcher + "_scaleConstraint", maintainOffset=False)[0]

            skipTranslate = "none"
            if cmds.getAttr(self.controlObject + ".switchOrientationOnly"):
                skipTranslate = ["x", "y", "z"]

            parentConstraint = cmds.parentConstraint(targetObject, spaceSwitcher, n=spaceSwitcher + "_parentConstraint", maintainOffset=False, skipTranslate=skipTranslate)[0]
            parentWeightList = cmds.parentConstraint(parentConstraint, q=True, weightAliasList=True)
            parentWeight = parentConstraint + "." + parentWeightList[len(parentWeightList)-1]

            attrs = [(parentWeight, "parent")]
            containedNodes = [parentConstraint]

            if self.globalScale:
                scaleWeightList = cmds.scaleConstraint(scaleConstraint, q=True, weightAliasList=True)
                scaleWeight = scaleConstraint + "." + scaleWeightList[len(scaleWeightList)-1]

                attrs.append((scaleWeight, "scale"))
                containedNodes.append(scaleConstraint)

            for attr in attrs:
                expressionString = attr[0] + " = (" + spaceSwitcher + ".currentSpace == " + str(enumIndex) + ");\n"
                expressionName = spaceSwitcher + "_" + attr[1] + "WeightExpression_" + str(enumIndex)
                containedNodes.append(cmds.expression(name=expressionName, string=expressionString))

            utils.addNodeToContainer(animModuleNamespace + ":module_container", containedNodes)

            index = enumIndex

        transformAttributes = ([self.translation[0], "translateX"], [self.translation[1], "translateY"], [self.translation[2], "translateZ"], [self.rotation[0], "rotateX"], [self.rotation[1], "rotateY"], [self.rotation[2], "rotateZ"], [self.globalScale, "globalScale"])
        currentTime = cmds.currentTime(q=True)
        if setKeyframes:
            for attribute in transformAttributes:
                if attribute[0]:
                    if not cmds.selectKey(self.controlObject, attribute=attribute[1], time=(currentTime-1,)) > 0:
                        value = cmds.getAttr(self.controlObject + "." + attribute[1], time=currentTime-1)
                        cmds.setKeyframe(self.controlObject, attribute=attribute[1], time=currentTime-1, value=value, outTangentType="step")

        cmds.setAttr(spaceSwitcher + ".currentSpace", index)
        cmds.setKeyframe(spaceSwitcher, at="currentSpace", ott="step")

        # Maya versions name the animCurve differently; grab the actual curve driving currentSpace,
        # rename it into this module's namespace for uniqueness, and add that node to our container.
        curve = cmds.listConnections(spaceSwitcher + ".currentSpace", s=True, d=False, type="animCurve") or []
        if curve:
            desired = f"{spaceSwitcher}_currentSpace"
            try:
                curve[0] = cmds.rename(curve[0], desired)
            except Exception:
                desired = curve[0]
            utils.addNodeToContainer(animModuleNamespace + ":module_container", desired)

        if maintainOffset:
            if self.globalScale == True:
                newScale = self.getCurrentScale()
                scaleRatio = newScale/currentScale
                newScaleAttributeValue = cmds.getAttr(self.controlObject + ".scaleY") / scaleRatio
                cmds.setAttr(self.controlObject + ".scaleY", newScaleAttributeValue)

            if self.rotation == [True, True, True]:
                cmds.xform(self.controlObject, worldSpace=True, absolute=True, rotation=currentOrientation)

            if self.translation == [True, True, True]:
                cmds.xform(self.controlObject, worldSpace=True, absolute=True, translation=currentPosition)

        if setKeyframes:
            for attribute in transformAttributes:
                if attribute[0]:
                    cmds.setKeyframe(self.controlObject, attribute=attribute[1])

    def getCurrentScale(self):
        locator = cmds.spaceLocator()[0]
        cmds.scaleConstraint(self.controlObject, locator)
        scale = cmds.getAttr(locator + ".scaleY")
        cmds.delete(locator)
        return scale

    def UI(self, parentLayout, extraContentBuilder=None):
        """
        Build a PySide UI for this control object.
        The UI is built inside a CollapsibleWidget whose header contains a bold label (the control's name)
        and a visibility checkbox. The content area contains three groups for Translate, Rotate, and (if applicable) Scale.
        In each group the X, Y, and Z controls (label + spin box) are arranged horizontally with a spacer between each.
        If extraContentBuilder is provided, it will be called with the content layout so callers can append custom controls inside the collapsible.
        """
        import System.animation_UI
        importlib.reload(System.animation_UI)
        from System.animation_UI import CollapsibleWidget, ClickToScrollDoubleSpinBox, FloatAttrControlWidget

        # Create a custom header widget
        headerWidget = QtWidgets.QWidget()
        headerLayout = QtWidgets.QHBoxLayout(headerWidget)
        headerLayout.setContentsMargins(5, 5, 5, 5)
        niceName = utils.stripAllNamespaces(self.controlObject)[1]
        nameLabel = QtWidgets.QLabel(niceName)
        nameLabel.setStyleSheet("font-weight: bold;")
        headerLayout.addWidget(nameLabel)
        headerLayout.addStretch(1)
        # Create a visibility checkbox.
        visCheckbox = QtWidgets.QCheckBox("Visibility")
        try:
            visVal = cmds.getAttr(self.controlObject + ".display")
        except Exception:
            visVal = True
        visCheckbox.setChecked(bool(visVal))
        visCheckbox.stateChanged.connect(lambda state: cmds.setAttr(self.controlObject + ".display", bool(state)))
        headerLayout.addWidget(visCheckbox)

        # Create the collapsible widget using our custom header.
        # (Assuming CollapsibleWidget is imported from our animation_UI module.)
        collapsible = CollapsibleWidget(headerWidget=headerWidget, settingsKey="ControlObject/" + niceName)
        contentLayout = QtWidgets.QVBoxLayout()
        collapsible.setContentLayout(contentLayout)

        # --- Translate Controls Group (only if any axis is enabled) ---
        self._transControls = {}
        translateAxes = [("X", self.translation[0]), ("Y", self.translation[1]), ("Z", self.translation[2])]
        if any(flag for _, flag in translateAxes):
            transGroup = QtWidgets.QGroupBox("Translate")
            transLayout = QtWidgets.QHBoxLayout(transGroup)
            transLayout.setSpacing(10)
            for axis, enabled in translateAxes:
                if not enabled:
                    continue
                axisLayout = QtWidgets.QHBoxLayout()
                lbl = QtWidgets.QLabel(axis + ":")
                spin = ClickToScrollDoubleSpinBox()
                spin.setRange(-100, 100)
                spin.setDecimals(3)
                try:
                    val = cmds.getAttr(self.controlObject + ".translate" + axis)
                except Exception:
                    val = 0.0
                spin.setValue(val)
                # When changed, update the Maya attribute.
                spin.valueChanged.connect(lambda v, a=axis: cmds.setAttr(self.controlObject + ".translate" + a, v))
                axisLayout.addWidget(lbl)
                axisLayout.addWidget(spin)
                axisLayout.addStretch(1)
                transLayout.addLayout(axisLayout)
                self._transControls[axis] = spin
            contentLayout.addWidget(transGroup)

        # --- Rotate Controls Group (only if any axis is enabled) ---
        self._rotControls = {}
        rotateAxes = [("X", self.rotation[0]), ("Y", self.rotation[1]), ("Z", self.rotation[2])]
        if any(flag for _, flag in rotateAxes):
            rotGroup = QtWidgets.QGroupBox("Rotate")
            rotLayout = QtWidgets.QHBoxLayout(rotGroup)
            rotLayout.setSpacing(10)
            for axis, enabled in rotateAxes:
                if not enabled:
                    continue
                axisLayout = QtWidgets.QHBoxLayout()
                lbl = QtWidgets.QLabel(axis + ":")
                spin = ClickToScrollDoubleSpinBox()
                spin.setRange(-360, 360)
                spin.setDecimals(3)
                try:
                    val = cmds.getAttr(self.controlObject + ".rotate" + axis)
                except Exception:
                    val = 0.0
                spin.setValue(val)
                spin.valueChanged.connect(lambda v, a=axis: cmds.setAttr(self.controlObject + ".rotate" + a, v))
                axisLayout.addWidget(lbl)
                axisLayout.addWidget(spin)
                axisLayout.addStretch(1)
                rotLayout.addLayout(axisLayout)
                self._rotControls[axis] = spin
            contentLayout.addWidget(rotGroup)

        # --- Global Scale Control (if enabled) ---
        if self.globalScale:
            fullAttr = self.controlObject + ".globalScale"
            try:
                val = cmds.getAttr(fullAttr)
            except Exception:
                val = 1.0
            # Create the float control widget with the desired range and conversion factor.
            scaleControl = FloatAttrControlWidget(fullAttr, "Global Scale:", 0.1, 10, val, conversion=1000, callback=lambda v: cmds.setAttr(fullAttr, v))
            contentLayout.addWidget(scaleControl)
            self._scaleControl = scaleControl

        # Allow callers to add additional content inside this collapsible.
        if extraContentBuilder is not None:
            try:
                extraContentBuilder(contentLayout)
            except Exception as e:
                print(f"Error building extra content for control {self.controlObject}: {e}")

        parentLayout.addWidget(collapsible)
        
        # separator
        parentLayout.addWidget(utils.create_separator())

        # Create a QTimer to refresh values periodically so that external changes are reflected.
        self.refreshTimer = QtCore.QTimer(collapsible)
        self.refreshTimer.timeout.connect(self._refreshValues)
        self.refreshTimer.start(100)

    def _refreshValues(self):
        # If the control object no longer exists, just return.
        if not cmds.objExists(self.controlObject):
            return

        # Refresh translation values.
        for axis, spin in self._transControls.items():
            attr = self.controlObject + ".translate" + axis
            if cmds.objExists(attr) and not spin.hasFocus():
                try:
                    val = cmds.getAttr(attr)
                    spin.setValue(val)
                except Exception as e:
                    print("Error refreshing translate" + axis + ":", e)

        # Refresh rotation values.
        for axis, spin in self._rotControls.items():
            attr = self.controlObject + ".rotate" + axis
            if cmds.objExists(attr) and not spin.hasFocus():
                try:
                    val = cmds.getAttr(attr)
                    spin.setValue(val)
                except Exception as e:
                    print("Error refreshing rotate" + axis + ":", e)

        # Refresh global scale (if enabled).
        if self.globalScale and hasattr(self, "_scaleControl") and not self._scaleControl.hasFocus():
            attr = self.controlObject + ".globalScale"
            if cmds.objExists(attr):
                try:
                    val = cmds.getAttr(attr)
                    self._scaleControl.setValue(val)
                except Exception as e:
                    print("Error refreshing global scale:", e)

    def switchSpace_UI(self, targetObject):
        constraint = self.controlObject + "_spaceSwitcher_scaleConstraint"
        if not cmds.objExists(constraint):
            constraint = self.controlObject + "_spaceSwitcher_parentConstraint"
            if not cmds.objExists(constraint):
                print("ERROR: Control object appears to have no space switching capabilities")
                return

        spaceNameText = "[a-z] [A-Z] [0-9] or _ only"
        spaceNameEnable = True

        enumIndex = -1
        index = 0
        done = False

        while not done:
            attribute = constraint + ".target[" + str(index) + "].targetScale"
            if cmds.connectionInfo(attribute, isDestination=True):
                connection = cmds.listConnections(attribute)[0]

                if connection == targetObject + "_spaceSwitchTarget" or connection == targetObject:
                    enumIndex = index

                    enumEntries = cmds.attributeQuery("currentSpace", n=self.controlObject + "_spaceSwitcher", listEnum=True)[0]
                    enumEntriesList = enumEntries.split(":")

                    spaceNameText = enumEntriesList[index]
                    spaceNameEnable = False

                    done = True

            else:
                done = True

            index += 1

        # Build a PySide dialog for space switching.
        dialog = QtWidgets.QDialog(parent=None)
        dialog.setWindowTitle("Switch Space")
        dialog.setModal(True)
        dialog.setFixedSize(320, 180)

        layout = QtWidgets.QVBoxLayout(dialog)
        formLayout = QtWidgets.QFormLayout()

        spaceNameEdit = QtWidgets.QLineEdit()
        spaceNameEdit.setText(spaceNameText)
        spaceNameEdit.setEnabled(spaceNameEnable)
        formLayout.addRow("Space Name:", spaceNameEdit)

        maintainOffsetCheck = QtWidgets.QCheckBox("Maintain Offset?")
        maintainOffsetCheck.setChecked(True)
        formLayout.addRow(maintainOffsetCheck)

        setKeyframesCheck = QtWidgets.QCheckBox("Set Keyframes on Control?")
        setKeyframesCheck.setChecked(True)
        formLayout.addRow(setKeyframesCheck)

        layout.addLayout(formLayout)

        buttonLayout = QtWidgets.QHBoxLayout()
        acceptBtn = QtWidgets.QPushButton("Accept")
        cancelBtn = QtWidgets.QPushButton("Cancel")
        buttonLayout.addStretch(1)
        buttonLayout.addWidget(acceptBtn)
        buttonLayout.addWidget(cancelBtn)
        layout.addLayout(buttonLayout)

        acceptBtn.clicked.connect(lambda: self.acceptWindow(dialog, spaceNameEdit, maintainOffsetCheck, setKeyframesCheck, targetObject, enumIndex))
        cancelBtn.clicked.connect(lambda: self.cancelWindow(dialog))

        dialog.show()

    def acceptWindow(self, dialog, spaceNameEdit, maintainOffsetCheck, setKeyframesCheck, targetObject, enumIndex):
        spaceName = spaceNameEdit.text()
        maintainOffset = maintainOffsetCheck.isChecked()
        setKeyframes = setKeyframesCheck.isChecked()

        dialog.accept()

        self.switchSpace(targetObject, spaceName, index=enumIndex, maintainOffset=maintainOffset, setKeyframes=setKeyframes)

        cmds.select(self.controlObject, replace=True)

    def cancelWindow(self, dialog):
        dialog.reject()
