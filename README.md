# Tokenizer — MoiQuandJeCreeUnToken42

Projet de création et de démonstration d’un token ERC-20 dans le cadre du sujet **Tokenizer**.

## Choix du projet

- **Blockchain :** Ethereum Sepolia, un réseau de test public permettant de réaliser les manipulations sans utiliser de fonds réels.
- **Standard :** ERC-20.
- **Langage :** Solidity `^0.8.20` ; le contrat publié a été compilé avec Solidity `v0.8.34` sans optimisation.
- **Outil de développement et de déploiement :** Remix IDE avec MetaMask comme portefeuille connecté.
- **Bibliothèque :** OpenZeppelin Contracts pour l’implémentation ERC-20 et la gestion de propriété.
- **Nom du token :** `MoiQuandJeCreeUnToken42`.
- **Symbole :** `MQCT`.
- **Décimales :** 18, comme dans l’implémentation ERC-20 utilisée.
- **Offre initiale :** 42 000 000 tokens, attribués au compte qui déploie le contrat.

Le nom du token contient `42`, conformément à la contrainte du sujet.

## Fonctionnement et privilèges

Le contrat expose les fonctions ERC-20 habituelles : consultation des soldes, transferts, approbations et transferts délégués.

La fonction `mint(address to, uint256 amount)` est réservée au propriétaire du contrat grâce à `onlyOwner`. Elle permet de créer de nouveaux tokens après le déploiement ; l’offre initiale de 42 000 000 tokens n’est donc pas une offre maximale. Cette possibilité constitue un privilège administratif qui doit être pris en compte lors de l’utilisation du token.

Le propriétaire initial est le compte MetaMask qui déploie le contrat. L’adresse du propriétaire peut être consultée avec `owner()`.

## Structure du dépôt

```text
.
├── README.md
├── code/
│   ├── Token42.sol
│   ├── Token42_flattened.sol
│   └── MultiSig42.sol
├── deployment/
│   └── README.md
└── documentation/
    └── Whitepaper.md
```

`Token42.sol` est la version source du token et importe OpenZeppelin. `Token42_flattened.sol` contient les dépendances nécessaires dans un seul fichier et peut être utilisé directement dans Remix lorsque la résolution des imports pose problème.

`MultiSig42.sol` correspond à la piste bonus du sujet. Il est conservé séparément et n’est pas présenté comme une fonctionnalité opérationnelle du token dans l’état actuel du dépôt.

## Compiler et déployer avec Remix IDE

1. Ouvrir [Remix IDE](https://remix.ethereum.org/).
2. Importer `code/Token42.sol`. Si les imports OpenZeppelin ne sont pas résolus, importer et compiler `code/Token42_flattened.sol` à la place.
3. Dans **Solidity Compiler**, sélectionner `v0.8.34` pour reproduire le bytecode publié. Cette version est compatible avec le pragma `^0.8.20` du contrat.
4. Compiler le contrat `MoiQuandJeCreeUnToken42`.
5. Dans MetaMask, sélectionner le réseau **Ethereum Sepolia** et utiliser uniquement des SepoliaETH de test.
6. Dans l’onglet **Deploy & Run Transactions**, sélectionner **Injected Provider - MetaMask**.
7. Vérifier que le compte affiché est le compte destiné à devenir propriétaire du token.
8. Sélectionner `MoiQuandJeCreeUnToken42`, puis cliquer sur **Deploy**. Le constructeur ne demande aucun paramètre.
9. Confirmer la transaction dans MetaMask et conserver l’adresse du contrat ainsi que le hash de transaction.

Les clés privées, phrases de récupération et fichiers contenant des secrets ne doivent jamais être ajoutés au dépôt.

## Vérification du fonctionnement

Après le déploiement, sélectionner le contrat déployé dans Remix et effectuer au minimum les vérifications suivantes :

1. `name()` retourne `MoiQuandJeCreeUnToken42`.
2. `symbol()` retourne `MQCT`.
3. `decimals()` retourne `18`.
4. `totalSupply()` correspond à l’offre initiale, augmentée uniquement des éventuels mint réalisés.
5. `balanceOf(adresse_du_deployeur)` contient l’offre initiale après le déploiement.
6. Un transfert vers un second compte MetaMask fonctionne.
7. `owner()` retourne l’adresse du compte déployeur.
8. Un compte qui n’est pas propriétaire ne peut pas appeler `mint`.

Pour les fonctions utilisant une quantité de tokens, les valeurs sont exprimées dans l’unité minimale du token. Avec 18 décimales, `1 MQCT` correspond à `1000000000000000000`.

## Déploiement publié

Le contrat a été déployé sur le réseau public de test et ses informations peuvent être vérifiées sur les explorateurs indiqués ci-dessous.

- **Réseau :** Ethereum Sepolia
- **Chain ID :** `11155111`
- **Adresse du token :** `0x0739C18260E1FF9ceD7267A3D4F08fBCA0485e2c`
- **Hash de déploiement :** `0x0ae08a69521d967f7cec60e0c0f249b57c3aad47662628cf2ab477dff2990083`
- **Lien Sepolia Etherscan :** [ouvrir le contrat](https://sepolia.etherscan.io/address/0x0739C18260E1FF9ceD7267A3D4F08fBCA0485e2c)
- **Code source vérifié :** [Sepolia Blockscout](https://eth-sepolia.blockscout.com/address/0x0739C18260E1FF9ceD7267A3D4F08fBCA0485e2c#code)

La vérification sur l’explorateur doit permettre de retrouver le nom du contrat, son symbole `MQCT` et son code source correspondant à la version remise dans le dépôt.

## Documentation complémentaire

Les choix fonctionnels et les limites du token sont détaillés dans [`documentation/Whitepaper.md`](documentation/Whitepaper.md). La procédure pratique de déploiement et de publication est rappelée dans [`deployment/README.md`](deployment/README.md).
