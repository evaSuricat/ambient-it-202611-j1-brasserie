# E9 · La carte, ligne à ligne

**Point du programme** : génération de snippets simples avec l'IA. La complétion contre la demande ciblée.

**Durée** : 15 minutes.

## L'idée

`exercices/09-snippets-carte/depart/` contient la page avec sa section carte vide. `carte.md` donne les noms, les descriptions et les prix : ce sont des données exactes. On essaie deux façons de les mettre dans la page, sans agent, dans l'éditeur :

- **Tab** (la complétion) : Copilot propose la suite en gris, en devinant ce qui est probable ;
- **Ctrl+I** (la demande dans l'éditeur) : vous sélectionnez un texte et vous dites quoi en faire.

Le panneau de chat Copilot ne sert pas ici : tout se passe dans l'onglet `index.html` ou `style.css`.

## Ce qu'on fait

0. **Reprendre votre page.** Si l'exercice 8 a abouti, copiez votre page dans `exercices/09-snippets-carte/depart/`, en écrasant celle qui s'y trouve ; sinon, gardez celle qui est fournie. Ces lignes se lancent depuis la racine de votre dossier `stagiaire_J1`, avant tout `cd`, une ligne après l'autre (elles marchent sous Windows comme sous Linux) :

       cp exercices/08-maquette-vers-page/depart/index.html exercices/09-snippets-carte/depart/
       cp exercices/08-maquette-vers-page/depart/style.css exercices/09-snippets-carte/depart/
       cp exercices/08-maquette-vers-page/depart/css/* exercices/09-snippets-carte/depart/css/

   Résultat attendu : aucun message, et les fichiers copiés apparaissent dans `exercices/09-snippets-carte/depart/` (le dossier `css/` ne doit pas contenir un second `css/`). Une erreur « No such file » (« Cannot find path » sous PowerShell) veut dire que le chemin ou le dossier de départ est faux : rien n'a été écrit, vérifiez que vous êtes à la racine (`pwd`).

1. **Ouvrir les deux fichiers.** `exercices/09-snippets-carte/depart/index.html` et `exercices/09-snippets-carte/depart/carte.md`, dans deux onglets côte à côte.

2. **Premier essai : Tab.** Dans `index.html`, section carte, remplacez la phrase « La carte arrive. » par ce commentaire :

       <!-- Deux colonnes : Bières et cidre, À manger. Chaque colonne : h3, puis une liste ul ; chaque li : nom, description, prix dans un span -->

   Cliquez à la fin de cette ligne, Entrée, puis attendez 2 ou 3 secondes sans rien taper. Du texte gris apparaît. Tab accepte, Échap refuse, Alt+] montre la proposition suivante. Si rien n'apparaît, tapez le début de la ligne (`<h3>`).

   Acceptez, puis comparez à `carte.md` : les plats et les prix sont-ils les bons ? Y a-t-il des descriptions ? Notez ce que vous trouvez, puis supprimez tout ce que Tab a écrit, en gardant le commentaire.

3. **Deuxième essai : Ctrl+I, colonne Bières.** Dans `carte.md`, copiez les dix lignes de « Bières et cidre » (lignes 7 à 16). Dans `index.html`, sous le commentaire, écrivez `<!-- Bières et cidre`, Entrée, collez, Entrée, `-->`. Sélectionnez ce bloc, de `<!-- Bières` à `-->`, appuyez sur Ctrl+I et envoyez :

       Transforme ce tableau en HTML : un h3 Bières et cidre, puis une liste ul ; chaque li contient le nom, la description et le prix, chacun dans un span. Garde exactement les noms et les prix du tableau, sans en ajouter ni en retirer.

   Le résultat s'affiche en vert. Comparez les dix lignes à `carte.md`, puis cliquez sur **Keep**. Si le micro s'ouvre, fermez-le avec sa croix et relisez la saisie.

4. **Colonne À manger.** Même geste juste après le `</ul>`, avec les lignes 22 à 31 de `carte.md`, un bloc `<!-- À manger` et ce prompt :

       Transforme ce tableau en HTML : un h3 À manger, puis une liste ul ; chaque li contient le nom, la description et le prix, chacun dans un span. Garde exactement les noms et les prix du tableau, sans en ajouter ni en retirer.

5. **Le happy hour, à la main.** Juste avant le `<h3>` de Bières et cidre, écrivez cette ligne, en copiant le texte depuis `carte.md` (ligne 33). Si un texte gris apparaît, Échap.

       <p class="happy-hour">Happy hour du mardi au vendredi, 17 h à 19 h : la pression à 2,50 € le 25 cl, le pichet à 10 €.</p>

6. **Préparer les colonnes.** Sélectionnez du `<h3>` de Bières et cidre au dernier `</ul>` d'À manger, Ctrl+I :

       Enveloppe cette sélection dans un div de classe colonnes-carte, et chaque colonne (h3 et ul) dans son propre div. Ajoute class="prix" au dernier span de chaque li. Ne change aucun texte ni aucun prix.

   Vérifiez dans le vert que les vingt lignes ont `class="prix"`, **Keep**, puis Ctrl+S.

7. **Le style.** Dans `exercices/09-snippets-carte/depart/style.css`, cliquez sur une ligne vide à la fin du fichier. Si vous voyez une règle `.carte .attente`, elle ne sert plus : supprimez-la. Ctrl+I :

       Styles de la section #carte. .colonnes-carte : une grille, une colonne, puis deux à partir de 48rem, alignées en haut. Les listes sans puces. Dans chaque li, une grille à deux colonnes : le nom en gras, la description en dessous, et le prix en gras à droite sur toute la hauteur, sans passer à la ligne. Un filet pointillé entre les lignes, un encadré pour .happy-hour. Utilise les variables de :root, sans ajouter de couleur en dur.

   **Keep**, Ctrl+S, puis rechargez la page dans Chrome, en largeur ordinateur et en largeur téléphone.

## Livrable

La section carte remplie, dans `exercices/09-snippets-carte/depart/index.html` et `style.css` : l'encadré happy hour, puis vingt lignes conformes à `carte.md`, en deux colonnes alignées en haut.

## Ce qu'on observe

- **Tab invente, même avec `carte.md` ouvert à côté** : à la répétition, des plats et des prix qui n'existent pas, et pas de descriptions. Ouvrir ou sélectionner une source dans un autre onglet ne garantit rien : la complétion prolonge ce qui est probable, elle ne recopie pas.
- **Tab peut proposer tout un bloc d'un coup** : Ctrl+Flèche droite n'accepte que le mot suivant.
- **Ctrl+I, avec la source sélectionnée, garde les données exactes** : vous lui donnez le texte, vous dites quoi en faire. On compare quand même chaque prix.
- **Ctrl+I ne modifie que là où on le lance** : un style demandé dans `style.css` n'ajoute ni classe ni conteneur dans `index.html`. C'est pour ça que l'étape 6 vient avant l'étape 7.
- **La règle à retenir** : quand une donnée compte, on ne la laisse pas deviner. Tab sert au code répétitif, pas à recopier une carte.
- La complétion ne lit pas forcément `AGENTS.md` (non vérifié) : les règles du projet ne s'appliquent peut-être pas à Tab.
- Comparer avec l'exercice 8 : l'agent a fait la page entière en un prompt et vous avez relu après coup ; ici vous contrôlez chaque morceau.
