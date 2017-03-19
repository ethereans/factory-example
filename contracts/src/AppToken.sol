pragma solidity ^0.4.9;

import "lib/ethereans/token/CollaborationToken.sol";
import "lib/ethereans/management/Owned.sol";
import "./MyAppTokenI.sol";

contract AppToken is MyAppTokenI, CollaborationToken, Owned {
    
    function AppToken(){
        setAttribute("name","AppToken");
        setAttribute("symbol","APP");
    }
    
    function mint(address _to, uint _amount) only_owner{
        _mint(_to,_amount);
    }
    
}