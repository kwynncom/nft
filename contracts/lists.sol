// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract my2lists {
    mapping(address => uint8) private whitelistV;
    
    constructor() {
    	setWhitelist();
    }

    function setWhitelist() private {
	whitelistV[0xdF3e18d64BC6A983f673Ab319CCaE4f1a57C7097] = 2;	
    }

	function decWhite(address a) private { whitelistV[a]--; }
    
}
