pragma solidity ^0.4.9;

import "../MyAppTokenI.sol";

contract MyAppTokenFactoryNI {
    function newProjectToken(string _name) returns (MyAppTokenI);
    function newAppToken() returns (MyAppTokenI);
}