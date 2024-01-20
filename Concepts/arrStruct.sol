// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract arrstruct{

    struct student {
        string name;
        uint roll;
        bool pass;
        uint[3] marks;
    }

    student[3] public s;

    function stu(uint index, string calldata _name, uint _roll, bool _pass, uint[3] memory _marks) public   {
s[index] = student(_name, _roll, _pass, _marks);
    }


function stuarr(uint index) public view returns (uint){
    return s[index].roll;
}
}

