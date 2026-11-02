# E16 · Les chiffres de la journée

**Point du programme** : mesure de productivité et suivi des prompts efficaces.

**Durée** : 15 minutes.

## Ce qu'on fait

Deux groupes, A et B, deux tâches de cinq minutes chacune, sur la page que vous avez construite aujourd'hui, avec ses photos d'E15.

**Avant de commencer : reprendre votre page.** Si le serveur d'E15 tourne encore, arrêtez-le (`Ctrl+C` dans son terminal). Puis, depuis la racine de votre dossier `stagiaire_J1`, une ligne après l'autre (elles marchent sous Windows comme sous Linux) :

    cp exercices/15-agent-photos/depart/index.html exercices/16-chiffres/depart/
    cp exercices/15-agent-photos/depart/style.css exercices/16-chiffres/depart/
    cp exercices/15-agent-photos/depart/script.js exercices/16-chiffres/depart/
    cp exercices/15-agent-photos/depart/servir.py exercices/16-chiffres/depart/
    cp exercices/15-agent-photos/depart/charger.py exercices/16-chiffres/depart/
    cp exercices/15-agent-photos/depart/carte.db exercices/16-chiffres/depart/
    cp -r exercices/15-agent-photos/depart/css exercices/16-chiffres/depart/
    cp -r exercices/15-agent-photos/depart/photos exercices/16-chiffres/depart/

Résultat attendu : aucun message. Une erreur « No such file » (« Cannot find path » sous PowerShell) veut dire que vous n'êtes pas à la racine (`pwd`). Si E15 n'a pas abouti, ces lignes reprennent la page fournie dans E15 : l'exercice fonctionne aussi.

Enregistrez cette copie, sinon elle serait comptée dans vos lignes écrites :

    git add exercices/16-chiffres/depart
    git commit -m "E16 : page d'E15 reprise comme point de départ"

Résultat attendu : une ligne qui commence par le nom de votre branche, puis le nombre de fichiers modifiés.

Pour voir la page, dans un **deuxième terminal** :

    cd exercices/16-chiffres/depart
    python servir.py

Le serveur reste en attente. Ouvrez http://127.0.0.1:8000/ et rechargez la page (F5) pour voir vos changements. Passez par cette adresse : ouvert directement, `index.html` ne peut pas charger la carte et la console affiche une erreur.

| | Tâche 1 : `tache-1-evenements.md` (section Événements du mois, trois cartes) | Tâche 2 : `tache-2-reservation.md` (formulaire de réservation) |
|---|---|---|
| Groupe A | sans IA : complétion coupée, ni chat ni Claude Code | avec IA (Copilot ou Claude Code, comme chacun veut) |
| Groupe B | avec IA (Copilot ou Claude Code, comme chacun veut) | sans IA : complétion coupée, ni chat ni Claude Code |

Couper la complétion : ouvrez `index.html` (sur un fichier Markdown, le menu affiche déjà « Disabled », ce qui ne vaut pas pour le HTML), icône Copilot dans la barre d'état en bas à droite, ligne **Inline Suggestions**, puis décochez **Ghost text suggestions** et **Next edit suggestions**. Pour la remettre, recochez ces deux cases. Si vous donnez la tâche à un outil, nommez le dossier : « Dans exercices/16-chiffres/depart/, fais la tâche décrite dans tache-1-evenements.md » (ou `tache-2-reservation.md`).

Les cinq minutes comptent la vérification. Une IA écrit la tâche en une demi-minute ; le temps qui compte, c'est celui de vérifier : ouvrez http://127.0.0.1:8000/ dans Chrome, F12, console sans erreur. Pour la tâche 2, cliquez le bouton sans rien remplir : une bulle de message apparaît à côté du premier champ. « Fait » sans « valide » ne compte pas comme fini.

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
