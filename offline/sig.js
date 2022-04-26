// require('./../node_modules/web3');
const abilo = require('web3-eth-abi');

console.log(
abilo.encodeFunctionSignature(


    {
      "inputs": [],
      "name": "freeMint",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "payable",
      "type": "function"
    }

)
);
