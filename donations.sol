// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;

contract donations{
     

  address payable public owner; 
  address public donators;

 
  constructor() public{
    owner = (msg.sender);
  }

    function getDonation() public payable{
        require(msg.value >= .001 ether);
        donators.push(msg.sender);
    }

function transferToOwner() external {
    require(msg.sender == owner);
    owner.transfer(address(this).balance);
}

function getDonators() public view returns (address[] memory){
    return donators;
}
}
