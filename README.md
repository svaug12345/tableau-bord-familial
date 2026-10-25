# Tableau de bord familial — SV

POC d'un tableau de bord familial à afficher en continu sur un grand écran
(pensé pour le **Samsung Smart Monitor M7 32"** sous Tizen, mais marche dans
n'importe quel navigateur et sur téléphone).

**Version actuelle : 1.0.0**

## Ce qu'il affiche

- 🕐 **Horloge + date** en français, mise à jour chaque seconde
- ☀️ **Météo** en direct (actuelle + 4 jours) — via l'API gratuite Open-Meteo, sans clé
- 🗓️ **Saint du jour** — calendrier français embarqué, fonctionne hors ligne
- 🏖️ **Compte à rebours** avant les prochaines vacances scolaires
- ✅ **Pense-bête / corvées** (données de démo pour l'instant)

Le tout habillé à la charte **SV** (fond sombre, accents turquoise, logo au trait).

## Utilisation

Ouvrir `tableau-bord-familial.html` dans un navigateur. C'est tout : un seul
fichier, aucune installation.

## Personnalisation

Tout se règle dans le bloc `CONFIG` en haut du `<script>`, à la fin du fichier HTML :

- `latitude` / `longitude` / `ville` — pour la météo
- `vacances` — liste des dates de vacances (Zone C par défaut), à mettre à jour chaque année
- `corvees` — le pense-bête (temporaire, en attendant le NAS)

## Prochaines étapes (idées)

- [ ] Brancher le pense-bête et le calendrier sur le NAS Synology (édition depuis le téléphone)
- [ ] Récupérer les dates de vacances automatiquement (API education.gouv.fr)
- [ ] Empaqueter en appli Tizen (`.wgt`) pour l'installer sur le M7
- [ ] Ajouter : menu de la semaine, anniversaires, planning qui-fait-quoi

## Licence

Projet personnel.
