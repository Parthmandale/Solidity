// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract vs{
    function change(uint[3] memory brr , uint[3] calldata crr) public pure returns(uint[3] memory ){
        brr[1] = 2*brr[1];
        brr[0] = crr[0];
        return brr;
    }
}