pragma solidity ^0.8.0;

import '@chainlink/contracts/src/v0.8/interfaces/FeedRegistryInterface.sol';
import '@chainlink/contracts/src/v0.8/Denominations.sol';
import '@openzeppelin/contracts/utils/math/SafeCast.sol';
import '@openzeppelin/contracts/utils/math/SafeMath.sol';

contract PriceFeed {
  using SafeCast for int256;
  using SafeMath for uint256;

  FeedRegistryInterface internal _feed;

  constructor(address _feedRegistry) {
    _feed = FeedRegistryInterface(_feedRegistry);
  }

  function getPriceUSD(address _base) external view returns (uint256) {
    (, int256 price, , , ) = _feed.latestRoundData(_base, Denominations.USD);
    return price.toUint256();
  }
}
