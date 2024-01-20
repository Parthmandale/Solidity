// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract ifelse{

     function fun(uint _x) public pure returns(string memory){
        string memory val;

 val = _x>100?"GREATER" : "EQUAL OR LESSER";

 return  val;
     }
}