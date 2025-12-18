"""
Centralized color constants/helpers for RiggingTool.

This module is intentionally lightweight (no Maya imports) so it can be safely
imported by both UI and non-UI code.
"""

from PySide2 import QtGui


DEFAULT_COLOR_RGB = (249.0 / 255.0, 170.0 / 255.0, 38.0 / 255.0)
DEFAULT_COLOR_QCOLOR = QtGui.QColor.fromRgbF(*DEFAULT_COLOR_RGB)


# Maya's legacy "index color" palette as RGB (0-1) for migration and UI convenience.
MAYA_INDEX_COLOR_RGB = [
    (0.0, 0.0, 0.0),                                     #  1: Black
    (64.0 / 255.0, 64.0 / 255.0, 64.0 / 255.0),          #  2: Dark Gray
    (153.0 / 255.0, 153.0 / 255.0, 153.0 / 255.0),       #  3: Gray
    (155.0 / 255.0, 0.0, 40.0 / 255.0),                  #  4: Reddish
    (0.0, 4.0 / 255.0, 96.0 / 255.0),                    #  5: Deep Blue
    (0.0, 0.0, 1.0),                                      #  6: Blue
    (0.0, 70.0 / 255.0, 25.0 / 255.0),                   #  7: Dark Green
    (38.0 / 255.0, 0.0, 67.0 / 255.0),                   #  8: Purple-ish
    (200.0 / 255.0, 0.0, 200.0 / 255.0),                 #  9: Magenta
    (138.0 / 255.0, 72.0 / 255.0, 51.0 / 255.0),         # 10: Brown
    (63.0 / 255.0, 35.0 / 255.0, 31.0 / 255.0),          # 11: Dark Brown
    (153.0 / 255.0, 38.0 / 255.0, 0.0),                  # 12: Orange-ish
    (1.0, 0.0, 0.0),                                      # 13: Red
    (0.0, 1.0, 0.0),                                      # 14: Green
    (0.0, 65.0 / 255.0, 153.0 / 255.0),                  # 15: Blue-ish
    (1.0, 1.0, 1.0),                                      # 16: White
    (1.0, 1.0, 0.0),                                      # 17: Yellow
    (100.0 / 255.0, 220.0 / 255.0, 1.0),                 # 18: Light Blue
    (67.0 / 255.0, 1.0, 163.0 / 255.0),                  # 19: Aqua
    (1.0, 176.0 / 255.0, 176.0 / 255.0),                 # 20: Pink
    (228.0 / 255.0, 172.0 / 255.0, 121.0 / 255.0),       # 21: Tan
    (1.0, 1.0, 99.0 / 255.0),                             # 22: Light Yellow
    (0.0, 153.0 / 255.0, 84.0 / 255.0),                  # 23: Greenish
    (160.0 / 255.0, 105.0 / 255.0, 48.0 / 255.0),        # 24: Brownish
    (158.0 / 255.0, 160.0 / 255.0, 48.0 / 255.0),        # 25: Olive
    (104.0 / 255.0, 160.0 / 255.0, 48.0 / 255.0),        # 26: Olive Green
    (48.0 / 255.0, 160.0 / 255.0, 93.0 / 255.0),         # 27: Teal
    (48.0 / 255.0, 160.0 / 255.0, 160.0 / 255.0),        # 28: Cyan
    (48.0 / 255.0, 103.0 / 255.0, 160.0 / 255.0),        # 29: Blue
    (111.0 / 255.0, 48.0 / 255.0, 160.0 / 255.0),        # 30: Purple
    (160.0 / 255.0, 48.0 / 255.0, 105.0 / 255.0),        # 31: Reddish Purple
    DEFAULT_COLOR_RGB,                                    # 32: Yellowish Orange
]


MAYA_INDEX_QCOLORS = [QtGui.QColor.fromRgbF(*rgb) for rgb in MAYA_INDEX_COLOR_RGB]

