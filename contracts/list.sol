// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./config.sol";

contract mylist is myNFTConfig {

    mapping(address => uint8) private thelistv;
    
    constructor() {
    	setList();
    }

    function setList() private {
	thelistv[0xdF3e18d64BC6A983f673Ab319CCaE4f1a57C7097] = 2;	
    }

    function decrement(address a) public { thelistv[a]--; }
    
    function listCanMintOrDie(address a, uint256 msgValue) public view {
	require(msgValue == MINT_PRICE, "Transaction value did not equal the mint price");
	require(thelistv[a] >= 1, "The message sender address is either not in the list or has already used its quota");
     }
    
}
