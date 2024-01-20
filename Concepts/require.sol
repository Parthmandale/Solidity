// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract req{
uint public sum;
uint public check =1;
function reqq(uint a) public {
    check = 2;
    require(a==0,"a is not 0");
    sum=1;
}

}