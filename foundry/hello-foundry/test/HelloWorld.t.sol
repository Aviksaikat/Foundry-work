// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/HelloWorld.sol";

contract HelloWorldTest is Test {
    HelloWorld public hello_world;

    function setUp() public {
        hello_world = new HelloWorld();
    }

    function testGreet() external {
        assertEq(hello_world.greet(), "Hello World!!");
    }
}
