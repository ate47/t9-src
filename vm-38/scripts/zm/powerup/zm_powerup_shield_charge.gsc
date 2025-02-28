#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_powerups.gsc;

#namespace zm_powerup_shield_charge;

/*
	Name: function_ad92cacc
	Namespace: zm_powerup_shield_charge
	Checksum: 0x42BA2A50
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ad92cacc()
{
	level notify(1876519275);
}

/*
	Name: __init__system__
	Namespace: zm_powerup_shield_charge
	Checksum: 0x8B350DE1
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_shield_charge", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_shield_charge
	Checksum: 0xC2A1E7EF
	Offset: 0x118
	Size: 0xFC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	zm_powerups::register_powerup("shield_charge", &grab_shield_charge);
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("shield_charge", "p8_wz_armor_scrap", #"hash_3f5e4aa38f9aeba5", &func_drop_when_players_own, 1, 0, 0);
		zm_powerups::function_59f7f2c6("shield_charge", #"hash_6c72c13078ae03d7", #"hash_3d58d22b97f9c9b4", #"hash_53f81d6d588b9984");
		zm_powerups::powerup_set_statless_powerup("shield_charge");
	}
	/#
		thread shield_devgui();
	#/
}

/*
	Name: func_drop_when_players_own
	Namespace: zm_powerup_shield_charge
	Checksum: 0x8CB56B5C
	Offset: 0x220
	Size: 0xB6
	Parameters: 0
	Flags: None
*/
function func_drop_when_players_own()
{
	players = getplayers();
	foreach(player in players)
	{
		if((isdefined(player.armortier) ? player.armortier : 0) > 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: grab_shield_charge
	Namespace: zm_powerup_shield_charge
	Checksum: 0x7FD0E3EE
	Offset: 0x2E0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function grab_shield_charge(player)
{
	level thread shield_charge_powerup(self, player);
}

/*
	Name: shield_charge_powerup
	Namespace: zm_powerup_shield_charge
	Checksum: 0x39AA1187
	Offset: 0x310
	Size: 0xCE
	Parameters: 2
	Flags: None
*/
function shield_charge_powerup(item, player)
{
	var_2cacdde7 = 50;
	inventoryitem = player.inventory.items[6];
	if(isdefined(inventoryitem))
	{
		var_2cacdde7 = (isdefined(inventoryitem.var_a6762160.var_a3aa1ca2) ? inventoryitem.var_a6762160.var_a3aa1ca2 : 50);
		if(var_2cacdde7 == 0)
		{
			var_2cacdde7 = 50;
		}
	}
	player.armor = player.armor + math::clamp(var_2cacdde7, 0, player.maxarmor);
}

/*
	Name: shield_devgui
	Namespace: zm_powerup_shield_charge
	Checksum: 0x8F1CF069
	Offset: 0x3E8
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function shield_devgui()
{
	/#
		level flag::wait_till("");
		wait(1);
		zm_devgui::add_custom_devgui_callback(&shield_devgui_callback);
		adddebugcommand("");
		adddebugcommand("");
	#/
}

/*
	Name: shield_devgui_callback
	Namespace: zm_powerup_shield_charge
	Checksum: 0x5BA61BD0
	Offset: 0x470
	Size: 0xC6
	Parameters: 1
	Flags: None
*/
function shield_devgui_callback(cmd)
{
	/#
		players = getplayers();
		retval = 0;
		switch(cmd)
		{
			case "shield_charge":
			{
				zm_devgui::zombie_devgui_give_powerup(cmd, 1);
				break;
			}
			case "next_shield_charge":
			{
				zm_devgui::zombie_devgui_give_powerup(getsubstr(cmd, 5), 0);
				break;
			}
		}
		return retval;
	#/
}

