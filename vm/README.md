# Poste stagiaire : la VM du Jour 1

Ce dossier décrit le poste que chaque stagiaire utilise pendant le Jour 1, et le script qui le construit. Il est destiné à l'équipe technique d'Ambient IT (Desktop-as-a-Service) et sert aussi à monter la VM VirtualBox de secours.

## Ce qu'il faut

- **Ubuntu 24.04** avec un bureau léger, 4 Go de RAM, 2 cœurs, 20 Go de disque, clavier AZERTY. La VM doit être conservée entre le Jour 1 et le Jour 2.
- Un utilisateur par stagiaire (par exemple `stagiaire`), avec `sudo`.
- Sorties réseau autorisées : `github.com` et les domaines Copilot, `claude.ai` et `api.anthropic.com`, la marketplace VS Code (`marketplace.visualstudio.com`, `update.code.visualstudio.com`), `pypi.org` et `files.pythonhosted.org`.

## Installer

Sur la VM modèle, en root :

    sudo bash installer-vm.sh stagiaire

Le script installe git, Python 3.12 (natif sur 24.04) avec `venv` et `pip`, VS Code et trois extensions (Python, SonarQube for IDE, Claude Code), Google Chrome (Lighthouse est intégré à F12), Claude Code par son installateur natif (sans Node), et clone le dépôt des exercices dans `~/ambient-it-j1`. Il affiche les versions obtenues à la fin. Rien d'autre : pas d'Ollama, pas de Docker.

Les comptes se connectent le jour J, par le stagiaire lui-même : GitHub dans VS Code pour Copilot (un compte gratuit suffit), Anthropic pour Claude Code (abonnement Pro ou clé API, à régler avant la session).

## Vérifier

Après l'installation, dans un terminal de la VM :

    python3 --version && git --version && code --version | head -1 && google-chrome --version && claude --version

Puis ouvrir VS Code sur `~/ambient-it-j1/exercices/01-trois-outils/depart` (Fichier, Ouvrir le dossier).

## Test du script

Le script a été testé le 28/10/2026 dans un conteneur Docker `ubuntu:24.04` vierge, sans bureau : toutes les étapes passent, versions relevées ci-dessous. Ce qui n'est pas testé par ce moyen : l'ouverture graphique de VS Code et de Chrome, et la connexion des comptes.

| Composant | Version obtenue le 28/10/2026 |
|---|---|
| Ubuntu | 24.04 (image `ubuntu:24.04`) |
| git | 2.43.0 |
| Python | 3.12.3, pip 24.0 |
| VS Code | 1.143.1 |
| Google Chrome | 156.0.8078.73 |
| Claude Code | 2.1.312 |
| Extensions | Python 2026.10.0 (avec Pylance, Debugger et Python Environments), SonarQube for IDE 6.2.0, Claude Code 2.1.312 |

Le clone du dépôt échoue tant qu'il est privé : le script le signale et continue. Rendre le dépôt public avant de construire la VM modèle, ou y copier le zip du dépôt.
