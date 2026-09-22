# Déploiement avec Remix IDE et MetaMask

Cette notice décrit le déploiement du token sur Ethereum Sepolia sans utiliser de fonds réels.

## Préparation

- installer l’extension MetaMask ;
- sélectionner le réseau Ethereum Sepolia ;
- utiliser un compte de test dédié au projet ;
- obtenir uniquement des SepoliaETH de test auprès d’un faucet reconnu ;
- ne jamais partager ni commiter la phrase de récupération ou la clé privée.

## Compilation dans Remix

1. Ouvrir [Remix IDE](https://remix.ethereum.org/).
2. Importer `../code/Token42.sol`.
3. Sélectionner le compilateur Solidity `v0.8.34` afin de reproduire le bytecode publié. Cette version respecte le pragma `^0.8.20` du contrat.
4. Compiler le contrat `MoiQuandJeCreeUnToken42`.

Si Remix ne résout pas les imports `@openzeppelin/contracts/...`, importer `../code/Token42_flattened.sol` et compiler le contrat `MoiQuandJeCreeUnToken42` défini dans ce fichier.

## Déploiement

1. Ouvrir **Deploy & Run Transactions**.
2. Choisir **Injected Provider - MetaMask**.
3. Vérifier le réseau et l’adresse du compte affichés par Remix.
4. Sélectionner `MoiQuandJeCreeUnToken42`.
5. Cliquer sur **Deploy**. Aucun argument de constructeur n’est requis.
6. Confirmer la transaction dans MetaMask.
7. Noter l’adresse du contrat et le hash de transaction.

Le compte qui réalise cette opération devient le propriétaire initial du contrat et reçoit l’offre initiale de 42 000 000 tokens.

## Vérifications après déploiement

Dans le contrat déployé dans Remix :

- appeler `name()` et vérifier `MoiQuandJeCreeUnToken42` ;
- appeler `symbol()` et vérifier `MQCT` ;
- appeler `decimals()` et vérifier `18` ;
- appeler `totalSupply()` ;
- appeler `balanceOf()` avec l’adresse du compte déployeur ;
- appeler `owner()` ;
- réaliser un transfert vers une seconde adresse de test ;
- vérifier qu’un compte qui n’est pas propriétaire ne peut pas appeler `mint`.

Les montants ERC-20 sont exprimés dans l’unité minimale. Avec 18 décimales, `1 MQCT` vaut `1000000000000000000` dans les champs de Remix.

## Publication et informations à conserver

Après le déploiement, vérifier le contrat sur l’explorateur Sepolia correspondant. Reporter ensuite dans le README et le whitepaper :

- l’adresse du contrat ;
- le hash de transaction de déploiement ;
- le réseau `Ethereum Sepolia` ;
- le lien direct vers l’explorateur ;
- le résultat de la vérification du code source.

Pour ce projet, l’adresse publiée du token est :

- **Réseau :** Ethereum Sepolia
- **Adresse :** `0x0739C18260E1FF9ceD7267A3D4F08fBCA0485e2c`
- **Hash de création :** `0x0ae08a69521d967f7cec60e0c0f249b57c3aad47662628cf2ab477dff2990083`
- **Explorateur :** [Sepolia Etherscan](https://sepolia.etherscan.io/address/0x0739C18260E1FF9ceD7267A3D4F08fBCA0485e2c)
- **Code vérifié :** [Sepolia Blockscout](https://eth-sepolia.blockscout.com/address/0x0739C18260E1FF9ceD7267A3D4F08fBCA0485e2c#code)