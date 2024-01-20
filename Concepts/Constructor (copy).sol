// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Constructor{

uint public age;
string public name;
address public owner;

constructor(uint _age, string memory _name, address _owner ){
    age =  _age ;
    name = _name;
    owner = _owner;
}

}