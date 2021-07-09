// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;
pragma experimental ABIEncoderV2;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
// github: import "https://github.com/smartcontractkit/chainlink/blob/master/evm-contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

/*
    Aggregator API Reference
        decimals	The number of decimals in the response.
        description	The description of the aggregator that the proxy points to.
        getRoundData	Get data from a specific round.
        latestRoundData	Get data from the latest round.
        version	The version representing the type of aggregator the proxy points to.

    Feed Registry: https://docs.chain.link/docs/feed-registry/
*/

/*
        ethusd = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        btcusd = AggregatorV3Interface(0xECe365B379E1dD183B20fc5f022230C044d51404);
        linkusd = AggregatorV3Interface(0xd8bD0a1cB028a31AA859A21A3758685a95dE4623);
        audusd = AggregatorV3Interface(0x21c095d2aDa464A294956eA058077F14F66535af);
*/

contract PriceConsumerV3 {
    struct PriceData {
        address feedAddress;
        string title;
        int price;
    }

    address[] public priceFeeds;
    PriceData[] public priceInfo;

//pass an array of priceFeed addresses
    constructor() public {
        // Map over each address to create the aggregator
        // priceFeeds.push(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        // priceFeeds.push(0xECe365B379E1dD183B20fc5f022230C044d51404);
        // priceFeeds.push(0xd8bD0a1cB028a31AA859A21A3758685a95dE4623);
        // priceFeeds.push(0x21c095d2aDa464A294956eA058077F14F66535af);
        priceInfo.push(createPriceData(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e, "ETHUSD"));
        priceInfo.push(createPriceData(0xECe365B379E1dD183B20fc5f022230C044d51404, "BTCUSD"));
        priceInfo.push(createPriceData(0xd8bD0a1cB028a31AA859A21A3758685a95dE4623, "LINKUSD"));
        priceInfo.push(createPriceData(0x21c095d2aDa464A294956eA058077F14F66535af, "AUDUSD"));
    }

    function createPriceData(address feedAddress, string memory title) private view returns (PriceData memory){
        PriceData memory newData = PriceData({
            feedAddress: feedAddress,
            title: title,
            price: getLatestPrice(feedAddress)
        });
        return newData;
    }

    /**
     * Returns the latest price
     */
    function getLatestPrice(address priceFeed) public view returns (int) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = AggregatorV3Interface(priceFeed).latestRoundData(); //latestRoundData(address assset, address denomination)
        return price;
    }

    function getAllPrices() public view returns (PriceData[] memory) {
        return priceInfo;
    }
}
// // SPDX-License-Identifier: MIT
// pragma solidity ^0.6.6;

// import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
// // github: import "https://github.com/smartcontractkit/chainlink/blob/master/evm-contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

// /*
//     Aggregator API Reference
//         decimals	The number of decimals in the response.
//         description	The description of the aggregator that the proxy points to.
//         getRoundData	Get data from a specific round.
//         latestRoundData	Get data from the latest round.
//         version	The version representing the type of aggregator the proxy points to.

//     Feed Registry: https://docs.chain.link/docs/feed-registry/
// */

// /*
//         ethusd = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
//         btcusd = AggregatorV3Interface(0xECe365B379E1dD183B20fc5f022230C044d51404);
//         linkusd = AggregatorV3Interface(0xd8bD0a1cB028a31AA859A21A3758685a95dE4623);
//         audusd = AggregatorV3Interface(0x21c095d2aDa464A294956eA058077F14F66535af);
// */

// contract PriceConsumerV3 {
//     // mapping(string => AggregatorV3Interface) aggregatorAddresses;
//     // address[] private aggregatorAddresses;

//     struct PriceData {
//         AggregatorV3Interface feedInterface;
//         string title;
//         uint price;
//     }

//     mapping(address => PriceData) priceFeeds;
//     address[] public priceInfo;

//     // mapping(address => AggregatorV3Interface) priceInterfaces;
//     // address[] private priceInterfaces;
    
//     /**
//      * Find these here: https://docs.chain.link/docs/reference-contracts/
//      * Network: Kovan
//      * Aggregator: ETH/USD
//      * Address: 0x9326BFA02ADD2366b30bacB125260Af641031331
//      *
//      * Network: Rinkeby
//      * Aggregator: ETH/USD
//      * Address: 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
//      */


//     constructor() public {
//         // ethusd = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
//         // btcusd = AggregatorV3Interface(0xECe365B379E1dD183B20fc5f022230C044d51404);
//         // linkusd = AggregatorV3Interface(0xd8bD0a1cB028a31AA859A21A3758685a95dE4623);
//         // audusd = AggregatorV3Interface(0x21c095d2aDa464A294956eA058077F14F66535af);

//         // Map over each address to create the aggregator?
//         createPriceData(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e, "ETHUSD");
//         createPriceData(0xECe365B379E1dD183B20fc5f022230C044d51404, "BTCUSD");
//         createPriceData(0xd8bD0a1cB028a31AA859A21A3758685a95dE4623, "LINKUSD");
//         createPriceData(0x21c095d2aDa464A294956eA058077F14F66535af, "AUDUSD");
//     }

//     function createPriceData(address feedAddress, string memory title) private {
//         PriceData memory newData = Request({
//             feedInterface: AggregatorV3Interface(feedAddress),
//             title: title
//         });
//         priceInfo.push(newData);
//     }

//     /**
//      * Returns the latest price
//      */
//     function getLatestPrice() public view returns (int) {
//         (
//             uint80 roundID, 
//             int price,
//             uint startedAt,
//             uint timeStamp,
//             uint80 answeredInRound
//         ) = priceFeed.latestRoundData(); //latestRoundData(address assset, address denomination)
//         return price;
//     }

//     function getAllPrices() public view returns (int) {
//         (
//             uint80 roundID, 
//             int price,
//             uint startedAt,
//             uint timeStamp,
//             uint80 answeredInRound
//         ) = priceFeed.latestRoundData(); //latestRoundData(address assset, address denomination)
//         return price;
//     }
// }


// // SPDX-License-Identifier: MIT
// pragma solidity ^0.6.7;

// import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

// contract PriceConsumerV3 {
//     AggregatorV3Interface internal priceFeed;
//     // FeedRegistryInterface internal registry;
    
//     /**
//      * Network: Kovan
//      * Aggregator: ETH/USD
//      * Address: 0x9326BFA02ADD2366b30bacB125260Af641031331
//      */
//     constructor() public {
//         priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
//         //registry = FeedRegistryInterface(0xd441F0B98BcF34749391A3879A94caA95ffDB74D);
//     }

//     /**
//      * Returns the latest price
//      */
//     function getLatestPrice() public view returns (int) {
//         (
//             uint80 roundID, 
//             int price,
//             uint startedAt,
//             uint timeStamp,
//             uint80 answeredInRound
//         ) = priceFeed.latestRoundData();
//         return price;
//     }
    
//         /**
//      * Returns the latest price
//      */
//     // function getThePrice(address asset, address denomination) public view returns (int) {
//     //     (
//     //         uint80 roundID, 
//     //         int price,
//     //         uint startedAt,
//     //         uint timeStamp,
//     //         uint80 answeredInRound
//     //     ) = registry.latestRoundData(asset, denomination);
//     //     return price;
//     // }
// }