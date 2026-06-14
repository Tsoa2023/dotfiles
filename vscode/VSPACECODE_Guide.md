# 🚀 VSPACECODE - Complete Command Menu Guide

VSpaceCode est un menu puissant qui te donne accès à **toutes les commandes VS Code** via le clavier, en appuyant sur **SPACE** en mode Normal Vim.

---

## 📌 Concept Principal

Au lieu de chercher dans la Palette de Commandes (`Ctrl+Shift+P`), VSpaceCode organise les commandes en catégories logiques, accessibles avec des mnémoniques rapides.

```
Space    → Menu principal
Space f  → File commands
Space e  → Editor commands
Space g  → Git commands
Space b  → Buffer/Tab commands
...
```

---

## 🎮 Accès au Menu

| Action | Shortcut |
|--------|----------|
| Ouvrir Menu Principal | `Space` (en mode Normal) |
| Naviguer | `j/k` (Vim) ou flèches |
| Sélectionner | `Enter` ou `l` |
| Annuler | `Esc` ou `q` |

---

## 📂 Catégories Principales

### 🗂️ File Operations (Space + f)
```
Space f n  → New file
Space f e  → Open file
Space f s  → Save current file
Space f S  → Save all files
Space f r  → Recent files
Space f d  → Delete file
Space f R  → Rename file
Space f c  → Close file
Space f C  → Close all files
```

### ✏️ Editor Operations (Space + e)
```
Space e l  → Format document
Space e w  → Toggle word wrap
Space e i  → Insert snippet
Space e c  → Comment line/block
Space e u  → Undo
Space e y  → Redo
Space e d  → Delete line
Space e D  → Duplicate line up/down
```

### 🌳 Buffer/Tabs (Space + b)
```
Space b n  → Next buffer/tab
Space b p  → Previous buffer/tab
Space b 1  → Go to buffer 1
Space b 2  → Go to buffer 2
Space b 3  → Go to buffer 3
Space b 4  → Go to buffer 4
Space b d  → Delete buffer
Space b D  → Delete all other buffers
Space b l  → List all buffers
```

### 🔍 Search (Space + s)
```
Space s f  → Search in files (Ctrl+Shift+F)
Space s r  → Search and replace
Space s s  → Search in current file
Space s h  → Search history
Space s w  → Search word under cursor
```

### 📦 Git Operations (Space + g)
```
Space g s  → Git status
Space g a  → Git add
Space g c  → Git commit
Space g p  → Git push
Space g P  → Git pull
Space g d  → Git diff
Space g D  → Git diff all
Space g b  → Git branch
Space g l  → Git log
Space g h  → Git history
```

### 🔧 Project/Workspace (Space + p)
```
Space p c  → Change project
Space p f  → Find in project
Space p s  → Project search
Space p g  → Go to file in project
```

### 🔌 Extensions (Space + x)
```
Space x i  → Install extension
Space x u  → Update extensions
Space x d  → Disable extension
Space x e  → Enable extension
Space x l  → List extensions
```

### ⚙️ Settings (Space + S)
```
Space S e  → Edit settings
Space S k  → Edit keybindings
Space S t  → Change theme
Space S f  → Change font
```

### 💻 Terminal (Space + t)
```
Space t n  → New terminal
Space t t  → Toggle terminal
Space t 1  → Select terminal 1
Space t 2  → Select terminal 2
Space t d  → Delete terminal
```

### 🪟 Window/Split (Space + w)
```
Space w v  → Split vertical
Space w s  → Split horizontal
Space w n  → Next split
Space w p  → Previous split
Space w d  → Delete split
Space w o  → Only one split (close others)
Space w m  → Maximize split
```

---

## 💡 Workflows Courants

### Workflow 1 : Créer et Éditer un Nouveau Fichier

```
Space f n  → Entre le nom du fichier
             └─ Fichier créé et ouvert

(Edit your code)

Space f s  → Sauvegarde le fichier

Space f c  → Ferme le fichier
```

### Workflow 2 : Git Commit & Push

```
Space g s  → Vois le statut Git

Space g a  → Ajoute les fichiers (staging)

Space g c  → Commit → Entre le message

Space g p  → Push vers le serveur
```

### Workflow 3 : Formater et Nettoyer

```
Space e l  → Formate le document actuel

Space e c  → Commente/Décommente les lignes sélectionnées

Space e d  → Supprime les lignes vides
```

### Workflow 4 : Navigation Multi-fichiers

```
Space s f  → Cherche une string dans tous les fichiers
             → Sélectionne un résultat

Space b l  → Vois tous les buffers ouverts

Space b n  → Saute au buffer suivant
```

### Workflow 5 : Exploration Projet

```
Space p f  → Cherche fichier dans le projet

Space s f  → Cherche du texte dans le projet

Space g l  → Vois l'historique Git du projet
```

---

## 🎯 Combinaisons Puissantes

### Combo 1 : Édition Rapide Multi-fichier
```
1. Space s f           → Cherche du texte
2. Sélectionne un hit
3. (Edit in first file)
4. Space s f           → Recherche suivante
5. (Edit in next file)
6. Répète...
```

### Combo 2 : Git Workflow
```
Space g s    → Vois les changements
Space g a    → Add
Space g D    → Vois tous les diffs
Space g c    → Commit
Space g l    → Log de commits
Space g p    → Push
```

### Combo 3 : Project Setup
```
Space f n    → Crée package.json
Space f n    → Crée .env
Space f n    → Crée README.md
Space g c    → Commit initial
Space g p    → Push au repo
```

---

## ⌨️ Raccourcis Composés (Chainable)

VSpaceCode permet de chainer les commandes:

```
Space → Wait for menu
     ↓
     f → File submenu
     ↓
     n → New file

OU

Space → Menu
     ↓
     g → Git submenu
     ↓
     s → Status
```

---

## 🔧 Personnalisation VSpaceCode

### Ajouter des Raccourcis Personnalisés

Dans `settings.json` :
```json
"vspacecode.bindingOverrides": [
  {
    "keys": "space g r",
    "name": "Git Rebase",
    "type": "command",
    "command": "git.rebase"
  }
]
```

### Remapper des Keybindings

```json
"vspacecode.bindingOverrides": [
  {
    "keys": "space f",
    "name": "My File Commands",
    "type": "bindings",
    "bindings": {
      "n": {"command": "workbench.action.files.newUntitledFile"},
      "o": {"command": "workbench.action.files.openFile"}
    }
  }
]
```

---

## 📊 Comparaison : VSpaceCode vs Alternatives

| Feature | VSpaceCode | Ctrl+Shift+P | Menu Interface |
|---------|-----------|--------------|-----------------|
| **Speed** | ⚡⚡⚡⚡ | ⚡⚡⚡ | ⚡ |
| **Discoverability** | 🟢 Catégories logiques | 🟡 Liste plein texte | 🟢 Menus hiérarchiques |
| **Clavier 100%** | ✅ Oui | ✅ Oui | ❌ Nécessite souris |
| **Mnémoniques** | ✅ Logiques (f=file, g=git) | ❌ Non | ❌ Menus profonds |
| **Extensible** | ✅ Oui | ❌ Non | ❌ Non |

---

## 🚀 Tips & Tricks

### Tip 1 : Mémoriser les Mnémoniques
```
Mémorise juste une lettre à la fois:
f = File
g = Git
e = Editor
b = Buffer
s = Search

Les sous-commandes suivent logiquement!
```

### Tip 2 : Combo avec Harpoon
```
Space s f  → Cherche fichier
(résultat)
Ctrl+A     → Marque avec Harpoon
Ctrl+E     → Vérifie Harpoon menu
```

### Tip 3 : Remplace la Palette de Commandes
```
Au lieu de: Ctrl+Shift+P → (tape longtemps)
Utilise:    Space → (mnémonique rapide)
```

### Tip 4 : Git Workflow Ultra-Rapide
```
Ctrl+Grave          → Terminal
git status          → Vois les changements
Ctrl+1              → Va au fichier important
Space e l           → Formate
Space f s           → Sauvegarde
Ctrl+Grave          → Retour terminal
git add .           → Add
git commit -m "msg" → Commit
```

---

## 🎮 Navigation dans les Menus

### Dans le Menu VSpaceCode
```
j         → Bas
k         → Haut
l / Enter → Sélectionner/Entrer submenu
h / Esc   → Sortir/Retour
q         → Annuler et fermer
```

### Recherche Rapide dans Menus (Optional)
```
Type une lettre → Filtre les commandes
                  (selon la première lettre)
```

---

## ❓ FAQ VSpaceCode

### Q : Comment trouver une commande?
**A:** Via VSpaceCode:
- Space → Explore les catégories
- Ou mémorise : f=file, g=git, e=editor

### Q : Peux-tu ajouter tes propres commandes?
**A:** Oui! Via `vspacecode.bindingOverrides` dans settings.json

### Q : Comment faire disparaître le menu?
**A:** Appuie sur `q` ou `Esc`

### Q : Fonctionne-t-il en mode Insert?
**A:** Non, VSpaceCode = mode Normal Vim uniquement. En Insert, `Space` = espace normal

### Q : Où trouver toutes les commandes?
**A:** `Space` → Explore, ou Ctrl+Shift+P pour voir les noms techniques

---

## 🔗 Ressources

- **VSpaceCode Docs** : https://www.vspacecode.com/
- **VSpaceCode Keybindings** : https://github.com/VSpaceCode/VSpaceCode
- **Spacemacs Inspiration** : https://www.spacemacs.org/

---

## ✅ Setup Checklist VSpaceCode

- [ ] VSpaceCode installée (VS Code Marketplace)
- [ ] `Space` fonctionne en mode Normal
- [ ] Menu principal apparaît quand tu appuies `Space`
- [ ] Navigue avec `j/k` dans les menus
- [ ] Appuie sur `q` pour fermer le menu
- [ ] Testée au moins 5 commandes (Space f, Space g, etc.)
- [ ] Intégrée dans ton workflow quotidien

---

## 🎯 Prochaines Étapes

1. **Mémorise** : f, g, e, b, s (top 5 categories)
2. **Explore** : Appuie sur `Space` et vois les options
3. **Pratique** : Git workflow (Space g = fastest)
4. **Customise** : Ajoute tes propres keybindings au besoin
5. **Master** : Combine avec Vim + Harpoon pour puissance maximale

---

**Résumé** : VSpaceCode = Menu organisé clavier-centré. Appuie sur `Space` et utilise des mnémoniques (f=file, g=git, e=editor) pour un accès ultra-rapide aux commandes.

**Dernière mise à jour** : 2026-06-14
