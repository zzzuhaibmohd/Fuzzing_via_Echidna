/*
Assumptions
1. Anyone can have at maximum 1000 tokens
2. Balance should not be greater than zero

echidna-test contracts/examples/token.sol --contract testToken

│ Call sequence:                                                                                                       │               
│ 1.airdrop()                                                                                                          │               
│ 2.backdoor()       

*/
contract Token{
    mapping(address => uint) public balances;
    function airdrop() public{
        balances[msg.sender] = 1000;
    }
    function consume() public{
        require(balances[msg.sender]>0);
        balances[msg.sender] -= 1;
    }
    function backdoor() public{
        balances[msg.sender] += 1;
    }
}

contract testToken is Token {
    function echidna_balance_under_1000() public view returns(bool){
        return (balances[msg.sender] <= 1000);
    }
}
