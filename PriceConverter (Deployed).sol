//https://sepolia.etherscan.io/address/0x3EAf34a872Cb602cE8Af9d7e96d87DB9D58938c5

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./AggregatorV3Interface.sol";

library PriceConverter{

     function getPrice() internal view returns(uint256) {
        //ABI
        //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
       (, int256 price,,,) = priceFeed.latestRoundData();
       return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD = (ethPrice * ethAmount)/ 1e18;

        return ethAmountInUSD;
    }

    function getVerison() internal view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }
}
