// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/PullPayment.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./list.sol";
import "./config.sol";
import "./whitelist.sol";


contract NFT is ERC721, PullPayment, Ownable, myNFTConfig {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;
    function withdrawPayments(address payable payee) public override onlyOwner virtual { super.withdrawPayments(payee); }    

    mapping(address => uint8) private freelistV;
     mapping(address => uint8) private whitelistV;

    enum mintTypeEnum {free, whitelist, publicMint }
    
    whitelist private whitelv;
//    mylist private freelv;
    

    constructor() ERC721("NFTTutorial", "NFT") {
    
   	whitelv = new whitelist();
//   	freelv  =
     }

    function freeMint() 
    public 
    returns (uint256)
    {
//    	require(freelistV[msg.sender] >= 1, "The message sender is either not in the free list or has already used the free mint");
//    	return preApprovedMint(mintTypeEnum.free);
    }


    function whitelistMint()
    public
    payable
    returns (uint256)
    {
	whitelv.listCanMintOrDie(msg.sender, msg.value);
    	uint256 tokenN = paidMint();	 
    	whitelv.decrement;
    	return tokenN;
    }

    function paidMint()
    public 
    payable
    returns (uint256)
    {
	require(msg.value == MINT_PRICE, "Transaction value did not equal the mint price");
	return preApprovedMint();    	
    }

    function preApprovedMint()
        private
        returns (uint256)
    {
        uint256 tokenId = currentTokenId.current();
        require(tokenId < TOTAL_SUPPLY, "Max supply reached");
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        
        _safeMint(msg.sender, newItemId);
        return newItemId;
    }
}
