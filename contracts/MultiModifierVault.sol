// SPDX-License-Identifier: MIT
// DApp's with Scarlett - Example 008
pragma solidity ^0.8.0;

contract TipJarWithModifiers {
    address public owner;
    bool public paused;
    uint public balance;

    constructor() {
        owner = msg.sender;
        paused = false;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    modifier whenNotPaused() {
        require(!paused, "Paused");
        _;
    }

    modifier minAmount(uint _min) {
        require(msg.value >= _min, "Amount too low");
        _;
    }

    function pause() public onlyOwner {
        paused = true;
    }

    function unpause() public onlyOwner {
        paused = false;
    }

    // ⬇️ This function uses THREE modifiers
    function deposit() public payable whenNotPaused minAmount(1 ether) {
        balance += msg.value;
    }

    // Two modifiers here
    function withdrawAll() public onlyOwner whenNotPaused {
        payable(owner).transfer(balance);
        balance = 0;
    }
}
