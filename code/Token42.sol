// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MoiQuandJeCreeUnToken42 is ERC20, Ownable {
    constructor() ERC20("MoiQuandJeCreeUnToken42", "MQCT") Ownable(msg.sender) {
        _mint(msg.sender, 42000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}