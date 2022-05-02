// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract myNFTConfig {
	uint256 public constant totalSupply = 2222; // this appears to be a standard and the getter is automatic
    uint256 public constant MINT_PRICE  = 0.08 ether;
    uint64 public constant presalesStart     = 1651187531;
    uint64 public constant generalSalesStart = presalesStart + 150;
    
}
