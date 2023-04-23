// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract PredictableNFTTest is Test {
	address nft;

	address hacker = address(0x6DC51f9C50735658Cc6a003e07B0b92dF9c98473);

	function setUp() public {
		vm.createSelectFork("goerli");
		vm.deal(hacker, 1 ether);
		nft = address(0xFD3CbdbD9D1bBe0452eFB1d1BFFa94C8468A66fC);
	}

	function test() public {
		vm.startPrank(hacker);
		uint mintedId;
		uint currentBlockNum = block.number;

		// Mint a Superior one, and do it within the next 100 blocks.
		for(uint i=0; i<100; i++) {
			vm.roll(currentBlockNum);

			// ---- hacking time ----

			currentBlockNum++;
		}

		// get rank from `mapping(tokenId => rank)`
		(, bytes memory ret) = nft.call(abi.encodeWithSignature(
			"tokens(uint256)",
			mintedId
		));
		uint mintedRank = uint(bytes32(ret));
		assertEq(mintedRank, 3, "not Superior(rank != 3)");
	}
}