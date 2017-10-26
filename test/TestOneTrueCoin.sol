pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/OneTrueCoin.sol";

contract TestOneTrueCoin {

  function testInitialBalanceUsingDeployedContract() {
    OneTrueCoin oneTrueCoin = OneTrueCoin(DeployedAddresses.OneTrueCoin());

    Assert.equal(oneTrueCoin.getOwner(), tx.origin, "Creator should have the one coin to rule them all");
  }

  function testInitialBalanceWithNewOneTrueCoin() {
    OneTrueCoin oneTrueCoin = new OneTrueCoin();

    Assert.equal(oneTrueCoin.getOwner(), tx.origin, "Creator should have the one coin to rule them all");
  }
}
