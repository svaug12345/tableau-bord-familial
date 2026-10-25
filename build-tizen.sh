#!/usr/bin/env bash
# =====================================================================
#  build-tizen.sh — prépare le dossier de l'appli TV Samsung
# ---------------------------------------------------------------------
#  Une appli Tizen = un dossier avec config.xml + index.html + icône.
#  Ce script rassemble ces fichiers dans build/tizen/ à partir des
#  sources du dépôt. Comme ça, on ne modifie QU'UN SEUL fichier HTML
#  (tableau-bord-familial.html) et il sert à la fois au navigateur
#  et à la TV.
#
#  Utilisation (Git Bash sous Windows, ou Linux/Mac) :
#      ./build-tizen.sh
#  Ensuite : voir INSTALL-TV.md pour signer et installer sur l'écran.
# =====================================================================

set -e   # le script s'arrête à la première erreur

# On se place dans le dossier du script, d'où qu'on le lance
cd "$(dirname "$0")"

SORTIE="build/tizen"

# On repart d'un dossier propre à chaque fois
rm -rf "$SORTIE"
mkdir -p "$SORTIE/assets/logos"

# 1) La page : Tizen veut qu'elle s'appelle index.html
cp tableau-bord-familial.html "$SORTIE/index.html"

# 2) La carte d'identité de l'appli et son icône
cp tizen/config.xml "$SORTIE/config.xml"
cp tizen/icon.png   "$SORTIE/icon.png"

# 3) Les logos SV (l'icône d'onglet y fait référence)
cp assets/logos/*.svg "$SORTIE/assets/logos/"

echo "Dossier de l'appli prêt : $SORTIE"
echo "Prochaine étape : signer et installer (voir INSTALL-TV.md)."
