//https://sepolia.etherscan.io/address/0x3EAf34a872Cb602cE8Af9d7e96d87DB9D58938c5

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";


contract FundMe {

    using PriceConverter for uint256;

    address[] public funders;
    mapping (address => uint256) public amountFundedByAddress;
    struct getFunders{
        address sender;
    }

    getFunders[] funderAddress;


    uint256 public minimumUSD = 50 * 1e18;

    address public owner;
    constructor(){
        owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >=minimumUSD,"Not Enought ETH");
        funders.push(msg.sender);
        funderAddress.push(getFunders(msg.sender));
        amountFundedByAddress[msg.sender] = msg.value;
    }

    function getAllFunders() public view returns(getFunders[] memory){
        return funderAddress;
    }

    function withdraw() public onlyOwner {
        require(msg.sender == owner, "Sender is not Owner!");
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            amountFundedByAddress[funder] = 0;
        }
        // Reseting Array
        funders = new address[](0);

        //Withdraw Funds from Contract
         (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");

    }

    modifier onlyOwner{
        require(msg.sender == owner, "Sender is not Owner!");

        _;
    }

   
}
