#using script_49d63131b6de89a1;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_812a8849;

/*
	Name: function_669e8903
	Namespace: namespace_812a8849
	Checksum: 0xC7DB2B07
	Offset: 0x9D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_669e8903()
{
	level notify(780606159);
}

/*
	Name: init
	Namespace: namespace_812a8849
	Checksum: 0x4508621D
	Offset: 0x9F8
	Size: 0xBD4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	var_85b7df77 = array("lgt_gold_container_receptacle_on", "lgt_gold_container_receptacle_off");
	var_f7289d61 = array("lgt_env_powered_fx_on", "lgt_env_powered_on_room_04", "lgt_env_powered_on_room_05", "lgt_env_powered_on_room_06", "lgt_env_powered_on_room_07", "lgt_env_powered_on_room_08", "lgt_env_powered_on_room_09");
	var_130c06bc = array("lgt_env_powered_off_room_04", "lgt_env_powered_off_room_05", "lgt_env_powered_off_room_06", "lgt_env_powered_off_room_07", "lgt_env_powered_off_room_08", "lgt_env_powered_off_room_09", "lgt_env_powered_off_room_10");
	var_c480ccc5 = array("lgt_env_dark_aether", "lgt_env_dark_aether_on_crystal", "lgt_env_dark_aether_on_bio_01", "lgt_env_dark_aether_on_bio_02", "lgt_env_dark_aether_on_bio_03", "lgt_env_dark_aether_fx", "lgt_central_ring_dark_aether", "fxexp_particle_accelerator_stabilized_dark_aether", "fxexp_aether_jellyfish");
	var_487f1775 = array("lgt_env_dark_aether_off_crystal", "lgt_env_dark_aether_off_bio_01", "lgt_env_dark_aether_off_bio_02", "lgt_env_dark_aether_off_bio_03");
	namespace_cf4aa5f0::function_6dbaba52("default", "lgt_env_default", undefined, undefined, var_85b7df77);
	namespace_cf4aa5f0::function_6dbaba52("default", var_487f1775, undefined, undefined, undefined);
	namespace_cf4aa5f0::function_6dbaba52("default", var_130c06bc, undefined, undefined, undefined);
	namespace_cf4aa5f0::function_6dbaba52("power_on", var_f7289d61, undefined, undefined, var_130c06bc, &power_on);
	namespace_cf4aa5f0::function_6dbaba52("power_on", "lgt_env_powered_on_room_10", undefined, undefined, "lgt_env_default");
	namespace_cf4aa5f0::function_6dbaba52("power_on", "fxexp_particle_accelerator_unstable", undefined, undefined, undefined);
	namespace_cf4aa5f0::function_6dbaba52("power_on_immediate", undefined, var_f7289d61, undefined, var_130c06bc);
	namespace_cf4aa5f0::function_6dbaba52("power_on_immediate", undefined, "lgt_env_powered_on_room_10", undefined, "lgt_env_default");
	namespace_cf4aa5f0::function_6dbaba52("aether_on", var_c480ccc5, undefined, undefined, var_f7289d61, &function_58e1770);
	namespace_cf4aa5f0::function_6dbaba52("aether_on", undefined, undefined, undefined, "lgt_env_powered_on_room_10");
	namespace_cf4aa5f0::function_6dbaba52("aether_on", undefined, undefined, undefined, "lgt_central_ring_powered_on");
	namespace_cf4aa5f0::function_6dbaba52("aether_on", undefined, undefined, undefined, "fxexp_particle_accelerator_stabilized");
	namespace_cf4aa5f0::function_6dbaba52("aether_off", var_487f1775, var_f7289d61, undefined, var_c480ccc5, &function_644c666);
	namespace_cf4aa5f0::function_6dbaba52("aether_off", undefined, "fxexp_particle_accelerator_stabilized", undefined, undefined);
	namespace_cf4aa5f0::function_6dbaba52("terminal_on", "lgt_central_ring_powered_on", undefined, undefined, undefined, &function_13508757);
	namespace_cf4aa5f0::function_6dbaba52("terminal_on", "fxexp_particle_accelerator_stabilized", undefined, undefined, "fxexp_particle_accelerator_unstable");
	namespace_cf4aa5f0::function_6dbaba52("terminal_on", "fxexp_particle_accelerator_stabilized_dark_energy", undefined, undefined, undefined);
	namespace_cf4aa5f0::function_6dbaba52("center_zone_on", undefined, "lgt_env_powered_on_room_10", undefined, undefined, &function_41575406);
	namespace_cf4aa5f0::function_6dbaba52("exfil_begin", undefined, "fxexp_particle_accelerator_unstable", undefined, "fxexp_particle_accelerator_stabilized", &function_a6be5efd);
	namespace_cf4aa5f0::function_6dbaba52("exfil_aether_explode", "fxexp_fx_exfile_aether_energy", undefined, undefined, undefined, &function_8b462844);
	namespace_cf4aa5f0::function_6dbaba52("receptacle_off", "lgt_gold_container_receptacle_off", undefined, undefined, undefined, &receptacle_off);
	namespace_cf4aa5f0::function_6dbaba52("receptacle_on", undefined, undefined, undefined, "lgt_gold_container_receptacle_off", &receptacle_on);
	namespace_cf4aa5f0::function_6dbaba52("pa_romm_off", "lgt_env_powered_off_room_10", undefined, undefined, "lgt_env_powered_on_room_10", &function_5d65ec93);
	namespace_cf4aa5f0::function_6dbaba52("pa_romm_on", "lgt_env_powered_on_room_10", undefined, undefined, "lgt_env_powered_off_room_10", &function_d4f7930b);
	clientfield::register("world", "dark_aether_active", 1, 1, "int", &dark_aether_active, 1, 0);
	clientfield::register("world", "terminal_on", 1, 1, "int", &terminal_on, 1, 0);
	clientfield::register("world", "center_zone_lights_off", 1, 1, "int", &center_zone_lights_off, 1, 0);
	clientfield::register("world", "gold_container_receptacle", 1, 2, "int", &gold_container_receptacle, 1, 0);
	clientfield::register("world", "exfil_begin", 1, 1, "int", &function_32635334, 1, 0);
	clientfield::register("world", "exfil_aether_trigger", 1, 1, "int", &exfil_aether_trigger, 1, 0);
	var_c54ed3ff = array("lgt_env_helping_hand_room_1", "lgt_env_helping_hand_room_2", "lgt_env_helping_hand_room_3", "lgt_env_helping_hand_room_4", "lgt_env_helping_hand_room_5");
	var_5b828e46 = array("lgt_env_dance_party", "lgt_env_powered_off_room_10");
	var_d6887678 = array("lgt_env_eyes_in_dark_corpse_01", "lgt_env_eyes_in_dark_corpse_02", "lgt_env_eyes_in_dark_corpse_03", "lgt_env_eyes_in_dark_corpse_04", "lgt_env_eyes_in_dark_corpse_05", "lgt_env_eyes_in_dark_corpse_final");
	namespace_cf4aa5f0::function_6dbaba52("hh_turn_all_lights_off", undefined, undefined, undefined, var_c54ed3ff, &function_8101dd57);
	namespace_cf4aa5f0::function_6dbaba52("hh_turn_room_1_light_on", "lgt_env_helping_hand_room_1", undefined, undefined, undefined, &function_21b2db42);
	namespace_cf4aa5f0::function_6dbaba52("hh_turn_room_2_light_on", "lgt_env_helping_hand_room_2", undefined, undefined, undefined, &function_7c061f48);
	namespace_cf4aa5f0::function_6dbaba52("hh_turn_room_3_light_on", "lgt_env_helping_hand_room_3", undefined, undefined, undefined, &function_3334d18c);
	namespace_cf4aa5f0::function_6dbaba52("hh_turn_room_4_light_on", "lgt_env_helping_hand_room_4", undefined, undefined, undefined, &function_43104854);
	namespace_cf4aa5f0::function_6dbaba52("hh_turn_room_5_light_on", "lgt_env_helping_hand_room_5", undefined, undefined, undefined, &function_fea29f76);
	namespace_cf4aa5f0::function_6dbaba52("hh_turn_room_5_light_off", undefined, undefined, undefined, "lgt_env_helping_hand_room_5", &function_18f1085);
	namespace_cf4aa5f0::function_6dbaba52("dance_party_light_on", var_5b828e46, undefined, undefined, "lgt_env_powered_on_room_10", &function_642374db);
	namespace_cf4aa5f0::function_6dbaba52("dance_party_light_off", "lgt_env_powered_on_room_10", undefined, undefined, var_5b828e46, &function_5764fb3e);
	namespace_cf4aa5f0::function_6dbaba52("eye_corpse_all_lights_off", undefined, undefined, undefined, var_d6887678, &function_fc8d90f);
	namespace_cf4aa5f0::function_6dbaba52("eye_corpse_1_light_on", "lgt_env_eyes_in_dark_corpse_01", undefined, undefined, undefined, &function_3f76876d);
	namespace_cf4aa5f0::function_6dbaba52("eye_corpse_2_light_on", "lgt_env_eyes_in_dark_corpse_02", undefined, undefined, undefined, &function_1a9ab05e);
	namespace_cf4aa5f0::function_6dbaba52("eye_corpse_3_light_on", "lgt_env_eyes_in_dark_corpse_03", undefined, undefined, undefined, &function_e8bff837);
	namespace_cf4aa5f0::function_6dbaba52("eye_corpse_4_light_on", "lgt_env_eyes_in_dark_corpse_04", undefined, undefined, undefined, &function_982b261f);
	namespace_cf4aa5f0::function_6dbaba52("eye_corpse_5_light_on", "lgt_env_eyes_in_dark_corpse_05", undefined, undefined, undefined, &function_b7ed6d15);
	namespace_cf4aa5f0::function_6dbaba52("eye_corpse_final_light_on", "lgt_env_eyes_in_dark_corpse_final", undefined, undefined, undefined, &function_3af921f0);
	clientfield::register("world", "helping_hand_room_light", 1, 3, "int", &function_fea08e0c, 1, 0);
	clientfield::register("world", "dance_party_light", 1, 1, "int", &function_bf23133d, 1, 0);
	clientfield::register("world", "eye_corpse_light", 1, 3, "int", &function_6b387dd, 1, 0);
}

/*
	Name: dark_aether_active
	Namespace: namespace_812a8849
	Checksum: 0x13875864
	Offset: 0x15D8
	Size: 0x70
	Parameters: 7
	Flags: Linked
*/
function dark_aether_active(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level notify(#"hash_22f24a373548473d");
	}
	else
	{
		level notify(#"hash_29e046cf89ba2659");
	}
}

/*
	Name: terminal_on
	Namespace: namespace_812a8849
	Checksum: 0xEA72C354
	Offset: 0x1650
	Size: 0x58
	Parameters: 7
	Flags: Linked
*/
function terminal_on(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level notify(#"terminal_on");
	}
}

/*
	Name: function_32635334
	Namespace: namespace_812a8849
	Checksum: 0x476C8475
	Offset: 0x16B0
	Size: 0x58
	Parameters: 7
	Flags: Linked, Private
*/
function private function_32635334(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level notify(#"hash_7dbd20c454454fb5");
	}
}

/*
	Name: exfil_aether_trigger
	Namespace: namespace_812a8849
	Checksum: 0x58D50466
	Offset: 0x1710
	Size: 0x58
	Parameters: 7
	Flags: Linked, Private
*/
function private exfil_aether_trigger(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level notify(#"hash_792fc58fcc31fc47");
	}
}

/*
	Name: center_zone_lights_off
	Namespace: namespace_812a8849
	Checksum: 0x7F09D236
	Offset: 0x1770
	Size: 0x70
	Parameters: 7
	Flags: Linked
*/
function center_zone_lights_off(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level notify(#"center_zone_lights_off");
	}
	else
	{
		level notify(#"hash_6a85393053fbdebb");
	}
}

/*
	Name: gold_container_receptacle
	Namespace: namespace_812a8849
	Checksum: 0xA24F7E87
	Offset: 0x17E8
	Size: 0x88
	Parameters: 7
	Flags: Linked
*/
function gold_container_receptacle(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		level notify(#"receptacle_off");
	}
	else if(bwastimejump == 2)
	{
		level notify(#"receptacle_on");
	}
}

/*
	Name: function_fea08e0c
	Namespace: namespace_812a8849
	Checksum: 0xB015E2F4
	Offset: 0x1878
	Size: 0x16A
	Parameters: 7
	Flags: Linked
*/
function function_fea08e0c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(bwastimejump))
	{
		switch(bwastimejump)
		{
			case 0:
			{
				level notify(#"hash_747bdae07819fd69");
				break;
			}
			case 1:
			{
				level notify(#"hash_6745b76e96a137f2");
				break;
			}
			case 2:
			{
				level notify(#"hash_5bc2cdfbceece14d");
				break;
			}
			case 3:
			{
				level notify(#"hash_751d64e6d9fe257c");
				break;
			}
			case 4:
			{
				level notify(#"hash_2130419e84ba3a27");
				break;
			}
			case 5:
			{
				level notify(#"hash_56702ce4ec3de2e6");
				break;
			}
			case 6:
			{
				level notify(#"hash_1e99f8fd6d3ef8c8");
				break;
			}
		}
	}
}

/*
	Name: function_bf23133d
	Namespace: namespace_812a8849
	Checksum: 0x2FC90FDE
	Offset: 0x19F0
	Size: 0x70
	Parameters: 7
	Flags: Linked
*/
function function_bf23133d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level notify(#"hash_6990bc8ecd1b7d78");
	}
	else
	{
		level notify(#"hash_7c5254a6859e80b2");
	}
}

/*
	Name: function_6b387dd
	Namespace: namespace_812a8849
	Checksum: 0xEB4499D4
	Offset: 0x1A68
	Size: 0x16A
	Parameters: 7
	Flags: Linked
*/
function function_6b387dd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(bwastimejump))
	{
		switch(bwastimejump)
		{
			case 0:
			{
				level notify(#"hash_26fe7957ec929d1f");
				break;
			}
			case 1:
			{
				level notify(#"hash_6f13eb84a7801e48");
				break;
			}
			case 2:
			{
				level notify(#"hash_49ba406d98d7e3ef");
				break;
			}
			case 3:
			{
				level notify(#"hash_6fbc2bc6b22eb64e");
				break;
			}
			case 4:
			{
				level notify(#"hash_17f0b94a986f8d5");
				break;
			}
			case 5:
			{
				level notify(#"hash_149d6ccba06a51a4");
				break;
			}
			case 6:
			{
				level notify(#"hash_ff649c11f82a671");
				break;
			}
		}
	}
}

/*
	Name: function_dcf22669
	Namespace: namespace_812a8849
	Checksum: 0x769CD9AF
	Offset: 0x1BE0
	Size: 0x2E4
	Parameters: 0
	Flags: Linked
*/
function function_dcf22669()
{
	namespace_cf4aa5f0::function_470d684a("default");
	namespace_cf4aa5f0::function_470d684a("receptacle_off");
	namespace_cf4aa5f0::function_470d684a("receptacle_on");
	namespace_cf4aa5f0::function_470d684a("terminal_on");
	namespace_cf4aa5f0::function_470d684a("exfil_begin");
	namespace_cf4aa5f0::function_470d684a("exfil_aether_explode");
	namespace_cf4aa5f0::function_470d684a("pa_romm_off");
	namespace_cf4aa5f0::function_470d684a("pa_romm_on");
	if(level clientfield::get("zombie_power_on"))
	{
		namespace_cf4aa5f0::function_470d684a("power_on_immediate");
	}
	else
	{
		namespace_cf4aa5f0::function_470d684a("power_on");
	}
	namespace_cf4aa5f0::function_25002e3("aether_on");
	namespace_cf4aa5f0::function_25002e3("aether_off");
	namespace_cf4aa5f0::function_25002e3("center_zone_on");
	namespace_cf4aa5f0::function_470d684a("dance_party_light_on");
	namespace_cf4aa5f0::function_470d684a("dance_party_light_off");
	namespace_cf4aa5f0::function_25002e3("hh_turn_all_lights_off");
	namespace_cf4aa5f0::function_25002e3("hh_turn_room_1_light_on");
	namespace_cf4aa5f0::function_25002e3("hh_turn_room_2_light_on");
	namespace_cf4aa5f0::function_25002e3("hh_turn_room_3_light_on");
	namespace_cf4aa5f0::function_25002e3("hh_turn_room_4_light_on");
	namespace_cf4aa5f0::function_25002e3("hh_turn_room_5_light_on");
	namespace_cf4aa5f0::function_25002e3("hh_turn_room_5_light_off");
	namespace_cf4aa5f0::function_25002e3("eye_corpse_all_lights_off");
	namespace_cf4aa5f0::function_25002e3("eye_corpse_1_light_on");
	namespace_cf4aa5f0::function_25002e3("eye_corpse_2_light_on");
	namespace_cf4aa5f0::function_25002e3("eye_corpse_3_light_on");
	namespace_cf4aa5f0::function_25002e3("eye_corpse_4_light_on");
	namespace_cf4aa5f0::function_25002e3("eye_corpse_5_light_on");
	namespace_cf4aa5f0::function_25002e3("eye_corpse_final_light_on");
}

/*
	Name: power_on
	Namespace: namespace_812a8849
	Checksum: 0xB6EB93C2
	Offset: 0x1ED0
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private power_on()
{
	level waittill(#"power_on");
}

/*
	Name: function_58e1770
	Namespace: namespace_812a8849
	Checksum: 0x50C9A267
	Offset: 0x1EF8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_58e1770()
{
	level waittill(#"hash_22f24a373548473d");
}

/*
	Name: function_644c666
	Namespace: namespace_812a8849
	Checksum: 0xFFD78E2A
	Offset: 0x1F20
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_644c666()
{
	level waittill(#"hash_29e046cf89ba2659");
}

/*
	Name: function_13508757
	Namespace: namespace_812a8849
	Checksum: 0x9CF1C4C8
	Offset: 0x1F48
	Size: 0x22
	Parameters: 0
	Flags: Linked, Private
*/
function private function_13508757()
{
	level waittill(#"terminal_on");
	wait(3);
}

/*
	Name: function_41575406
	Namespace: namespace_812a8849
	Checksum: 0x70CD7CB5
	Offset: 0x1F78
	Size: 0x4E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_41575406()
{
	while(true)
	{
		level waittill(#"hash_29e046cf89ba2659");
		if(!level clientfield::get("center_zone_lights_off"))
		{
			break;
		}
	}
}

/*
	Name: receptacle_off
	Namespace: namespace_812a8849
	Checksum: 0x6D535C57
	Offset: 0x1FD0
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private receptacle_off()
{
	level waittill(#"receptacle_off");
}

/*
	Name: receptacle_on
	Namespace: namespace_812a8849
	Checksum: 0xB4C8C6E7
	Offset: 0x1FF8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private receptacle_on()
{
	level waittill(#"receptacle_on");
}

/*
	Name: function_5d65ec93
	Namespace: namespace_812a8849
	Checksum: 0x252BF662
	Offset: 0x2020
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5d65ec93()
{
	level waittill(#"center_zone_lights_off");
}

/*
	Name: function_d4f7930b
	Namespace: namespace_812a8849
	Checksum: 0xBABE8842
	Offset: 0x2048
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d4f7930b()
{
	level waittill(#"hash_6a85393053fbdebb");
}

/*
	Name: function_8101dd57
	Namespace: namespace_812a8849
	Checksum: 0xAB95F61C
	Offset: 0x2070
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8101dd57()
{
	level waittill(#"hash_747bdae07819fd69");
}

/*
	Name: function_21b2db42
	Namespace: namespace_812a8849
	Checksum: 0x76EBA614
	Offset: 0x2098
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_21b2db42()
{
	level waittill(#"hash_6745b76e96a137f2");
}

/*
	Name: function_7c061f48
	Namespace: namespace_812a8849
	Checksum: 0xC602BC2E
	Offset: 0x20C0
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7c061f48()
{
	level waittill(#"hash_5bc2cdfbceece14d");
}

/*
	Name: function_3334d18c
	Namespace: namespace_812a8849
	Checksum: 0x82398D80
	Offset: 0x20E8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3334d18c()
{
	level waittill(#"hash_751d64e6d9fe257c");
}

/*
	Name: function_43104854
	Namespace: namespace_812a8849
	Checksum: 0xA21FA64A
	Offset: 0x2110
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_43104854()
{
	level waittill(#"hash_2130419e84ba3a27");
}

/*
	Name: function_fea29f76
	Namespace: namespace_812a8849
	Checksum: 0x35E7F3B0
	Offset: 0x2138
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fea29f76()
{
	level waittill(#"hash_56702ce4ec3de2e6");
}

/*
	Name: function_18f1085
	Namespace: namespace_812a8849
	Checksum: 0xB20C5B02
	Offset: 0x2160
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_18f1085()
{
	level waittill(#"hash_1e99f8fd6d3ef8c8");
}

/*
	Name: function_642374db
	Namespace: namespace_812a8849
	Checksum: 0xB9D2E21A
	Offset: 0x2188
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_642374db()
{
	level waittill(#"hash_6990bc8ecd1b7d78");
}

/*
	Name: function_5764fb3e
	Namespace: namespace_812a8849
	Checksum: 0xE060CD37
	Offset: 0x21B0
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5764fb3e()
{
	level waittill(#"hash_7c5254a6859e80b2");
}

/*
	Name: function_fc8d90f
	Namespace: namespace_812a8849
	Checksum: 0xD8706A5D
	Offset: 0x21D8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fc8d90f()
{
	level waittill(#"hash_26fe7957ec929d1f");
}

/*
	Name: function_3f76876d
	Namespace: namespace_812a8849
	Checksum: 0xA387C8B2
	Offset: 0x2200
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3f76876d()
{
	level waittill(#"hash_6f13eb84a7801e48");
}

/*
	Name: function_1a9ab05e
	Namespace: namespace_812a8849
	Checksum: 0x89558B38
	Offset: 0x2228
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1a9ab05e()
{
	level waittill(#"hash_49ba406d98d7e3ef");
}

/*
	Name: function_e8bff837
	Namespace: namespace_812a8849
	Checksum: 0x1DDFB92
	Offset: 0x2250
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e8bff837()
{
	level waittill(#"hash_6fbc2bc6b22eb64e");
}

/*
	Name: function_982b261f
	Namespace: namespace_812a8849
	Checksum: 0x7EF32D6C
	Offset: 0x2278
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_982b261f()
{
	level waittill(#"hash_17f0b94a986f8d5");
}

/*
	Name: function_b7ed6d15
	Namespace: namespace_812a8849
	Checksum: 0x18598FA6
	Offset: 0x22A0
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b7ed6d15()
{
	level waittill(#"hash_149d6ccba06a51a4");
}

/*
	Name: function_3af921f0
	Namespace: namespace_812a8849
	Checksum: 0xBABCA4F2
	Offset: 0x22C8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3af921f0()
{
	level waittill(#"hash_ff649c11f82a671");
}

/*
	Name: function_a6be5efd
	Namespace: namespace_812a8849
	Checksum: 0x45894289
	Offset: 0x22F0
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a6be5efd()
{
	level waittill(#"hash_7dbd20c454454fb5");
}

/*
	Name: function_8b462844
	Namespace: namespace_812a8849
	Checksum: 0x93E2FAAC
	Offset: 0x2318
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8b462844()
{
	level waittill(#"hash_792fc58fcc31fc47");
}

