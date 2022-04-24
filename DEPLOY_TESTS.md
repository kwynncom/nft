date
Sat Apr 23 11:00:16 PM EDT 2022
git status
...
Untracked files: DEPLOY_TESTS.md
date ; npx hardhat compile ; date
Sat Apr 23 11:01:46 PM EDT 2022
Nothing to compile
Sat Apr 23 11:01:47 PM EDT 2022
# meaning unchanged
SHA512(contracts/NFT.sol)= 84bcfa9a1948a6bb63ed36456360c2438342f28674146cc5abcf8e3a9f79c9c63e4cf109e7d13d4cd5ef7b218b985c7486e6dcc7b6389e528cd1fa18d14e8507
# being very specific!
# rinkeby is one of the test ETH networks
npx hardhat run scripts/deploy.js --network rinkeby
Deploying contracts with the account: 0x9BEb87E50Dbb3f1356C9B8d72A5F08C794d3b95f
Account balance: 4720727655797742255
Contract deployed to address: 0xb12b33946066799DD095b0227a3E9bAF91B9106a
date
Sat Apr 23 11:04:21 PM EDT 2022
# (Apr-24-2022 03:04:05 AM +UTC)
# [Contract 0xb12b33946066799dd095b0227a3e9baf91b9106a Created]
npx hardhat verify 0xb12b33946066799DD095b0227a3E9bAF91B9106a
Nothing to compile
Successfully submitted source code for contract
contracts/NFT.sol:NFT at 0xb12b33946066799DD095b0227a3E9bAF91B9106a
for verification on the block explorer. Waiting for verification result...

Successfully verified contract NFT on Etherscan.
https://rinkeby.etherscan.io/address/0xb12b33946066799DD095b0227a3E9bAF91B9106a#code

openssl sha512 contracts/NFT.sol ; date
SHA512(contracts/NFT.sol)= 84bcfa9a1948a6bb63ed36456360c2438342f28674146cc5abcf8e3a9f79c9c63e4cf109e7d13d4cd5ef7b218b985c7486e6dcc7b6389e528cd1fa18d14e8507
Sat Apr 23 11:06:38 PM EDT 2022

