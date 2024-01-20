// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract loops{

    function loop() public pure returns(uint){
        uint x = 0;
    //     while(x<10){
    //         x+=5;
    //     }
    // return x;
    
    // do{
    //     x+=5;
    // }while(x<10); 
    
    // return x;

    for(uint i=0; i<10; i=i+5){
    x+=5;
    }
return x;

    }
}