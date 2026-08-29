// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

abstract contract EthernautSolution is Script {
    /// Returns either a real or fake player depending on the environment.
    function getPlayer() internal returns (uint256 pk, address player, bool isLocal) {
        pk = vm.envOr("PRIVATE_KEY", uint256(0));
        if (pk == 0) {
            pk = 0xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
            player = vm.addr(pk);
            isLocal = true;
            vm.deal(player, 100 ether);
        } else {
            player = vm.addr(pk);
            isLocal = false;
        }
    }

    /// Starts a prank or broadcast for the player depending on the environment.
    function startSession(uint256 pk, address player, bool isLocal) internal {
        if (isLocal) {
            vm.startPrank(player);
        } else {
            vm.startBroadcast(pk);
        }
    }

    /// Stops a prank or broadcast for the player depending on the environment.
    function stopSession(bool isLocal) internal {
        if (isLocal) {
            vm.stopPrank();
        } else {
            vm.stopBroadcast();
        }
    }
}
