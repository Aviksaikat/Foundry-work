// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Counter.sol";

// Each test will start a new instance

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testInc() public {
        counter.inc();
        assertEq(counter.count(), 1);
    }

    function testDec() public {
        counter.inc();
        counter.inc();
        counter.dec();
        assertEq(counter.count(), 1);
    }

    function testFailDec() public {
        counter.dec();
    }

    function testDecUnderFlow() public {
        vm.expectRevert(stdError.arithmeticError);
        counter.dec();
    }
}
