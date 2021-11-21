// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;

contract donations{
     
     
     mapping (address => uint) balance;

  address payable public owner; 
  address[] public donators;

    event newDonation(
        address[] indxed,
        uint amouth
        );
 
  constructor() public payable{
    owner = msg.sender;
  }

    function getDonation() public payable{
        require(msg.value >= .001 ether);
        donators.push(msg.sender);
     
      emit newDonation(donators , msg.value);
    }

function transferToOwner() external {
    require(msg.sender == owner);
    owner.transfer(address(this).balance);
}

function getDonators() public view returns (address[] memory){
    return donators;
}
}
