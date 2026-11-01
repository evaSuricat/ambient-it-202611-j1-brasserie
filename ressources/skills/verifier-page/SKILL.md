---
name: verifier-page
description: Relire une page HTML et sa feuille de style selon la grille d'accessibilité du projet, sans rien modifier.
argument-hint: chemin/index.html chemin/style.css
disable-model-invocation: true
---
Relis les fichiers $ARGUMENTS selon la grille ci-dessous (chemins complets depuis la racine, par exemple exercices/05-commande-a-moi/depart/index.html exercices/05-commande-a-moi/depart/style.css). Si aucun fichier n'est donné, demande-moi les chemins de index.html et style.css. Ne modifie rien : tu rends un rapport.

Grille :
1. Structure : HTML sémantique (header, nav, main, section, footer), un seul h1, titres sans saut de niveau, chaque section reliée à son titre par aria-labelledby.
2. Images : chaque img a un alt qui décrit ce qu'elle montre, ou alt="" si décorative.
3. Contraste : pour chaque couple texte/fond du CSS, calcule le ratio de contraste et signale ce qui est sous 4,5 pour 1 (3 pour 1 pour les titres de plus de 24 px).
4. Clavier : les liens et boutons ont un état :focus visible ; l'ordre de tabulation suit l'ordre de lecture.
5. Ressources externes : aucune police web, aucun script ou style chargé depuis un autre domaine, aucune bibliothèque.

Rapport en trois listes, en français :
- Bon : ce qui respecte la grille.
- À corriger : chaque point avec le fichier, la ligne et la correction proposée.
- Non vérifié : ce que tu ne peux pas vérifier sans navigateur, et comment le vérifier à la main.
