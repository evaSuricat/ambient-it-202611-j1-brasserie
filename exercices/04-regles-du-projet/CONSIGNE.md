# E4 · Les règles du projet

**Point du programme** : atelier officiel « personnaliser son IDE avec plusieurs assistants IA », première partie, les fichiers d'instructions.

**Durée** : 20 minutes.

## L'idée

Le brief dit ce que veut le client. Les règles du projet disent comment l'équipe code : ses conventions, celles que le brief ne mentionne pas. Un outil ne lit le brief que s'il le trouve ; il lit le fichier de règles à chaque fois, sans qu'on le demande. Vous allez écrire un seul fichier, `AGENTS.md`, que Copilot et Claude Code lisent tous les deux, et mesurer l'écart avec et sans.

## Ce qu'on fait

1. **Reprendre votre page.** Copiez votre `index.html` et votre `style.css` de l'exercice 2 (`exercices/02-page-en-un-prompt/depart/`) dans `exercices/04-regles-du-projet/depart/`, en écrasant ceux qui s'y trouvent. Si votre exercice 2 n'a pas abouti, gardez ceux fournis.

   Dans le terminal de VS Code, depuis la racine de votre dossier `stagiaire_J1`, une ligne après l'autre (elles marchent sous Windows comme sous Linux) :

   ```
   cp exercices/02-page-en-un-prompt/depart/index.html exercices/04-regles-du-projet/depart/
   cp exercices/02-page-en-un-prompt/depart/style.css exercices/04-regles-du-projet/depart/
   ```

2. **Ouvrir `index.html`** de `exercices/04-regles-du-projet/depart/` dans l'éditeur. Pas le `brief.md` : le fichier ouvert part avec le prompt, et le brief apporterait les contraintes avec lui.

3. **Sans règles, dans Copilot.** Ouvrez une nouvelle conversation (New Chat), puis **remettez le sélecteur sur Agent** : New Chat repasse en Ask, et en Ask Copilot ne modifie rien. Réglages : Agent, mode Interactive, Manual permissions. Envoyez :

   > Ajoute un plan d'accès dans la section Venir.

   Si Copilot demande une permission pour une commande dans le terminal, elle apparaît sous le chat : acceptez (« Allow in this Session »). Puis Keep ou Undo. Regardez et notez ce qui manque : un lien vers OpenStreetMap, un dossier `css/`, des commentaires qui encadrent la section.

4. **Revenir à votre page d'E2.** L'Undo de Copilot n'est pas toujours fiable : refaites plutôt les deux `cp` de l'étape 1 pour écraser les fichiers, et supprimez le dossier `css/` de `depart/` s'il a été créé.

5. **Écrire les règles du projet**, dans un seul fichier, `AGENTS.md`, à la racine de votre dossier `stagiaire_J1` (la racine du dépôt, pas `depart/`). Copilot et Claude Code le lisent seuls, sans que vous le leur disiez.

   Piège : VS Code crée un nouveau fichier dans le dossier sélectionné dans l'explorateur. Cliquez d'abord dans le vide sous l'arborescence, puis « New File » ; ou créez-le depuis le terminal. Vérifiez que `AGENTS.md` est au même niveau que le dossier `exercices`.

   Texte à copier dans `AGENTS.md` :

   ```
   # Règles du projet

   ## Contraintes du client
   - La page est en français.
   - HTML sémantique (header, nav, main, section, footer) et un seul h1.
   - Aucun framework, aucune police web, aucun script externe.
   - La page s'ouvre sans Internet : rien n'est chargé depuis un autre domaine.
   - Toute image a un texte alternatif.
   - Contraste du texte d'au moins 4,5 pour 1.
   - Vouvoiement, aucun superlatif.

   ## Conventions de l'équipe
   - Tout plan d'accès est accompagné d'un lien "Ouvrir le plan dans OpenStreetMap" vers openstreetmap.org, ouvert dans un nouvel onglet.
   - Chaque nouveau composant a sa propre feuille de style dans le dossier css/, reliée par une balise link dans index.html.
   - Chaque section ajoutée est encadrée par les commentaires <!-- DÉBUT nom --> et <!-- FIN nom -->.

   ## Charte du Pigala
   - Les couleurs de l'enseigne sont des variables dans :root : orange #F26B1D, bleu nuit #1D2A44, crème #FFF6E9, vert houblon #5C8A3A.
   - L'orange #F26B1D ne sert ni de texte sur crème, ni de fond sous un texte blanc. Pour un bouton : orange foncé #B84A0C, texte blanc.
   - Chaque section a un titre h2, relié par aria-labelledby.
   - Les numéros de téléphone sont des liens tel:.
   - Tout texte vient de brief.md ou de carte.md. Si une information manque, le dire plutôt que l'inventer.
   ```

   Ce fichier vous suit jusqu'à la fin de la journée : les exercices suivants n'ont plus d'autre fichier de règles.

6. **Avec règles**, le même prompt : « Ajoute un plan d'accès dans la section Venir. »
   - dans Copilot : New Chat, **remettre Agent**, puis envoyez. Il lit `AGENTS.md` de lui-même (« Read AGENTS.md » dans son journal) ;
   - puis revenez à votre page d'E2 : refaites les deux `cp` de l'étape 1 et supprimez le dossier `css/` de `depart/` s'il a été créé ;
   - enfin dans Claude Code : nouvelle session (bouton +), mode Manual. Il demande l'autorisation avant chaque écriture. **Ce résultat reste dans `depart/` : c'est votre page pour la suite de la journée, ne l'effacez pas.**

7. **Vérifier**, pour chaque outil :
   - le lien « Ouvrir le plan dans OpenStreetMap » est visible dans la page (règle 1) ;
   - un fichier `.css` est apparu dans le dossier `css/`, dans l'explorateur (règle 2) ;
   - `index.html` contient `<!-- DÉBUT … -->` et `<!-- FIN … -->` autour de la nouvelle section (règle 3) ;
   - ouvrez la page dans Chrome, F12, onglet Réseau, cochez « Offline » et rechargez : le plan s'affiche-t-il encore ?

8. **Comparer** : sans règles et avec, Copilot et Claude Code. Copilot écrit sur le disque puis propose Keep ou Undo ; Claude Code, en mode Manual, demande avant d'écrire. Qu'est-ce qui manque dans vos règles pour que le résultat soit celui que vous vouliez ?

Si Copilot répond qu'il est en « lecture seule », il est en Ask : cliquez sur Agent dans le sélecteur et renvoyez le prompt.

## Livrable

`AGENTS.md` à la racine de `stagiaire_J1`, et le plan d'accès dans la section Venir de `index.html`, avec son lien OpenStreetMap, sa feuille dans `css/` et ses commentaires DÉBUT et FIN. Cette page, celle que Claude Code a produite, est votre point de départ pour l'exercice 5.

## Piège à observer

Sans règles, l'outil ne connaît pas les conventions de l'équipe : pas de lien OpenStreetMap, pas de dossier `css/`, pas de commentaires. Et sans le brief à portée de main, il peut intégrer une vraie carte en ligne : la page ne s'ouvre plus hors connexion (Chrome affiche le dinosaure « Aucun accès à Internet »). La formatrice le montre en projection.

Avec les règles, les trois conventions sont appliquées dès la première réponse, sans que vous les citiez. Si l'une est ignorée, reformulez-la : c'est l'exercice. Les règles sont là pour que ça marche à chaque fois, dans six mois, sur un autre poste, pour un autre collègue.
