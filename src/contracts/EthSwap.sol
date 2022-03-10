//solidity code for smart contract

pragma solidity ^0.5.0;

//import smart contracts
import "./Token.sol";

contract EthSwap{
    string public name = "EthSwap Instant Exchange";
    Token public token;
    uint public rate = 100;

 

    event TokensPurhased(
        address account,
        address token,
        uint amount,
        uint rate
    );

    event TokensSold(
        address account,
        address token,
        uint amount,
        uint rate
    );

    constructor(Token _token) public{
        token = _token;
    }

    function buyTokens() public payable{
        //Redemption Rate = value of DApp per eth 
        //value =  No of eth input * redemption rate
        uint tokenAmount = msg.value * 100;

        //Make sure that the balance of EthSwap exchange is more than the token amount purchase
        require(token.balanceOf(address(this)) >= tokenAmount);

        //msg.sender refers to the person who call this buyTokens function which is the buyer
        token.transfer(msg.sender, tokenAmount);

        //Emit an event
        emit TokensPurhased(msg.sender, address(token), tokenAmount, rate);
    }

    function sellTokens(uint _amount) public{
        //Investor cannot sell more token than they have
        require(token.balanceOf(msg.sender) >= _amount);

        //Calculate the ether amount received
        uint etherAmount = _amount / rate;

        //Make sure EthSwap has > eth 
        require(address(this).balance >= etherAmount);

        //Make sure that the balance of account balance is more than the token amount sell
        
        //send etherAmount to the msg.sender who call this function
        token.transferFrom(msg.sender, address(this), _amount);
        msg.sender.transfer(etherAmount);

        //Emit an event
        emit TokensSold(address(this), address(token), _amount, rate);
    }
}

