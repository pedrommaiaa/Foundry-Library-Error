// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {MockERC20} from "solmate/test/utils/mocks/MockERC20.sol";
import {SafeTransferLib} from "solmate/utils/SafeTransferLib.sol";

contract LibraryTest is Test {
    MockERC20 public token;

    function setUp() public {
        token = new MockERC20("MockToken", "TST", 18);
    }

    function testRevertTransfer() external {
        vm.expectRevert(bytes("TRANSFER_FAILED"));
        SafeTransferLib.safeTransfer(token, address(0xBEEF), 1e18);
    }
}
