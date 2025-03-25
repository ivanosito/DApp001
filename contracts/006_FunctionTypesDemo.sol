// SPDX-License-Identifier: MIT
// DApp's with Scarlett - Example 007
pragma solidity ^0.8.0;

contract FunctionTypesDemo {
    address public owner;
    uint public donations;

    constructor() {
        owner = msg.sender;
    }

    // 🔒 Modifier — Access control for the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner.");
        _;
    }

    function getDonations() public view returns (uint) {
        return donations;
    }

    function multiply(uint a, uint b) public pure returns (uint) {
        return a * b;
    }

    // PAYABLE + modifier
    function donate() public payable {
        require(msg.value > 0, "Send some ETH to donate!");
        donations += msg.value;
    }

    // NEW: Only owner can reset donation count
    function resetDonations() public onlyOwner {
        donations = 0;
    }

    function internalMagic() internal pure returns (string memory) {
        return "Inner power activated";
    }

    function greetExternal() external pure returns (string memory) {
        return "Greetings from the EVM realm!";
    }

    function showInnerSpell() public pure returns (string memory) {
        return internalMagic();
    }
}
