// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract vs{
  uint[3] public arr = [1,2,3];
  function change() public {
      arr[0] = 10;
      uint[3] storage pointer = arr;
      pointer[1] = 20;
  }
}