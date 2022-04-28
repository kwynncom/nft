// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./config.sol";

contract mylist is myNFTConfig { // I think this will NOT be config once I do date management

    mapping(address => uint8) internal thelistv;

    function decrement(address a) public { thelistv[a]--; }
    
    function listCanMintOrDie(address a) public view {
       	require(block.timestamp >= presalesStart && block.timestamp < generalSalesStart, "whitelist sale has not started yet");
	require(thelistv[a] >= 1, "The message sender address is either not in the list or has already used its quota");
     }
     
     function getChainId() private view returns (uint256 chainId) {  assembly { chainId := chainid()	} }
}

