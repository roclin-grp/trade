pragma solidity ^0.4.8;

contract Trade {
    uint public object_rate = 1000;
    mapping (address => uint) objectAccount;
    mapping (address => uint) coinAccount;
    address public owner;
    
    function Trade() {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        if (msg.sender != owner) { 
            throw; 
        } else { 
            _;
        }  
    } 
    
    function setRate(uint rate) onlyOwner {
        object_rate = rate;
    }

    // I am selling some object; this will credit my account
    function sellObject(uint object) public {
        coinAccount[msg.sender] += (object * object_rate);
    }

    // I am buying some object, this will crediting my object account
    function buyObject(uint coin) {
        if (coinAccount[msg.sender] > coin) {
            coinAccount[msg.sender] -= coin;
            objectAccount[msg.sender] += (coin / object_rate);
        }
    }
    
    function getObjectAccount() returns (uint object) {
        return objectAccount[msg.sender];
    }

    function getCoinAccount() returns (uint coin) {
        return coinAccount[msg.sender];
    }
}