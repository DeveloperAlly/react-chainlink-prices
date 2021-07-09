var PriceOriginal = artifacts.require("../build/contracts/PriceOriginal");
var PriceFeed = artifacts.require("../build/contracts/PriceFeed.sol");
var TestMapping = artifacts.require("../build/contracts/TestMapping.sol");

module.exports = function (deployer) {
  // deployer.deploy(PriceOriginal);
  deployer.deploy(PriceFeed);
  // deployer.deploy(TestMapping);
};
