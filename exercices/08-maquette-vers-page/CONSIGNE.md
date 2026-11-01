# E8 · De la maquette à la page

**Point du programme** : atelier officiel « coder une petite application en vibe coding ». Chronométré.

**Durée** : 20 minutes.

## Ce qu'on fait

`exercices/08-maquette-vers-page/depart/` contient la page des exercices précédents, `brief.md`, et `maquette.png` (celle de l'exercice 7, ou la maquette fournie). On fait refaire la page pour qu'elle suive la maquette, section par section.

0. **Reprendre votre page.** Si l'exercice 6 a abouti, copiez votre page dans `exercices/08-maquette-vers-page/depart/`, en écrasant celle qui s'y trouve ; sinon, gardez celle qui est fournie. L'exercice 7 ne produit qu'une maquette (une image) : la page vient de l'exercice 6, et `maquette.png` reste celui de `depart/`. Ces lignes se lancent depuis la racine de votre dossier `stagiaire_J1`, avant tout `cd`, une ligne après l'autre (elles marchent sous Windows comme sous Linux) :

       cp exercices/06-casse-ta-page/depart/index.html exercices/08-maquette-vers-page/depart/
       cp exercices/06-casse-ta-page/depart/style.css exercices/08-maquette-vers-page/depart/
       cp exercices/06-casse-ta-page/depart/css/* exercices/08-maquette-vers-page/depart/css/

   Résultat attendu : aucun message, et les fichiers copiés apparaissent dans `exercices/08-maquette-vers-page/depart/` (le dossier `css/` ne doit pas contenir un second `css/`). Une erreur « No such file » (« Cannot find path » sous PowerShell) veut dire que le chemin ou le dossier de départ est faux : rien n'a été écrit, vérifiez que vous êtes à la racine (`pwd`).

1. Chrono.
2. Dans Claude Code, glisser `maquette.png` dans le champ (ou Ctrl+V après l'avoir copiée). Si l'image ne passe pas, écrivez son chemin dans le prompt (`exercices/08-maquette-vers-page/depart/maquette.png`). Puis :

   > Voici la maquette de la page (exercices/08-maquette-vers-page/depart/maquette.png). Refais index.html et style.css de ce dossier pour la suivre, section par section, dans cet ordre : en-tête, héros, l'esprit du lieu, la carte, horaires et soirées, venir, pied de page. Les textes viennent de brief.md, les règles d'AGENTS.md à la racine. La carte reste vide pour l'instant : seulement son titre et une phrase « la carte arrive ». Les photos arriveront plus tard : prévois leur emplacement.

3. Regarder dans Chrome, à côté de la maquette. Une correction par écart, une à la fois.
4. Chrono arrêté quand la page suit la maquette. Temps noté dans `exercices/08-maquette-vers-page/depart/chrono.md` (à créer).

## Livrable

`index.html` et `style.css` de `exercices/08-maquette-vers-page/depart/` fidèles à la maquette, `chrono.md`.

## Pièges

- L'agent supprime des textes de l'ancienne page que le brief ne donne pas : c'est normal, à relire dans le diff.
- Le pied de page de la maquette contient « Mentions légales » : le brief ne donne aucun contenu pour ça. Si l'agent invente une page, c'est de l'invention.

- L'agent invente des textes quand le brief ne les donne pas : lui redonner le brief, pas lui demander d'être créatif.
- Il ajoute parfois une police web « pour faire joli » : c'est la règle d'`AGENTS.md` qui doit l'en empêcher. Si elle n'a pas suffi, la préciser.
