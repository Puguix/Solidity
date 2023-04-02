pragma solidity >=0.8.0 <0.9.0; //Do not change the solidity version (0.8.4) as it negativly impacts submission grading
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {
    event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);
    event SellTokens(
        address buyer,
        uint256 amountOfETH,
        uint256 amountOfTokens
    );

    YourToken public yourToken;
    uint256 public constant tokensPerEth = 100;

    constructor(address tokenAddress) {
        yourToken = YourToken(tokenAddress);
    }

    // ToDo: create a payable buyTokens() function:
    function buyTokens() public payable {
        uint256 tokenAmount = msg.value * tokensPerEth;
        yourToken.transfer(msg.sender, tokenAmount);
        emit BuyTokens(msg.sender, msg.value, tokenAmount);
    }

    // ToDo: create a withdraw() function that lets the owner withdraw ETH
    function withdraw() public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    // ToDo: create a sellTokens(uint256 _amount) function:
    function sellTokens(uint256 _amount) public {
        yourToken.transferFrom(msg.sender, address(this), _amount);
        payable(msg.sender).transfer(_amount / tokensPerEth);
        emit SellTokens(msg.sender, _amount / tokensPerEth, _amount);
    }
}
