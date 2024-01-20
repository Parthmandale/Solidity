// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract lacalVariable {

uint  public age;
bool public isIt;
address public add;

function fun(uint _a, bool _b, address _c ) public returns(uint, bool){
    
    uint i =22;
    bool b1 = false; // local variable
    
    i+=2;
    b1 = true;

    age = _a;
    isIt = _b;
    add = _c;
}
}