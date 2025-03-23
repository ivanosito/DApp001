// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TipJarWithMessages {
    address public owner;

    struct Tip {
        address sender;
        uint amount;
        string message;
    }

    Tip[] public tips;

    constructor() {
        owner = msg.sender;
    }

    // Send ETH and a message
    function sendTip(string memory _message) public payable {
        require(msg.value > 0, "Le propina debe ser mayor a 0");
        tips.push(Tip(msg.sender, msg.value, _message));
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdraw() public {
        require(msg.sender == owner, "Solo el propietario puede retirar");
        payable(owner).transfer(address(this).balance);
    }

    // Optional: get number of tips
    function getTipsCount() public view returns (uint) {
        return tips.length;
    }

    // Optional: read a specific tip
    function getTip(uint index) public view returns (address, uint, string memory) {
        Tip memory t = tips[index];
        return (t.sender, t.amount, t.message);
    }
}
