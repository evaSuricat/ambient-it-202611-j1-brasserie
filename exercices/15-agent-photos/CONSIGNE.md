# E15 · L'agent fait le sale boulot

**Point du programme** : agents IA, automatisation de tâches en autonomie ; atelier officiel « automatiser une tâche répétitive avec un agent IA ». Chronométré.

**Durée** : 20 minutes.

## Ce qu'on fait

`depart/photos/` contient huit images de 1600 pixels de large. La page les attend à deux endroits (« Photo de la façade, à venir », « Photo de la terrasse, à venir ») et peut en montrer d'autres dans l'esprit du lieu. Tâche répétitive : trois tailles par image, les balises, les textes alternatifs.

1. Chrono. Un seul prompt à Claude Code :

   > Dans photos/, huit images. Écris redimensionner.py qui produit pour chacune trois largeurs (480, 960, 1600) dans photos/petit, photos/moyen, photos/grand, en JPEG qualité 85, puis lance-le. Ensuite remplace les deux blocs « photo à venir » de index.html par des images responsives (srcset et sizes) avec un texte alternatif qui décrit l'image, et ajoute une galerie de quatre photos dans la section « L'esprit du lieu ». Propose ensuite un message de commit. Si tu as besoin d'une bibliothèque, crée un environnement virtuel .venv et installe-la dedans, avec un requirements.txt.

2. Regarder ce que l'agent fait, étape par étape : il va créer `.venv`, installer Pillow, écrire le script, le lancer, modifier la page. Chaque permission demandée se lit avant d'être accordée.
3. Vérifier dans Chrome (`python servir.py`) : les images s'affichent, F12, onglet Réseau, la bonne taille est chargée selon la largeur de la fenêtre.
4. Lire les textes alternatifs : décrivent-ils l'image, ou le nom du fichier ?
5. Chrono arrêté, commit avec le message proposé, relu.

## Livrable

`redimensionner.py`, `requirements.txt`, 24 images, la page avec ses photos, un commit.

## Ce qu'on retient

- L'agent a enchaîné six gestes qu'on aurait faits à la main en une heure. Le chrono le dit.
- Il a eu besoin d'installer quelque chose : c'est le moment où on lit avant d'accepter. Sur le poste d'une entreprise, c'est souvent interdit, et il faut le savoir avant.
- Le texte alternatif est le point qu'il rate si `CLAUDE.md` ne l'exige pas : il écrit « photo 1 ». Une règle écrite vaut mieux qu'une correction après coup.
