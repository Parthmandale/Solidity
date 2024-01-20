// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract viewAndPurefunction{

uint public myage = 20;

function viefun() public view returns(uint) {
return myage;
}

function purefun(uint _x) public pure returns (uint){
    return _x;
}

function purefun2() public pure returns(uint){
return 1;
}

function simplefun() public{
  myage+=10;
}

function dummy() public view returns(uint){
    return myage+20;
}

}