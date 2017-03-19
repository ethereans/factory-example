pragma solidity ^0.4.8;

import "./OwnedI.sol";

contract Owned is OwnedI {
    address public owner= msg.sender;
    event NewOwner(address owner);

    modifier only_owner {
        if (msg.sender != owner) throw;
        _;
    }
    
    function setOwner(address _owner)
     only_owner {
        owner = _owner;
        NewOwner(_owner);
    }
    
    function getOwner() constant returns (address){
        return owner;
    }
}