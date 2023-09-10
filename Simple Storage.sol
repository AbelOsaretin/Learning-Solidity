// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 favoriteNumber;

    function saveFavoriteNum(uint256 value) public {
        favoriteNumber = value;
    }

    function displayFavoriteNum() public view returns (uint256) {
        return favoriteNumber;
    }

    function deleteFavoriteNum() public {
        favoriteNumber = 0;
    }
}
