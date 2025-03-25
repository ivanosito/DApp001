// SPDX-License-Identifier: MIT
// DApp's with Scarlett - Example 008
pragma solidity ^0.8.0;

contract TipJarWithModifiers {
    address public owner;
    bool public paused = false;

    struct Tip {
        address sender;
        uint amount;
        string message;
    }

    Tip[] public tips;

    // 📣 EVENTS
    event Tipped(address indexed from, uint amount, string message);
    event Withdrawn(address indexed by, uint amount);

    // 🧙 MODIFIERS
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    modifier minTip(uint _min) {
        require(msg.value >= _min, "Tip is too small!");
        _;
    }

    modifier whenNotPaused() {
        require(!paused, "Tipping is currently paused");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function sendTip(string memory _message) 
        public 
        payable 
        whenNotPaused 
        minTip(0.001 ether) 
    {
        tips.push(Tip(msg.sender, msg.value, _message));
        emit Tipped(msg.sender, msg.value, _message);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdraw() public onlyOwner {
        uint amount = address(this).balance;
        payable(owner).transfer(amount);
        emit Withdrawn(msg.sender, amount);
    }

    function getTipsCount() public view returns (uint) {
        return tips.length;
    }

    function getTip(uint index) public view returns (address, uint, string memory) {
        Tip memory t = tips[index];
        return (t.sender, t.amount, t.message);
    }

    function pauseTips() public onlyOwner {
        paused = true;
    }

    function resumeTips() public onlyOwner {
        paused = false;
    }
}
