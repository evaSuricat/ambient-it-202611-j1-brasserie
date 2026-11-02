# E5 · Une commande à moi

**Point du programme** : atelier officiel « personnaliser son IDE avec plusieurs assistants IA », seconde partie, les commandes et les skills.

**Durée** : 20 minutes.

## L'idée

Un bon prompt de relecture ne se retape pas : on l'écrit une fois dans un fichier, et on le rejoue avec une commande `/`. Ce fichier s'appelle un **skill**. Comme `AGENTS.md` à l'exercice 4, un seul fichier sert aux deux outils : Claude Code et Copilot suivent le même standard ouvert, Agent Skills.

Un skill, c'est un dossier qui porte son nom et qui contient un fichier `SKILL.md` :

- en tête, quelques champs entre deux lignes `---` : son nom (le même que celui du dossier) et une description, obligatoires ;
- en dessous, le prompt lui-même.

Claude Code appelait autrefois cela une « commande » (`.claude/commands/`) : les commandes ont été fondues dans les skills, et la documentation recommande les skills pour tout nouveau travail. Copilot, de son côté, ne charge plus les anciens fichiers `.prompt.md` dans ses sessions Copilot.

## Ce qu'on fait

La page de l'exercice est dans `exercices/05-commande-a-moi/depart/`. Le skill se crée à la RACINE de votre dossier, à côté de `AGENTS.md`. Rangé dans `depart/`, il serait invisible.

0. **Reprendre votre page.** Si l'exercice 4 a abouti, copiez la page qu'il a produite (celle de Claude Code, avec son plan d'accès) dans `exercices/05-commande-a-moi/depart/`, en écrasant celle qui s'y trouve ; sinon, gardez celle qui est fournie.

D'abord, repérez où est cette page : le dossier qui contient son `index.html`, son `style.css` et son dossier `css/`. C'est `exercices/04-regles-du-projet/depart/` si vous l'avez laissée sur place. Si vous avez rangé vos essais d'E4 dans des sous-dossiers, c'est celui de l'essai Claude Code, par exemple `exercices/04-regles-du-projet/depart/claude_avec_regles/` : remplacez alors `04-regles-du-projet/depart/` par ce chemin dans les trois lignes.

Ces lignes se lancent depuis la racine de votre dossier `stagiaire_J1`, une ligne après l'autre (elles marchent sous Windows comme sous Linux) :

      cp exercices/04-regles-du-projet/depart/index.html exercices/05-commande-a-moi/depart/
      cp exercices/04-regles-du-projet/depart/style.css exercices/05-commande-a-moi/depart/
      cp exercices/04-regles-du-projet/depart/css/* exercices/05-commande-a-moi/depart/css/

Résultat attendu : aucun message, et les fichiers copiés apparaissent dans `exercices/05-commande-a-moi/depart/` (le dossier `css/` ne doit pas contenir un second `css/`). Une erreur « No such file » (« Cannot find path » sous PowerShell) sur les deux premières lignes veut dire que le chemin de départ est faux : vous n'êtes pas à la racine (`pwd`), ou la page d'E4 est dans un sous-dossier que vous n'avez pas indiqué ; rien n'a été écrit. Sur la troisième ligne seulement, l'exercice 4 n'a pas créé de dossier `css/` (la règle 2 n'a pas été appliquée) : reprenez alors la page fournie avec `git restore exercices/05-commande-a-moi/depart`, qui remet les fichiers fournis dans ce dossier et ne touche à rien d'autre.

1. **Créer le fichier.** Dans l'explorateur de VS Code, cliquez d'abord dans le vide sous la liste des fichiers (aucun dossier sélectionné), puis sur l'icône « New File », et tapez ce nom tel quel :

       .claude/skills/verifier-page/SKILL.md

   Les barres obliques créent les dossiers en même temps. Tapez ce nom dans l'explorateur, pas dans la saisie d'un chat : Copilot en mode Agent le prendrait pour une demande.

2. **Écrire le skill.** L'en-tête, à copier tel quel :

       ---
       name: verifier-page
       description: Relire une page HTML et sa feuille de style selon la grille d'accessibilité du projet, sans rien modifier.
       argument-hint: chemin/index.html chemin/style.css
       disable-model-invocation: true
       ---

   `argument-hint` s'affiche dans la saisie pour rappeler quoi taper. `disable-model-invocation: true` réserve le skill à la commande `/verifier-page` : sans lui, l'outil peut le lancer de lui-même quand la description correspond à la demande.

   Sous l'en-tête, écrivez le prompt avec vos mots. Il doit :
   - recevoir les fichiers à relire par `$ARGUMENTS` (Claude Code y place ce que vous tapez après la commande ; Copilot reçoit le même texte à la suite) et demander les chemins s'il n'en a pas ;
   - dire « Ne modifie rien : tu rends un rapport » ;
   - donner la grille en cinq points : structure sémantique et ordre des titres, textes alternatifs, contraste des couleurs (ratio chiffré), navigation au clavier (focus visible), ressources externes interdites ;
   - demander un rapport en trois listes : Bon, À corriger (fichier, ligne, correction), Non vérifié.

   Enregistrez (Ctrl+S).

3. **Lancer le skill dans Claude Code.** Nouvelle conversation (bouton +) : une conversation déjà ouverte ne voit pas un skill créé après elle. Tapez :

/verifier-page exercices/05-commande-a-moi/depart/index.html exercices/05-commande-a-moi/depart/style.css

4. **Lancer le même skill dans Copilot.** New Chat, remettez le sélecteur sur Agent, puis la même ligne. Si Copilot demande « Run in terminal? » pour calculer des contrastes en Python, lisez la commande : des calculs et des `print`, aucun fichier. Acceptez si c'est le cas.

   Fermez `SKILL.md` dans l'éditeur avant de lancer : le fichier ouvert part avec le message, et l'outil lirait la grille comme une pièce jointe au lieu de lancer le skill.

5. **Comparer** les deux rapports. Le rapport n'existe que dans la réponse : copiez-le avec le bouton de copie sous la réponse (« Copy response »), puis collez celui que vous préférez dans `exercices/05-commande-a-moi/depart/rapport-relecture.md` (sélectionnez le dossier `depart` dans l'explorateur, « New File »).

## Livrable

`.claude/skills/verifier-page/SKILL.md` à la racine, et `exercices/05-commande-a-moi/depart/rapport-relecture.md`.

## Piège à observer

- La commande n'apparaît pas : le skill est dans `depart/`, ou le nom du dossier et le champ `name` diffèrent, ou la conversation a été ouverte avant le skill.
- Sans chemins, le skill demande les fichiers : c'est la grille qui le prévoit. L'outil propose parfois d'autres pages, trouvées dans l'état de git : choisissez celle de l'exercice.
- Les deux rapports trouvent les mêmes défauts de contraste, avec des mots différents : c'est la grille qui fait le rapport. Regardez lequel applique aussi les règles d'`AGENTS.md` (la couleur de bouton de la charte, les commentaires DÉBUT et FIN).

## Si vous n'avez pas fini cet exercice

Les exercices 6 à 16 utilisent `/verifier-page`. Une copie du skill est dans `ressources/skills/verifier-page/SKILL.md`. Copiez le dossier `verifier-page` entier dans `.claude/skills/` à la racine de votre dossier (créez `.claude/skills/` s'il n'existe pas), puis ouvrez une nouvelle conversation.

## Pour aller plus loin

Un skill peut contenir d'autres fichiers à côté de `SKILL.md` (un modèle de rapport, un script de calcul de contraste) et les citer dans son prompt. C'est ce qui le distingue d'une ancienne commande, qui n'était qu'un fichier.

## Sources

- Claude Code, skills : https://code.claude.com/docs/en/skills (« Custom commands have been merged into skills »)
- VS Code, skills : https://code.visualstudio.com/docs/copilot/customization/agent-skills
- VS Code, migration des fichiers de prompt : https://code.visualstudio.com/docs/agent-customization/migrate-customizations
- GitHub, emplacements des skills (`.github/skills`, `.claude/skills`, `.agents/skills`) : https://docs.github.com/en/copilot/concepts/customizations/agent-skills
- Standard Agent Skills : https://agentskills.io
