// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage2 {
    struct inputData {
        string name;
        uint256 favoriteNumber;
    }

    inputData[] public people;

    function storeInfo(string memory _name, uint256 _favoriteNumber) public {
        people.push(inputData(_name, _favoriteNumber));
    }


    function displayStoredInfo () public view returns (inputData[] memory){
        return people;
    }
 
}
