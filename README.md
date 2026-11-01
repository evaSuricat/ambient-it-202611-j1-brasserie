# Le Pigala : une page pour une brasserie, en seize exercices

Formation « Développeurs : boostez vos performances grâce à l'IA » (Ambient IT, novembre 2026), journée 1.

Le fil rouge : une brasserie-restaurant de Montreuil, fictive, qui veut une seule page web. On la construit avec les assistants IA de l'éditeur, par petits exercices de 10 à 20 minutes qui suivent le programme de la journée. Le brief est dans `brief.md`, la carte dans `ressources/`.

## Démarrer

Prérequis : VS Code avec les extensions GitHub Copilot et Claude Code connectées, Git, Python 3.12, Google Chrome.

1. Créer un dossier `stagiaire_J1`, l'ouvrir dans VS Code (Fichier, Ouvrir le dossier, puis « Yes, I trust the authors »), et y cloner ce dépôt depuis un terminal de VS Code, sans oublier le point final :

       git clone https://github.com/evaSuricat/ambient-it-202611-j1-brasserie.git .

2. Créer sa branche de travail, une par personne, depuis un terminal de VS Code :

       git switch -c prenom

3. Garder la racine de `stagiaire_J1` ouverte toute la journée : c'est là que les assistants lisent `AGENTS.md` (écrit à l'exercice 4) et le skill `/verifier-page` (écrit à l'exercice 5). Pour chaque exercice, lire son `CONSIGNE.md` dans `exercices/NN-nom/`. Les prompts nomment le dossier de l'exercice (« Dans exercices/NN-nom/depart/, … »), et les commandes du terminal se lancent depuis la racine, sauf quand la consigne dit de faire `cd` dans `depart/`.

## Une seule page, d'exercice en exercice

Chaque exercice reprend votre page de l'exercice précédent : l'étape « Reprendre votre page » de la consigne la recopie dans le `depart/` de l'exercice. En fin de journée, votre page porte tout ce que vous avez fait. Si un exercice n'a pas abouti, gardez le `depart/` fourni : c'est la solution de l'exercice précédent, vous repartez propre. Deux exceptions : l'exercice 12 part par défaut de la page fournie, qui contient un bug posé exprès, et l'exercice 16 repart de la page de l'exercice 10.

| Exercice | Point du programme |
|---|---|
| 01 Trois outils, un prompt | Copilot, Claude Code, ChatGPT : qui lit quoi |
| 02 Une page en un prompt | Vibe coding, chronométré |
| 03 Cloud ou local ? | Où tournent l'agent et le modèle, où vont les données |
| 04 Les règles du projet | Personnaliser son IDE : fichiers d'instructions |
| 05 Une commande à moi | Personnaliser son IDE : commandes et skills |
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
