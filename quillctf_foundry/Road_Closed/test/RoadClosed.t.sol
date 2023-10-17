// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/RoadClosed.sol";

contract RoadClosedTest is Test {
    RoadClosed public target;

    function setUp() public {
        vm.createSelectFork("goerli");
        target = RoadClosed(0xd2372eb76c559586be0745914e9538c17878e812)
    }

    
}
