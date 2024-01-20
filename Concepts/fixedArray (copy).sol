// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract farr{
uint[5] public arr;
uint [3] public arr2 = [10,20,30];

function multi(uint[3] memory brr ) public pure returns(uint[3] memory) {
    brr[1] = 2*brr[1];
    return brr;
}

}


