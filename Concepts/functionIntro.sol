// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract functionIntro{

   uint public age = 19;

   function add(uint x, uint _y) public pure returns(uint)
   {
       return x + _y;
   }
   function changeAge() public {
       age+=1;
      
   }

function getAge() public view returns(uint){
    return age;
}

function fun() public{
    //code
} 

}

//outside the main mfuction

function dummy(uint _x) pure returns(uint) {
  return _x*10;
}
