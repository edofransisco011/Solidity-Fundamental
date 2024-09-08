// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract BooleanExample {
    // State variables
    bool public isActive;
    bool public isUserRegistered;

    // Constructor to initialize the contract
    constructor() {
        isActive = true;
        isUserRegistered = false;
    }

    // Function to toggle the active status
    function toggleActive() public {
        isActive = !isActive;
    }

    // Function to register a user
    function registerUser() public {
        require(!isUserRegistered, "User is already registered");
        isUserRegistered = true;
    }

    // Function demonstrating boolean operations
    function booleanOperations(bool _value1, bool _value2) public pure returns (bool, bool, bool) {
        bool andResult = _value1 && _value2;  // Logical AND
        bool orResult = _value1 || _value2;   // Logical OR
        bool notResult = !_value1;            // Logical NOT

        return (andResult, orResult, notResult);
    }

    // Function to check if a number is within a range
    function isInRange(uint256 number, uint256 lower, uint256 upper) public pure returns (bool) {
        return (number >= lower) && (number <= upper);
    }

    // Function combining multiple boolean checks
    function canPerformAction(bool _isAuthorized, bool _hasEnoughFunds, bool _isWithinTimeLimit) 
        public 
        view 
        returns (bool) 
    {
        return isActive && _isAuthorized && _hasEnoughFunds && _isWithinTimeLimit;
    }
}