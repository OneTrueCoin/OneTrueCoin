pragma solidity ^0.4.4;

contract OneTrueCoin {
    address owner;

    event Transfer(address indexed _from, address indexed _to);

    function OneTrueCoin() {
        owner = tx.origin;
    }

    function sendCoin(address receiver) returns(bool sufficient) {
        require(msg.sender == owner);
        owner = receiver;
        Transfer(msg.sender, receiver);
        return true;
    }

    function getOwner() returns(address) {
        return owner;
    }

    function isOwner(address addr) returns(bool) {
        return owner == addr;
    }
}
