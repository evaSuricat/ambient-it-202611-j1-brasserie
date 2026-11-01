# E5 · Une commande à moi

**Point du programme** : atelier officiel « personnaliser son IDE avec plusieurs assistants IA », seconde partie, les commandes et fichiers de prompt.

**Durée** : 20 minutes.

## Ce qu'on fait

La page de l'exercice est dans `exercices/05-commande-a-moi/depart/`. On écrit une grille de relecture une fois, et on la rejoue à volonté, dans les deux outils. Les deux fichiers de commande se créent à la RACINE de votre dossier, à côté de `AGENTS.md`, et non dans `depart/`. Sinon `/verifier-page` n'apparaît pas.

1. **Claude Code** : le fichier `.claude/commands/verifier-page.md`, à la racine. Son contenu est le prompt ; il se lance en tapant `/verifier-page` dans le panneau Claude Code (pas dans un terminal Git Bash).
2. **Copilot** : le fichier `.github/prompts/verifier-page.prompt.md`, à la racine. Il commence par un en-tête dont le champ de mode s'appelle `agent` (valeur `ask`), pas `mode`. Il se lance dans Copilot Chat en tapant `/verifier-page` ou par la commande « Chat: Run Prompt ».

La grille, en cinq points : structure sémantique et ordre des titres, textes alternatifs, contraste des couleurs, navigation au clavier (liens visibles au focus), ressources externes interdites. Le prompt demande un rapport en trois listes : ce qui est bon, ce qui est à corriger avec la ligne concernée, ce qui n'a pas pu être vérifié.

Les fichiers à relire ne sont plus dans le dossier courant : la commande les reçoit en argument, avec leur chemin complet depuis la racine. Dans Claude Code, le mot après `/verifier-page` arrive dans `$ARGUMENTS` du fichier de commande. Dans Copilot, ce qui suit `/verifier-page` est transmis comme texte supplémentaire.

3. Lancer les deux sur la page de l'exercice :

       /verifier-page exercices/05-commande-a-moi/depart/index.html exercices/05-commande-a-moi/depart/style.css

   Comparer les deux rapports. Coller celui qu'on préfère dans `exercices/05-commande-a-moi/depart/rapport-relecture.md`.

## Livrable

Les deux fichiers de commande (à la racine) et `exercices/05-commande-a-moi/depart/rapport-relecture.md`.

## Si vous n'avez pas fini cet exercice

Les exercices 6 à 16 utilisent la commande. Une copie des deux fichiers est dans `ressources/commandes/`. Copiez-les à la racine de votre dossier, chacun à sa place : `verifier-page.md` dans `.claude/commands/` et `verifier-page.prompt.md` dans `.github/prompts/` (créez les dossiers s'ils n'existent pas).

## Pour aller plus loin

Relire un autre fichier : `/verifier-page` suivi du chemin du fichier (Claude Code : `$ARGUMENTS` dans le fichier de commande).
