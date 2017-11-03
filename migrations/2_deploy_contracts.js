var AuthenticationContract = artifacts.require("./AuthenticationContract.sol");

module.exports = function(deployer) {
  deployer.deploy(AuthenticationContract);
};
