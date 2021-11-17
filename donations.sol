// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract donations{
     
      uint totalDonations; 
  address payable owner; 

 
  constructor() {
    owner = payable(msg.sender);
  }


  function donate() public payable {
    (bool success,) = owner.call{value: msg.value}("");
    require(success, "Failed to send money");
  }

  function getTotalDonations() view public returns(uint) {
    return totalDonations;
  }
}
