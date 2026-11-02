# E13 · Revue avant commit

**Point du programme** : revue de code automatisée et suggestions ; génération de commit.

**Durée** : 15 minutes.

## Ce qu'on fait

`depart/` contient la page réparée et `A-FAIRE.md`, une demande d'évolution : une section « Ils en parlent » avec trois avis clients (fictifs, dans `A-FAIRE.md`). On la fait écrire, on la fait relire **avant** de committer, on génère le message de commit. Les fichiers de l'exercice sont dans `exercices/13-revue-avant-commit/depart/`.

0. **Reprendre votre page.** Si l'exercice 12 a abouti, copiez votre page dans `exercices/13-revue-avant-commit/depart/`, en écrasant celle qui s'y trouve ; sinon, gardez celle qui est fournie. C'est la page réparée de l'exercice 12, avec son serveur et sa base. Ces lignes se lancent depuis la racine de votre dossier `stagiaire_J1`, avant tout `cd`, une ligne après l'autre (elles marchent sous Windows comme sous Linux) :

cp exercices/12-bug-glisse/depart/index.html exercices/13-revue-avant-commit/depart/
cp exercices/12-bug-glisse/depart/style.css exercices/13-revue-avant-commit/depart/
cp exercices/12-bug-glisse/depart/css/* exercices/13-revue-avant-commit/depart/css/
cp exercices/12-bug-glisse/depart/script.js exercices/13-revue-avant-commit/depart/
cp exercices/12-bug-glisse/depart/servir.py exercices/13-revue-avant-commit/depart/
cp exercices/12-bug-glisse/depart/charger.py exercices/13-revue-avant-commit/depart/
cp exercices/12-bug-glisse/depart/carte.db exercices/13-revue-avant-commit/depart/

   Résultat attendu : aucun message, et les fichiers copiés apparaissent dans `exercices/13-revue-avant-commit/depart/` (le dossier `css/` ne doit pas contenir un second `css/`). Une erreur « No such file » (« Cannot find path » sous PowerShell) veut dire que le chemin ou le dossier de départ est faux : rien n'a été écrit, vérifiez que vous êtes à la racine (`pwd`).

1. Dans le terminal, à la racine du dépôt, vérifiez que votre dépôt est propre :

       git status

   Résultat attendu : `nothing to commit, working tree clean`. Si des fichiers des exercices précédents apparaissent modifiés, **y compris la page que vous venez de copier à l'étape 0**, committez-les d'abord (`git add -A` puis `git commit -m "Fin des exercices précédents"`), sinon la relecture portera aussi sur eux et pas seulement sur la nouvelle section. Rien n'est perdu : un commit se défait.
2. Dans Claude Code :

   > Dans exercices/13-revue-avant-commit/depart/, fais ce que demande A-FAIRE.md.

   Ouvrez `A-FAIRE.md` ou `index.html` avant, pour que l'outil sache de quel dossier on parle. Lisez ce qu'il a écrit : les trois avis doivent être recopiés mot pour mot, sans étoile ni superlatif ajouté.
3. Vérifier dans Chrome. La page lit la carte dans la base : lancez le serveur dans un **deuxième terminal** (bouton **+** du panneau Terminal).

       cd exercices/13-revue-avant-commit/depart
       pwd
       python servir.py

   Résultat attendu : `pwd` affiche un chemin qui se termine par `exercices/13-revue-avant-commit/depart`, puis le serveur affiche une adresse et reste en attente (`Ctrl+C` l'arrête). Ouvrez http://127.0.0.1:8000/. Si vous ouvrez `index.html` par double-clic, la console affiche une erreur 404 sur `/api/carte` : c'est normal sans le serveur.
4. Ne pas committer. Dans `index.html`, sélectionner toute la nouvelle section, clic droit, menu **Copilot**, **Review** (libellés de la documentation GitHub ; si vous ne les voyez pas, cherchez une entrée de revue dans ce menu et dites-moi son nom). Les remarques apparaissent dans l'éditeur et dans le panneau Comments. Autre chemin, sans sélection : dans la vue Source Control (Ctrl+Maj+G), survoler « CHANGES » fait apparaître le bouton « Copilot Code Review - Uncommitted Changes ».
5. Corriger ce qui mérite de l'être, à la main ou en le demandant à l'outil. Ignorer le reste en le disant pourquoi.
6. Dans la vue Source Control (Ctrl+Maj+G), tout ajouter, puis cliquer l'icône étincelle à droite du champ de message : Copilot écrit le message de commit. Le relire, le corriger s'il décrit mal, committer.

## Livrable

Un commit dont le message a été généré, après revue. `message-de-commit.md` : le message généré tel quel, et le message gardé.

## Ce qu'on retient

- Dans VS Code, Copilot ne relit que ce qui n'est pas encore commité (ou une sélection). Pour relire une pull request entière, c'est la page GitHub, « Reviewers », Copilot, en offre Pro ou en organisation.
- Claude Code a ses propres revues, `/code-review` et `/security-review`, sans Copilot. Elles relisent tout ce qui n'est pas commité, donc le dépôt doit être propre sauf la section d'E13. `/code-review` répond en JSON brut, `/security-review` en anglais. Lisez les remarques, ne les acceptez pas en bloc.
- Le message de commit généré décrit ce qui a changé ; c'est à vous d'y mettre pourquoi.
