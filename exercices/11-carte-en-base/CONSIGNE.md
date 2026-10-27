# E11 · La carte en base

**Point du programme** : le vibe coding et SQL ; la page devient une petite application.

**Durée** : 20 minutes.

## Ce qu'on fait

`depart/` contient la page relue et `carte.csv`. La carte, aujourd'hui écrite dans le HTML, va vivre dans une base SQLite servie par Python. SQLite est inclus dans Python : rien à installer.

1. Dans Claude Code, un prompt en trois parties, ou trois prompts :

   > 1. Écris charger.py : il crée carte.db (SQLite) avec une table carte (id, categorie, nom, description, prix) et la remplit depuis carte.csv. Relançable : il vide la table avant de recharger.
   > 2. Écris servir.py : un serveur http.server sur 127.0.0.1:8000 qui sert ce dossier sans cache, et répond sur /api/carte avec la carte en JSON, triée par catégorie puis par nom.
   > 3. Dans index.html, remplace les deux listes de la carte par des listes vides remplies par un script.js qui appelle /api/carte. Garde le HTML actuel dans un `<noscript>`. Pas de bibliothèque.

2. **Lire chaque requête SQL avant de lancer** : `CREATE TABLE`, `INSERT`, `SELECT`. Demander « explique la requête » au moindre doute.
3. Lancer : `python charger.py` puis `python servir.py`, ouvrir http://127.0.0.1:8000/.
4. La preuve que la carte vient de la base : changer un prix dans la base et recharger la page.

       python -c "import sqlite3; c=sqlite3.connect('carte.db'); c.execute(\"UPDATE carte SET prix=3.9 WHERE nom='Pigala Blonde'\"); c.commit()"

## Livrable

`charger.py`, `carte.db`, `servir.py`, `script.js`, la page branchée sur l'API. F12, onglet Réseau : la requête `/api/carte` apparaît.

## Ce qu'on retient

L'IA écrit du SQL juste la plupart du temps, et faux de temps en temps, avec la même assurance. Le Jour 2 reprend cette base avec une table de réservations et des données personnelles : ce qu'on envoie au modèle, ce qu'on anonymise.
