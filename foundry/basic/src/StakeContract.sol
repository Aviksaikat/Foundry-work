// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@opensezppling/contracts/token/ERC20/ERC20.sol";

error TransactionFailed();

contract StakeContract {
    
    mapping(address => mapping(address => uint256)) public s_balances;

    function stake(uint256 amount, address token) external returns(bool) {
        
        s_balances[msg.sender][token] += amount; 
        bool success = IERC20(token).transferFrom(msg.sender, address(this), amount);
        if (!success) revert TransactionFailed();
        return success;
    }
}