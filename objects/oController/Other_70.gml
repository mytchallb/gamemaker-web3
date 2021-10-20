/// @description 

var my_id = async_load[? "id"];

if (my_id=="getWalletAddress") {
	global.user_address = async_load[? "address"];
	
	if (global.user_address=="0") {
		print("Denied access to wallet");
	} else {
		print("Got user address as "+string(global.user_address));
		state=2;
		oBtnConnectWallet.image_index=1;
	}
}


if (my_id=="getTokenBalance") {
	var bal = async_load[? "balance"];

	if (bal==-1) {
		print("Failed to get the balance");
	} else {
		print("User has "+string(bal)+" of the token");
	}
}