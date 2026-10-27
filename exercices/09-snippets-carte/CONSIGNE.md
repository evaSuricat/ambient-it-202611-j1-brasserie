# E9 · La carte, ligne à ligne

**Point du programme** : génération de snippets simples avec l'IA. La complétion contre l'agent.

**Durée** : 15 minutes.

## Ce qu'on fait

`depart/` contient la page avec sa section carte vide. Cette fois, pas d'agent : la complétion Copilot, ligne à ligne, dans l'éditeur. `carte.md`, dans le dossier, donne les noms et les prix ; l'ouvrir dans un onglet à côté, Copilot s'en sert comme contexte.

1. Dans `index.html`, dans la section carte, supprimer la phrase « La carte arrive. » et taper un commentaire :

       <!-- Deux colonnes : Bières et cidre, À manger. Chaque colonne : h3, puis une liste ul ; chaque li : nom, description, prix dans un span -->

2. Entrée, puis attendre la proposition grisée. Tab pour accepter, Échap pour refuser, Alt+] pour la suivante. Continuer ligne après ligne : Copilot propose les plats, vous vérifiez les prix contre `carte.md`.
3. Pour le style : dans `style.css`, sélectionner la règle `.carte .attente`, Ctrl+I, et demander « styles pour les deux colonnes de la carte, liste sans puces, prix aligné à droite en gras, filet pointillé entre les lignes ».

## Livrable

La section carte remplie, dans `index.html` et `style.css`.

## Ce qu'on observe

- La complétion ne touche jamais à un autre fichier, et ne propose jamais plus de quelques lignes : vous gardez la main à chaque Tab.
- Elle invente des prix si `carte.md` n'est pas ouvert. Le contexte, c'est ce que l'éditeur montre.
- Comparer avec l'exercice 8 : l'agent a fait la page entière en un prompt, mais vous avez relu après coup ; ici vous relisez pendant.
