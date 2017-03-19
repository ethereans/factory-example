pragma solidity ^0.4.8;

contract OwnedI {
    function getOwner() constant returns (address);
    event NewOwner(address owner);

    function setOwner(address _owner);
}