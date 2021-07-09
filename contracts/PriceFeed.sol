// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;
pragma experimental ABIEncoderV2;

//To run on remix use Injected Web3 with Metamask on Rinkeby network activated

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract PriceFeed {
    AggregatorV3Interface internal priceFeed;
    mapping(string => address) public priceData;

    struct PriceData {
        uint80 roundID;
        int price;
        uint startedAt;
        uint timeStamp;
        uint80 answeredInRound;
        string description;
        uint8 decimals;
    }
    
    /**
     * Network: Kovan
     * Aggregator: ETH/USD
     * Address: 0x9326BFA02ADD2366b30bacB125260Af641031331
     */
    constructor() public {
        priceData["ETHUSD"] = 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e;
        priceData["BTCUSD"] = 0xECe365B379E1dD183B20fc5f022230C044d51404;
        priceData["LINKUSD"] = 0xd8bD0a1cB028a31AA859A21A3758685a95dE4623;
        priceData["AUDUSD"]= 0x21c095d2aDa464A294956eA058077F14F66535af;
    }

    function getAddress(string memory asset) public view returns(address) {
        return priceData[asset];
    }
    
    function createMapping(string memory assetName, address assetAddress) public {
        priceData[assetName] = assetAddress;
    }
    
    /**
     * Returns the latest price
     */
    function getLatestPrice(string memory asset) public view returns (int) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = AggregatorV3Interface(priceData[asset]).latestRoundData();
        return price;
    }
    function getLatestPrice(address assetAddress) public view returns (PriceData memory) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = AggregatorV3Interface(assetAddress).latestRoundData();
        // return price;
        PriceData memory newPriceData = PriceData({
            roundID:roundID, 
            price:price,
            startedAt:startedAt,
            timeStamp:timeStamp,
            answeredInRound: answeredInRound,
            description: AggregatorV3Interface(assetAddress).description(),
            decimals: AggregatorV3Interface(assetAddress).decimals()
        });
        return newPriceData;
    }
}
