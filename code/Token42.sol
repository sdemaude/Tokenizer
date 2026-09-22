// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @notice ERC-20 token with an owner-controlled mint function.
contract MoiQuandJeCreeUnToken42 is ERC20, Ownable {
    /// @notice Creates the token and assigns the initial supply to the deployer.
    constructor() ERC20("MoiQuandJeCreeUnToken42", "MQCT") Ownable(msg.sender) {
        // Mint 42 million tokens to the deployer.
        _mint(msg.sender, 42000000 * 10 ** decimals());
    }

    /// @notice Mints tokens to an address. Only the owner can call this function.
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}