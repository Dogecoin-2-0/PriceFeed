pragma solidity ^0.8.0;

import '@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol';
import '@chainlink/contracts/src/v0.8/Denominations.sol';
import '@openzeppelin/contracts/utils/math/SafeCast.sol';
import '@openzeppelin/contracts/utils/math/SafeMath.sol';

contract PriceFeed {
  using SafeCast for int256;
  using SafeMath for uint256;

  constructor() {}

  function fetchLatestPrice(address _base) external view returns (uint256) {
    AggregatorV3Interface _feed = AggregatorV3Interface(_base);
    (, int256 price, , , ) = _feed.latestRoundData();
    return price.toUint256();
  }

  function getDecimals(address _base) external view returns (uint8) {
    AggregatorV3Interface _feed = AggregatorV3Interface(_base);
    return _feed.decimals();
  }
}
