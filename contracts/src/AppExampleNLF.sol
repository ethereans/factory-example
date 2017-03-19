pragma solidity ^0.4.9;


import "lib/ethereans/management/Owned.sol";
import "lib/ethereans/token/Token.sol";
import "./library/MyAppTokenLibraryNF.sol";

contract AppExampleNLF is Owned {
    
    using MyAppTokenLibraryNF for MyAppTokenFactoryNI;
    MyAppTokenFactoryNI public myTokenFactory;
    
    MyAppTokenI public myToken;
    mapping (uint => MyAppTokenI) public userProjectToken;
    uint public projectCount = 0;

    function AppExampleNLF(MyAppTokenFactoryNI _myTokenFactory){
        myTokenFactory = _myTokenFactory;
        myToken = myTokenFactory._newAppToken();
    }

    function createProject(string _name) {
        userProjectToken[projectCount] = myTokenFactory._newProjectToken(_name);
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