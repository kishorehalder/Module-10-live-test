// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/transparent/Proxy.sol";

contract MyTokenProxy is Proxy {
    constructor(address implementation) Proxy(implementation, "") {}
}
