# E6 · Casse ta page

**Point du programme** : apprendre par l'expérimentation.

**Durée** : 20 minutes.

## Ce qu'on fait

`depart/` contient la page, ses règles et sa commande de relecture. Git est le filet : on commite avant chaque essai, on revient après.

1. Dans un terminal, depuis `depart/` :

       git add -A
       git commit -m "E6 : état avant expérimentation"

2. Demander à Claude Code ou à Copilot (mode Agent) une transformation de votre choix, une seule par essai. Idées : un mode sombre, une version en anglais, la page en une seule couleur, une animation sur le bouton Appeler, la carte en tableau, la navigation collée en haut.
3. Regarder le résultat dans Chrome. Garder ou jeter :

       git add -A && git commit -m "E6 : essai mode sombre"      # garder
       git restore . && git clean -fd                             # jeter

4. Trois essais au moins. À la fin, `git log --oneline` montre la trace.

## Livrable

Un `git log` à trois commits au moins (y compris celui du départ), et une ligne dans `journal.md` par essai : ce qu'on a demandé, ce qui est arrivé, gardé ou jeté.

## Ce qu'on apprend

Ce qui a mal tourné vaut autant que ce qui a marché : notez les demandes qui ont donné un résultat inattendu, elles nourrissent la relecture de l'après-midi.
