// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NumberStore {
    uint256 public number;

    function setNumber(uint256 _num) external {
        number = _num;
    }
}
