/// @description 

switch (state) {
	
	// See if Metamask is connected to browser - this calls a function in the included JS file
	case 0:
		browser_has_metamask = checkMetaConnection();

		if (browser_has_metamask) {
			print("MetaMask is installed in the browser, checking if user has already connected wallet");
			state=1;
			alarm[0]=1;
		} else {
			print("You need to install the MetaMask extension");
		}
		break;
	
	
	// Connect wallet
	case 1:
		print("Getting users wallet address");
		getMetamaskAccount();
		break;
	
	// Ask user for coin to check
	case 2:
		if (global.user_address!="0") {
			balance_input = get_string_async("Please enter the token address you want to check in the wallet (Default is SAT)","0x1e446cbea52badeb614fbe4ab7610f737995fb44");	
		}
		break;
	
	// Check users coin
	case 3:
		print("Checking users wallet for token: "+string(coin_address_to_check))
		getTokenBalance(global.user_address, coin_address_to_check);
		break;
		
		
		
		// Send transaction
		case 4:
			print("Yet to create this function!")
		break;



}
