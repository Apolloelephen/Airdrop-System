// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AlphaToken is ERC20 {

    constructor() ERC20("APOLLOTOKEN", "AT") {

        _mint(msg.sender, 1000);
    }
}