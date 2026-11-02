# E11 · La carte en base

**Point du programme** : le vibe coding et SQL ; la page devient une petite application.

**Durée** : 20 minutes.

## Ce qu'on fait

`depart/` contient la page relue et `carte.csv`. Vous travaillez à la racine du dépôt dans VS Code, et chaque commande de cet exercice se lance depuis `exercices/11-carte-en-base/depart`. La carte, aujourd'hui écrite dans le HTML, va vivre dans une base SQLite servie par Python. SQLite est inclus dans Python : rien à installer.

0. **Reprendre votre page.** Si l'exercice 10 a abouti, copiez votre page dans `exercices/11-carte-en-base/depart/`, en écrasant celle qui s'y trouve ; sinon, gardez celle qui est fournie. Seule la page se copie (HTML, feuille de style et dossier `css/`) : le script et le serveur sont à écrire dans cet exercice. Ces lignes se lancent depuis la racine de votre dossier `stagiaire_J1`, avant tout `cd`, une ligne après l'autre (elles marchent sous Windows comme sous Linux) :

       cp exercices/10-relire/depart/index.html exercices/11-carte-en-base/depart/
       cp exercices/10-relire/depart/style.css exercices/11-carte-en-base/depart/
       cp exercices/10-relire/depart/css/* exercices/11-carte-en-base/depart/css/

   Résultat attendu : aucun message, et les fichiers copiés apparaissent dans `exercices/11-carte-en-base/depart/` (le dossier `css/` ne doit pas contenir un second `css/`). Une erreur « No such file » (« Cannot find path » sous PowerShell) veut dire que le chemin ou le dossier de départ est faux : rien n'a été écrit, vérifiez que vous êtes à la racine (`pwd`).

   Enregistrez ce point de départ, toujours depuis la racine :

       git add exercices/11-carte-en-base
       git commit -m "E11 : état avant la base"

1. Dans le terminal, placez-vous dans le dossier de l'exercice, puis vérifiez où vous êtes :

       cd exercices/11-carte-en-base/depart
       pwd

   Résultat attendu : un chemin qui se termine par `exercices/11-carte-en-base/depart`. Sinon, revenez à la racine avec `cd ../../..` et recommencez.

2. Dans Claude Code, trois prompts, envoyés un par un : attendez sa réponse avant le suivant.

   Premier prompt :

       Dans exercices/11-carte-en-base/depart/, écris charger.py : il crée carte.db (SQLite) avec une table carte (id, categorie, nom, description, prix) et la remplit depuis carte.csv. Relançable : il vide la table avant de recharger.

   Deuxième prompt :

       Dans exercices/11-carte-en-base/depart/, écris servir.py : un serveur http.server sur 127.0.0.1:8000 (le port peut être donné en argument : python servir.py 8001) qui sert ce dossier sans cache, et répond sur /api/carte avec la carte en JSON, triée par catégorie puis par nom. Ne lance pas le serveur toi-même : je le lancerai dans mon terminal.

   Troisième prompt :

       Dans exercices/11-carte-en-base/depart/index.html, remplace les deux listes de la carte par des listes vides remplies par un script.js qui appelle /api/carte. Garde la carte actuelle dans un <noscript>. Si l'appel échoue, la page affiche : La carte n'a pas pu être chargée. Pas de bibliothèque.

3. **Lire chaque requête SQL avant de lancer** : `CREATE TABLE`, `INSERT`, `SELECT`. Demander « explique la requête » au moindre doute. Lire aussi le texte ajouté pour les erreurs : il doit venir de vous, pas de l'outil.
4. Lancer le chargement de la base, dans le terminal où vous êtes :

       python charger.py

   Si `python` n'existe pas (Mac, certains Linux), tapez `python3`, ici et dans la suite. Résultat attendu : une ligne qui annonce vingt lignes chargées, et `carte.db` qui apparaît dans l'explorateur. Vous pouvez le relancer sans risque : il vide la table avant de recharger.
5. Lancer le serveur **dans son propre terminal**. Un serveur ne rend jamais la main : si Claude Code le lance à votre place, la conversation reste bloquée. Si cela arrive, `Ctrl+C` dans le terminal, ou dites à Claude Code de ne pas lancer le serveur. Ouvrez un deuxième terminal (bouton **+** en haut à droite du panneau Terminal), puis :

       cd exercices/11-carte-en-base/depart
       python servir.py

   Résultat attendu : une adresse affichée, puis le terminal reste en attente (et affiche une ligne par requête reçue). C'est normal. `Ctrl+C` l'arrête. Si le port 8000 est pris, relancez avec `python servir.py 8001` et changez le numéro dans l'adresse de Chrome.
6. Dans Chrome, ouvrir http://127.0.0.1:8000/. La carte s'affiche, triée par ordre alphabétique : c'est le tri demandé, pas celui de `carte.md`. F12, onglet **Network** (Réseau), F5 : une ligne `carte` apparaît, avec le statut 200. Cliquez dessus : **Preview** montre les vingt plats, **Initiator** montre que c'est `script.js` qui les a demandés.
7. La preuve que la carte vient de la base : changer un prix dans la base et recharger la page. Dans le premier terminal (celui qui n'est pas occupé par le serveur) :

       python -c "import sqlite3; c=sqlite3.connect('carte.db'); c.execute('UPDATE carte SET prix=3.9 WHERE nom=?', ('Pigala Blonde',)); c.commit()"

   Résultat attendu : aucune réponse à l'écran, puis, après rechargement, Pigala Blonde à 3,90 €, sans que `index.html` ait changé. Le changement est déjà enregistré dans la base. Remettez ensuite le vrai prix :

       python charger.py

   Attention : `charger.py` efface la table et la recharge depuis `carte.csv`. Tout changement fait seulement dans la base est alors perdu. Où est la vérité : dans le CSV ou dans la base ?
8. Le cas d'erreur. Arrêtez le serveur (`Ctrl+C` dans son terminal), puis F5 dans Chrome : « Ce site est inaccessible ». C'est normal, le serveur envoyait toute la page. Ouvrez maintenant `exercices/11-carte-en-base/depart/index.html` par double-clic : la page s'affiche, avec le message « La carte n'a pas pu être chargée. » à la place de la carte.
9. Committer, depuis la racine :

       cd ../../..
       git add exercices/11-carte-en-base
       git commit -m "E11 : carte en base SQLite, servie par Python et lue par script.js"

   Résultat attendu : une ligne « files changed », avec `charger.py`, `servir.py` et `script.js`.

## Livrable

`charger.py`, `carte.db`, `servir.py`, `script.js`, la page branchée sur l'API. F12, onglet Réseau : la requête `/api/carte` apparaît.

## Ce qu'on retient

À partir d'ici, le double-clic ne suffit plus : la carte passe par le serveur, il faut `python servir.py` pour voir la page complète. L'IA écrit du SQL juste la plupart du temps, et faux de temps en temps, avec la même assurance. Le Jour 2 reprend cette base avec une table de réservations et des données personnelles : ce qu'on envoie au modèle, ce qu'on anonymise.
