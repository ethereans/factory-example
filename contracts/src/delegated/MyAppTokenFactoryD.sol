pragma solidity ^0.4.9;

import "./MyAppTokenFactoryDI.sol";
import "../AppToken.sol";
import "../ProjectToken.sol";

contract MyAppTokenFactoryD is MyAppTokenFactoryDI{

    function newProjectToken(address _ret){
        TokenFactoryMessageI message = TokenFactoryMessageI(_ret);
        string memory _name = "no name :("; //p.getProjectName();
        message.setReturn(address(new ProjectToken(_name)));
    }
    
    function newAppToken(address _ret){
        TokenFactoryMessageI message = TokenFactoryMessageI(_ret);
        address instance = address(new AppToken());
        message.setReturn(instance);
    }
    
}