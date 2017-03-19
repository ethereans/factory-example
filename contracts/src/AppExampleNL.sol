pragma solidity ^0.4.9;


import "lib/ethereans/management/Owned.sol";
import "lib/ethereans/token/Token.sol";
import "./library/MyAppTokenLibraryN.sol";

contract AppExampleNL is Owned {
    
    MyAppTokenI public myToken;
    
    mapping (uint => MyAppTokenI) public userProjectToken;
    uint public projectCount = 0;

    function AppExampleNL(){
        myToken = MyAppTokenLibraryN.newAppToken();
    }

    function createProject(string _name) {
        userProjectToken[projectCount] = MyAppTokenLibraryN.newProjectToken(_name);
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