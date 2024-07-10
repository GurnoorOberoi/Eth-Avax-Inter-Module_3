# MyToken Smart Contract
The myToken smart contract is an ERC20-compliant token implementation built using the OpenZeppelin library. This token, named "Gurnoor" with the symbol "GUR", includes additional functionalities for minting and burning tokens. These functions are restricted to the contract owner and token holders, respectively. The contract provides a secure and efficient way to manage token issuance, transfers, and burning within a decentralized application or platform.

## Description 
The myToken smart contract is a versatile and secure implementation of the ERC20 token standard, leveraging the OpenZeppelin library for robust and well-tested functionality. Below is a detailed description of each aspect of the contract, including its purpose, functionalities, and how it integrates with decentralized applications.

#### Token Name and Symbol
##### Token Name: Gurnoor
##### Token Symbol: GUR
These identifiers make the token recognizable within wallets and exchanges, allowing users to easily identify and transact with the token.

## Features
#### Minting New Tokens:
Only the contract owner has the authority to mint new tokens. This feature is crucial for platforms that need to control the supply of their tokens, ensuring that new tokens are only created when necessary.
The mint function allows the owner to specify the recipient address and the amount of tokens to be minted.

#### Burning Tokens:
Token holders can burn their own tokens. This feature is useful for reducing the total supply of tokens, which can help manage inflation or remove unused tokens from circulation.
The burn function allows any token holder to specify the amount of their tokens they wish to burn.

#### Transferring Tokens:
Standard ERC20 transfer functionality is implemented, allowing token transfers between addresses. This is essential for enabling transactions and interactions within a decentralized application or platform.
The transfer function ensures that tokens can be transferred securely and efficiently from one user to another.

#### Initial Supply:
The initial supply of tokens is minted to the owner upon deployment. This provides a starting point for token distribution and usage within the platform.

## Get Started
### Executing Program 
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at Remix Ethereum.


``` Solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

//import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract myToken is ERC20 {
    address owner;

    constructor(uint _initialSupply) ERC20("Gurnoor", "GUR") {
        owner = msg.sender;
        _mint(msg.sender, _initialSupply);
    }

    function mint(address to, uint amount) public {
        require(msg.sender == owner, "Not Authorized");
        _mint(to, amount);
    }

    function burn(uint amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address recipient, uint amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

}
```

## Author
Name: Gurnoor Oberoi

## License
This project is licensed under the MIT License - see the LICENSE.md file for details
