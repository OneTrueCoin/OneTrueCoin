var OneTrueCoin = artifacts.require("./OneTrueCoin.sol");

module.exports = function(deployer) {
  deployer.deploy(OneTrueCoin);
};
