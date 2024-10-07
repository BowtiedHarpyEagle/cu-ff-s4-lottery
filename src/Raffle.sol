// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title Raffle
 * @author Bowtied HarpyEagle
 * @dev Implements Chainlink VRF V2.5
 * @notice This is a simple provably fair lottery contract
 */

contract Raffle {
    error Raffle__SendMoretoEnterRaffle();

    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    /* Events */

    event RaffleEntered(address indexed player);


    constructor(uint256 _entranceFee) {
        i_entranceFee = _entranceFee;
    }

    function enter() public payable {
        // require(msg.value >= entranceFee, "Raffle__SendMoretoEnterRaffle");
        /* require(msg.value >= entranceFee, Raffle__SendMoretoEnterRaffle()); 
        starting with solidity 0.8.26, it is possible to use this syntax */
        if (msg.value < i_entranceFee) {
            revert Raffle__SendMoretoEnterRaffle();
        }

        s_players.push(payable(msg.sender));
        emit RaffleEntered(msg.sender);
    }

    function pickWinner() public {}

    /** getter functions */

    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
