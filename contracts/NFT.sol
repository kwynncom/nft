// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./config.sol"; import "./whitelist.sol"; import "./freelist.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol" ; import "@openzeppelin/contracts/utils/Counters.sol"; 
import "@openzeppelin/contracts/security/PullPayment.sol"; import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721, PullPayment, Ownable, myNFTConfig {
    using Counters for Counters.Counter; Counters.Counter private currentTokenId;

	uint256 public totalSupply;
	uint256 public constant maxTotalSupply = MAX_SUPPLY;

    function withdrawPayments(address payable payee) public override onlyOwner virtual { super.withdrawPayments(payee); }    
    function setBaseTokenURI(string memory _baseTokenURI) public     onlyOwner { baseTokenURI = _baseTokenURI;  }
    string public baseTokenURI;

    whitelist whitelv;
    freelist freelv;
        
    constructor() ERC721("NFTTutorial", "NFT") {
     	whitelv = new whitelist();   	
   		freelv  = new freelist();
   		
        baseTokenURI = "";
    }
    function freeMint() public returns (uint256)  {
   	address addr = msg.sender;
    	freelv.		listCanMintOrDie(addr);
    	uint256 tokenN = preApprovedMint(addr);	 
    	freelv.		       decrement(addr);
    	return tokenN;    	
    }
    function whitelistMint() public payable returns (uint256) {

     	address addr = msg.sender;
  	whitelv.listCanMintOrDie(        addr);
    	uint256 tokenN = 	paidMint(addr, msg.value);	 
    	whitelv.	       decrement(addr);
    	return tokenN;
    }
    function generalMint()    	    public  payable returns (uint256) {     
    	require(block.timestamp >= generalSalesStart, "general or post-whitelist sale has not yet begun");
    	return paidMint(msg.sender, msg.value);
    }
    function paidMint(address addr, uint256 msgValue) private returns (uint256) {
	require(msgValue == MINT_PRICE, "Transaction value did not equal the mint price");
	return preApprovedMint(addr);    	
    }
    function preApprovedMint(address addr) private returns (uint256)    {
        uint256 tokenId = currentTokenId.current();
        require(tokenId < MAX_SUPPLY, "Max supply reached");
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(addr, newItemId);
        totalSupply =   newItemId; // only for purposes of satisfying EtherScan
        return          newItemId;
    }
    
	function _baseURI() internal view virtual override returns (string memory) { return baseTokenURI;  }    
}
