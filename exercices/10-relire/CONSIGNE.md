# E10 · Relire ce qu'on n'a pas écrit

**Point du programme** : relecture et amélioration du code généré.

**Durée** : 15 minutes.

## Ce qu'on fait

`depart/` contient la page complète avec sa carte. On la relit avec la grille de l'exercice 5, on corrige, on mesure.

1. Dans Claude Code : `/verifier-page`. Lire le rapport. Dans Copilot Chat : `/verifier-page` ou « Chat: Run Prompt ». Comparer.
2. Appliquer au moins deux corrections de la liste « À corriger », à la main ou en demandant à l'outil : « applique les corrections 1 et 3 du rapport ».
3. Mesurer avant et après avec Lighthouse : ouvrir `index.html` dans Chrome, F12, onglet « Lighthouse », cocher Accessibilité et Bonnes pratiques, mode Ordinateur, « Analyser ». Noter les deux scores dans `lighthouse.md`.
4. Committer :

       git add -A && git commit -m "E10 : contraste des boutons et de l'encadré, focus visible"

## Livrable

Deux corrections commitées, `lighthouse.md` avec les scores avant et après.

## Ce qu'on retient

Lighthouse tourne dans Chrome, hors ligne. Il ne voit pas tout : le contraste, oui ; un texte alternatif faux, non ; un ordre de titres cassé, en partie. La grille et l'œil complètent l'outil.
