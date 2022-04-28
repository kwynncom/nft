// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./list.sol";

contract freelist is mylist {

    constructor() { setList(); }

    function setList() private {
	thelistv[0xFABB0ac9d68B0B445fB7357272Ff202C5651694a] = 1;	
    }
    
}
