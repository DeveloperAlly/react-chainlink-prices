import web3 from "../web3";
import PriceFeed from "../../../build/contracts/PriceFeed.json";

const address = process.env.NEXT_PUBLIC_PRICEFEED;
console.log("address", address);
const PriceFeedInstance = new web3.eth.Contract(PriceFeed.abi, address);
console.log("PriceFeed", PriceFeedInstance);
export default PriceFeedInstance;
