// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract stateVariable{

uint public sallary;

constructor(){
    sallary = 2000;
}

function setSallary() public {
sallary = 2300;
}

}