
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
