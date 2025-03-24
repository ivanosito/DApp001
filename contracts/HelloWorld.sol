// SPDX-License-Identifier: MIT
// DApp's with Scarlett - Example 001

pragma solidity ^0.8.0;

contract HelloWorld {
    string public message = "Hello, Web3 World!";

    function updateMessage(string memory _newMessage) public {
        message = _newMessage;
    }
}
