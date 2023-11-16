# Module-10-live-test
To implement an upgradable ERC20 token using the OpenZeppelin framework and the proxy pattern, I follow the steps below. I'll create three separate Solidity contracts: the ERC20 token implementation, the proxy contract, and the upgradeable token contract that combines them. We will use OpenZeppelin's ERC20 implementation and the ProxyAdmin contract to manage proxy upgrades.

Here's a simplified example of how this can be done:

1. First, let's create the ERC20 token implementation contract using OpenZeppelin's ERC20 implementation:
  In this contract, I inherit from OpenZeppelin's ERC20 contract and initialize it with a name, symbol, and an initial supply of tokens.

2. Next, I created the proxy contract. This contract will delegate calls to the actual implementation contract and is upgradable.
   The MyTokenProxy contract extends OpenZeppelin's Proxy contract, and it takes the address of the implementation contract as a constructor argument.
   
4. Now, I created the upgradeable token contract that combines the proxy and the implementation.
To deploy and use the upgradeable ERC20 token, you first deploy the MyToken contract (the initial implementation), and then deploy the MyTokenProxy contract, passing the address of the MyToken contract as the implementation address.
Here's a step-by-step explanation of how the proxy pattern is utilized in this implementation:

The MyTokenProxy contract delegates all calls to the implementation contract. It acts as a transparent proxy, meaning it forwards all calls and data to the implementation contract.

The UpgradeableToken contract manages the current implementation contract's address and allows the contract owner to upgrade it using the upgradeImplementation function.

When you upgrade the implementation, you deploy a new version of the ERC20 token, and then the owner updates the implementation address in the UpgradeableToken contract to point to the new implementation. This effectively upgrades the token while preserving the state and history of the contract.

The proxy pattern ensures that the contract's state, including balances and allowances, is preserved across upgrades because all state data is stored in the implementation contract, and only the code logic is upgraded.

Remember to import the required OpenZeppelin contracts and adapt the code to your specific requirements and deployment workflow. Additionally, make sure you thoroughly test and audit the code before deploying it in a production environment.
