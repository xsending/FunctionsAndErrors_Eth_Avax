# FunctionsAndErrors_Eth_Avax

This Solidity program demonstrates how the require(), assert(), and revert() functions perform when applied to a simple token burning and minting simulation. The purpose of this program is to show how the said functions will behave as error handlers when used in various test cases.  

## Description

This Solidity program is a simple simulation of the process of token burning and minting, while also including error handler functions require(), assert(), and revert(). It is written in Solidity, and has 3 functions that will be used to demonstrate the behavior of the said error handler functions. It also includes other variables that will be used to store the values that will be inputted by the user when performing various test cases. This program serves as a good example in showing the uses of the require(), assert(), and revert() functions. 

## Getting Started

### Executing program

The Remix IDE is a good option (https://remix.ethereum.org/) for running this code. First, create a new file, and simply copy this code and compile it on the "Solidity Compiler" tab.

```javascript
// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;


/* first address used: 0x71C7656EC7ab88b098defB751B7401B5f6d8976F
   second address used: 0xC66d07097f4823343bf116463070B3be5e941C4E
*/

contract MyTokenErrorHandling {

    // public variables here
    struct Token{
        string tkn_name;
        string tkn_abbrev;
        uint t_supply;
    }
    
    Token public eth = Token("Ethereum", "ETH", 0);

    // mapping variable here
    mapping (address => uint) public balances;

    // mint function
    function mint100(address addr, uint val) external{
        require(val <= 100, "You can only mint at a maximum of 100 tokens at a time.");
        eth.t_supply += val;
        balances[addr] += val;
    }

    function mint200(address addr, uint val) external{
        if (val > 200){
            revert("You can only mint at a maximum of 200 tokens at a time.");
        }
        eth.t_supply += val;
        balances[addr] += val;
    }

    // burn function
    function burn(address addr, uint val) external{
        assert(val <= balances[addr]);
        eth.t_supply -= val;
        balances[addr] -= val;
    }
}
```
After compiling, proceed to the "Deploy & Run Transactions" tab and click "deploy" to run the code. Provide a Solidity address and a value for the functions found in the program in order to execute it, and see how it affects the values stored in the "balances" variable and the "eth" object. Furthermore, notice as well how the error handlers will behave once it encounters some conditions that does not satisfy its requirements. Continue to experiment with different values and see how the program works with various inputs.

## Authors

Abel Gomez  

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
