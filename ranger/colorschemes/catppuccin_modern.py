# Catppuccin Modern pour ranger (inspiré Hyprland/rofi)

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Scheme(ColorScheme):
    progress_bar_color = blue

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        if context.in_browser:
            fg = 110  # bleu moderne
            bg = 236  # fond gris foncé
        if context.selected:
            attr |= bold
            fg = 218  # violet clair
            bg = 60   # bleu foncé
        if context.marked:
            fg = 214  # orange
            bg = 236
        if context.directory:
            fg = 117  # bleu clair
        if context.media:
            fg = 175  # rose
        if context.image:
            fg = 81   # cyan
        if context.video:
            fg = 161  # rouge
        if context.link:
            fg = 141  # violet
        if context.bad:
            fg = 196  # rouge fort
            bg = 236
        if context.tag_marker:
            attr |= bold
            fg = 208
            bg = 236

        return fg, bg, attr
