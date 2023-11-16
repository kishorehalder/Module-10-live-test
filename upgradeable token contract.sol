// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";

contract UpgradeableToken is Ownable {
    address public implementation;
    ProxyAdmin public proxyAdmin;

    constructor(address _implementation, address _proxyAdmin) {
        implementation = _implementation;
        proxyAdmin = ProxyAdmin(_proxyAdmin);
    }

    function upgradeImplementation(address newImplementation) external onlyOwner {
        proxyAdmin.upgradeTo(address(this), newImplementation);
    }

    function balanceOf(address account) external view returns (uint256) {
        return IERC20(implementation).balanceOf(account);
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        return IERC20(implementation).transfer(to, amount);
    }
    
    // Implement other ERC20 functions as needed
}
