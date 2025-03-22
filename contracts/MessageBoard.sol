// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageBoard {
    string private message;
    address public owner;

    constructor(string memory _initialMessage) {
        message = _initialMessage;
        owner = msg.sender;
    }

    function readMessage() public view returns (string memory) {
        return message;
    }

    function updateMessage(string memory _newMessage) public {
        require(msg.sender == owner, "Only the owner can update the message.");
        message = _newMessage;
    }
}
