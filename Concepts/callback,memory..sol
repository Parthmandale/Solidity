// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract CallbackAndMemory{

function call(uint[3] memory arr, uint[3] calldata brr) public pure returns(uint[3] memory){

arr[1] = brr[1] * 2;
arr[0]=brr[0];
return arr;

} 

}