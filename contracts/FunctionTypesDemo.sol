// SPDX-License-Identifier: MIT
// DApp's with Scarlett - Example 006
pragma solidity ^0.8.0;

contract FunctionTypesDemo {
    address public owner;
    uint public donations;

    constructor() {
        owner = msg.sender;
    }

    // 📖 VIEW — Reads the state
    function getDonations() public view returns (uint) {
        return donations;
    }

    // 🧮 PURE — Only math, no state
    function multiply(uint a, uint b) public pure returns (uint) {
        return a * b;
    }

    // 💸 PAYABLE — Accepts ETH and updates state
    function donate() public payable {
        require(msg.value > 0, "Send some ETH to donate!");
        donations += msg.value;
    }

    // 🔐 INTERNAL — Can only be used from within the contract
    function internalMagic() internal pure returns (string memory) {
        return "Inner power activated";
    }

    // 🌍 EXTERNAL — Must be called from outside the contract
    function greetExternal() external pure returns (string memory) {
        return "Greetings from the EVM realm!";
    }

    // 🧙‍♂️ PUBLIC — Calls the internal function (demonstrates `internal`)
    function showInnerSpell() public pure returns (string memory) {
        return internalMagic();
    }
}
