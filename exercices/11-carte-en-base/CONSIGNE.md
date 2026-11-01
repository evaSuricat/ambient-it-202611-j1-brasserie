# E11 · La carte en base

**Point du programme** : le vibe coding et SQL ; la page devient une petite application.

**Durée** : 20 minutes.

## Ce qu'on fait

`depart/` contient la page relue et `carte.csv`. Vous travaillez à la racine du dépôt dans VS Code, et chaque commande de cet exercice se lance depuis `exercices/11-carte-en-base/depart`. La carte, aujourd'hui écrite dans le HTML, va vivre dans une base SQLite servie par Python. SQLite est inclus dans Python : rien à installer.

1. Dans le terminal, placez-vous dans le dossier de l'exercice, puis vérifiez où vous êtes :

       cd exercices/11-carte-en-base/depart
       pwd

   Résultat attendu : un chemin qui se termine par `exercices/11-carte-en-base/depart`. Sinon, revenez à la racine avec `cd ../../..` et recommencez.

2. Dans Claude Code, un prompt en trois parties, ou trois prompts :

   > 1. Dans exercices/11-carte-en-base/depart/, écris charger.py : il crée carte.db (SQLite) avec une table carte (id, categorie, nom, description, prix) et la remplit depuis carte.csv. Relançable : il vide la table avant de recharger.
   > 2. Dans exercices/11-carte-en-base/depart/, écris servir.py : un serveur http.server sur 127.0.0.1:8000 (le port peut être donné en argument : python servir.py 8001) qui sert ce dossier sans cache, et répond sur /api/carte avec la carte en JSON, triée par catégorie puis par nom. Ne lance pas le serveur toi-même : je le lancerai dans mon terminal.
   > 3. Dans exercices/11-carte-en-base/depart/index.html, remplace les deux listes de la carte par des listes vides remplies par un script.js qui appelle /api/carte. Garde la carte actuelle dans un `<noscript>`. Si l'appel échoue, la page affiche : La carte n'a pas pu être chargée. Pas de bibliothèque.

3. **Lire chaque requête SQL avant de lancer** : `CREATE TABLE`, `INSERT`, `SELECT`. Demander « explique la requête » au moindre doute. Lire aussi le texte ajouté pour les erreurs : il doit venir de vous, pas de l'outil.
4. Lancer le chargement de la base, dans le terminal où vous êtes :

       python charger.py

   Résultat attendu : une ligne qui annonce vingt lignes chargées, et `carte.db` qui apparaît dans l'explorateur. Vous pouvez le relancer sans risque : il vide la table avant de recharger.
5. Lancer le serveur **dans son propre terminal**. Un serveur ne rend jamais la main : si Claude Code le lance à votre place, la conversation reste bloquée. Si cela arrive, `Ctrl+C` dans le terminal, ou dites à Claude Code de ne pas lancer le serveur. Ouvrez un deuxième terminal (bouton **+** en haut à droite du panneau Terminal), puis :

       cd exercices/11-carte-en-base/depart
       python servir.py

   Résultat attendu : une adresse affichée, puis le terminal reste en attente (et affiche une ligne par requête reçue). C'est normal. `Ctrl+C` l'arrête. Si le port 8000 est pris, relancez avec `python servir.py 8001` et changez le numéro dans l'adresse de Chrome.
6. Dans Chrome, ouvrir http://127.0.0.1:8000/.
7. La preuve que la carte vient de la base : changer un prix dans la base et recharger la page. Dans le premier terminal (celui qui n'est pas occupé par le serveur) :

       python -c "import sqlite3; c=sqlite3.connect('carte.db'); c.execute(\"UPDATE carte SET prix=3.9 WHERE nom='Pigala Blonde'\"); c.commit()"

   Résultat attendu : aucune réponse à l'écran, puis, après rechargement, Pigala Blonde à 3,90 €. Si les guillemets posent problème dans votre terminal, rien n'a été modifié : appelez-moi.

## Livrable

`charger.py`, `carte.db`, `servir.py`, `script.js`, la page branchée sur l'API. F12, onglet Réseau : la requête `/api/carte` apparaît.

## Ce qu'on retient

L'IA écrit du SQL juste la plupart du temps, et faux de temps en temps, avec la même assurance. Le Jour 2 reprend cette base avec une table de réservations et des données personnelles : ce qu'on envoie au modèle, ce qu'on anonymise.
