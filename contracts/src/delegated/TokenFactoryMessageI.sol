pragma solidity 0.4.9;

import "../MyAppTokenI.sol";

contract TokenFactoryMessageI {
    function setReturn(address ret);
    function getProjectName() constant returns (string);
}