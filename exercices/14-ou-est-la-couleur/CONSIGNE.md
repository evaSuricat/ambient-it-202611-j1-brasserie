# E14 · Où est la couleur ?

**Point du programme** : recherche assistée sur la base de code.

**Durée** : 10 minutes.

## Ce qu'on fait

Trois questions, posées d'abord à Copilot Chat avec `@workspace`, puis à Claude Code, puis comparées à Ctrl+Maj+F. Cet exercice ne modifie aucun fichier de la page : il cherche. Les fichiers sont dans `exercices/14-ou-est-la-couleur/depart/`. Comme le dépôt contient seize copies de la page, la première question nomme ce dossier.

**Posez les trois questions dans la même conversation**, l'une après l'autre, sans « Nouvelle conversation » entre elles : la question 2 dit « cette couleur », et l'outil ne sait de quelle couleur vous parlez que grâce à la réponse à la question 1.

1. Copilot Chat, en mode Ask : `@workspace Dans exercices/14-ou-est-la-couleur/depart/, où la couleur principale de la page est-elle définie ?`
2. `@workspace Où cette couleur est-elle utilisée, fichier par fichier ?`
3. `@workspace Si je remplace l'orange de l'enseigne par un rouge, qu'est-ce qui change à l'écran, et qu'est-ce qui risque de casser ?`

Puis la même chose dans Claude Code : mêmes questions, **sans** `@workspace`. Claude Code l'ignore sans dégât, mais il ne sert à rien. Question 1 : `Dans exercices/14-ou-est-la-couleur/depart/, où la couleur principale de la page est-elle définie ?` Les deux autres, telles quelles, dans la même conversation.

Enfin la recherche classique, limitée au dossier de l'exercice. Sans cette limite, elle couvre tous les exercices et renvoie une trentaine de lignes. Dans l'explorateur, clic droit sur le dossier `14-ou-est-la-couleur`, puis « Find in Folder… » (libellé à vérifier à l'écran). Autre façon : ouvrir Ctrl+Maj+F et saisir `exercices/14-ou-est-la-couleur` dans le champ « files to include ». Chercher `F26B1D`, puis `--orange`.

Résultat attendu : `F26B1D` donne 2 résultats dans 2 fichiers (`style.css` ligne 3, `brief.md` ligne 39) ; `--orange` donne 7 résultats dans 1 fichier (`style.css`). Si vous en voyez beaucoup plus, la recherche n'est pas limitée au dossier.

## Livrable

`reponses.md`, à créer dans `exercices/14-ou-est-la-couleur/depart/` : les trois réponses de chaque outil, et une ligne : ce que la recherche classique ne dit pas.

## Ce qu'on retient

Sur ce dépôt de cinq fichiers, la recherche classique suffit presque. Sur un dépôt de deux cent mille lignes, la question 3 est celle qu'on se pose vraiment, et c'est la seule que Ctrl+Maj+F ne sait pas poser.
