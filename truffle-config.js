require('babel-register');
require('babel-polyfill');

//This is the main entry point for the application
//Below block of code is to specifiy the connection to the blockchain
module.exports = {
  networks: {
    //development newtowork that connect to Ganache
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
  },
  //location of smart contract
  contracts_directory: './src/contracts/',
  contracts_build_directory: './src/abis/',
  compilers: {
    solc: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
}
