# 📖 VS Code Keyboard Shortcuts Guide

Guide complet des raccourcis clavier pour une productivité maximale **SANS SOURIS**.

---

## 🎮 MODE VIM ESSENTIELS

### Escape alternatifs (Insert Mode)
| Action | Shortcut |
|--------|----------|
| Quitter le mode Insert | `jk` ou `kj` |

### Navigation (Normal Mode)
| Action | Shortcut |
|--------|----------|
| Haut | `k` |
| Bas | `j` |
| Gauche | `h` |
| Droite | `l` |
| Début ligne | `0` |
| Fin ligne | `$` |
| Début fichier | `gg` |
| Fin fichier | `G` |

### Édition (Normal Mode)
| Action | Shortcut |
|--------|----------|
| Supprimer caractère | `x` |
| Supprimer ligne | `dd` |
| Copier ligne | `yy` |
| Coller | `p` |
| Undo | `u` |
| Redo | `<C-r>` |
| Insérer avant | `i` |
| Insérer après | `a` |
| Rechercher | `/` |

---

## 🚀 VSPACECODE - Le Power Menu (SPACE)

Appuie sur **SPACE** en mode Normal pour voir le menu principal avec toutes les commandes.

### Menu Organisation
```
space   → Menu Principal
space f → Fichiers
space e → Éditeur
space w → Windows/Splits
space b → Buffers (Onglets)
space g → Git
space p → Projets
space s → Search
space t → Terminal
```

---

## 🎯 NAVIGATION RAPIDE (HARPOON)

**Concept** : Marquer jusqu'à 4 fichiers favoris pour y accéder instantanément.

### Commandes Harpoon
| Action | Shortcut |
|--------|----------|
| Ajouter fichier actuel | `Ctrl+A` |
| Ouvrir menu Harpoon | `Ctrl+E` |
| Aller au fichier 1 | `Ctrl+1` |
| Aller au fichier 2 | `Ctrl+2` |
| Aller au fichier 3 | `Ctrl+3` |
| Aller au fichier 4 | `Ctrl+4` |

### Utilisation
1. Ouvre un fichier que tu utilises souvent
2. Appuie sur `Ctrl+A` pour l'ajouter à Harpoon
3. Fais-le pour 4 fichiers importants
4. Accède-les rapidement avec `Ctrl+1/2/3/4`
5. Revois ton menu avec `Ctrl+E`

---

## 📁 FICHIERS & EXPLORATEUR

| Action | Shortcut |
|--------|----------|
| Bascule barre latérale | `Ctrl+N` |
| Nouveau fichier | `Ctrl+Shift+N` |
| Fermer onglet actuel | `Ctrl+W` |
| Fermer tous les onglets | `Ctrl+Shift+W` |
| Onglet suivant | `Ctrl+Tab` |
| Onglet précédent | `Ctrl+Shift+Tab` |
| Enregistrer | `Ctrl+S` |
| Enregistrer tout | `Ctrl+Shift+S` |

---

## 🔍 RECHERCHE & REMPLACE

| Action | Shortcut |
|--------|----------|
| Chercher dans fichier | `Ctrl+F` |
| Remplacer dans fichier | `Ctrl+H` |
| Chercher dans tous fichiers | `Ctrl+Shift+F` |
| Sélectionner occurrence suivante | `Ctrl+D` |
| Sélectionner toutes occurrences | `Ctrl+Shift+L` |

---

## 💻 TERMINAL

| Action | Shortcut |
|--------|----------|
| Basculer terminal | `Ctrl+Grave (backtick)` |
| Nouveau terminal | `Ctrl+Shift+Grave` |
| Terminal → Éditeur | `Ctrl+J` |
| Éditeur → Terminal | `Ctrl+J` |

---

## 🎨 ÉDITION AVANCÉE

| Action | Shortcut |
|--------|----------|
| Formater document | `Ctrl+Shift+I` |
| Monter ligne(s) | `Alt+Up` |
| Descendre ligne(s) | `Alt+Down` |
| Dupliquer ligne | `Ctrl+Shift+D` (VS Code) ou `yyp` (Vim) |
| Enlever ligne | `dd` (Vim) ou `Ctrl+Shift+K` |
| Commenter ligne | `Ctrl+/` |
| Multi-curseur | `Ctrl+D` (suivant) |

---

## 📋 COMMANDES VSCODE

| Action | Shortcut |
|--------|----------|
| Palette de commandes | `Ctrl+Shift+P` |
| Ouvrir fichier | `Ctrl+P` |
| Vérifier les erreurs | `Ctrl+Shift+M` |
| Aller à ligne | `Ctrl+G` |
| Aller à symbole | `Ctrl+Shift+O` |
| Aller à définition | `F12` ou `Ctrl+Click` |
| Références | `Shift+F12` |

---

## 🔧 PARAMÉTRAGES & OPTIMISATIONS

### Font Current
```json
"editor.fontFamily": "'FiraCode Nerd Font', 'JetBrains Mono', 'Cascadia Code'"
```

### Vim Keybindings (settings.json)
```json
"vim.normalModeKeyBindingsNonRecursive": [
  { "before": ["<space>"], "commands": ["vspacecode.space"] },
  { "before": ["j", "k"], "after": ["<Esc>"] },
  { "before": ["k", "j"], "after": ["<Esc>"] }
]
```

---

## 💡 PRO TIPS

### 1. Combinaisons Puissantes Vim
```vim
5j      → Descendre 5 lignes
10w     → Avancer 10 mots
3dd     → Supprimer 3 lignes
yiw     → Copier le mot sous le curseur
ci"     → Changer le contenu entre guillemets
```

### 2. Recherche & Replace Avancée
- `Ctrl+F` → Entre ta recherche
- `Ctrl+Shift+L` → Sélectionne TOUTES les occurrences
- Type pour remplacer toutes à la fois

### 3. Multi-Curseur (Power Edit)
```
Ctrl+D    → Ajoute curseur au prochain match
Ctrl+D    → Répète pour chaque occurrence
Type     → Modifie tous en même temps
```

### 4. Git via VSpaceCode
```
Space → g → Status
Space → g → Commit
Space → g → Push
Space → g → Pull
```

### 5. Utiliser Harpoon Efficacement
- Fichiers constants : `Config.js`, `Main.ts`, `Styles.css`
- Appuie régulièrement sur `Ctrl+E` pour voir ton menu Harpoon
- Remplace un fichier : `Ctrl+A` sur un nouveau fichier (remplace le dernier)

---

## 🎯 FLUX DE TRAVAIL RECOMMANDÉ

### Workflow Basique (100% Clavier)
1. **Ouvrir fichier** : `Ctrl+P` → Type nom
2. **Éditer** : `i` pour insérer, `jk` pour ESC
3. **Naviguer** : `k/j/h/l` ou `Ctrl+1/2/3/4` (Harpoon)
4. **Chercher** : `Ctrl+F` ou `/` (Vim)
5. **Sauvegarder** : `Ctrl+S`
6. **Terminal** : `Ctrl+Grave`
7. **Menu puissant** : `Space` (VSpaceCode)

### Changer de fichier rapidement
```
Ctrl+E  → Ouvre Harpoon
Sélectionne avec Numéros
Ou Ctrl+1/2/3/4 directement
```

### Éditer plusieurs lignes à la fois
```
Ctrl+D  → Sélectionne occurrence
Ctrl+D  → Ajoute curseur
...     → Répète
Type    → Toutes les lignes changent
```

---

## 🔗 Ressources

- **VSCodeVim Docs** : https://github.com/VSCodeVim/Vim
- **VSpaceCode Docs** : https://www.vspacecode.com/
- **Harpoon Docs** : https://github.com/ThePrimeagen/harpoon

---

## ✅ Checklist Initial Setup

- [ ] `jk` pour ESC testé en mode Insert
- [ ] VSpaceCode fonctionne avec `Space` en Normal mode
- [ ] Harpoon configuré avec `Ctrl+A`, `Ctrl+E`, `Ctrl+1-4`
- [ ] Font installée et affichée correctement
- [ ] Terminal ouvert avec `Ctrl+Grave`
- [ ] Recherche fonctionne avec `Ctrl+F`
- [ ] Multi-curseur testé avec `Ctrl+D`

---

**Dernière mise à jour** : 2026-06-14
**VS Code Version** : Latest with VSCodeVim + VSpaceCode + Harpoon
