// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrisonersDilemma {
    address public player1;
    address public player2;
    uint256 public deposit;
    bool public player1Decision;
    bool public player2Decision;
    bool public player1Decided;
    bool public player2Decided;

    constructor(address _player1, address _player2, uint256 _deposit) {
        player1 = _player1;
        player2 = _player2;
        deposit = _deposit;
    }

    function makeDecision(bool decision) public payable {
        require(msg.value == deposit, "Must send deposit");
        require(msg.sender == player1 || msg.sender == player2, "Not a registered player");

        if (msg.sender == player1) {
            player1Decision = decision;
            player1Decided = true;
        } else if (msg.sender == player2) {
            player2Decision = decision;
            player2Decided = true;
        }

        if (player1Decided && player2Decided) {
            distributeRewards();
        }
    }

    function distributeRewards() private {
        if (player1Decision && player2Decision) {
            // Both cooperate
            payable(player1).transfer(deposit + deposit / 2);
            payable(player2).transfer(deposit + deposit / 2);
        } else if (!player1Decision && player2Decision) {
            // Player 1 defects, Player 2 cooperates
            payable(player1).transfer(deposit * 2);
        } else if (player1Decision && !player2Decision) {
            // Player 1 cooperates, Player 2 defects
            payable(player2).transfer(deposit * 2);
        } else {
            // Both defect
            payable(player1).transfer(deposit);
            payable(player2).transfer(deposit);
        }
    }
}
