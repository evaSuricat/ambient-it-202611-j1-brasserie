# E1 · Le même prompt, trois outils

**Point du programme** : tour d'horizon des outils, IDE (Copilot) contre agent en ligne de commande (Claude Code) contre ChatGPT. Pourquoi ne pas utiliser ChatGPT en tant que développeur.

**Durée** : 15 minutes.

## Ce qu'on fait

Dans `depart/`, deux fichiers : `brief.md` et `carte.md`. Le même prompt, mot pour mot, est donné à trois outils :

> Lis brief.md et propose la structure de la page, section par section, avec le contenu de chacune en une ligne.

1. **ChatGPT**, dans le navigateur.
2. **Copilot Chat**, dans VS Code (icône Copilot en haut, ou Ctrl+Alt+I), avec `brief.md` ouvert dans l'éditeur.
3. **Claude Code**, dans le panneau VS Code ou le terminal, le dossier `depart/` ouvert.

## Ce qu'on observe

Pour chaque outil, trois lignes dans `01-comparatif.md` :

- A-t-il lu le fichier sans qu'on le colle ?
- Propose-t-il de créer des fichiers, ou seulement du texte ?
- Où sont partis le brief et la carte ?

## Livrable

`01-comparatif.md` dans `depart/`, neuf lignes. Un exemple est dans `solution/`.

## Si l'outil ne répond pas

Pas de réseau : aucun des trois ne répond. Les captures des trois réponses sont dans les slides, on fait l'observation dessus.
