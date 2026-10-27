# Règles du projet Le Pigala

Page web d'une brasserie-restaurant de Montreuil. Le brief complet est dans `brief.md`. Lis-le avant toute modification.

## Langue et ton

- Tout est en français, avec les accents, y compris les commentaires du code.
- Vouvoiement, ton direct et chaleureux. Pas de superlatif, pas de tiret long.

## HTML

- HTML sémantique : `header`, `nav`, `main`, `section`, `footer`, `address`. Un seul `h1`. Les titres se suivent sans saut de niveau.
- Chaque `section` a un titre `h2` et un attribut `aria-labelledby` qui pointe dessus.
- Toute image a un attribut `alt` qui décrit ce qu'elle montre, ou `alt=""` si elle est décorative.
- Les numéros de téléphone sont des liens `tel:`.

## CSS

- Une seule feuille, `style.css`. Les couleurs de l'enseigne sont des variables dans `:root` : orange `#F26B1D`, bleu nuit `#1D2A44`, crème `#FFF6E9`, vert houblon `#5C8A3A`.
- Contraste texte sur fond d'au moins 4,5 pour 1. L'orange de l'enseigne `#F26B1D` ne tient ce ratio ni sous du texte blanc (3,0) ni comme texte sur crème (2,8) : il sert aux fonds décoratifs, aux filets, et comme texte sur bleu nuit (4,7). Pour un bouton, orange foncé `#B84A0C` avec texte blanc (5,2).
- La page se lit sur un téléphone sans défilement horizontal.

## Interdits

- Aucun framework CSS ou JavaScript, aucune bibliothèque.
- Aucune police web, aucune ressource chargée depuis un autre domaine : la page doit s'ouvrir sans Internet.
- Un seul script, `script.js`, qui lit `/api/carte`. Aucune bibliothèque.
- Ne pas inventer de contenu : tout texte vient de `brief.md` ou de `carte.md`, à la racine du dossier. Si une information manque, le dire plutôt que combler.

## Façon de travailler

- Annoncer en une ligne ce qui va être modifié avant de modifier.
- Après une modification de `index.html`, vérifier que la page reste valide (balises fermées, un seul `h1`).
