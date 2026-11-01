# E9 · La carte, ligne à ligne

**Point du programme** : génération de snippets simples avec l'IA. La complétion contre l'agent.

**Durée** : 15 minutes.

## Ce qu'on fait

`exercices/09-snippets-carte/depart/` contient la page avec sa section carte vide. Cette fois, pas d'agent : la complétion Copilot, ligne à ligne, dans l'éditeur. `carte.md`, dans le dossier, donne les noms et les prix ; l'ouvrir dans un onglet à côté, Copilot s'en sert comme contexte.

0. **Reprendre votre page.** Si l'exercice 8 a abouti, copiez votre page dans `exercices/09-snippets-carte/depart/`, en écrasant celle qui s'y trouve ; sinon, gardez celle qui est fournie. Ces lignes se lancent depuis la racine de votre dossier `stagiaire_J1`, avant tout `cd`, une ligne après l'autre (elles marchent sous Windows comme sous Linux) :

       cp exercices/08-maquette-vers-page/depart/index.html exercices/09-snippets-carte/depart/
       cp exercices/08-maquette-vers-page/depart/style.css exercices/09-snippets-carte/depart/
       cp exercices/08-maquette-vers-page/depart/css/* exercices/09-snippets-carte/depart/css/

   Résultat attendu : aucun message, et les fichiers copiés apparaissent dans `exercices/09-snippets-carte/depart/` (le dossier `css/` ne doit pas contenir un second `css/`). Une erreur « No such file » (« Cannot find path » sous PowerShell) veut dire que le chemin ou le dossier de départ est faux : rien n'a été écrit, vérifiez que vous êtes à la racine (`pwd`).

1. Ouvrir `exercices/09-snippets-carte/depart/index.html` et `exercices/09-snippets-carte/depart/carte.md` dans deux onglets. Dans `index.html`, dans la section carte, supprimer la phrase « La carte arrive. » et taper un commentaire :

       <!-- Deux colonnes : Bières et cidre, À manger. Chaque colonne : h3, puis une liste ul ; chaque li : nom, description, prix dans un span -->

2. Entrée, puis attendre la proposition grisée. Tab pour accepter, Échap pour refuser, Alt+] pour la suivante. Continuer ligne après ligne : Copilot propose les plats, vous vérifiez les prix contre `carte.md`.
3. Pour le style : dans `style.css`, ouvrir `exercices/09-snippets-carte/depart/style.css`, sélectionner la règle `.carte .attente` (triple-clic sur la ligne), Ctrl+I, et demander « styles pour les deux colonnes de la carte, liste sans puces, prix aligné à droite en gras, filet pointillé entre les lignes ».

## Livrable

La section carte remplie, dans `exercices/09-snippets-carte/depart/index.html` et `style.css`.

## Ce qu'on observe

- La règle `.carte .attente` n'a plus de cible une fois la phrase supprimée : c'est normal, Ctrl+I la remplace.
- La complétion ne lit pas forcément `AGENTS.md` (non vérifié) : les règles du projet ne s'appliquent peut-être pas à Tab.
- La complétion ne touche jamais à un autre fichier, et ne propose jamais plus de quelques lignes : vous gardez la main à chaque Tab.
- Elle invente des prix si `carte.md` n'est pas ouvert. Le contexte, c'est ce que l'éditeur montre.
- Comparer avec l'exercice 8 : l'agent a fait la page entière en un prompt, mais vous avez relu après coup ; ici vous relisez pendant.
