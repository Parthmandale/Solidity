// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract messge{
    
    function mssg() public view returns (address) {
        return msg.sender;
    }

}