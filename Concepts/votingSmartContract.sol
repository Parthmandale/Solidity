// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract VotingSmartContract {

    struct voter {
        string name;
        uint256 age;
        uint256 voterId;
        string gender;
        uint256 voteCandidateId;
        address voterAddress;
    }
    
    struct candidate {
        string name;
        string party;
        uint256 age;
        string gender;
        uint256 candidateId;
        address candidateAddress;
        uint256 vote;
    }
    
    address electionComission;
    address public Winner;
    
    uint256 nextVoterId = 1;
    uint256 nextCandidateId = 1;
 
    uint256 startTime;
    uint256 endTime;

    mapping(uint256 => voter) public voterDetail;
    mapping(uint256 => candidate) public candidateDetail;

    bool stopVoting;

    constructor() {
        electionComission = msg.sender;
    }

    modifier isVotingOver() {
        require(block.timestamp > endTime || stopVoting == true,"Voting yet not over");

        _;
    }

    modifier onlyCommisioner() {
        require(electionComission == msg.sender, "Not from election Commision");

        _;
    }

    function candidateRegister( string calldata _name, string calldata _party,uint256 _age,string calldata _gender) external {
        require(msg.sender != electionComission,"ElectionComission can not participate ");
        require(candidateVerification(msg.sender) == true, "Already register");
        require(_age > 28, "Age not matched");   
        require(nextCandidateId < 3, "Candidate seats already fullfilled");

        candidateDetail[nextCandidateId] = candidate(_name,_party,_age,_gender,nextCandidateId,msg.sender,0);

        nextCandidateId++;
    }

    function candidateVerification(address _person) internal view returns (bool)
    {
        for (uint256 i = 1; i < nextCandidateId; i++) {
            if (candidateDetail[i].candidateAddress == _person) {
                return false;
            }
        }
        return true;
    }

    function candidateList() public view returns (candidate[] memory) {
        candidate[] memory array = new candidate[](nextCandidateId - 1);
        for (uint256 i = 1; i < nextCandidateId; i++) {
            array[i - 1] = candidateDetail[i];
        }

        return array;
    }

    function voterRegister(
        string calldata _name,
        uint256 _age,
        string calldata _gender
    ) external {
        require(voterVerification(msg.sender) == true," Voter Already Registered");
        require(_age > 18, "Not alligible");
        voterDetail[nextVoterId] = voter(_name, _age,nextVoterId, _gender,0, msg.sender);
        nextVoterId++;
    }

    function voterVerification(address _person) internal view returns (bool) {
        for (uint256 i = 1; i < nextVoterId; i++) {
            if (voterDetail[i].voterAddress == _person) {
                return false;
            }
        }
        return true;
    }

    function voterList() public view returns (voter[] memory) {
        voter[] memory array = new voter[](nextVoterId - 1);
        for (uint256 i = 1; i < nextVoterId; i++) {
            array[i - 1] = voterDetail[i];
        }

        return array;
    }

    function vote(uint256 _voterId, uint256 _CandidateId) external {
        require(voterDetail[_voterId].voteCandidateId == 0, "Already Voted");
        require( voterDetail[_voterId].voterAddress == msg.sender,"You are not the voter");
        require(startTime != 0, "Voting not started");
        require(nextCandidateId == 3, "Candidate registration proceess yet not finished ");
        require(_CandidateId > 0 && _CandidateId < 3, "Invalid Candidate Id");

        voterDetail[_voterId].voteCandidateId = _CandidateId;

        candidateDetail[_CandidateId].vote++;
    }

    function voteTime(uint256 _startTime, uint256 _endTime) external onlyCommisioner{
        startTime = block.timestamp + _startTime;
        endTime = startTime + _endTime;
    }

    function votingStatus() public view returns (string memory) {
        if (startTime == 0) {
            return "Voting Yet not started";
        } else if (
            (startTime > 0 && block.timestamp < endTime) || stopVoting == false
        ) {
            return "Voting in progress";
        } else {
            return "voting ended";
        }
    }

    function result() external onlyCommisioner {
        require(nextCandidateId > 1, "Candidate regisration yet not done");
        uint256 maximumVotes = 0;
        address currentWinner;

        for (uint256 i = 1; i < nextCandidateId; i++) {
            if (candidateDetail[i].vote > maximumVotes) {
                maximumVotes = candidateDetail[i].vote;
                currentWinner = candidateDetail[i].candidateAddress;
            }
        }

        Winner = currentWinner;
    }

    function emergency() public onlyCommisioner {
        stopVoting = true;
    }

}
