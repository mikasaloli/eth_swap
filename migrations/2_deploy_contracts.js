// const Token = artifacts.require("Token");
const XokSwap = artifacts.require('XokSwap')
const Xcoin = artifacts.require('Xcoin')

module.exports = async function (deployer) {
  // Deploy Token

  await deployer.deploy(Xcoin)
  const xcoin = await Xcoin.deployed()

  await deployer.deploy(XokSwap, xcoin.address)
  const xokSwap = await XokSwap.deployed()

  await xcoin.transfer(xokSwap.address, '10000000')
  // const token = await Token.deployed()

  // Deploy EthSwap
  // await deployer.deploy(, token.address);
  // const ethSwap = await EthSwap.deployed()

  // Transfer all tokens to EthSwap (1 million)
  // await token.transfer(ethSwap.address, '1000000000000000000000000')
}
