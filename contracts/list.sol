// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./config.sol";

contract mylist is myNFTConfig {

    mapping(address => uint8) internal thelistv;
    
    constructor() {
//    	setList();
    }

    function decrement(address a) public { thelistv[a]--; }
    
    function listCanMintOrDie(address a, uint256 msgValue) public view {
    
       	require(block.timestamp >= presalesStart && block.timestamp < publicSalesStart, "whitelist sale has not started yet");
    
	require(msgValue == MINT_PRICE, "Transaction value did not equal the mint price");
	require(thelistv[a] >= 1, "The message sender address is either not in the list or has already used its quota");
     }
    
}
