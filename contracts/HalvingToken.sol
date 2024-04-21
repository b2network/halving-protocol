// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20, ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {ERC20Capped} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

/// @title Halving Token Contract
contract HalvingToken is
    ERC20Burnable,
    ERC20Permit,
    ERC20Capped
{

    uint256 public constant HALVING_CYCLE = 210000;
    uint256 public constant DEFAULT_REWARD = 50 * 10**8;
    uint8 public constant BTC_DECIMALS = 8;

    uint256 private _currentBlock;

    /// @notice Initializes the contract with a name, symbol, cap
    constructor()
        ERC20("BTC Halving Token", "BTCHV")
        ERC20Permit("BTC Halving Token")
        ERC20Capped(21 * 10**6 * 10**8)
    {

    }

    function decimals() public view virtual override returns (uint8) {
        return BTC_DECIMALS;
    }

    /// @notice Allows the owner to mint new tokens, up to the cap. The minting halving rule is exactly the same as BTC rule.
    function mint() external {
        uint256 currentCycle = _currentBlock / HALVING_CYCLE;

        uint256 currentReward = DEFAULT_REWARD / 2**currentCycle;

        _currentBlock++;
        _mint(msg.sender, currentReward);
    }

    /// @dev Internal function to update state during transfers, respecting the cap
    /// @param from The address sending the tokens
    /// @param to The address receiving the tokens
    /// @param value The amount of tokens being transferred
    function _update(
        address from,
        address to,
        uint256 value
    ) internal override(ERC20, ERC20Capped) {
        super._update(from, to, value);
    }

}