pragma solidity ^0.4.9;

import "lib/ethereans/token/Token.sol";
import "lib/ethereans/management/OwnedI.sol";

contract MyAppTokenI is Token, OwnedI {
    
    function mint(address _to, uint _amount);
    
}