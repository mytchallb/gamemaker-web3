/// @description 


var input_id = ds_map_find_value(async_load, "id");
switch (input_id) {
	
	case balance_input:
		if ds_map_find_value(async_load, "status") {
			if (ds_map_find_value(async_load, "result") != "") {
				coin_address_to_check = ds_map_find_value(async_load, "result");
				state=3;
				alarm[0]=1;
			} else {
				print("Please use a proper address");
				state=-1;
			}
		}
		break;
	
}




    

    