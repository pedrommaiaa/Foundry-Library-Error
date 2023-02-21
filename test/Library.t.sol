// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Helper} from "../src/Helper.sol";
import {MockERC20} from "solmate/test/utils/mocks/MockERC20.sol";
import {SafeTransferLib} from "solmate/utils/SafeTransferLib.sol";

contract LibraryTest is Test {
    Helper public helper;
    MockERC20 public token;

    function setUp() public {
        token = new MockERC20("MockToken", "TST", 18);
        helper = new Helper(token);
    }

    function testRevertTransfer() external {
        vm.expectRevert(bytes("TRANSFER_FAILED"));
        SafeTransferLib.safeTransfer(token, address(0xBEEF), 1e18);
    }

    function testRevertHelperTransfer() external {
        vm.expectRevert(bytes("TRANSFER_FAILED"));
        helper.doSafeTransfer(address(0xBEEF), 1e18);
    }
}
