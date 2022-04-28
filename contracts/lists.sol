// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract whitelist {

    mapping(address => uint8) private whitelistV;
    
    constructor() {
    	setWhitelist();
    }

    function setWhitelist() private {
	whitelistV[0xdF3e18d64BC6A983f673Ab319CCaE4f1a57C7097] = 2;	
    }

    function decWhite(address a) private { whitelistV[a]--; }
    
    function whitelistCanMintOrDie(address a) public view {
	require(whitelistV[a] >= 1, "The message sender address is either not in the list or has already used its quota");
     }
    
}
