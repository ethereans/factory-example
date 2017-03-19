pragma solidity ^0.4.9;

import "../AppToken.sol";
import "../ProjectToken.sol";

library MyAppTokenLibraryN {
       
    function newProjectToken(string _name) internal returns (MyAppTokenI) { 
        return new ProjectToken(_name);
        
    }
    function newAppToken() internal returns (MyAppTokenI){
        return new AppToken();
    }
    
}