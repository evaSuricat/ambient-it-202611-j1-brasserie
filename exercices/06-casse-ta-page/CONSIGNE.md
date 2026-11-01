# E6 · Casse ta page

**Point du programme** : apprendre par l'expérimentation.

**Durée** : 20 minutes.

## Ce qu'on fait

`depart/` contient la page et ses règles (`AGENTS.md` est à la racine). Git est le filet : on commite avant chaque essai, on revient après.

1. Dans le terminal VS Code, qui s'ouvre à la racine de votre dossier, placez-vous d'abord dans le dossier de l'exercice :

       cd exercices/06-casse-ta-page/depart
       pwd

   `cd` change de dossier. `pwd` affiche où vous êtes. Résultat attendu : un chemin qui finit par `06-casse-ta-page/depart`. Si ce n'est pas le cas, ne continuez pas : montrez-moi l'écran. Rien n'a été modifié à ce stade.

   Puis, le point de départ :

       git add -A
       git commit -m "E6 : état avant expérimentation"

   `git add -A` enregistre tout le dépôt, y compris vos exercices précédents : c'est voulu, ils sont ainsi à l'abri.

2. Demander à Claude Code ou à Copilot (mode Agent) une transformation de votre choix, une seule par essai, en nommant le dossier : « dans exercices/06-casse-ta-page/depart/, … ». Idées : un mode sombre, une version en anglais, la page en une seule couleur, une animation sur le bouton Appeler, la carte en tableau, la navigation collée en haut.
3. Regarder le résultat dans Chrome. Garder ou jeter :

       git add -A && git commit -m "E6 : essai mode sombre"      # garder

   Pour jeter, regardez d'abord ce qui serait supprimé, sans rien effacer :

       git status
       git clean -nd

   Puis, si la liste vous convient :

       git restore . && git clean -fd                             # jeter

   Attention : `git restore .` et `git clean -fd` agissent dans le dossier où vous êtes et ses sous-dossiers. Lancés depuis la racine, ils effacent le travail non enregistré des autres exercices. Restez dans `exercices/06-casse-ta-page/depart`. Pour revenir à la racine plus tard : `cd ../../..`.

4. Trois essais au moins. À la fin, `git log --oneline` montre la trace.

## Livrable

Un `git log` à trois commits au moins (y compris celui du départ), et une ligne dans `exercices/06-casse-ta-page/depart/journal.md` (à créer) par essai : ce qu'on a demandé, ce qui est arrivé, gardé ou jeté.

## Ce qu'on apprend

Ce qui a mal tourné vaut autant que ce qui a marché : notez les demandes qui ont donné un résultat inattendu, elles nourrissent la relecture de l'après-midi.
