#!/usr/bin/env bash
# Poste stagiaire, formation Ambient IT « Développeurs : boostez vos performances grâce à l'IA », Jour 1.
# Cible : Ubuntu 24.04 (Desktop-as-a-Service d'Ambient IT, ou VM VirtualBox de secours).
# Lancer en root :   sudo bash installer-vm.sh [nom_utilisateur]
# Le nom d'utilisateur est celui qui ouvrira VS Code (défaut : l'utilisateur qui a appelé sudo).
#
# Installe : git, Python 3.12 (natif sur 24.04) avec venv et pip, VS Code et trois extensions
# (Python, SonarQube for IDE, Claude Code), Google Chrome (Lighthouse est intégré à F12),
# Claude Code (installateur natif, sans Node), et clone le dépôt des exercices.
# Rien d'autre : pas d'Ollama, pas de Docker. Les comptes (GitHub pour Copilot, Anthropic pour
# Claude Code) se connectent le jour J, par le stagiaire.
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive
# Sans effet sur une vraie VM ; évite la question « WSL ? » du lanceur code quand le test tourne dans Docker.
export DONT_PROMPT_WSL_INSTALL=1

STAGIAIRE="${1:-${SUDO_USER:-}}"
if [ -z "$STAGIAIRE" ] || [ "$STAGIAIRE" = "root" ]; then
  echo "Donner le nom de l'utilisateur qui ouvrira VS Code : sudo bash installer-vm.sh stagiaire" >&2
  exit 1
fi
if ! id "$STAGIAIRE" >/dev/null 2>&1; then
  echo "Utilisateur $STAGIAIRE inconnu : le créer d'abord (adduser $STAGIAIRE)." >&2
  exit 1
fi
MAISON="$(getent passwd "$STAGIAIRE" | cut -d: -f6)"
DEPOT="https://github.com/evaSuricat/ambient-it-202611-j1-brasserie.git"

echo "== 1/6 Paquets système"
apt-get update -q
apt-get install -y -q git python3 python3-venv python3-pip curl wget ca-certificates gnupg apt-transport-https sudo

echo "== 2/6 VS Code"
wget -qO /tmp/code.deb "https://update.code.visualstudio.com/latest/linux-deb-x64/stable"
apt-get install -y -q /tmp/code.deb
rm -f /tmp/code.deb

echo "== 3/6 Google Chrome"
wget -qO /tmp/chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
apt-get install -y -q /tmp/chrome.deb
rm -f /tmp/chrome.deb

echo "== 4/6 Extensions VS Code pour $STAGIAIRE"
for ext in ms-python.python sonarsource.sonarlint-vscode anthropic.claude-code; do
  sudo -u "$STAGIAIRE" -H env DONT_PROMPT_WSL_INSTALL=1 code --no-sandbox --install-extension "$ext" --force
done

echo "== 5/6 Claude Code (installateur natif) pour $STAGIAIRE"
sudo -u "$STAGIAIRE" -H bash -c "curl -fsSL https://claude.ai/install.sh | bash"
if ! grep -q '.local/bin' "$MAISON/.bashrc"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$MAISON/.bashrc"
fi

echo "== 6/6 Dépôt des exercices dans $MAISON/ambient-it-j1"
if [ ! -d "$MAISON/ambient-it-j1/.git" ]; then
  sudo -u "$STAGIAIRE" -H git clone -q "$DEPOT" "$MAISON/ambient-it-j1"     || echo "Clone impossible (dépôt privé ou réseau) : copier le zip du dépôt dans $MAISON/ambient-it-j1"
fi

echo
echo "== Versions obtenues"
git --version
python3 --version
python3 -m pip --version
sudo -u "$STAGIAIRE" -H env DONT_PROMPT_WSL_INSTALL=1 code --no-sandbox --version | head -1
google-chrome --version
sudo -u "$STAGIAIRE" -H bash -lc 'export PATH="$HOME/.local/bin:$PATH"; claude --version'
sudo -u "$STAGIAIRE" -H env DONT_PROMPT_WSL_INSTALL=1 code --no-sandbox --list-extensions --show-versions
echo
echo "Terminé. Le stagiaire ouvre VS Code sur $MAISON/ambient-it-j1/exercices/01-trois-outils/depart"
