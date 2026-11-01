# Feuille de relevé E16

Une ligne par personne et par tâche. « Fait » : la condition « fini quand » de la tâche est remplie à cinq minutes. « Valide » : console sans erreur, section visible.

| Prénom | Groupe | Tâche | Avec IA | Fait (oui/non) | Valide (oui/non) | Lignes écrites | Remarque |
|---|---|---|---|---|---|---|---|
| | A | 1 | non | | | | |
| | A | 2 | oui | | | | |
| | B | 1 | oui | | | | |
| | B | 2 | non | | | | |

Lignes écrites : dans le terminal, placez-vous dans le dossier de l'exercice, puis comptez les lignes ajoutées :

    cd exercices/16-chiffres/depart
    pwd
    git add -A .
    git diff --cached --stat .

`git add -A .` prépare les fichiers de ce dossier pour un commit, sans committer : rien n'est écrit dans l'historique. Résultat attendu : la liste de vos fichiers avec, en dernière ligne, « N insertions(+) ». Notez ce N, c'est le nombre de lignes ajoutées, que vous les ayez écrites ou acceptées. Le comptage est fait par git : il compte aussi ce que l'IA a écrit.

## Chronos de la journée (relevés au tableau)

| Exercice | Temps le plus court | Temps médian | Temps le plus long |
|---|---|---|---|
| E2, une page en un prompt | | | |
| E8, de la maquette à la page | | | |
| E15, l'agent et les photos | | | |

## Compilation

| | Sans IA | Avec IA |
|---|---|---|
| Tâches finies en cinq minutes | /  | /  |
| Dont valides | | |
