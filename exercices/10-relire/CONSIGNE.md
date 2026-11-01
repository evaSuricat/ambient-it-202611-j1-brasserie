# E10 · Relire ce qu'on n'a pas écrit

**Point du programme** : relecture et amélioration du code généré.

**Durée** : 15 minutes.

## Ce qu'on fait

`exercices/10-relire/depart/` contient la page complète avec sa carte. On la relit avec la grille de l'exercice 5, on corrige, on mesure.

0. La commande `/verifier-page` vient de l'exercice 5 : c'est le skill `.claude/skills/verifier-page/SKILL.md`, à la racine de votre dossier, lu par Claude Code et par Copilot. Si vous ne l'avez pas, copiez le dossier `ressources/skills/verifier-page` dans `.claude/skills/` à la racine (créez `.claude/skills/` s'il n'existe pas : clic droit dans l'explorateur, « New Folder »). Puis ouvrez une nouvelle conversation dans chaque outil.
1. Dans Claude Code, avec les chemins de la page :

       /verifier-page exercices/10-relire/depart/index.html exercices/10-relire/depart/style.css

   Lire le rapport. Dans Copilot Chat (New Chat, sélecteur sur Agent) : `/verifier-page` suivi des deux mêmes chemins. Comparer.
2. Appliquer au moins deux corrections de la liste « À corriger », à la main ou en demandant à l'outil. Nommez le point, pas le numéro, car la numérotation change d'un rapport à l'autre : « Dans exercices/10-relire/depart/, applique les corrections du rapport sur le contraste du bouton et de l'encadré. »
3. Mesurer avant et après avec Lighthouse : ouvrir `exercices/10-relire/depart/index.html` dans Chrome, F12, onglet « Lighthouse », cocher Accessibilité et Bonnes pratiques, mode Ordinateur, « Analyser ». Créer `exercices/10-relire/depart/lighthouse.md` et y noter les deux scores.
4. Committer. Placez-vous dans le dossier de l'exercice, contrôlez, puis committez :

       cd exercices/10-relire/depart
       pwd
       git add -A && git commit -m "E10 : contraste des boutons et de l'encadré"

   `pwd` doit afficher un chemin qui finit par `10-relire/depart`. Résultat attendu du commit : une ligne « 1 file changed » ou plus. Revenir à la racine : `cd ../../..`.

## Livrable

Deux corrections commitées, `exercices/10-relire/depart/lighthouse.md` avec les scores avant et après.

## Bon à savoir

Après la correction du bouton, le survol (`#c9540f`, 4,4 pour 1) devient plus clair que le fond normal : c'est une correction de plus, à faire à la main (par exemple `#9A3E09`, 6,9 pour 1).

## Ce qu'on retient

Lighthouse tourne dans Chrome, hors ligne. Il ne voit pas tout : le contraste, oui ; un texte alternatif faux, non ; un ordre de titres cassé, en partie. La grille et l'œil complètent l'outil.
