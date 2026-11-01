# E16 · Les chiffres de la journée

**Point du programme** : mesure de productivité et suivi des prompts efficaces.

**Durée** : 15 minutes.

## Ce qu'on fait

Deux groupes, A et B, deux tâches de cinq minutes chacune, dans `exercices/16-chiffres/depart/`. Le dossier est la page de l'exercice 10, sans serveur ni base : les deux tâches ne dépendent de rien d'autre que du HTML et du CSS. Pour voir le résultat, ouvrez `index.html` dans Chrome : pas de serveur à lancer.

| | Tâche 1 : `tache-1-evenements.md` (section Événements du mois, trois cartes) | Tâche 2 : `tache-2-reservation.md` (formulaire de réservation) |
|---|---|---|
| Groupe A | sans IA : complétion coupée, ni chat ni Claude Code | avec IA (Copilot ou Claude Code, comme chacun veut) |
| Groupe B | avec IA (Copilot ou Claude Code, comme chacun veut) | sans IA : complétion coupée, ni chat ni Claude Code |

Couper la complétion : icône Copilot dans la barre d'état en bas à droite, « Désactiver les complétions ». La remettre à l'inverse. Si vous donnez la tâche à un outil, nommez le dossier : « Dans exercices/16-chiffres/depart/, fais la tâche décrite dans tache-1-evenements.md » (ou `tache-2-reservation.md`).

Les cinq minutes comptent la vérification. Une IA écrit la tâche en une demi-minute ; le temps qui compte, c'est celui de vérifier : ouvrez la page dans Chrome, F12, console sans erreur. Pour la tâche 2, cliquez le bouton sans rien remplir : une bulle de message apparaît à côté du premier champ. « Fait » sans « valide » ne compte pas comme fini.

Au bout de cinq minutes, chacun remplit sa ligne dans `feuille-de-releve.md` : fait ou pas, page valide ou pas (F12, console sans erreur, section visible), nombre de lignes écrites.

Lignes écrites : dans le terminal, placez-vous dans le dossier de l'exercice, puis comptez les lignes ajoutées :

    cd exercices/16-chiffres/depart
    pwd
    git add -A .
    git diff --cached --stat .

`git add -A .` prépare les fichiers de ce dossier pour un commit, sans committer : rien n'est écrit dans l'historique. Résultat attendu : la liste de vos fichiers avec, en dernière ligne, « N insertions(+) ». Notez ce N, c'est le nombre de lignes ajoutées, que vous les ayez écrites ou acceptées. Le comptage est fait par git : il compte aussi ce que l'IA a écrit.
 Le formateur compile au tableau avec les chronos de la journée (E2, E8, E15).

Puis quatre minutes : chacun relit son historique de la journée (panneau Copilot Chat, sessions Claude Code) et note ses trois meilleurs prompts dans `PROMPTS.md`, avec ce qui les a rendus efficaces.

## Livrable

`feuille-de-releve.md` remplie, `PROMPTS.md`.

## Ce qu'on retient

Deux études sérieuses disent l'inverse l'une de l'autre : plus 55 % (GitHub, 2022, tâche courte et bien spécifiée) et moins 19 % (METR, 2025, développeurs expérimentés sur leurs propres dépôts). La mesure dépend de la tâche, du dépôt et de l'expérience. La vôtre est au tableau. Ce qui fait la différence n'est pas l'outil : c'est la précision du prompt et la connaissance du projet. `PROMPTS.md` devient un fichier d'équipe.
