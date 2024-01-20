// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract kecak {
    function str(string calldata s1, string calldata s2) public pure returns(bool)
    {
        if (
            keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2)))
            
         {
            return true;
        }
         else return false;
    }

    function stri(string calldata s1, string calldata s2 ) public pure returns(string memory){
      string memory s = string.concat(s1,s2);
      return s;
    } 
}
