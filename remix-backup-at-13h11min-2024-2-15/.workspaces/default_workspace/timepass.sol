// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract yo {

    uint256 public x = 10;

    modifier modifierA() {
        if(x==10) return;
        _;
    } 

    function a() public modifierA {
        x=20;
        
    }

    function c() public  {
        x=20;
        return;
    }
    
    function b() public  {
        c();
        x=30;
    }
}