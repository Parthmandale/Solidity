// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract _string{
    string public str = "Parth"; // state variable

function checkstr( string memory _x ) public pure returns(string memory) {

string memory name = _x ;
return name;
}
}
