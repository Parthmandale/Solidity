 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoinFlip {
 

 // this value will change if you did put this in function and it will work as a transaction
 uint256 public blockValue = uint256(blockhash(block.number - 1));

}