# ~/.config/ranger/colorschemes/catppuccin_mocha.py
from __future__ import (absolute_import, division, print_function)

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class CatppuccinMocha(ColorScheme):
    progress_bar_color = 212  # Pink

    def use(self, context):
        fg, bg, attr = default_colors

        # Pas de background -> transparent
        transparent_bg = -1

        # Couleurs Catppuccin
        text = 231      # #cdd6f4
        overlay0 = 246  # #6c7086
        pink = 212      # #f5c2e7
        mauve = 177     # #cba6f7
        red = 203       # #f38ba8
        peach = 215     # #fab387
        yellow = 220    # #f9e2af
        green = 148     # #a6e3a1
        teal = 116      # #94e2d5
        sapphire = 74   # #74c7ec
        blue = 75       # #89b4fa
        lavender = 183  # #b4befe

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
                fg = pink
                bg = transparent_bg
            else:
                attr = normal
                fg = text
                bg = transparent_bg

            if context.empty or context.error:
                fg = red

            if context.border:
                fg = mauve  # Bordures violet/rose
                bg = transparent_bg

            if context.image:
                fg = yellow
            elif context.video:
                fg = peach
            elif context.audio:
                fg = teal
            elif context.document:
                fg = blue
            elif context.container:
                fg = mauve
            elif context.directory:
                attr |= bold
                fg = lavender
            elif context.executable and not any((context.media, context.container, context.fifo, context.socket)):
                attr |= bold
                fg = green
            elif context.socket:
                fg = pink
                attr |= bold
            elif context.fifo or context.device:
                fg = yellow
                if context.device:
                    attr |= bold
            elif context.link:
                fg = sapphire if context.good else red
            elif context.tag_marker and not context.selected:
                attr |= bold
                fg = red if fg not in (red,) else text
            elif context.bad:
                fg = red
            elif context.media:
                fg = peach if not context.image else yellow

        elif context.in_titlebar:
            attr |= bold
            bg = transparent_bg
            if context.hostname:
                fg = green
            elif context.directory:
                fg = lavender
            elif context.tab:
                fg = text if context.good else overlay0
            elif context.link:
                fg = sapphire

        elif context.in_statusbar:
            bg = transparent_bg
            if context.permissions:
                fg = green if context.good else red
            if context.marked:
                attr |= bold | reverse
                fg = yellow
            if context.message:
                fg = red if context.bad else text
            if context.loaded:
                pass
            if context.vcsinfo:
                fg = blue
                attr &= ~bold
            if context.vcscommit:
                fg = green
                attr &= ~bold

        if context.text and context.highlight:
            attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = blue
            if context.selected:
                attr |= reverse
            if context.loaded:
                fg = green

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflicts:
                fg = red
            elif context.vcschanged:
                fg = yellow
            elif context.vcsunknown:
                fg = red
            elif context.vcsstaged:
                fg = green
            elif context.vcssync:
                fg = green
            elif context.vcsignored:
                fg = overlay0

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync:
                fg = green
            elif context.vcsbehind:
                fg = red
            elif context.vcsahead:
                fg = blue
            elif context.vcsdiverged:
                fg = yellow
            elif context.vcsunknown:
                fg = red

        return fg, bg, attr
