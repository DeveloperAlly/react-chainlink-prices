import web3 from "../web3";
import PriceOriginal from "../../../build/contracts/PriceOriginal.json";

const address = process.env.NEXT_PUBLIC_PRICEORIGINAL;
console.log("address", address);
const PriceOriginalInstance = new web3.eth.Contract(PriceOriginal.abi, address);
console.log("PriceOriginalInstance", PriceOriginalInstance);
export default PriceOriginalInstance;
