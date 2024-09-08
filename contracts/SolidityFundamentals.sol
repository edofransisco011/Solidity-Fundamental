// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15; // Specifies the version of Solidity to use

// Defines a new contract named 'SolidityFundamentals'
contract SolidityFundamentals {
    // State variables (stored on the blockchain)
    uint256 public number; // Unsigned integer variable, publicly accessible
    address public owner; // Address variable to store the contract owner's address
    bool public isActive; // Boolean variable to store the contract's active status

    // Events (used to emit logs)
    event NumberChanged(uint256 newNumber); // Event to log when the number is changed

    // Constructor function, called when the contract is deployed
    constructor() {
        owner = msg.sender; // Sets the contract deployer as the owner
        isActive = true; // Initializes the contract as active
    }

    // Modifier to restrict function access to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner"); // Checks if the caller is the owner
        _; // Continues with the function execution if the check passes
    }

    // Function to set a new number
    function setNumber(uint256 _newNumber) public onlyOwner {
        require(isActive, "Contract is not active"); // Checks if the contract is active
        number = _newNumber; // Sets the new number
        emit NumberChanged(_newNumber); // Emits an event with the new number
    }

    // Function to get the current number
    function getNumber() public view returns (uint256) {
        return number; // Returns the current value of 'number'
    }

    // Function to toggle the active status of the contract
    function toggleActive() public onlyOwner {
        isActive = !isActive; // Flips the boolean value of isActive
    }

    // Function to demonstrate basic arithmetic operations
    function performMath(uint256 a, uint256 b) public pure returns (uint256, uint256, uint256, uint256) {
        uint256 sum = a + b; // Addition
        uint256 difference = a > b ? a - b : b - a; // Subtraction (ensures positive result)
        uint256 product = a * b; // Multiplication
        uint256 quotient = b != 0 ? a / b : 0; // Division (with check for division by zero)

        return (sum, difference, product, quotient); // Returns multiple values
    }
}