// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/PullPayment.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721, PullPayment, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;
    function withdrawPayments(address payable payee) public override onlyOwner virtual { super.withdrawPayments(payee); }    

    mapping(address => uint8) private freelist20;
    uint256 public constant TOTAL_SUPPLY = 2222_000;
    uint256 public constant MINT_PRICE = 0.08 ether;

    constructor() ERC721("NFTTutorial", "NFT") {
        setFreeList20();
     }

    function setFreeList20() private {
	freelist20[0xFABB0ac9d68B0B445fB7357272Ff202C5651694a] = 2;
    }

    function freeMint() 
    public 
    payable
    returns (uint256)
    {
    	
    }

    function paidMint()
    public 
    payable
    returns (uint256)
    {
	require(msg.value == MINT_PRICE, "Transaction value did not equal the mint price");
	return preApprovedMint(msg.sender);    	
    }

    function preApprovedMint(address recipient)
        private
        returns (uint256)
    {
        uint256 tokenId = currentTokenId.current();
        require(tokenId < TOTAL_SUPPLY, "Max supply reached");
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(recipient, newItemId);
        return newItemId;
    }
}
