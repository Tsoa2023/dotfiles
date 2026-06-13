# Guide complet : Configuration VSCode + Neovim

> Document d'accompagnement pour le fichier `settings.json` fourni.
> Chaque section explique **quoi** fait la config, **pourquoi** elle est utile, et **comment** l'utiliser au quotidien.

---

## 1. Interface épurée — le Mode Zen permanent

### Ce que ça fait

```json
"editor.minimap.enabled": false,
"editor.scrollbar.horizontalScrollbarSize": 0,
"editor.scrollbar.verticalScrollbarSize": 0,
"editor.overviewRulerBorder": false,
"editor.renderWhitespace": "selection",
"editor.renderControlCharacters": false,
"zenMode.centerLayout": false,
"zenMode.hideLineNumbers": false,
```

### Pourquoi ?

Le tutoriel prône un espace de travail **minimaliste**, sans distraction visuelle. La minimap, les barres de défilement épaisses et les guides d'indentation créent du bruit visuel inutile.

### Comment l'utiliser

| Raccourci | Action |
|---|---|
| `Ctrl+K Z` | Activer le **Zen Mode** (plein écran épuré) |
| `Ctrl+B` | Basculer la barre latérale |
| `` Ctrl+` `` | Ouvrir/fermer le terminal |
| `Echap` deux fois | Sortir du Zen Mode |

> **Astuce** : En Zen Mode, les numéros de ligne sont **conservés** (contrairement au défaut de VSCode). Pratique pour les mouvements Vim comme `:42` ou `12G`.

---

## 2. Numéros de ligne relatifs

### Ce que ça fait

```json
"editor.lineNumbers": "relative"
```

### Pourquoi ?

Avec Neovim/Vim, les numéros relatifs sont **indispensables** pour les mouvements verticaux :

- `5j` → descendre de 5 lignes
- `10k` → monter de 10 lignes
- `d3j` → supprimer 3 lignes vers le bas
- `y5k` → copier 5 lignes vers le haut

### Comment l'utiliser

Regardez le numéro à côté de la ligne cible, utilisez-le directement dans vos motions Vim.

---

## 3. Intégration Neovim (vscode-neovim)

### Ce que ça fait

```json
"vscode-neovim.compositeKeys": { "jk": { ... }, "kj": { ... } },
"vscode-neovim.highlightYank": true,
"vscode-neovim.highlightVimSearch": true,
"vscode-neovim.relativenumber": true,
"vscode-neovim.statusBarColorControl": true,
```

### Pourquoi ?

L'extension lance une **véritable instance Neovim** en arrière-plan. Vous bénéficiez de TOUS les mouvements Vim natifs (pas une émulation) tout en gardant les fonctionnalités VSCode (IntelliSense, debugger, git).

### Commandes essentielles en mode Normal

| Commande | Action |
|---|---|
| `jk` ou `kj` | Revenir en mode Normal (depuis Insertion) |
| `dd` | Supprimer une ligne |
| `yy` | Copier une ligne |
| `p` / `P` | Coller après / avant |
| `u` / `Ctrl+R` | Annuler / rétablir |
| `/motif` + `Enter` | Rechercher un motif |
| `n` / `N` | Occurrence suivante / précédente |
| `:%s/ancien/nouveau/g` | Remplacer globalement |
| `gg` / `G` | Début / fin du fichier |
| `0` / `$` | Début / fin de ligne |
| `ci(` ou `ci"` | Changer dans les parenthèses/guillemets |
| `.` | Répéter la dernière action |
| `Ctrl+d` / `Ctrl+u` | Descendre / monter d'une demi-page |
| `Ctrl+f` / `Ctrl+b` | Page suivante / précédente |
| `za` | Basculer le pliage de code |
| `:w` | Enregistrer |
| `:q` | Fermer le fichier (si 1 onglet) |
| `:!commande` | Exécuter une commande shell |

### Mode Visuel

| Commande | Action |
|---|---|
| `v` | Mode visuel caractère |
| `V` | Mode visuel ligne |
| `Ctrl+v` | Mode visuel bloc (sélection colonne) |
| `y` / `d` | Copier / supprimer la sélection |
| `>` / `<` | Indenter / désindenter |

### Fonctionnalités spéciales

- **Highlight Yank** : le texte copié est surligné 150ms (visuel agréable)
- **Recherche Vim** : les résultats sont surlignés 500ms puis disparaissent
- **Barre de statut colorée** : change de couleur selon le mode (Normal/Insertion/Visuel)

---

## 4. Harpoon — Navigation rapide entre fichiers

### Ce que ça fait

```json
"harpoon.keybindings": [
  { "key": "ctrl+e", "command": "harpoon.toggleQuickMenu" },
  { "key": "ctrl+a", "command": "harpoon.addFile" },
  ...
]
```

### Pourquoi ?

Plutôt que de chercher vos fichiers dans l'explorateur ou avec `Ctrl+P`, Harpoon permet de **marquer** 4 fichiers fréquemment utilisés et d'y accéder instantanément.

### Comment l'utiliser

| Raccourci | Action |
|---|---|
| `Ctrl+A` | Ajouter le fichier courant à la liste Harpoon |
| `Ctrl+1` | Aller au fichier marqué n°1 |
| `Ctrl+2` | Aller au fichier marqué n°2 |
| `Ctrl+3` | Aller au fichier marqué n°3 |
| `Ctrl+4` | Aller au fichier marqué n°4 |
| `Ctrl+E` | Ouvrir le menu rapide pour sélectionner visuellement |

> **Flux de travail typique** : ouvrez vos 4 fichiers principaux, faites `Ctrl+A` sur chacun, puis naviguez avec `Ctrl+1..4` sans toucher à la souris.

---

## 5. Terminal intégré optimisé

### Ce que ça fait

```json
"terminal.integrated.fontFamily": "'JetBrains Mono', 'MesloLGS NF', monospace",
"terminal.integrated.cursorStyle": "underline",
"terminal.integrated.macOptionIsMeta": true,
"terminal.integrated.shellIntegration.enabled": true,
```

### Pourquoi ?

Le terminal est le deuxième espace de travail du développeur. Avec Starship, le mode Vi du shell, et les Nerd Fonts, chaque élément est optimisé pour la productivité.

### Prérequis

Installez ces outils dans votre terminal :

```bash
# macOS (Homebrew)
brew install zsh starship tmux neovim

# Linux (apt)
sudo apt install zsh tmux neovim
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

### Configuration Starship (`.config/starship.toml`)

```toml
format = """
[](#9A348E)\
$os\
$username\
[](bg:#DA627D fg:#9A348E)\
$directory\
[](fg:#DA627D bg:#FCA17D)\
$git_branch\
$git_status\
[](fg:#FCA17D bg:#86BBD8)\
$nodejs\
$rust\
$python\
[](fg:#86BBD8 bg:#33658A)\
$docker_context\
$time\
[](fg:#33658A)\
\n$character"""

[nodejs]
symbol = "⬢ "
format = "via [$symbol($version)]($style) "

[python]
symbol = " "
format = "via [$symbol($version)]($style) "

[directory]
truncation_length = 3
truncate_to_repo = true
```

### Mode Vi dans le shell (zsh)

Ajoutez ceci dans `~/.zshrc` :

```zsh
bindkey -v           # Active le mode Vi
export KEYTIMEOUT=1  # Délai court entre Escape et la commande

# Indicateur de mode dans le prompt
function zle-line-init zle-keymap-select {
    case $KEYMAP in
        vicmd)      PROMPT="%F{green}❮ NORMAL ❯%f " ;;
        viins|main) PROMPT="%F{blue}❮ INSERT ❯%f " ;;
    esac
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
```

### Tmux (démarrage automatique dans VSCode)

Créez `~/.tmux.conf` :

```tmux
set -g mouse on
set -g mode-keys vi
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",xterm-256color:Tc"
set -g status-bg colour235
set -g status-fg colour250
set -g status-left "#[fg=green]#S "
set -g status-right "#[fg=yellow]%H:%M"
bind -T copy-mode-vi v send-keys -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-selection
bind -T copy-mode-vi Escape send-keys -X cancel
```

Puis ajoutez dans `~/.zshrc` :

```zsh
# Démarrage automatique de tmux dans le terminal VSCode
if [[ -n "$TERM_PROGRAM" && "$TERM_PROGRAM" == "vscode" ]]; then
    if [[ -z "$TMUX" ]]; then
        tmux new-session -A -s vscode
    fi
fi
```

### Raccourcis utiles dans le terminal

| Raccourci | Action |
|---|---|
| `Escape` + `h/j/k/l` | Navigation en mode Vi dans le shell |
| `Escape` + `v` | Mode visuel (copie) dans le terminal |
| `Ctrl+R` | Rechercher dans l'historique des commandes |
| `Ctrl+A` / `Ctrl+E` | Aller au début / fin de ligne |
| `Esc` puis `dd` | Supprimer toute la ligne courante |

---

## 6. Formatage et autocomplétion

### Ce que ça fait

```json
"editor.formatOnSave": true,
"editor.codeActionsOnSave": { "source.fixAll": "explicit", "source.organ