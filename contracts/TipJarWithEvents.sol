// SPDX-License-Identifier: MIT
// DApp's with Scarlett - Example 005
pragma solidity ^0.8.0;

contract TipJarWithEvents {
    address public owner;

    struct Tip {
        address sender;
        uint amount;
        string message;
    }

    Tip[] public tips;

    // 📣 EVENT: Log every tip sent to the jar
    event Tipped(address indexed from, uint amount, string message);

    constructor() {
        owner = msg.sender;
    }

    // Users send ETH + a message, and we log it!
    function sendTip(string memory _message) public payable {
        require(msg.value > 0, "Tip must be greater than 0");
        tips.push(Tip(msg.sender, msg.value, _message));
        
        // ✨ Here’s the spell:
        emit Tipped(msg.sender, msg.value, _message);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }

    function getTipsCount() public view returns (uint) {
        return tips.length;
    }

    function getTip(uint index) public view returns (address, uint, string memory) {
        Tip memory t = tips[index];
        return (t.sender, t.amount, t.message);
    }
}
