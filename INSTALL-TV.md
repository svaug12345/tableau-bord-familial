# Installer l'appli sur l'écran Samsung M7

L'appli Tizen est un simple dossier : `config.xml`, `index.html` et une icône.
Samsung exige que toute appli installée sur une TV soit **signée** avec un
certificat Samsung lié à **ton** écran. C'est pour ça que cette étape se fait
sur ton PC, avec ton compte Samsung.

Il faut le faire **une seule fois**. Les mises à jour ne demandent ensuite que
deux commandes.

---

## 1. Préparer l'écran (une fois)

1. Sur le M7, ouvre **Apps**, puis tape **1 2 3 4 5** avec la télécommande.
2. Passe **Developer mode** sur **On** et entre l'**adresse IP de ton PC**.
3. Redémarre l'écran (débranche-le 10 secondes si besoin).
4. Note l'**adresse IP de l'écran** : *Paramètres > Général > Réseau > État du réseau > Paramètres IP*.

## 2. Installer les outils sur le PC (une fois)

1. Installe **VS Code**, puis l'extension **Tizen** (de Samsung). Tizen Studio
   est en fin de vie, c'est maintenant cette extension qui le remplace.
2. Dans l'extension, installe le **Samsung Certificate Extension** et le
   profil **TV** quand elle te le propose.

## 3. Connecter l'écran

Dans l'extension Tizen : **Device Manager** > **Ajouter** > entre l'IP de
l'écran > **Connecter**. L'écran apparaît dans la liste.

En ligne de commande, c'est l'équivalent de :

```bash
sdb connect 192.168.1.XX     # remplace par l'IP de l'écran
sdb devices                  # l'écran doit apparaître ici
```

## 4. Créer le certificat Samsung (une fois)

Dans l'extension Tizen : **Certificate Manager** > **+** > **Samsung** > **TV**.

- **Auteur** : crée un certificat auteur (nom + mot de passe : **note-le bien**).
- **Distributeur** : connecte-toi avec ton **compte Samsung**, puis laisse
  l'outil ajouter le **DUID** de l'écran connecté. Le certificat sera valable
  pour cet écran-là.
- Donne un nom au profil, par exemple `sv-tv`.

> Garde une copie du dossier des certificats (`SamsungCertificate`) : sans
> lui, tu ne pourras plus mettre à jour l'appli sans la désinstaller.

## 5. Construire, signer et installer

Dans le dossier du dépôt (Git Bash sous Windows) :

```bash
./build-tizen.sh                                   # rassemble les fichiers dans build/tizen
tizen package -t wgt -s sv-tv -- build/tizen       # signe et crée le fichier .wgt
tizen install -n build/tizen/TableauBord.wgt -t <nom-de-l-ecran>
```

Le nom de l'écran est celui qu'affiche `sdb devices`.

Tu peux aussi le faire sans ligne de commande : dans VS Code, ouvre le dossier
`build/tizen`, puis clic droit > **Run on TV device**.

L'appli **Tableau familial** apparaît dans **Apps**, avec l'icône SV.
Tu peux ensuite l'épingler dans la barre d'accueil, juste après Plex.

## Sur la TV

- **Retour** sur la télécommande : quitte l'appli.
- L'écran ne se met pas en veille tant que l'appli est ouverte.

## Mettre à jour

1. Modifie `tableau-bord-familial.html`.
2. Monte le numéro de version dans le HTML **et** dans `tizen/config.xml`.
3. Relance les commandes de l'étape 5.

## En cas de souci

| Message | Cause probable |
|---|---|
| `invalid certificate chain` / `certificate error` | Certificat pas de type **Samsung > TV**, ou DUID de l'écran absent du certificat distributeur. |
| L'écran n'apparaît pas dans `sdb devices` | Mode développeur désactivé, ou IP du PC mal saisie à l'étape 1. |
| `install failed` après un changement de certificat | Désinstalle l'ancienne version de l'appli sur l'écran, puis réinstalle. |
