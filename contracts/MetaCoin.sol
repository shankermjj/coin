pragma solidity ^0.4.17;

import "./ConvertLib.sol";

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract MetaCoin {
	mapping (address => uint) balances;
address public x;
        struct wallet
       {
         address from;
         address to;
         uint256 amount1;
         uint256 time;
       }
        wallet[] public candidates;
	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	function MetaCoin() public {
		balances[tx.origin] = 10000;
	}

	function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;

		x=receiver;
		Transfer(msg.sender, x, amount);
                candidates.push(wallet({from:msg.sender,to:receiver,amount1:amount,time:now}));
		return true;
	}

	function getBalanceInEth(address addr) public view returns(uint){
		return ConvertLib.convert(getBalance(addr),2);
	}

	function getBalance(address addr) public view returns(uint) {
		return balances[addr];
	}
        function getx() public view returns(address)
        {
         return x;
        }
        
        function fetch(uint index)public returns(address,address,uint256,uint256)
        {
	    return(candidates[index].from,candidates[index].to,candidates[index].amount1,candidates[index].time);
	}
        

}
