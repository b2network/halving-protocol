# Halving Protocol

To commemorate the fourth halving of BTC, we have coded a token that simulates the issuance rules of BTC.

The total supply of Halving Token is 21 million, with each mint producing 50 tokens. Every 210,000 mints, the number of tokens produced will be halved.

| Mint Times | Mint Amount |
| --- | --- |
| 1 - 210,000 | 50 |
| 210,001 - 420,000 | 25 |
| 420,001 - 630,000 | 12.5 |
| 630,001 - 840,000 | 6.25 |
| 840,001 - 1,050,000 | 3.125 |

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/HalvingToken.js
```
