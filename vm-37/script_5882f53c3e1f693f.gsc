#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_812a8849;

/*
	Name: init
	Namespace: namespace_812a8849
	Checksum: 0x7A91CA7B
	Offset: 0x178
	Size: 0x2BC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "dark_aether_active", 1, 1, "int");
	clientfield::register("world", "terminal_on", 1, 1, "int");
	clientfield::register("world", "center_zone_lights_off", 1, 1, "int");
	clientfield::register("world", "gold_container_receptacle", 1, 2, "int");
	clientfield::register("world", "exfil_begin", 1, 1, "int");
	clientfield::register("world", "exfil_aether_trigger", 1, 1, "int");
	level thread function_d88ded8(#"dark_aether_active", "dark_aether_active");
	level thread function_d88ded8(array("terminal_1_is_on", "terminal_2_is_on"), "terminal_on");
	level thread function_d88ded8(#"hash_94bda7ad49639f5", "center_zone_lights_off");
	level thread function_d88ded8(#"hash_6dae739b31c68d72", "exfil_begin");
	level thread function_d88ded8(#"exfil_aether_trigger", "exfil_aether_trigger");
	level thread function_b5bdf435();
	clientfield::register("world", "helping_hand_room_light", 1, 3, "int");
	clientfield::register("world", "dance_party_light", 1, 1, "int");
	clientfield::register("world", "eye_corpse_light", 1, 3, "int");
	level thread function_387ae4cb();
}

/*
	Name: function_d88ded8
	Namespace: namespace_812a8849
	Checksum: 0xD212A355
	Offset: 0x440
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function function_d88ded8(flag, clientfield)
{
	level endon(#"end_game");
	while(true)
	{
		level waittill(flag);
		if(isarray(flag))
		{
			level clientfield::set(clientfield, level flag::get_all(flag));
		}
		else
		{
			level clientfield::set(clientfield, level flag::get(flag));
		}
	}
}

/*
	Name: function_b5bdf435
	Namespace: namespace_812a8849
	Checksum: 0xC1BB2309
	Offset: 0x510
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_b5bdf435()
{
	level endon(#"end_game");
	level waittill(#"hash_5d4ec14886878368");
	level clientfield::set("gold_container_receptacle", 1);
	level waittill(#"hash_3b0c1d89e0879d06");
	level clientfield::set("gold_container_receptacle", 2);
}

/*
	Name: function_bd7cde02
	Namespace: namespace_812a8849
	Checksum: 0x7C2F1EFB
	Offset: 0x5A8
	Size: 0x1C2
	Parameters: 1
	Flags: Linked
*/
function function_bd7cde02(state)
{
	level endon(#"hash_2d0433bbc2675311");
	if(isdefined(state))
	{
		switch(state)
		{
			case "turn_all_lights_off":
			{
				level clientfield::set("helping_hand_room_light", 0);
				break;
			}
			case "hash_5352f9e4f4c14e5d":
			{
				level clientfield::set("helping_hand_room_light", 1);
				break;
			}
			case "hash_2ab337a49f728442":
			{
				level clientfield::set("helping_hand_room_light", 2);
				break;
			}
			case "hash_555317dd04ddfb53":
			{
				level clientfield::set("helping_hand_room_light", 3);
				break;
			}
			case "hash_39c27d9e66fbcc70":
			{
				level clientfield::set("helping_hand_room_light", 4);
				break;
			}
			case "hash_5d16dc15bacebc31":
			{
				level clientfield::set("helping_hand_room_light", 5);
				break;
			}
			case "hash_7c795fec6d335b4d":
			{
				level clientfield::set("helping_hand_room_light", 6);
				break;
			}
		}
	}
}

/*
	Name: function_387ae4cb
	Namespace: namespace_812a8849
	Checksum: 0xC725FF87
	Offset: 0x778
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_387ae4cb()
{
	level endon(#"end_game");
	level waittill(#"hash_6990bc8ecd1b7d78");
	level clientfield::set("dance_party_light", 1);
	level waittill(#"hash_7c5254a6859e80b2");
	level clientfield::set("dance_party_light", 0);
}

/*
	Name: function_32ba2029
	Namespace: namespace_812a8849
	Checksum: 0x164B0335
	Offset: 0x810
	Size: 0x1C2
	Parameters: 1
	Flags: Linked
*/
function function_32ba2029(state)
{
	level endon(#"hash_2d0433bbc2675311");
	if(isdefined(state))
	{
		switch(state)
		{
			case "hash_26fe7957ec929d1f":
			{
				level clientfield::set("eye_corpse_light", 0);
				break;
			}
			case "hash_4f392103c121e5e8":
			{
				level clientfield::set("eye_corpse_light", 1);
				break;
			}
			case "hash_2cff279013344d8f":
			{
				level clientfield::set("eye_corpse_light", 2);
				break;
			}
			case "hash_3e957b81e3c5716e":
			{
				level clientfield::set("eye_corpse_light", 3);
				break;
			}
			case "hash_5d0f09f0cbf01d75":
			{
				level clientfield::set("eye_corpse_light", 4);
				break;
			}
			case "hash_10b3c9031d24f9c4":
			{
				level clientfield::set("eye_corpse_light", 5);
				break;
			}
			case "hash_ff649c11f82a671":
			{
				level clientfield::set("eye_corpse_light", 6);
				break;
			}
		}
	}
}

