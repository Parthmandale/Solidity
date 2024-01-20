// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract dynamicaarr{
    uint[] public arr =[1,2,3];
    function pushelemnt (uint elem) public {
        arr.push(elem);   //push the last element
    }

    function popelemt() public {
        arr.pop();     // removes the last elemet
    }

    function returnarr() public view returns(uint[] memory){
        return arr;
    } 
}