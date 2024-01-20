// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract map{

mapping (uint => string) public data;

function mapp(uint key, string calldata value) public {
    data[key] = value;
}
function maap(uint key) public view returns (string memory){
return data[key];
}
}