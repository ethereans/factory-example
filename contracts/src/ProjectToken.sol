pragma solidity ^0.4.9;

import "lib/ethereans/token/CollaborationToken.sol";
import "lib/ethereans/management/Owned.sol";
import "./MyAppTokenI.sol";

contract ProjectToken is MyAppTokenI, CollaborationToken, Owned{

    function ProjectToken(string _name){
        setAttribute("name", _name);
        setAttribute("symbol","PRJ");
    }
    
    function mint(address _to, uint _amount) only_owner {
        _mint(_to,_amount);
    }
    
}