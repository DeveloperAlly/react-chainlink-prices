// SPDX-License-Identifier: MIT
pragma solidity ^0.6.7;

contract TestMapping {
    mapping(string => address) priceData;
    
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
}