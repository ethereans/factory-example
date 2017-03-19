pragma solidity 0.4.9;

import "./TokenFactoryMessageI.sol";

contract TokenFactoryMessage is TokenFactoryMessageI {
    address ret;
    string arg;
    
    function setProjectName(string _arg){
        arg = _arg;
    }
    function getProjectName() constant returns (string){
        return arg;
    }
    function setReturn(address _ret){
        ret = _ret;
    }
    function getReturn() constant returns (address){
        return ret;   
    }
}