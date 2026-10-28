# Le Pigala : une page pour une brasserie, en seize exercices

Formation « Développeurs : boostez vos performances grâce à l'IA » (Ambient IT, novembre 2026), journée 1.

Le fil rouge : une brasserie-restaurant de Montreuil, fictive, qui veut une seule page web. On la construit avec les assistants IA de l'éditeur, par petits exercices de 10 à 20 minutes qui suivent le programme de la journée. Le brief est dans `brief.md`, la carte dans `ressources/`.

## Démarrer

Prérequis : VS Code avec les extensions GitHub Copilot et Claude Code connectées, Git, Python 3.12, Google Chrome.

1. Cloner ce dépôt et l'ouvrir dans VS Code (Fichier, Ouvrir le dossier).
2. Créer sa branche de travail, une par personne, depuis un terminal de VS Code :

       git switch -c prenom

3. Lire le `CONSIGNE.md` de l'exercice en cours dans `exercices/`, puis **ouvrir son dossier `depart/` comme dossier de travail** : Fichier, Ouvrir le dossier, choisir `exercices/NN-nom/depart`. Les assistants lisent leurs fichiers d'instructions et leurs commandes à la racine du dossier ouvert, pas plus haut. Claude Code en terminal se lance depuis ce même dossier.

## Les exercices sont indépendants

Chaque exercice a un dossier `depart/` qui contient tout ce qu'il faut pour le faire, même si l'exercice précédent n'a pas été fini : le `depart/` d'un exercice est la solution du précédent. Celui qui est en avance continue dans son propre dossier, celui qui a décroché repart propre.

| Exercice | Point du programme |
|---|---|
| 01 Trois outils, un prompt | Copilot, Claude Code, ChatGPT : qui lit quoi |
| 02 Une page en un prompt | Vibe coding, chronométré |
| 03 Cloud ou local ? | Où tournent l'agent et le modèle, où vont les données |
| 04 Les règles du projet | Personnaliser son IDE : fichiers d'instructions |
| 05 Une commande à moi | Personnaliser son IDE : commandes et fichiers de prompt |
| 06 Casse ta page | Apprendre par l'expérimentation, git comme filet |
| 07 La maquette en dix minutes | Création d'UI avec un outil IA |
| 08 De la maquette à la page | Coder une petite application en vibe coding |
| 09 La carte, ligne à ligne | Génération de snippets |
| 10 Relire ce qu'on n'a pas écrit | Relecture et amélioration du code généré |
| 11 La carte en base | SQL avec l'IA, la page devient une application |
| 12 Le bug glissé | Détection et correction de bugs |
| 13 Revue avant commit | Revue de code automatisée, message de commit |
| 14 Où est la couleur ? | Recherche assistée dans la base de code |
| 15 L'agent fait le sale boulot | Automatiser une tâche répétitive avec un agent |
| 16 Les chiffres de la journée | Mesure de productivité, prompts efficaces |

## Les branches

- `main` : les dossiers `depart/` seuls. On y travaille dans sa branche, au prénom.
- Les solutions (un résultat possible, pas le seul) vivent dans un dépôt privé à part, `ambient-it-202611-j1-brasserie-solutions`, montré par la formatrice à la correction.

## Le serveur local

À partir de l'exercice 11, la page lit la carte depuis une petite base SQLite servie par Python. Depuis le dossier de l'exercice :

    python servir.py

Puis http://127.0.0.1:8000/ dans Chrome. Ctrl+C pour arrêter. Avant l'exercice 11, la page s'ouvre directement depuis l'explorateur de fichiers, en double-cliquant sur `index.html`.
