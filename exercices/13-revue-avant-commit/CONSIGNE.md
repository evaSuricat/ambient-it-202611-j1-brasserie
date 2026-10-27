# E13 · Revue avant commit

**Point du programme** : revue de code automatisée et suggestions ; génération de commit.

**Durée** : 15 minutes.

## Ce qu'on fait

`depart/` contient la page réparée et `A-FAIRE.md`, une demande d'évolution : une section « Ils en parlent » avec trois avis clients (fictifs, dans `A-FAIRE.md`). On la fait écrire, on la fait relire **avant** de committer, on génère le message de commit.

1. Dans Claude Code : « Fais ce que demande A-FAIRE.md ». Vérifier dans Chrome.
2. Ne pas committer. Dans `index.html`, sélectionner toute la nouvelle section, clic droit, **Copilot**, **Review and Comment**. Les remarques apparaissent dans l'éditeur et dans l'onglet Commentaires. Ça marche avec l'offre Copilot Free.
3. Corriger ce qui mérite de l'être, à la main ou en le demandant à l'outil. Ignorer le reste en le disant pourquoi.
4. Dans la vue Source Control (Ctrl+Maj+G), tout ajouter, puis cliquer l'icône étincelle à droite du champ de message : Copilot écrit le message de commit. Le relire, le corriger s'il décrit mal, committer.

## Livrable

Un commit dont le message a été généré, après revue. `message-de-commit.md` : le message généré tel quel, et le message gardé.

## Ce qu'on retient

- Dans VS Code, Copilot ne relit que ce qui n'est pas encore commité (ou une sélection). Pour relire une pull request entière, c'est la page GitHub, « Reviewers », Copilot, en offre Pro ou en organisation.
- Claude Code a ses propres revues, `/code-review` et `/security-review`, sans Copilot.
- Le message de commit généré décrit ce qui a changé ; c'est à vous d'y mettre pourquoi.
