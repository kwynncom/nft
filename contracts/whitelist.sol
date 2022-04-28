// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./list.sol";

contract whitelist is mylist {

    constructor() { setList(); }

    function setList() private {
	// NFT-WHITELIST-AUTOGEN-GOES-BELOW
	thelistv[0xdF3e18d64BC6A983f673Ab319CCaE4f1a57C7097] = 2;
	thelistv[0xb12b33946066799DD095b0227a3E9bAF91B9106a] = 2;
	thelistv[0xac9DfC856A446C8A7179319Fd37183b8f3351B49] = 2;
	thelistv[0x79cC47bB998f0B4AA660006fD3196f203e855f4D] = 2;
	thelistv[0xAbAc1f0A0bd9406ce5172d2d1824eFCE2d6ABF46] = 2;
	thelistv[0x8ca86d22241C3458441E286Fa0062023988c1E61] = 2;
	thelistv[0x51174F5CD092e8876846684607eB8f89A8C93def] = 2;
	thelistv[0xFABB0ac9d68B0B445fB7357272Ff202C5651694a] = 2;

    }
    
}

