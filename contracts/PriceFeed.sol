pragma solidity ^0.8.0;

import '@chainlink/contracts/src/v0.8/interfaces/FeedRegistryInterface.sol';
import '@openzeppelin/contracts/utils/math/SafeCast.sol';
import '@openzeppelin/contracts/utils/math/SafeMath.sol';

contract PriceFeed {
  using SafeCast for int256;
  using SafeMath for uint256;

  FeedRegistryInterface internal _feed;

  constructor(address _feedRegistry) {
    _feed = FeedRegistryInterface(_feedRegistry);
  }

  function getPrice(address _base, address _quote)
    external
    view
    returns (uint256)
  {
    (, int256 price, , , ) = _feed.latestRoundData(_base, _quote);
    return price.toUint256();
  }
}
