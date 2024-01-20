// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract nestedmap{

mapping (address => mapping(address => uint)) public access;

function nested(address row, address col, uint value) public {
    access[row][col] = value; 
}

function returndata( address row, address col ) public view returns(uint val) {
   return access[row][col]; 
}

}