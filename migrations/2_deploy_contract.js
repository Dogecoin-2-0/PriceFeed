const PriceFeed = artifacts.require('PriceFeed');
require('dotenv').config();

module.exports = function (deployer) {
  deployer.deploy(PriceFeed, process.env[process.env.NETWORK]);
};
