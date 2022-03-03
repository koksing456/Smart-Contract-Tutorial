//To put smart contract on the blockchain
const EthSwap = artifacts.require("EthSwap");
const Token = artifacts.require("Token");

module.exports = async function(deployer) {
    //deploy ethswap
  await deployer.deploy(EthSwap)
  const ethSwap = await EthSwap.deployed()

  //deploy token;
  await deployer.deploy(Token);
  const token = await Token.deployed()

  //Transfer all tokens to EthSwap
  await token.transfer(ethSwap.address, '1000000000000000000000000')
};