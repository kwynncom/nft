// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./config.sol";

abstract contract mylist is myNFTConfig { // I think this will NOT be config once I do date management

    mapping(address => uint8) internal thelistv;

    function decrement(address a) public { thelistv[a]--; }
    
    function listCanMintOrDie(address a) public view {
    
    	uint256 U = block.timestamp;
    
    	require(U >= presalesStart    , "The sale for whitelist and free mints has not started.");
    	require(U <  generalSalesStart, "The general public sale has begun.  The whitelist is moot; free mints are no longer allowed.");
	require(thelistv[a] >= 1, "The message sender address is either not in the list or has already used its list quota");
     }
     
//     function getChainId() private view returns (uint256 chainId) {  assembly { chainId := chainid()	} }
}

