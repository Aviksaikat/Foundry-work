// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";

contract ConsoleLogTest is Test {
    function testLogSomething() external view {
        console.log("Loggin from Console.t.sol", 420);

        int x = -3;
        console.logInt(x);
    }
}
