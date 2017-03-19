pragma solidity ^0.4.9;

import "../MyAppTokenI.sol";
import "../normal/MyAppTokenFactoryNI.sol";

library MyAppTokenLibraryNF {
    
    function _newProjectToken(MyAppTokenFactoryNI self, string _name) internal returns (MyAppTokenI) { 
        return self.newProjectToken(_name);
        
    }
    function _newAppToken(MyAppTokenFactoryNI self) internal returns (MyAppTokenI){
        return self.newAppToken();
    }
    
}