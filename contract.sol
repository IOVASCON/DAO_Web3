// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProcurementContract {
    struct Bid {
        address bidder;
        uint amount;
        string description;
        bool selected;
    }

    address public owner;
    mapping(uint => Bid[]) public bids;
    uint public projectCount;

    constructor() {
        owner = msg.sender;
        projectCount = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    function createProject() public onlyOwner {
        projectCount += 1;
    }

    function submitBid(uint projectId, uint amount, string memory description) public {
        require(projectId <= projectCount, "Project does not exist.");
        bids[projectId].push(Bid(msg.sender, amount, description, false));
    }

    function selectBid(uint projectId, uint bidIndex) public onlyOwner {
        require(projectId <= projectCount, "Project does not exist.");
        require(bidIndex < bids[projectId].length, "Bid does not exist.");
        bids[projectId][bidIndex].selected = true;
    }
}
