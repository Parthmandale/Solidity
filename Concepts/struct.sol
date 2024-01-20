// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// A struct is a complex datatype . It is a composite of other existing data type.

contract structure{
struct Student{
    string name;
    uint roll;
    bool pass;
    uint[3] marks;
}

Student public s1;  // Here is Student is acting like a datatype

function str(string memory _name, uint _roll, bool _pass, uint[3] memory _arr) public {
// s1.name = _name;
// s1.roll = _roll;
// s1.pass = _pass;
// s1.marks = _arr;
s1 = Student(_name,_roll,_pass,_arr); // this is shortcut
}

function stru() public view returns(Student memory){ //Student is act a datatype
    return s1;
}

function srtu() public view returns(string memory){
return s1.name;
}  

function marks() public view returns(uint[3] memory){
    return s1.marks;
}

// Array with String


}