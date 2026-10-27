# E12 · Le bug glissé

**Point du programme** : détection et correction de bugs avec l'IA (SonarQube, ZAP, LLM).

**Durée** : 15 minutes.

## Ce qu'on fait

`depart/` contient la page de l'exercice 11, mais la carte ne s'affiche plus. Deux bugs, pas un.

1. Lancer `python charger.py` puis `python servir.py`, ouvrir http://127.0.0.1:8000/ : la carte est vide. F12, onglet Console et onglet Réseau : regarder avant de demander.
2. Décrire le **symptôme** à l'outil, pas la cause supposée. Dans Copilot Chat, `/fix` avec `script.js` ouvert, ou dans Claude Code :

   > La carte ne s'affiche plus dans la page servie par servir.py. La console du navigateur dit : [coller le message]. Trouve la cause et corrige.

3. Un bug corrigé, la carte revient. Le second ne se voit pas : la page s'affiche. Lancer l'analyse **SonarQube for IDE** (extension VS Code, analyse locale) : clic droit sur le dossier, « SonarQube for IDE: Analyze all project files », ou ouvrir `index.html` et regarder l'onglet Problèmes.
4. Corriger le second, noter les deux dans `rapport-sonar.md`.

## Livrable

Page réparée, `rapport-sonar.md` : les deux bugs, comment chacun a été trouvé, par qui (vous, le navigateur, le LLM, Sonar).

## Ce qu'on retient

Le navigateur a vu le premier bug avant tout le monde. Sonar a vu le second que personne ne voyait. Le LLM a corrigé les deux une fois qu'on lui a dit quoi regarder. Ce sont trois outils différents, pas trois versions du même.
