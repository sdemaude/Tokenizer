# Whitepaper — MoiQuandJeCreeUnToken42

## 1. Présentation

MoiQuandJeCreeUnToken42 est un token fongible créé dans le cadre du projet Tokenizer. Le projet a pour objectif de mettre en œuvre un actif numérique compatible avec les outils usuels de l’écosystème Ethereum et de démontrer ses opérations principales sur un réseau de test public.

Le token n’est pas présenté comme une monnaie réelle, un produit financier ou une promesse de rendement. Le déploiement et les manipulations sont réalisés sur Ethereum Sepolia avec des fonds de test.

## 2. Choix techniques

| Élément | Choix |
|---|---|
| Blockchain | Ethereum Sepolia |
| Chain ID | `11155111` |
| Standard | ERC-20 |
| Langage | Solidity `^0.8.20`, compilé en `v0.8.34` pour le déploiement |
| Outil | Remix IDE |
| Portefeuille | MetaMask |
| Bibliothèque | OpenZeppelin Contracts |
| Nom | `MoiQuandJeCreeUnToken42` |
| Symbole | `MQCT` |
| Décimales | 18 |
| Offre initiale | 42 000 000 MQCT |

Le nom contient `42`, conformément à la contrainte du sujet. Le symbole `MQCT` est le ticker utilisé pour identifier le token.

## 3. Fonctionnement du token

Le contrat est basé sur l’implémentation ERC-20 d’OpenZeppelin. Il fournit les opérations standard suivantes :

- consultation du nom, du symbole, des décimales et de l’offre totale ;
- consultation du solde d’une adresse ;
- transfert de tokens ;
- approbation d’un compte ou d’un contrat ;
- transfert utilisant une autorisation existante.

Lors du déploiement, 42 000 000 tokens sont créés et attribués au compte déployeur.

La fonction `mint` permet au propriétaire de créer des tokens supplémentaires. Elle est protégée par `onlyOwner`. L’offre de 42 000 000 tokens est donc une offre initiale et non une limite maximale. Le propriétaire doit conserver la clé du compte de manière sécurisée et informer les utilisateurs de ce pouvoir administratif.

Le propriétaire initial est le compte MetaMask ayant déployé le contrat. La fonction `owner()` permet de contrôler cette adresse.

## 4. Sécurité et limites

Les contrôles de soldes, transferts et autorisations reposent sur OpenZeppelin. L’accès à `mint` est limité au propriétaire du contrat.

Les points importants à communiquer aux utilisateurs sont les suivants :

- la blockchain ne permet pas d’annuler un déploiement ou une transaction confirmée ;
- les frais de transaction et les opérations sur le réseau Sepolia restent soumis au fonctionnement de la blockchain ;
- la possession de la clé privée du propriétaire donne accès aux fonctions protégées par `onlyOwner` ;
- la fonction `mint` peut augmenter l’offre totale ;
- les adresses et liens indiqués dans ce document doivent correspondre au déploiement réellement publié.

## 5. Déploiement et utilisation

Le déploiement est réalisé avec Remix IDE et MetaMask :

1. sélectionner Ethereum Sepolia dans MetaMask ;
2. ouvrir `code/Token42.sol` dans Remix, ou `code/Token42_flattened.sol` si les imports ne sont pas résolus ;
3. compiler avec Solidity `v0.8.34` pour reproduire le contrat publié ;
4. choisir le fournisseur `Injected Provider - MetaMask` ;
5. déployer `MoiQuandJeCreeUnToken42` sans paramètre ;
6. confirmer la transaction dans MetaMask ;
7. conserver l’adresse du contrat et vérifier le code sur Sepolia Etherscan.

Les tests manuels minimaux sont : vérifier les métadonnées, vérifier l’offre et le solde initial, effectuer un transfert, contrôler le propriétaire et vérifier qu’un compte non propriétaire ne peut pas appeler `mint`.

## 6. Informations du déploiement

Informations du déploiement public :

- **Réseau :** Ethereum Sepolia
- **Chain ID :** `11155111`
- **Adresse du token :** `0x0739C18260E1FF9ceD7267A3D4F08fBCA0485e2c`
- **Hash de transaction de déploiement :** `0x0ae08a69521d967f7cec60e0c0f249b57c3aad47662628cf2ab477dff2990083`
- **Lien vers Sepolia Etherscan :** [ouvrir le contrat](https://sepolia.etherscan.io/address/0x0739C18260E1FF9ceD7267A3D4F08fBCA0485e2c)
- **Code vérifié :** [oui, sur Sepolia Blockscout](https://eth-sepolia.blockscout.com/address/0x0739C18260E1FF9ceD7267A3D4F08fBCA0485e2c#code)

## 7. Références dans le dépôt

- Contrat source : [`code/Token42.sol`](../code/Token42.sol)
- Version aplatie utilisable dans Remix : [`code/Token42_flattened.sol`](../code/Token42_flattened.sol)
- Procédure de déploiement : [`deployment/README.md`](../deployment/README.md)