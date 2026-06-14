# 🔱 HARPOON - Navigation Rapide entre Fichiers

Harpoon est un plugin de navigation qui te permet de **marquer jusqu'à 4 fichiers favoris** et y accéder **instantanément** avec des raccourcis clavier.

---

## 🎯 Concept Principal

Au lieu de naviguer dans l'arborescence ou de chercher un fichier avec `Ctrl+P`, tu marques tes fichiers les plus importants et les atteins en une seule touche.

**Idée** : C'est comme des "signets" pour fichiers, mais ultra-rapide.

---

## ⌨️ Raccourcis Harpoon

| Action | Shortcut | Description |
|--------|----------|-------------|
| Ajouter fichier actuel | `Ctrl+A` | Marque le fichier ouvert |
| Voir le menu | `Ctrl+E` | Liste tous tes 4 fichiers marqués |
| Aller au fichier 1 | `Ctrl+1` | Jump instantanément |
| Aller au fichier 2 | `Ctrl+2` | Jump instantanément |
| Aller au fichier 3 | `Ctrl+3` | Jump instantanément |
| Aller au fichier 4 | `Ctrl+4` | Jump instantanément |

---

## 📚 Utilisation Pas à Pas

### Étape 1️⃣ : Marquer tes fichiers favoris

```
1. Ouvre le fichier "config.json"
2. Appuie sur Ctrl+A → Confirme
   └─ config.json est maintenant au slot 1

3. Ouvre le fichier "main.ts"
4. Appuie sur Ctrl+A → Confirme
   └─ main.ts est maintenant au slot 2

5. Ouvre le fichier "styles.css"
6. Appuie sur Ctrl+A → Confirme
   └─ styles.css est maintenant au slot 3

7. Ouvre le fichier ".env"
8. Appuie sur Ctrl+A → Confirme
   └─ .env est maintenant au slot 4
```

### Étape 2️⃣ : Naviguer entre tes fichiers

```
Tu es dans un fichier random...

Appuie sur Ctrl+1   → Jump à config.json
Appuie sur Ctrl+2   → Jump à main.ts
Appuie sur Ctrl+3   → Jump à styles.css
Appuie sur Ctrl+4   → Jump à .env
```

### Étape 3️⃣ : Voir ton menu

```
Appuie sur Ctrl+E → Vue le menu :

    1. config.json
    2. main.ts
    3. styles.css
    4. .env
```

---

## 💡 Cas d'Usage Recommandés

### Pour un Développeur Frontend
```
1. index.html     (structure)
2. styles.css     (styles)
3. App.jsx        (composant principal)
4. config.js      (configuration)
```

### Pour un Développeur Backend
```
1. main.py        (point d'entrée)
2. config.py      (config)
3. models.py      (modèles)
4. .env           (variables d'environnement)
```

### Pour DevOps / Infra
```
1. Dockerfile     (configuration)
2. docker-compose.yaml
3. nginx.conf
4. deploy.sh
```

### Pour Développeur Full-Stack
```
1. package.json   (dépendances)
2. .env           (env vars)
3. src/App.tsx    (code principal)
4. README.md      (documentation)
```

---

## 🔄 Remplacer un Fichier Marqué

Pour remplacer un slot, il suffit :

```
1. Ouvre le nouveau fichier
2. Appuie sur Ctrl+A → Confirme
   └─ Le fichier précédent de ce slot est remplacé
   └─ Le nouveau fichier occupe ce slot
```

**Important** : Harpoon te place au prochain slot disponible. Si tu veux remplacer un slot spécifique, il faut :
1. Ouvrir le fichier à remplacer
2. `Ctrl+A` pour le marquer au prochain slot
3. Vérifier avec `Ctrl+E`
4. Supprimer l'ancien slot si nécessaire (via l'interface)

---

## 🎮 Workflow en Action

### Scénario Réaliste

```
Situation : Tu develops une app React et dois éditer 3 fichiers régulièrement

┌─ Setup Initial ─────────────────────────────────┐
│ File: App.jsx                                   │
│ Appuie: Ctrl+A → App.jsx → Slot 1              │
│                                                  │
│ File: components/Button.jsx                     │
│ Appuie: Ctrl+A → Button.jsx → Slot 2           │
│                                                  │
│ File: styles/app.css                            │
│ Appuie: Ctrl+A → app.css → Slot 3              │
└─────────────────────────────────────────────────┘

┌─ Workflow Rapide ───────────────────────────────┐
│ Tu es dans un fichier random...                 │
│                                                  │
│ Besoin d'éditer App.jsx?  → Ctrl+1 (Instant!)  │
│ Besoin d'éditer Button?   → Ctrl+2 (Instant!)  │
│ Besoin d'éditer CSS?      → Ctrl+3 (Instant!)  │
│                                                  │
│ Tu sautes entre fichiers SANS TOUCHE À LA SOURIS │
└─────────────────────────────────────────────────┘
```

---

## 🎯 Commandes Avancées

### Voir tous tes marqueurs
```
Ctrl+E → Menu Harpoon apparaît
         Affiche les 4 slots
         Vois les fichiers actuellement marqués
```

### Réorganiser (Optional)
Si tu veux changer l'ordre via l'UI Harpoon (disponible dans certaines versions) :
```
Ctrl+E → Navigation dans le menu
         Supprimer avec 'd' ou reorder
```

---

## 🚀 PRO TIPS

### Tip 1️⃣ : Combo avec VSpaceCode
```
Space → f → Cherche un fichier
Ctrl+A → Marque le fichier trouvé
Ctrl+E → Vois ton Harpoon mis à jour
```

### Tip 2️⃣ : Avec Vim Motion
```
Tu ouvres un fichier avec Vim motion:
  / searchTerm   → Cherche
  n              → Occurrence suivante
  Ctrl+A         → Marque-le
```

### Tip 3️⃣ : Session-based Harpoon
```
Session 1 (Frontend Dev)    → Slots: React files
Session 2 (Backend Work)    → Slots: Python files
Session 3 (Config/Infra)    → Slots: Config files

Change de session → Tes 4 slots changent automatiquement
```

---

## ❓ FAQ Harpoon

### Q: Comment supprimer un marqueur?
**A:** Harpoon ne propose pas de suppression directe. À la place :
- Marque un nouveau fichier au même slot (le remplace)
- Ou regarde le menu avec `Ctrl+E` pour voir les slots

### Q: Pouvez-vous avoir plus de 4 fichiers?
**A:** Non, Harpoon standard = 4 slots. Mais tu peux :
- Créer des sessions Harpoon différentes
- Ou marquer/demarquer rapidement avec `Ctrl+A`

### Q: Comment voir mes fichiers Harpoon actuels?
**A:** `Ctrl+E` pour voir le menu complet

### Q: Est-ce que Harpoon se synchro entre sessions?
**A:** Oui! Harpoon stocke tes marqueurs localement, donc tes slots persistent entre les sessions VS Code.

### Q: Pouvez-vous utiliser Harpoon + Vim?
**A:** **OUI!** C'est exactement le combo recommandé:
- Vim pour l'édition
- Harpoon pour la navigation
- VSpaceCode pour les commandes

---

## 📊 Comparaison : Harpoon vs Alternatives

| Feature | Harpoon | Ctrl+P | Explorer | Tabs |
|---------|---------|--------|----------|------|
| **Accès Clavier** | ✅ Ultra-rapide | ✅ Rapide | ❌ Nécessite souris | ✅ Rapide |
| **Précédent/Suivant** | ✅ 4 favoris | ❌ Non | ❌ Non | ✅ Oui |
| **Nombre fichiers** | 4 | Tous | Tous | Tabs |
| **Speed** | ⚡⚡⚡⚡ | ⚡⚡⚡ | ⚡ | ⚡⚡ |
| **Apprentissage** | 🟢 Facile | 🟢 Facile | 🟡 Moyen | 🟢 Facile |

---

## 🔗 Ressources Complémentaires

- **Harpoon Repo** : https://github.com/ThePrimeagen/harpoon
- **Harpoon VS Code** : Extension VSpaceCode compatible
- **Related Tools** : Combine avec Vim, VSpaceCode, et Multi-cursor

---

## ✅ Checklist Harpoon Setup

- [ ] Harpoon extension installée
- [ ] `Ctrl+A` pour ajouter fonctionne
- [ ] `Ctrl+E` pour voir le menu fonctionne
- [ ] `Ctrl+1/2/3/4` pour naviguer fonctionne
- [ ] 4 fichiers favoris marqués
- [ ] Testé les jumps rapidement
- [ ] Intégré dans ton workflow daily

---

**Résumé** : Harpoon = Navigation ultra-rapide pour 4 fichiers favoris. Marque-les avec `Ctrl+A`, jump avec `Ctrl+1/2/3/4`, vois-les avec `Ctrl+E`.

**Dernière mise à jour** : 2026-06-14
