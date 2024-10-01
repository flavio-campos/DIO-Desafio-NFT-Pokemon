# DIO-Desafio-NFT-Pokemon

# PokeDIO - Pokémon Game on Ethereum

**PokeDIO** is a decentralized Pokémon game built on the Ethereum blockchain using the ERC721 NFT standard. Players can mint unique Pokémon, battle them, and level them up based on battle outcomes. This project is designed to run in the Remix IDE, with MetaMask used for wallet integration.

## Overview

In **PokeDIO**, each Pokémon is an NFT, and players can interact with the game by minting, owning, and battling their Pokémon. The game is managed by the `gameOwner`, who has the exclusive right to mint new Pokémon. Players can challenge other Pokémon to battles, which affect the level of each participating Pokémon.

## Features

- **NFT Pokémon**: Each Pokémon is represented as an ERC721 token with unique properties.
- **Battles**: Players can battle their Pokémon, and depending on the result, their Pokémon will gain experience (level).
- **Minting**: The `gameOwner` can mint new Pokémon with custom names and images.

## Smart Contract Details

The contract follows the ERC721 standard from OpenZeppelin and is compatible with NFT platforms like OpenSea.

### Contract Structure

- **Pokemon Struct**: Each Pokémon has:
  - `name`: A string representing the name of the Pokémon.
  - `level`: An integer representing the Pokémon's level.
  - `img`: A string (URL) pointing to the Pokémon's image.

- **Functions**:
  - `createNewPokemon`: Allows the game owner to create new Pokémon.
  - `battle`: Allows Pokémon owned by players to battle each other, with leveling mechanics based on battle outcomes.

- **Modifiers**:
  - `onlyOwnerOf`: Ensures only the owner of a Pokémon can make it battle.

## Setup Instructions

### Prerequisites

To interact with this contract, you'll need:

- [Remix IDE](https://remix.ethereum.org/)
- [MetaMask](https://metamask.io/) extension installed in your browser.
- Test Ethereum tokens for deployment and interaction (e.g., from a [faucet](https://faucet.egorfine.com/)).

### Steps to Deploy and Interact

1. **Open Remix IDE**:
   - Go to [Remix IDE](https://remix.ethereum.org/).
   - Create a new file and paste the smart contract code from this repository.

2. **Compile the Contract**:
   - In Remix, select the appropriate Solidity compiler version (`^0.8.0`).
   - Click on "Compile PokeDIO.sol".

3. **Deploy the Contract**:
   - Under the "Deploy & Run Transactions" tab, ensure you have "Injected Web3" selected to connect your MetaMask wallet.
   - Ensure you're connected to a test network in MetaMask (e.g., Ropsten or Goerli).
   - Click "Deploy", and confirm the transaction in MetaMask.

4. **Interacting with the Contract**:
   - Once deployed, the contract functions will be available in Remix under the "Deployed Contracts" section.
   - Use MetaMask to send transactions and interact with the contract.

   - **Mint a Pokémon**: 
     As the `gameOwner`, you can create new Pokémon:
     ```solidity
     createNewPokemon(string _name, address _to, string _img)
     ```
     Example:
     ```solidity
     createNewPokemon("Pikachu", userAddress, "https://example.com/pikachu.png")
     ```

   - **Battle with Pokémon**:
     ```solidity
     battle(uint _attackingPokemon, uint _defendingPokemon)
     ```
     Example:
     ```solidity
     battle(0, 1)
     ```

## Example

### Minting a Pokémon

1. In the `createNewPokemon` function, provide the name, recipient address (MetaMask address), and a URL for the Pokémon image.
2. Confirm the transaction via MetaMask.

Example:
```solidity
createNewPokemon("Bulbasaur", "0xYourMetaMaskAddress", "https://example.com/bulbasaur.png");
```

## Battling Pokémon
To battle two Pokémon that exist on the blockchain:

- Select the IDs of the attacking and defending Pokémon.
- Confirm the battle and check the levels of both Pokémon.

Example:
```solidity
battle(0, 2);
```

## Notes
- MetaMask Integration: MetaMask is used for all transactions, including deploying the contract, minting new Pokémon, and battling.
- Gas Fees: All interactions will require gas fees (in ETH), so ensure you have sufficient test Ether in your MetaMask wallet.

## Future Enhancements
- Pokémon Types: Introduce type advantages (e.g., Fire vs. Water) to make battles more strategic.
- Evolution: Implement a feature that allows Pokémon to evolve when reaching certain levels.
- Trading Platform: Build a decentralized marketplace where players can trade or sell their Pokémon.

## License
This project is licensed under the GPL-3.0 License. See the LICENSE file for more details.

---

## Happy Pokémon battling on the blockchain! 🕹️🚀

