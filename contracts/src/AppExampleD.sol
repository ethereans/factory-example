pragma solidity ^0.4.9;


import "lib/ethereans/management/Owned.sol";
import "lib/ethereans/token/Token.sol";
import "./delegated/MyAppTokenFactoryDI.sol";
import "./delegated/TokenFactoryMessage.sol";

contract AppExampleD is Owned {
    
    MyAppTokenFactoryDI public myAppTokenFactory;
    TokenFactoryMessage tempRet;
    
    MyAppTokenI public myToken;
    mapping (uint => MyAppTokenI) public userProjectToken;
    uint public projectCount = 0;

    function AppExampleD(MyAppTokenFactoryDI _myAppTokenFactory){
        tempRet = new TokenFactoryMessage();
        myAppTokenFactory = _myAppTokenFactory;
        if(!myAppTokenFactory.delegatecall("newAppToken(address)",tempRet)) throw;
        myToken = MyAppTokenI(tempRet.getReturn());
    }

     function createProject(string _name) {
        tempRet.setProjectName(_name);
        if(!myAppTokenFactory.delegatecall("newProjectToken(address)",tempRet)) throw;
        userProjectToken[projectCount] = MyAppTokenI(tempRet.getReturn());
        projectCount++;
    }

    function mint(uint _project, address _to, uint _amount) only_owner {
        userProjectToken[_project].mint(_to,_amount);
    }
    function mint(address _to, uint _amount) only_owner{
        myToken.mint(_to,_amount);
    }
    
    function isOwned(uint _project) returns (address){
        return userProjectToken[_project].getOwner();
    }
}