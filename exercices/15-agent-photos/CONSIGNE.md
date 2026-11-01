# E15 · L'agent fait le sale boulot

**Point du programme** : agents IA, automatisation de tâches en autonomie ; atelier officiel « automatiser une tâche répétitive avec un agent IA ». Chronométré.

**Durée** : 20 minutes.

## Ce qu'on fait

`exercices/15-agent-photos/depart/photos/` contient huit images de 1600 pixels de large. La page les attend à deux endroits (« Photo de la façade, à venir », « Photo de la terrasse, à venir ») et peut en montrer d'autres dans l'esprit du lieu. Tâche répétitive : trois tailles par image, les balises, les textes alternatifs.

1. Chrono. Un seul prompt à Claude Code. Il crée l'environnement virtuel `.venv` à la **racine** du dépôt, là où VS Code le retrouve tout seul :

   > Dans exercices/15-agent-photos/depart/photos/, huit images. Écris exercices/15-agent-photos/depart/redimensionner.py qui produit pour chacune trois largeurs (480, 960, 1600) dans exercices/15-agent-photos/depart/photos/petit, exercices/15-agent-photos/depart/photos/moyen et exercices/15-agent-photos/depart/photos/grand, en JPEG qualité 85, puis lance-le. Ensuite remplace les deux blocs « photo à venir » de exercices/15-agent-photos/depart/index.html par des images responsives (srcset et sizes) avec un texte alternatif qui décrit l'image, et ajoute une galerie de quatre photos dans la section « L'esprit du lieu ». Propose ensuite un message de commit. Si tu as besoin d'une bibliothèque, crée un environnement virtuel .venv à la racine du dépôt (pas dans depart/) et installe-la dedans, avec un requirements.txt à côté de redimensionner.py.

2. Regarder ce que l'agent fait, étape par étape : il va créer `.venv`, installer Pillow, écrire le script, le lancer, modifier la page. Chaque permission demandée se lit avant d'être accordée.
3. Vérifier dans Chrome. Dans un **deuxième terminal** (bouton **+** du panneau Terminal) :

       cd exercices/15-agent-photos/depart
       pwd
       python servir.py

   Résultat attendu : `pwd` affiche un chemin qui se termine par `exercices/15-agent-photos/depart`, puis le serveur affiche une adresse et reste en attente (`Ctrl+C` l'arrête). Ouvrez http://127.0.0.1:8000/. Les images s'affichent. F12, onglet Réseau, réduire la largeur de la fenêtre : la taille de l'image chargée change (1600, puis 960, puis 480 pixels).
4. Lire les textes alternatifs. `AGENTS.md` les exige depuis E4 : vérifiez qu'ils décrivent vraiment ce qu'on voit sur la photo, pas le nom du fichier ni le bandeau de texte de l'image.
5. Vérifier que `.venv` n'apparaît pas dans l'explorateur de changements : à la racine, `git status` ne doit pas le lister, il est ignoré par git.
6. Chrono arrêté, commit avec le message proposé. Relisez-le avant de committer : s'il cite un fichier qui n'existe pas (par exemple `requirements.txt` si l'installation a été refusée), corrigez-le.

## Livrable

`redimensionner.py`, `requirements.txt` (dans `exercices/15-agent-photos/depart/`), 24 images dans `photos/petit`, `photos/moyen` et `photos/grand`, la page avec ses photos, un commit. Le `.venv` est à la racine du dépôt.

## Ce qu'on retient

- L'agent a enchaîné six gestes qu'on aurait faits à la main en une heure. Le chrono le dit.
- Il a eu besoin d'installer quelque chose : c'est le moment où on lit avant d'accepter. Sur le poste d'une entreprise, c'est souvent interdit, et il faut le savoir avant.
- Le texte alternatif est exigé par `AGENTS.md` depuis E4 : l'outil l'a écrit. Reste à vérifier qu'il décrit vraiment la photo. Une règle écrite vaut mieux qu'une correction après coup, et elle ne dispense pas de relire.
