// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract globalVariable{
        address public myAdd = msg.sender;
        uint public time = block.timestamp;
        uint public diff = block.difficulty;
        uint public gasCost = tx.gasprice;
}