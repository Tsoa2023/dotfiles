# ==============================================
# HYPRLAND COLORSCHEME POUR RANGER
# ==============================================

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Hyprland(ColorScheme):
    progress_bar_color = 5  # Cyan vibrant
    
    def use(self, context):
        fg, bg, attr = default_colors
        
        if context.reset:
            return default_colors
        
        elif context.in_browser:
            # Interface principale - tons sombres élégants
            if context.selected:
                attr = reverse
                fg = 15  # Blanc
                bg = 8   # Gris sombre
            else:
                fg = 15  # Blanc pour le texte principal
                bg = 0   # Noir pour l'arrière-plan
            
            if context.empty or context.error:
                fg = 1  # Rouge pour les erreurs
                bg = 0
                
            if context.border:
                fg = 8  # Bordures grises subtiles
                
            if context.media:
                if context.image:
                    fg = 13  # Magenta pour les images
                elif context.video:
                    fg = 12  # Rouge clair pour les vidéos  
                elif context.audio:
                    fg = 14  # Jaune pour l'audio
                    
            if context.container:
                fg = 9   # Rouge clair pour les archives
                
            if context.directory:
                attr |= bold
                fg = 4   # Bleu pour les dossiers
                
            elif context.executable:
                fg = 10  # Vert pour les exécutables
                attr |= bold
                
            if context.socket:
                fg = 13  # Magenta
                attr |= bold
                
            if context.fifo or context.device:
                fg = 11  # Jaune
                if context.device:
                    attr |= bold
                    
            if context.link:
                fg = 6 if context.good else 1  # Cyan ou rouge
                
            if context.bad:
                fg = 1  # Rouge pour les fichiers corrompus
                
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (1, 9):
                    fg = 15  # Blanc
                else:
                    fg = 9   # Rouge clair
                    
            if not context.selected and context.cut:
                fg = 8   # Gris pour les fichiers coupés
                attr |= bold
                
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = 3  # Jaune pour les fichiers marqués
                    
            if context.badinfo:
                if attr & reverse:
                    bg = 1  # Rouge
                else:
                    fg = 1  # Rouge
                    
        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = 1 if context.bad else 6  # Rouge ou cyan
            elif context.directory:
                fg = 4  # Bleu
            elif context.tab:
                if context.good:
                    bg = 10  # Vert pour l'onglet actif
                    fg = 0   # Noir
            elif context.link:
                fg = 6  # Cyan
                
        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 2  # Vert
                elif context.bad:
                    fg = 1  # Rouge
            if context.marked:
                attr |= bold | reverse
                fg = 3  # Jaune
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 1  # Rouge
            if context.loaded:
                bg = self.progress_bar_color
                fg = 0  # Noir
                
        if context.text:
            if context.highlight:
                attr |= reverse
                
        if context.in_taskview:
            if context.title:
                fg = 4  # Bleu
                
            if context.selected:
                attr |= reverse
                
            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color
                    fg = 0
                    
        return fg, bg, attr
