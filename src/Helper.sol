// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "solmate/tokens/ERC20.sol";
import {SafeTransferLib} from "solmate/utils/SafeTransferLib.sol";

contract Helper {
    ERC20 public token;

    constructor(ERC20 _token) { token = _token; }

    function doSafeTransfer(address to, uint256 amount) external {
        SafeTransferLib.safeTransfer(token, to, amount); 
    }
}
