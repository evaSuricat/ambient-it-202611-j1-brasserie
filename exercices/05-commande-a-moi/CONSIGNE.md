# E5 · Une commande à moi

**Point du programme** : atelier officiel « personnaliser son IDE avec plusieurs assistants IA », seconde partie, les commandes et fichiers de prompt.

**Durée** : 20 minutes.

## Ce qu'on fait

`depart/` contient la page avec ses fichiers d'instructions. On écrit une grille de relecture une fois, et on la rejoue à volonté, dans les deux outils :

1. **Claude Code** : le fichier `.claude/commands/verifier-page.md`. Son contenu est le prompt ; il se lance en tapant `/verifier-page` dans le panneau ou le terminal.
2. **Copilot** : le fichier `.github/prompts/verifier-page.prompt.md`. Il se lance dans Copilot Chat en tapant `/verifier-page` ou par la commande « Chat: Run Prompt ».

La grille, en cinq points : structure sémantique et ordre des titres, textes alternatifs, contraste des couleurs, navigation au clavier (liens visibles au focus), ressources externes interdites. Le prompt demande un rapport en trois listes : ce qui est bon, ce qui est à corriger avec la ligne concernée, ce qui n'a pas pu être vérifié.

3. Lancer les deux sur `index.html`. Comparer les deux rapports. Coller celui qu'on préfère dans `rapport-relecture.md`.

## Livrable

Les deux fichiers et `rapport-relecture.md`.

## Pour aller plus loin

Ajouter un argument à la commande : `/verifier-page style.css` pour relire un autre fichier (Claude Code : `$ARGUMENTS` dans le fichier de commande).
