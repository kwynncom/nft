// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Kwynn has modified this.

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract NFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;

    mapping(address => bool) private whitelist20;
    uint256 public constant TOTAL_SUPPLY = 2222_000;
    uint256 public constant MINT_PRICE = 0.08 ether;

    
 
    constructor() ERC721("NFTTutorial", "NFT") {
        whitelist20[0xFABB0ac9d68B0B445fB7357272Ff202C5651694a] = true;
        //          0xFABB0ac9d68B0B445fB7357272Ff202C5651694a
        //          0xFABB0ac9d68B0B445fB7357272Ff202C5651694a
     }

    function mintToMsgSender()
        public
        payable
        returns (uint256)
    {
         uint256 tokenId = currentTokenId.current();
        require(tokenId < TOTAL_SUPPLY, "Max supply reached");
	require(msg.value == MINT_PRICE, "Transaction value did not equal the mint price");
	
	address recipient = msg.sender;
	
//         require(whitelist20[recipient], "trying to mint free when not on whitelist, 23:30");

        currentTokenId.increment();

        uint256 newItemId = currentTokenId.current();
        _safeMint(recipient, newItemId);
        return newItemId;
    }
}
