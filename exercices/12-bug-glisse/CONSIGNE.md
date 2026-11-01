# E12 · Le bug glissé

**Point du programme** : détection et correction de bugs avec l'IA (SonarQube, ZAP, LLM).

**Durée** : 15 minutes.

## Ce qu'on fait

`depart/` contient la page de l'exercice 11, mais la carte ne s'affiche plus. Deux bugs, pas un. Chaque commande de cet exercice se lance depuis `exercices/12-bug-glisse/depart`.

0. **Choisir votre page.** Deux chemins.

   **(a) Par défaut : gardez le `depart/` fourni.** C'est le scénario prévu : la page est déjà cassée, et vous n'avez rien à copier. Passez à l'étape 1.

   **(b) Fil rouge : cassez votre propre page.** Si l'exercice 11 a abouti et que vous voulez garder votre page, copiez-la dans `exercices/12-bug-glisse/depart/`, puis posez vous-même les deux bugs. Les lignes `cp` se lancent depuis la racine de votre dossier `stagiaire_J1`, avant tout `cd`, une ligne après l'autre (elles marchent sous Windows comme sous Linux) :

       cp exercices/11-carte-en-base/depart/index.html exercices/12-bug-glisse/depart/
       cp exercices/11-carte-en-base/depart/style.css exercices/12-bug-glisse/depart/
       cp exercices/11-carte-en-base/depart/css/* exercices/12-bug-glisse/depart/css/
       cp exercices/11-carte-en-base/depart/script.js exercices/12-bug-glisse/depart/
       cp exercices/11-carte-en-base/depart/servir.py exercices/12-bug-glisse/depart/
       cp exercices/11-carte-en-base/depart/charger.py exercices/12-bug-glisse/depart/
       cp exercices/11-carte-en-base/depart/carte.db exercices/12-bug-glisse/depart/

   Résultat attendu : aucun message, et les fichiers copiés apparaissent dans `exercices/12-bug-glisse/depart/` (pas de `css/css/`). Puis les deux bugs, dans les fichiers copiés :

   - dans `script.js`, à la ligne `const reponse = await fetch("/api/carte");`, ajoutez un `s` : `"/api/cartes"` ;
   - dans `index.html`, section « La carte », supprimez la ligne `</div>` qui ferme la colonne « À manger », celle qui suit `<ul data-categorie="plat"></ul>` et précède `<noscript>` ; la colonne « Bières et cidre » garde le sien. Si le balisage de votre page est autre, supprimez la fermeture de la dernière colonne de la carte.

   Enregistrez les deux fichiers (Ctrl+S) avant de continuer. Le reste de l'exercice est le même : la carte est vide, le Happy hour passe à droite. À l'exercice 13, vous reprendrez la page réparée de l'exercice 12, la vôtre ou celle du `depart/`.

1. Dans le terminal, placez-vous dans le dossier de l'exercice et vérifiez où vous êtes :

       cd exercices/12-bug-glisse/depart
       pwd

   Résultat attendu : un chemin qui se termine par `exercices/12-bug-glisse/depart`. Sinon, revenez à la racine avec `cd ../../..` et recommencez.

2. Lancer le chargement de la base :

       python charger.py

   Résultat attendu : une ligne qui annonce vingt lignes chargées. Ce script réécrit `carte.db`, que git suit : `git status` va le montrer modifié. C'est normal. Pour le remettre dans son état d'origine, quand vous voulez : `git restore exercices/12-bug-glisse/depart/carte.db` depuis la racine du dépôt (`cd ../../..`), ou `git restore carte.db` depuis le dossier de l'exercice. Cela ne touche qu'à ce fichier.
3. Lancer le serveur dans un **deuxième terminal** (bouton **+** du panneau Terminal), qui reste occupé tant que le serveur tourne :

       cd exercices/12-bug-glisse/depart
       python servir.py

   Résultat attendu : une adresse affichée, puis plus rien (ce serveur n'écrit pas les requêtes). `Ctrl+C` l'arrête. Ouvrir http://127.0.0.1:8000/ : la carte est vide. F12, onglet Console et onglet Réseau : regarder avant de demander.
4. Décrire le **symptôme** à l'outil, pas la cause supposée. Dans Copilot Chat, `/fix` avec `script.js` ouvert, ou dans Claude Code :

   > Dans exercices/12-bug-glisse/depart/, la carte ne s'affiche plus dans la page servie par servir.py. La console du navigateur dit : [coller le message]. Trouve la cause et corrige.

5. Un bug corrigé, la carte revient. Regardez bien la page : l'encadré vert « Happy hour » est passé à droite de la carte, comme une troisième colonne. Le second bug se voit donc, mais sa cause ne se devine pas : la page s'affiche, la structure est cassée. L'outil a probablement déclaré le reste correct. Lancer l'analyse **SonarQube for IDE** (extension VS Code, analyse locale) : clic droit sur le dossier, « SonarQube for IDE: Analyze all project files », ou ouvrir `index.html` et regarder l'onglet Problèmes. Vous pouvez aussi demander à l'outil de relire le balisage de `index.html` sans rien modifier.
6. Corriger le second, noter les deux dans `rapport-sonar.md` (à créer dans `exercices/12-bug-glisse/depart/`).

## Livrable

Page réparée, `rapport-sonar.md` : les deux bugs, comment chacun a été trouvé, par qui (vous, le navigateur, le LLM, Sonar).

## Ce qu'on retient

Le navigateur a vu le premier bug avant tout le monde. Sonar a trouvé la cause du second, que l'œil voit sans l'expliquer. Le LLM a corrigé les deux une fois qu'on lui a dit quoi regarder. Ce sont trois outils différents, pas trois versions du même.
