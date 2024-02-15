// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/*//////////////////////////////////////////////////////////////
                               REENTRANCY
//////////////////////////////////////////////////////////////*/

// Inspired by: https://solidity-by-example.org/hacks/re-entrancy/

contract ReentrancyVictim {
    mapping(address => uint256) public userBalance;

    function deposit() public payable {
        userBalance[msg.sender] += msg.value;
    }


bool locked = false;

// CEI - Checks, Effect, Interaction
    function withdrawBalance() public {
    if(locked) revert();
        locked = true;

       // Checks - require, if else, revert and all come in check
       // Effect 
        uint256 balance = userBalance[msg.sender];
            // State change
        userBalance[msg.sender] = 0;

// Interaction - Do interaction/ changes
        (bool success,) = msg.sender.call{value: balance}("");
        if (!success) {
            revert();
        }

  locked = false;
    
    }
}

contract ReentrancyAttacker {
    ReentrancyVictim victim;

    constructor(ReentrancyVictim _victim) {
        victim = _victim;
    }

    function attack() public payable {
        victim.deposit{value: 1 ether}();
        victim.withdrawBalance();
    }

    receive() external payable {
        if (address(victim).balance >= 1 ether) {
            victim.withdrawBalance();
        }
    }
}
