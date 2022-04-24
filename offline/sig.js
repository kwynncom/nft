// require('./../node_modules/web3');
const abilo = require('web3-eth-abi');

console.log(
abilo.encodeFunctionSignature({
    name: 'myMethod',
    type: 'function',
    inputs: [{
        type: 'uint256',
        name: 'myNumber'
    },{
        type: 'string',
        name: 'myString'
    }]
})
);
