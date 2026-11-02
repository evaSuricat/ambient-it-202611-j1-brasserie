# E12 · Le bug glissé

**Point du programme** : détection et correction de bugs avec l'IA (SonarQube, ZAP, LLM).

**Durée** : 20 minutes.

## L'idée

`exercices/12-bug-glisse/depart/` contient la page de l'exercice 11, mais trois bugs s'y sont glissés. Trois outils les cherchent : le navigateur, l'IA, et SonarQube for IDE, un analyseur de code qui applique des règles écrites à l'avance, sans modèle. Chacun voit ce que les autres ne voient pas.

## Ce qu'on fait

0. **Préparer.**

   Installez l'extension : dans VS Code, Ctrl+Maj+X, cherchez **SonarQube for IDE**, éditeur **SonarSource**, coche bleue, **Install**. Une icône apparaît dans la barre de gauche. Il n'y a pas de compte à connecter : fermez ce qu'il propose.

   Gardez le `depart/` fourni : la page est déjà cassée, il n'y a rien à copier. Enregistrez ce point de départ, depuis la racine de votre dossier `stagiaire_J1` :

       git add -A
       git commit -m "E12 : état avant la chasse aux bugs"

   **Si vous préférez casser votre propre page**, copiez-la depuis `exercices/11-carte-en-base/depart/` (`index.html`, `style.css`, `css/`, `script.js`, `servir.py`, `charger.py`, `carte.db`), puis posez les trois bugs : dans `script.js`, remplacez `/api/carte` par `/api/cartes` ; dans `index.html`, retirez `lang="fr"` de la balise `<html>`, et retirez le `</div>` qui ferme la première colonne de la carte, juste après sa liste. Ctrl+S.

1. **Lancer la page.** Dans le terminal :

       cd exercices/12-bug-glisse/depart
       python charger.py

   Si `python` n'existe pas (Mac, certains Linux), tapez `python3`. Résultat attendu : une ligne qui annonce vingt lignes chargées. Ce script réécrit `carte.db` : `git status` peut le montrer modifié, c'est normal.

   Dans un **deuxième terminal** (bouton **+** du panneau Terminal), depuis la racine :

       cd exercices/12-bug-glisse/depart
       python servir.py

   Résultat attendu : une adresse, puis le terminal reste en attente. `Ctrl+C` l'arrête.

2. **Regarder avant de demander.** Dans Chrome, ouvrez http://127.0.0.1:8000/, pas le fichier par double-clic. Descendez à La carte : « La carte n'a pas pu être chargée. »

   Le même message apparaît quand on ouvre la page par double-clic : sans serveur, elle ne peut pas appeler la base. Ici, le serveur tourne et l'adresse commence par `http://127.0.0.1` : le problème est ailleurs. F12, onglet **Console** : lisez l'erreur rouge, puis F5.

3. **Premier bug : décrire le symptôme, pas la cause supposée.** Dans Claude Code, ou dans Copilot Chat avec `/fix` et `script.js` ouvert :

       Dans exercices/12-bug-glisse/depart/, la carte ne s'affiche plus dans la page servie par servir.py. La console du navigateur dit : [coller le message]. Trouve la cause et corrige.

   Résultat attendu : une seule lettre corrigée dans `script.js`. Lisez la correction avant de l'accepter, puis F5 : la carte revient.

4. **Deuxième bug : il se voit, mais rien ne le dit.** Regardez la page : les deux colonnes sont empilées dans la moitié gauche, et la moitié droite est vide. La console n'affiche aucune erreur. Décrivez ce que vous voyez :

       Dans exercices/12-bug-glisse/depart/, la carte s'affiche, mais À manger est sous Bières et cidre dans la moitié gauche, au lieu de deux colonnes. La console n'affiche aucune erreur. Trouve la cause et corrige.

   Autre façon de le voir sans l'IA, à faire avant d'envoyer le prompt : dans la page, clic droit sur le titre « Bières et cidre », **Inspecter**. Dans l'onglet Elements, le `<div>` d'« À manger » est rangé sous le `<ul>` des bières, à l'intérieur de leur colonne. Le navigateur ne signale pas ce genre d'erreur : il répare à sa façon, et Elements montre ce qu'il a compris.

5. **Troisième bug : personne ne l'a vu.** Ouvrez `exercices/12-bug-glisse/depart/index.html`, puis l'onglet **Problems** (Ctrl+Maj+M) ou l'onglet **SonarQube** à côté. SonarQube for IDE analyse le fichier ouvert et signale des lignes `Web:…`. Cliquez sur une remarque pour lire son explication :

   - **`Web:S5254`, ligne 2** : la balise `<html>` n'a pas d'attribut `lang`. C'est le troisième bug. Rien à l'écran, rien dans la console, mais un lecteur d'écran ne sait plus quelle langue lire. Corrigez : `<html lang="fr">`, Ctrl+S. La remarque disparaît.
   - **`Web:AvoidCommentedOutCodeCheck`** : Sonar prend pour du code mort les commentaires laissés sur les emplacements photo. Ce sont des consignes de travail, pas du code oublié : c'est à vous de juger. On les garde tant que les photos ne sont pas là.

   Sonar n'a pas signalé le `</div>` du deuxième bug. C'est aussi une information : un outil ne couvre que ses règles.

6. **Noter**, dans `exercices/12-bug-glisse/depart/rapport-sonar.md` (à créer), les trois bugs : comment chacun a été trouvé, et par qui.

7. **Committer.** Arrêtez le serveur (Ctrl+C), puis, depuis la racine :

       git add -A
       git commit -m "E12 : trois bugs corrigés, rapport"

## Livrable

Page réparée (deux colonnes, carte chargée, `lang="fr"`), `rapport-sonar.md`.

## Ce qu'on retient

Le navigateur a vu le premier bug avant tout le monde. L'œil a vu le deuxième, que la console et Sonar ne signalent pas, et l'IA en a trouvé la cause une fois le symptôme décrit. Sonar a vu le troisième, que personne d'autre n'avait remarqué. Ce sont trois outils différents, pas trois versions du même. Tous se trompent ou se taisent parfois : on lit et on juge chaque remarque.
