pragma solidity ^0.5.1;

contract MyCoin {
  /* a finte supply */
  uint supply;
  
  address minter;
  mapping (address => uint ) balances;
  
  constructor() public {
      minter = msg.sender;
      supply = 100;
  }
  
  function mint(address to, uint value) public {
      require(msg.sender == minter, "Only minter can mint!");
      require(supply - value >= 0, "Supply will be run out!");
      balances[to] += value;
      supply -= value;
  }
  
  function send(address to, uint value) public {
      require(balances[msg.sender] >= value, "invalid value!");
      balances[msg.sender] -= value;
      balances[to] += value;
  }
  
  function checkMyBalance() public view returns (uint) {
      return balances[msg.sender];
  }
}
