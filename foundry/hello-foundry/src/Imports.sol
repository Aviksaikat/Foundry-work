// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "solmate/tokens/ERC20.sol";
import "@openzepplin/contracts/access/Ownable.sol";

contract Token is ERC20("name", "symbol", 18) {}

contract TestOz is Ownable {}
