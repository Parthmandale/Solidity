// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract continueBreak{

function fun() public pure returns(uint){
   uint x = 0;
    for(uint i=0; i<10; i++){
        if(i==6){
break;  //continue
        }
        x+=5;
    }
return x;
}

}