// See if Metamask is installed in the browser
web3 = "";

function checkMetaConnection() {
	if (typeof window.ethereum !== 'undefined') {
		return 1;
	} else {
		return 0;
	}
}

// Ask user to connect wallet to site and get address
async function getMetamaskAccount() {
	var map = {};
	map["id"] = "getWalletAddress";
	map["address"]="0";

	try {
	  const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
		map["address"] = accounts[0];
		web3 = new Web3(window.ethereum);
		console.log(web3);
		console.log(map["address"]);

	} catch(error) {
		console.log("User rejected request");
	}
	GMS_API.send_async_event_social(map);
}


async function getTokenBalance(wallet_address, token_address) {

	// Default structure of ERC20 smart contract
	let minABI = [
	  // balanceOf
	  {
	    "constant":true,
	    "inputs":[{"name":"_owner","type":"address"}],
	    "name":"balanceOf",
	    "outputs":[{"name":"balance","type":"uint256"}],
	    "type":"function"
	  },
	  // decimals
	  {
	    "constant":true,
	    "inputs":[],
	    "name":"decimals",
	    "outputs":[{"name":"","type":"uint8"}],
	    "type":"function"
	  }
	];

	var map = {};
	map["id"] = "getTokenBalance";
	map["balance"]="-1";

	let contract = new web3.eth.Contract(minABI, token_address);
	console.log(contract);

	try {

		const balance = await contract.methods.balanceOf(wallet_address).call();
		const decimalPlaces = await contract.methods.decimals().call(); // 8
		let newBalance = 0;
		
		if (decimalPlaces) {
			newBalance = balance / (10 ** decimalPlaces);
		}

		console.log(balance);
		console.log(decimalPlaces);
		console.log(newBalance);

		map["balance"] = newBalance;

	} catch(error) {
		console.log(error);
	}

	GMS_API.send_async_event_social(map);
}


















//
