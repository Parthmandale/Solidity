// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract DOA {

struct Proposal{
    uint id;
    string description;
    uint amount;
    address payable receipient;
    uint votes;
    uint end;
    bool isExectuded;
}
    
mapping(address => bool) isInvestor;
mapping (address => uint) numOfShares;
mapping (address => mapping (uint => bool)) isVoted;  // two dimensional mapping inputs to give the result in bool
mapping (address => mapping (address => bool))  withdrawalStatus;    // Doubt 
mapping (uint => Proposal) public proposals;
address[] public investorsList;

uint public totalShares;
uint public availableFunds;
uint public contributionTime ;
uint public nextProposalId;
uint public voteTime;
uint public quorum;
address public manager;

constructor( uint _contributionTime, uint _voteTime, uint _quorum ) {
    require(_quorum > 0 && _quorum < 100, "Invalid Quorum Value");
    contributionTime = block.timestamp + _contributionTime ;
    voteTime = _voteTime;
    quorum = _quorum;
    manager = msg.sender;

}

modifier onlyInvestor()
{
require(isInvestor[msg.sender] == true, "you are not investor");

_;
}

modifier onlyManager(){
    require(manager == msg.sender,"Not Manager");

_;
} 

function contribution() public payable {
    require(contributionTime > block.timestamp, " Time for Contribution is over");
    require(msg.value > 0, "Send more than 0 ether");
    isInvestor[msg.sender] = true;
    numOfShares[msg.sender] += msg.value; 
    totalShares += msg.value;
    availableFunds += msg.value;
    investorsList.push(msg.sender); 
}

function redeemShares(uint _amount) public onlyInvestor {
    require(_amount < numOfShares[msg.sender], "You don't have enough amount of share");
    require(availableFunds> _amount, "Not enough funds to return");

    numOfShares[msg.sender] -= _amount;
    if (numOfShares[msg.sender] == 0) {
        isInvestor[msg.sender] = false;
    }

availableFunds -= _amount; 
payable(msg.sender).transfer(_amount);  //transfering of enth again to the investors account

}

function transerShares(uint _amount, address _to) public onlyInvestor {
    require(numOfShares[msg.sender] > _amount , "Not enough share with you to share that much"); 
    require(availableFunds >= _amount , "Not enough funds");
    numOfShares[msg.sender] -= _amount;
    if (numOfShares[msg.sender] == 0) {
        isInvestor[msg.sender] == false;     
    }

    numOfShares[_to] += _amount; 
    isInvestor[_to] = true;
    investorsList.push(_to);
}

    function createProposal(string calldata _description, uint _amount, address payable _recipient) public {
        require( availableFunds >= _amount, "Not enough funds");
        proposals[nextProposalId] = Proposal(nextProposalId, _description, _amount, _recipient,0, block.timestamp + voteTime, false );
    nextProposalId++;
    }


    function voteProposal(uint _proposalId) public onlyInvestor {
    Proposal storage proposalss = proposals[_proposalId];
    require(isVoted[msg.sender][_proposalId] == false , "Already voted"); 
    require(proposalss.end > block.timestamp, " voting time end ");
    require(proposalss.isExectuded == false, "already exectuded");
    
    
    isVoted[msg.sender][_proposalId] = true;
    proposalss.votes += numOfShares[msg.sender];  
   
    }

    function executeProposal(uint _proposalId) public onlyManager {
        Proposal storage proposalss = proposals[_proposalId];

        require( (proposalss.votes/ totalShares)*100 >= quorum , "Not enough Votes");
 
        proposalss.isExectuded = true;
        availableFunds -= proposalss.amount;

        _transfer(proposalss.amount, proposalss.receipient);

}

 function _transfer(uint _amount , address payable _receipient) public {
    _receipient.transfer(_amount);   // no need to have payable as we have already given it the nanme in parameter
       
}

    function proposalList() public view returns(Proposal[] memory) {
        Proposal[] memory arr = new Proposal[](nextProposalId-1);

        for (uint i=0; i<nextProposalId ; i++) 
        {
             arr[i] = proposals[i];
        }
        return arr;
    }

}
