# E3 · Où tournent mes outils, où vont mes données ?

**Point du programme** : comparatif cloud contre local, sécurité, performance, connectivité.

**Durée** : 15 minutes. Le modèle local (Ollama) et les données personnelles sont traités au Jour 2.

## L'idée

Un agent, c'est deux choses :

- le **harnais**, qui tourne sur votre poste : c'est le programme qui lit vos fichiers, écrit, lance des commandes et vous demande la permission (Copilot et Claude Code dans VS Code) ;
- le **modèle**, qui tourne dans le cloud : c'est lui qui réfléchit et décide quoi faire.

À chaque demande, le harnais envoie au modèle votre prompt, les fichiers qu'il a lus, et ce qui est ouvert ou sélectionné dans l'éditeur. La question n'est donc pas seulement « où tourne l'outil », mais « chez qui part ce que je lui donne ».

## Ce qu'on fait

Ouvrez `exercices/03-cloud-local/depart/fiche.md` et répondez aux cinq questions et à la conclusion, en une ou deux lignes. Les réponses se trouvent dans ce que vous avez vu en E1 et en E2, dans l'interface des deux outils, et dans les réglages de vos comptes.

- Ne cherchez pas dans les Settings de VS Code : la réponse n'y est pas.
- Chacun regarde ses propres réglages, sur son écran. Rien de personnel au vidéoprojecteur.
- Ne changez aucun réglage pendant l'exercice : on en parle ensemble au débrief, puis chacun décide.

## Livrable

`exercices/03-cloud-local/depart/fiche.md` remplie.

## Si l'outil ne répond pas

Les questions 1, 2 et 4 se font sans réseau, à partir de ce que vous avez vu le matin. La question 5 demande Internet : la formatrice montre les deux réglages en captures.

## Sources

- Harnais d'agent dans VS Code : https://code.visualstudio.com/docs/agents/run/agent-harnesses
- Hébergement des modèles de Copilot : https://docs.github.com/en/copilot/reference/ai-models/model-hosting
- Données dans Claude Code : https://code.claude.com/docs/en/data-usage
