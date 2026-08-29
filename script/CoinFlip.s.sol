// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./EthernautSolution.s.sol";

interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
    function consecutiveWins() external view returns (uint256);
}

contract CoinFlipScript is EthernautSolution {
    function run() external {
        address instance = vm.envOr("INSTANCE", address(0xF9Ab3e7a31522168101f85B377c72140457F1FBA));
        ICoinFlip target = ICoinFlip(instance);
        (uint256 pk, address player, bool isLocal) = getPlayer();

        startSession(pk, player, isLocal);

        stopSession(isLocal);
    }
}
