// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./list.sol";

contract whitelist is mylist {
    function listCanMintOrDie(address a, uint256 msgValue) public view {
	require(msgValue == MINT_PRICE, "Transaction value did not equal the mint price");
	super.listCanMintOrDie(a); 
    }

    function setList() private {
	thelistv[0xdF3e18d64BC6A983f673Ab319CCaE4f1a57C7097] = 2;	
    }
    
}

