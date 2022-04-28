// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/PullPayment.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./list.sol";
import "./config.sol";


contract NFT is ERC721, PullPayment, Ownable, myNFTConfig {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;
    function withdrawPayments(address payable payee) public override onlyOwner virtual { super.withdrawPayments(payee); }    

    mapping(address => uint8) private freelistV;
     mapping(address => uint8) private whitelistV;

    enum mintTypeEnum {free, whitelist, publicMint }
    uint64 public constant whitelistStart  = 1651017400;
    uint64 public constant publicStart  = 1651017400 + 86400;
    
    mylist private wlv;
    

    constructor() ERC721("NFTTutorial", "NFT") {
    
   	wlv = new mylist();
    
        setFreelist();
        setWhitelist();
     }

    function setFreelist() private {
	freelistV[0xFABB0ac9d68B0B445fB7357272Ff202C5651694a] = 1;
    }

	function setWhitelist() private {
		whitelistV[0xdF3e18d64BC6A983f673Ab319CCaE4f1a57C7097] = 2;	
	}


    function freeMint() 
    public 
    returns (uint256)
    {
    	require(freelistV[msg.sender] >= 1, "The message sender is either not in the free list or has already used the free mint");
    	return preApprovedMint(mintTypeEnum.free);
    }


    function whitelistMint()
    public
    payable
    returns (uint256)
    {
	wlv.listCanMintOrDie(msg.sender, msg.value);
    
    	require(block.timestamp >= whitelistStart, "whitelist sale has not started yet");
// 	require(whitelistV[msg.sender] >= 1, "The message sender is either not in the whitelist or has already used whitelist quota");
    	return preApprovedMint(mintTypeEnum.whitelist);	 
    }

    function paidMint()
    public 
    payable
    returns (uint256)
    {
	require(msg.value == MINT_PRICE, "Transaction value did not equal the mint price");
	return preApprovedMint(mintTypeEnum.publicMint);    	
    }

    function preApprovedMint(mintTypeEnum mintTyIn)
        private
        returns (uint256)
    {
        uint256 tokenId = currentTokenId.current();
        require(tokenId < TOTAL_SUPPLY, "Max supply reached");
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        
        address sendTo = msg.sender;
        
        _safeMint(sendTo, newItemId);
//        if      (mintTyIn == mintTypeEnum.free)      decFree (sendTo);
        if (mintTyIn == mintTypeEnum.whitelist) wlv.decrement(sendTo);

        return newItemId;
    }
}
