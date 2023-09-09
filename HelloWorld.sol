// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract HelloWorld {
    string message = "Hello World";

    function displayMessage () public view returns(string memory) {
        return message;
    }
}