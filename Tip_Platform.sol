// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TipJar {
    event NewTip(address indexed from, uint256 amount, string message);

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function sendTip(string calldata _message) external payable {
        require(msg.value > 0, "Tip must be greater than 0");
        emit NewTip(msg.sender, msg.value, _message);
    }

    function withdrawTips() external {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
