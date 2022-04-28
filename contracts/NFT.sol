// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/PullPayment.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./config.sol";
import "./whitelist.sol";
import "./freelist.sol";


contract NFT is ERC721, PullPayment, Ownable, myNFTConfig {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;

    function withdrawPayments(address payable payee) public override onlyOwner virtual { super.withdrawPayments(payee); }    

    whitelist private whitelv;
    freelist  private freelv;

    constructor() ERC721("NFTTutorial", "NFT") {
       	whitelv = new whitelist();
   	freelv  = new freelist();
     }

    function freeMint() public returns (uint256)  {

   	address addr = msg.sender;
    	freelv.listCanMintOrDie(addr);
    	uint256 tokenN = preApprovedMint();	 
    	freelv.decrement(addr);
    	return tokenN;    	
    }

    function whitelistMint() public payable returns (uint256) {
    
    	address addr = msg.sender;
  	whitelv.listCanMintOrDie(addr, msg.value);
    	uint256 tokenN = paidMint();	 
    	whitelv.decrement(addr);
    	return tokenN;
    }

    function paidMint() public payable returns (uint256) {
	require(msg.value == MINT_PRICE, "Transaction value did not equal the mint price");
	return preApprovedMint();    	
    }

    function preApprovedMint() private returns (uint256)    {
        uint256 tokenId = currentTokenId.current();
        require(tokenId < TOTAL_SUPPLY, "Max supply reached");
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        
        _safeMint(msg.sender, newItemId);
        return newItemId;
    }
}
