pragma solidity ^0.5.0;
import "./Xcoin.sol";

contract XokSwap {
    string public name = "XokSwap best swap ever";
    Xcoin public token;
    uint256 public rate = 1;

    event TokenPurchased(
        address account,
        address token,
        uint256 amount,
        uint256 rate
    );
    event TokenSold(
        address account,
        address token,
        uint256 amount,
        uint256 rate
    );

    constructor(Xcoin _token) public {
        token = _token;
    }

    function buyTokens() public payable {
        uint256 tokenAmount = msg.value * rate;


        require(token.balanceOf(address(this)) >= tokenAmount);

        token.transfer(msg.sender, tokenAmount);
        emit TokenPurchased(msg.sender, address(token), tokenAmount, rate);
        
    }

    function sellTokens(uint256 _amount) public {
        uint256 etherAmount = _amount / rate;
        require(address(this).balance >= etherAmount);
        token.transferFrom(msg.sender, address(this), _amount);
        msg.sender.transfer(etherAmount);
        emit TokenSold(msg.sender, address(token), _amount, rate);
    }
}
