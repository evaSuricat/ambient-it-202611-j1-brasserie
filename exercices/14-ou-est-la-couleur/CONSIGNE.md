# E14 · Où est la couleur ?

**Point du programme** : recherche assistée sur la base de code.

**Durée** : 10 minutes.

## Ce qu'on fait

Trois questions, posées d'abord à Copilot Chat avec `@workspace`, puis à Claude Code, puis comparées à Ctrl+Maj+F.

1. `@workspace Où la couleur principale de la page est-elle définie ?`
2. `@workspace Où cette couleur est-elle utilisée, fichier par fichier ?`
3. `@workspace Si je remplace l'orange de l'enseigne par un rouge, qu'est-ce qui change à l'écran, et qu'est-ce qui risque de casser ?`

Puis Ctrl+Maj+F sur `F26B1D` et sur `--orange`.

## Livrable

`reponses.md` : les trois réponses de chaque outil, et une ligne : ce que la recherche classique ne dit pas.

## Ce qu'on retient

Sur ce dépôt de cinq fichiers, la recherche classique suffit presque. Sur un dépôt de deux cent mille lignes, la question 3 est celle qu'on se pose vraiment, et c'est la seule que Ctrl+Maj+F ne sait pas poser.
