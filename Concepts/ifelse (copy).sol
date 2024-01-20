// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract ifelse{

    function fun(uint _x) public pure returns(string memory){
        string memory val;
   
        if(_x >100){
            val="greater";
        }
        else if(_x<100){
            val="lower";
        }
        
        else{
            val = "Equal"; 
        }
return val;
    }
}