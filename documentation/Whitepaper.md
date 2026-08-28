# Whitepaper : Token42 & Écosystème de Gouvernance Décentralisée

## 1. Introduction et Vision

Le projet Token42 s'inscrit dans le cadre de l'apprentissage des technologies de la blockchain et du développement de smart contracts. L'objectif est de concevoir un actif numérique fongible standardisé tout en intégrant des couches de gouvernance et de sécurité avancées. Ce document présente l'architecture technique, les choix de conception et le modèle fonctionnel du jeton.

## 2. Spécifications du Jeton (Token42)

Token42 est un actif numérique conforme au standard **ERC-20** sur la blockchain Ethereum (testnet Sepolia), garantissant une interopérabilité totale avec l'écosystème décentralisé (portefeuilles, plateformes d'échange décentralisées et explorateurs de blocs).

* **Nom du jeton :** MoiQuandJeCreeUnToken42
* **Symbole :** MQCT
* **Standard :** ERC-20 (via l'implémentation de référence OpenZeppelin)
* **Offre initiale (Initial Supply) :** 42 000 000 jetons avec une précision de 18 décimales.
* **Mécanisme de Mint :** L'émission de nouveaux jetons est strictement contrôlée afin d'éviter toute inflation non désirée, gérée via un mécanisme de propriété sécurisé (`Ownable`).

## 3. Sécurité et Architecture des Contrats

Pour prévenir les vulnérabilités courantes des smart contracts (failles logiques, erreurs de contrôle d'accès), le code repose sur les briques logicielles d'**OpenZeppelin**.

* **Héritage sécurisé :** Utilisation de contrats de base audités pour la gestion des soldes, des transferts et des autorisations d'approbation.
* **Encapsulation :** Séparation claire des rôles administratifs pour empêcher l'exécution de fonctions critiques par des utilisateurs non autorisés.

## 4. Partie Bonus : Gouvernance Multisig

Afin de renforcer la sécurité des actifs et d'éliminer les points de défaillance uniques, une architecture de portefeuille multi-signature (**Multisig**) a été implémentée et couplée au projet.

* **Principe de fonctionnement :** Aucune transaction ou modification critique ne peut être exécutée de manière unilatérale. Un seuil minimal de validations ($M$ signatures requises sur $N$ propriétaires) est indispensable.
* **Cycle de vie d'une transaction :**
1. Un propriétaire soumet une proposition de transaction (`submitTransaction`).
2. Les co-signataires examinent et approuvent la proposition (`confirmTransaction`).
3. Dès que le seuil requis est atteint, la transaction est exécutée de façon autonome par le smart contract (`executeTransaction`).



## 5. Déploiement et Utilisation

Le projet est déployé sur le réseau de test **Sepolia** pour valider l'ensemble des flux transactionnels en conditions réelles sans engager de fonds réels.

* **Réseau :** Ethereum Sepolia Testnet
* **Smart Contract Token :** À renseigner (Adresse du contrat sur Sepolia Etherscan)
* **Smart Contract Multisig :** À renseigner (Adresse du contrat sur Sepolia Etherscan)

## Conclusion

Token42 démontre la capacité à concevoir des actifs numériques robustes en combinant un standard ERC-20 optimisé et une gouvernance collective sécurisée par un multisig. Ce cadre technique pose les bases d'une architecture décentralisée fiable, transparente et extensible.