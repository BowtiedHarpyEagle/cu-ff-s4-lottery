// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title Raffle
 * @author Bowtied HarpyEagle
 * @dev Implements Chainlink VRF V2.5
 * @notice This is a simple provably fair lottery contract
 */

contract Raffle {
    uint256 private immutable i_entranceFee;

    constructor(uint256 _entranceFee) {
        i_entranceFee = _entranceFee;
    }

    function enter() public payable {}

    function pickWinner() public {}

    /** getter functions */

    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
