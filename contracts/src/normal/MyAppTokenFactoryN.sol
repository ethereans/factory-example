pragma solidity ^0.4.9;

import "./MyAppTokenFactoryNI.sol";
import "../AppToken.sol";
import "../ProjectToken.sol";

contract MyAppTokenFactoryN is MyAppTokenFactoryNI{

    function newProjectToken(string _name) returns (MyAppTokenI){
        ProjectToken instance = new ProjectToken(_name);
        instance.setOwner(msg.sender);
        return MyAppTokenI(instance);
    }
    
    function newAppToken() returns (MyAppTokenI){
        AppToken instance = new AppToken();
        instance.setOwner(msg.sender);
        return MyAppTokenI(instance);
    }
    
}