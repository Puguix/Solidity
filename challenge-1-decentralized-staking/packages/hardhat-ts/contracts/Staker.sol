// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0; //Do not change the solidity version (0.8.4) as it negativly impacts submission grading

import 'hardhat/console.sol';
import './ExampleExternalContract.sol';

contract Staker {
  ExampleExternalContract public exampleExternalContract;

  event Stake(address, uint256);

  mapping(address => uint256) public balances;
  uint256 public constant threshold = 1 ether;

  constructor(address exampleExternalContractAddress) {
    exampleExternalContract = ExampleExternalContract(exampleExternalContractAddress);
  }

  // Collect funds in a payable `stake()` function and track individual `balances` with a mapping:
  // ( Make sure to add a `Stake(address,uint256)` event and emit it for the frontend <List/> display )
  function stake() public payable {
    balances[msg.sender] = msg.value;
    Stake(msg.sender, msg.value);
  }

  // After some `deadline` allow anyone to call an `execute()` function
  // If the deadline has passed and the threshold is met, it should call `exampleExternalContract.complete{value: address(this).balance}()`

  // If the `threshold` was not met, allow everyone to call a `withdraw()` function to withdraw their balance

  // Add a `timeLeft()` view function that returns the time left before the deadline for the frontend

  // Add the `receive()` special function that receives eth and calls stake()
}