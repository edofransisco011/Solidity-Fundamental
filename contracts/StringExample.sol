// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract StringExample {
    // State variables
    string public greeting;
    mapping(address => string) public userNames;

    // Events
    event GreetingChanged(string newGreeting);
    event UserNameSet(address user, string name);

    // Constructor to initialize the contract
    constructor(string memory _initialGreeting) {
        greeting = _initialGreeting;
    }

    // Function to set a new greeting
    function setGreeting(string memory _newGreeting) public {
        greeting = _newGreeting;
        emit GreetingChanged(_newGreeting);
    }

    // Function to get the length of the greeting
    function getGreetingLength() public view returns (uint) {
        return bytes(greeting).length;
    }

    // Function to set a user's name
    function setUserName(string memory _name) public {
        userNames[msg.sender] = _name;
        emit UserNameSet(msg.sender, _name);
    }

    // Function to compare two strings
    function compareStrings(string memory _s1, string memory _s2) public pure returns (bool) {
        return keccak256(abi.encodePacked(_s1)) == keccak256(abi.encodePacked(_s2));
    }

    // Function to concatenate two strings
    function concatenateStrings(string memory _s1, string memory _s2) public pure returns (string memory) {
        return string(abi.encodePacked(_s1, _s2));
    }

    // Function to convert an address to a string
    function addressToString(address _addr) public pure returns (string memory) {
        return string(abi.encodePacked("0x", toHexString(uint160(_addr), 20)));
    }

    // Helper function to convert uint to hex string
    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length);
        bytes memory alphabet = "0123456789abcdef";
        for (uint256 i = 0; i < length; i++) {
            buffer[2 * i] = alphabet[uint8(value / (16 ** (length - 1 - i)) / 16)];
            buffer[2 * i + 1] = alphabet[uint8(value / (16 ** (length - 1 - i)) % 16)];
        }
        return string(buffer);
    }

    // Function to get a personalized greeting
    function getPersonalizedGreeting() public view returns (string memory) {
        string memory userName = userNames[msg.sender];
        if (bytes(userName).length == 0) {
            return greeting;
        } else {
            return string(abi.encodePacked(greeting, " ", userName, "!"));
        }
    }
}