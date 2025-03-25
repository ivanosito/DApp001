// SPDX-License-Identifier: MIT
// DApp's with Scarlett - Example 003
pragma solidity ^0.8.0;

contract TipJarWithMessages {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // This special function lets the contract receive ETH
    receive() external payable {}

    // View balance stored in the contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Withdraw all ETH to the owner's address
    function withdraw() public {
        require(msg.sender == owner, "Solo el propietario puede retirar!");
        payable(owner).transfer(address(this).balance);
    }
}
