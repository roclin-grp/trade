pragma solidity ^0.4.8;

contract TokenSupply {
    
    address public owner;
    uint256 public totalSupply;
    mapping (address => uint256) public balanceOf;
    
    /*To notify the client*/
    event Transfer(address indexed_to, address indexed_from, uint amount);
    
    function TokenSupply(uint initialSupply){
            totalSupply = initialSupply;
    }
    
    function onwed(){
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        if(msg.sender != owner)
            throw;
            _;
    }

    /* Mint function */   
    function mintToken(address target, uint256 mintedAmount) onlyOwner {
    
    balanceOf[target] += mintedAmount;
    totalSupply += mintedAmount;
    Transfer(0, owner, mintedAmount);
    Transfer(owner, target, mintedAmount);
    }
}