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
