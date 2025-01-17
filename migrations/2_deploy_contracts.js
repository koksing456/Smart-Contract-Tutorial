//To put smart contract on the blockchain
const EthSwap = artifacts.require("EthSwap");
const Token = artifacts.require("Token");

module.exports = async function(deployer) {

  //deploy token;
  await deployer.deploy(Token);
  const token = await Token.deployed() 

    //deploy ethswap
  await deployer.deploy(EthSwap, token.address)
  const ethSwap = await EthSwap.deployed()

  //Transfer all tokens to EthSwap
  await token.transfer(ethSwap.address, '1000000000000000000000000')
};