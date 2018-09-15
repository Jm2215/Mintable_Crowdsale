pragma solidity 0.4.24;
import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import "openzeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/CappedToken.sol";
contract TestToken is MintableToken, DetailedERC20, CappedToken {
  address private walletAddress;
  modifier hasMintPermission() {
    require(msg.sender == owner || msg.sender == walletAddress, 'UNAUTHORIZED');
    _;
  }
  constructor(
      string _name,
      string _symbol,
      uint8 _decimals,
      uint256 _cap,
      address _walletAddress
    ) 
    DetailedERC20(_name, _symbol, _decimals)
    CappedToken(_cap)
    public
  {
   walletAddress = _walletAddress
  }
}