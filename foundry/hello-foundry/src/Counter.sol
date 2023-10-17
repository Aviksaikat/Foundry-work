// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// only for testing remove it before atucal deployemnt
import "forge-std/console.sol";

contract Counter {
    uint256 public count;

    function inc() external {
        console.log("Increamented", count);
        count += 1;
    }

    function dec() external {
        console.log("Decreamented", count);
        count -= 1;
    }
}
