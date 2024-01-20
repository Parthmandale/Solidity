// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Storage {
    uint[3] public arr = [1,2,3];
function store() public{
    arr [0] = 10;
    uint[3] storage pointer = arr;        // Storage litrally works as pointer which we learned in C lang
    pointer [1] = 20; 
}   
}