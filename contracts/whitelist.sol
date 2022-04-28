// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./list.sol";

contract whitelist is mylist {

    constructor() { setList(); }

    function setList() private {
	thelistv[0xdF3e18d64BC6A983f673Ab319CCaE4f1a57C7097] = 2;	
    }
    
}

