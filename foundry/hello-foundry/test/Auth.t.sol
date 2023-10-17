// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

contract AuthTest is Test {
    Wallet public wallet;

    function setUp() external {
        wallet = new Wallet();
    }

    function testSetOwner() external {
        wallet.setOwner(address(0xdead));
        assertEq(wallet.owner(), address(0xdead));
    }

    // by saying testFail we are saying this test will fail
    function testFailNotOwner() external {
        // by this we are telling foundry to set the msg.sender for the next call = address(1)
        vm.prank(address(0xdead));
        wallet.setOwner(address(0xdead));
    }

    function testFailSetOwnerAgain() external {
        // msg.sender == address(this)
        wallet.setOwner(address(0xdead));

        // setting the msg.sender for the next call
        vm.startPrank(address(0xdead));
    
        wallet.setOwner(address(0xdead));

        wallet.setOwner(address(0xdead));
        
        wallet.setOwner(address(0xdead));
        // all the calls in between the msg.sender = address(1)
        vm.stopPrank();


        wallet.setOwner(address(0xdead));
    }
}