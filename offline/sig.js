// require('./../node_modules/web3');
const abilo = require('web3-eth-abi');

console.log('white ' + 
abilo.encodeFunctionSignature(


    {
      "inputs": [],
      "name": "whitelistMint",
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

console.log('free ' + 
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
      "stateMutability": "nonpayable",
      "type": "function"
    }

)
);

console.log('general ' + 
abilo.encodeFunctionSignature(

{
      "inputs": [],
      "name": "generalMint",
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
