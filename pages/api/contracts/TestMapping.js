import web3 from "../web3";
import TestMapping from "../../../build/contracts/TestMapping.json";

const address = process.env.NEXT_PUBLIC_TESTMAPPING;
console.log("address", address);
const TestMappingInstance = new web3.eth.Contract(TestMapping.abi, address);
console.log("TestMapping", TestMappingInstance);
export default TestMappingInstance;

// import web3 from "./web3";
// import Campaign from "../build/contracts/Campaign.json";

// const campaignDetails = (address) => {
//   return new web3.eth.Contract(Campaign.abi, address);
// };

// export default campaignDetails;
