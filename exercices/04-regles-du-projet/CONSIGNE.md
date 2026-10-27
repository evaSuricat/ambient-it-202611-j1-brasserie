# E4 · Les règles du projet

**Point du programme** : atelier officiel « personnaliser son IDE avec plusieurs assistants IA », première partie, les fichiers d'instructions.

**Durée** : 20 minutes.

## Ce qu'on fait

`depart/` contient la page de l'exercice 2 et le brief. Il manque la section horaires. Avant de la demander, on écrit les règles du projet là où chaque outil les lit :

1. `.github/copilot-instructions.md` : lu par Copilot (chat et agent) pour tout le dépôt.
2. `CLAUDE.md` à la racine du dossier : lu par Claude Code au démarrage.

Les règles, les mêmes dans les deux fichiers, viennent des « Contraintes techniques » et du « Ton » du brief : français, HTML sémantique, un seul `h1`, aucun framework, aucune police web, aucun script externe, texte alternatif sur toute image, contraste 4,5 pour 1, pas de tutoiement, pas de superlatif.

3. Puis le test. Le même prompt aux deux outils, l'un après l'autre (Copilot en mode Agent, puis Claude Code) :

   > Ajoute une section horaires et soirées d'après brief.md, entre la carte et la section venir, avec un lien dans la navigation.

4. Comparer : qui a respecté quoi ? Qu'est-ce qui manque dans vos règles pour que le résultat soit celui que vous vouliez ?

## Livrable

Les deux fichiers d'instructions et la section horaires dans `index.html`.

## Piège à observer

Sans fichier d'instructions, un des deux outils ajoute volontiers une police Google ou une icône depuis un CDN. Avec, il ne le fait plus. Si ça arrive quand même, la règle n'était pas assez claire : la reformuler, c'est l'exercice.
