#using script_32399001bdb550da;
#using script_47fb62300ac0bd60;
#using script_521cab335b496d29;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\cp_common\challenges.gsc;
#using scripts\cp_common\collectibles.gsc;
#using scripts\cp_common\skipto.gsc;

#namespace devgui;

/*
	Name: function_89f2df9
	Namespace: devgui
	Checksum: 0x2E33E572
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	/#
		system::register(#"devgui", &function_70a657d8, undefined, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: devgui
	Checksum: 0x1D11280A
	Offset: 0x128
	Size: 0x25C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		setdvar(#"coop_devgui", "");
		setdvar(#"coop_devgui_player", "");
		setdvar(#"cp_weap_devgui", "");
		setdvar(#"debug_center_screen", 0);
		setdvar(#"cp_attachment_devgui", "");
		setdvar(#"cp_weap_use_give_console_command_devgui", 0);
		setdvar(#"cp_weap_asset_name_display_devgui", 0);
		setdvar(#"cp_weap_devgui_player", "");
		thread devgui_think();
		thread devgui_weapon_think();
		thread devgui_weapon_asset_name_display_think();
		thread dev::devgui_test_chart_think();
		thread init_debug_center_screen();
		level thread function_5a9c86f0();
		level thread dev::body_customization_devgui(2);
		level thread function_57edec18();
		callback::on_start_gametype(&devgui_player_commands);
		callback::on_connect(&devgui_player_connect);
		callback::on_disconnect(&devgui_player_disconnect);
		level.devgui_player_connect = &devgui_player_connect;
		level.devgui_player_disconnect = &devgui_player_disconnect;
	#/
}

/*
	Name: devgui_player_commands
	Namespace: devgui
	Checksum: 0xF08B08DA
	Offset: 0x390
	Size: 0x1E4
	Parameters: 0
	Flags: None
*/
function devgui_player_commands()
{
	/#
		level flag::wait_till("");
		rootclear = "";
		adddebugcommand(rootclear);
		players = getplayers();
		foreach(player in getplayers())
		{
			rootclear = ("" + player.playername) + "";
			adddebugcommand(rootclear);
		}
		thread devgui_player_weapons();
		util::waittill_can_add_debug_command();
		level.player_devgui_base = "";
		devgui_add_player_commands(level.player_devgui_base, "", 0);
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			ip1 = i + 1;
			players[i] devgui_add_player_commands(level.player_devgui_base, players[i].playername, ip1);
		}
	#/
}

/*
	Name: devgui_player_connect
	Namespace: devgui
	Checksum: 0x75406348
	Offset: 0x580
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function devgui_player_connect()
{
	/#
		if(!isdefined(level.player_devgui_base))
		{
			return;
		}
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] != self)
			{
				continue;
			}
			self devgui_add_player_commands(level.player_devgui_base, players[i].playername, i + 1);
		}
	#/
}

/*
	Name: devgui_player_disconnect
	Namespace: devgui
	Checksum: 0xBCEF95F
	Offset: 0x628
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function devgui_player_disconnect()
{
	/#
		if(!isdefined(level.player_devgui_base))
		{
			return;
		}
		rootclear = ("" + self.playername) + "";
		util::add_queued_debug_command(rootclear);
	#/
}

/*
	Name: devgui_add_player_commands
	Namespace: devgui
	Checksum: 0x1789E998
	Offset: 0x688
	Size: 0x4E0
	Parameters: 3
	Flags: None
*/
function devgui_add_player_commands(root, pname, pid)
{
	/#
		player_devgui_root = (root + pname) + "";
		cmdindex = 1;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		if(isbot(self))
		{
			return;
		}
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
		devgui_add_player_command(player_devgui_root, pid, "", cmdindex, "");
		cmdindex++;
	#/
}

/*
	Name: devgui_add_player_command
	Namespace: devgui
	Checksum: 0x5ACD844A
	Offset: 0xB70
	Size: 0x94
	Parameters: 5
	Flags: None
*/
function devgui_add_player_command(root, pid, cmdname, cmdindex, cmddvar)
{
	/#
		util::add_queued_debug_command((((((((((pid + cmdindex) + "") + "") + "") + cmdname) + "") + "") + "") + cmddvar) + "");
	#/
}

/*
	Name: devgui_handle_player_command
	Namespace: devgui
	Checksum: 0xA99FA41
	Offset: 0xC10
	Size: 0x104
	Parameters: 3
	Flags: None
*/
function devgui_handle_player_command(cmd, playercallback, pcb_param)
{
	/#
		pid = getdvarint(#"coop_devgui_player", 0);
		if(pid > 0)
		{
			player = getplayers()[pid - 1];
			if(isdefined(player))
			{
				if(isdefined(pcb_param))
				{
					player thread [[playercallback]](pcb_param);
				}
				else
				{
					player thread [[playercallback]]();
				}
			}
		}
		else
		{
			array::thread_all(getplayers(), playercallback, pcb_param);
		}
		setdvar(#"coop_devgui_player", "");
	#/
}

/*
	Name: devgui_think
	Namespace: devgui
	Checksum: 0x3BAC3CBF
	Offset: 0xD20
	Size: 0x6D0
	Parameters: 0
	Flags: None
*/
function devgui_think()
{
	/#
		for(;;)
		{
			cmd = getdvarstring(#"coop_devgui");
			if(cmd == "")
			{
				waitframe(1);
				continue;
			}
			switch(cmd)
			{
				case "health":
				{
					devgui_handle_player_command(cmd, &devgui_give_health);
					break;
				}
				case "ammo":
				{
					devgui_handle_player_command(cmd, &devgui_toggle_ammo);
					break;
				}
				case "ignore":
				{
					devgui_handle_player_command(cmd, &devgui_toggle_ignore);
					break;
				}
				case "invul_on":
				{
					devgui_handle_player_command(cmd, &devgui_invulnerable, 1);
					break;
				}
				case "invul_off":
				{
					devgui_handle_player_command(cmd, &devgui_invulnerable, 0);
					break;
				}
				case "hash_40eb49b3498f2d5a":
				{
					devgui_handle_player_command(cmd, &function_c60fba82, #"axis");
					break;
				}
				case "hash_546db01572b08d35":
				{
					devgui_handle_player_command(cmd, &function_c60fba82, #"allies");
					break;
				}
				case "kill":
				{
					devgui_handle_player_command(cmd, &devgui_kill);
					break;
				}
				case "revive":
				{
					devgui_handle_player_command(cmd, &devgui_revive);
					break;
				}
				case "hash_52845e239e497665":
				{
					devgui_handle_player_command(cmd, &function_fa6a74c3, 100);
					break;
				}
				case "hash_43a9fbb800953127":
				{
					devgui_handle_player_command(cmd, &function_fa6a74c3, 1000);
					break;
				}
				case "hash_8219fc726384517":
				{
					devgui_handle_player_command(cmd, &function_c11f6cfe, 100);
					break;
				}
				case "hash_4afdee64ba81c711":
				{
					devgui_handle_player_command(cmd, &function_c11f6cfe, 1000);
					break;
				}
				case "hash_42b246496512ccba":
				{
					devgui_handle_player_command(cmd, &collectibles::function_a66b8474);
					break;
				}
				case "hash_777573ed749058d3":
				{
					devgui_handle_player_command(cmd, &collectibles::function_4e4a7021);
					break;
				}
				case "hash_62c2f3a35c11cebf":
				{
					devgui_handle_player_command(cmd, &function_8c36f50);
					break;
				}
				case "hash_3e24fbcff4d4b1eb":
				{
					devgui_handle_player_command(cmd, &function_895ead7c);
					break;
				}
				case "hash_7d67399c1e80c90f":
				{
					devgui_handle_player_command(cmd, &function_38ea35b);
					break;
				}
				case "hash_67a420615cfa783d":
				{
					devgui_handle_player_command(cmd, &function_d1f1f7b0);
					break;
				}
				case "hash_22e23b36dec9f72e":
				{
					devgui_handle_player_command(cmd, &function_b729c951);
					break;
				}
				case "hash_27b8b67661308678":
				{
					devgui_handle_player_command(cmd, &function_fa6a74c3, 1000000);
					break;
				}
				case "hash_17ae6e19e0c5fdd2":
				{
					devgui_handle_player_command(cmd, &function_f96938ce);
					break;
				}
				case "hash_171c599dfd8645fb":
				{
					devgui_handle_player_command(cmd, &function_de31914a, "");
					break;
				}
				case 0:
				{
					break;
				}
				default:
				{
					if(isdefined(level.custom_devgui))
					{
						if(isarray(level.custom_devgui))
						{
							foreach(devgui in level.custom_devgui)
							{
								if(is_true([[devgui]](cmd)))
								{
									break;
								}
							}
						}
						else
						{
							[[level.custom_devgui]](cmd);
						}
					}
					break;
				}
			}
			setdvar(#"coop_devgui", "");
			wait(0.5);
		}
	#/
}

/*
	Name: function_de31914a
	Namespace: devgui
	Checksum: 0xD86CB670
	Offset: 0x13F8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_de31914a(stat_name)
{
	/#
		self challenges::function_8332bc5e(stat_name, 50);
	#/
}

/*
	Name: function_f96938ce
	Namespace: devgui
	Checksum: 0x461D7BE9
	Offset: 0x1430
	Size: 0xE0
	Parameters: 0
	Flags: None
*/
function function_f96938ce()
{
	/#
		var_16e5e46 = skipto::function_228558fd();
		foreach(var_9ea95904 in var_16e5e46)
		{
			self stats::function_dad108fa(#"hash_6c042cdc991e48c2" + getsubstr(getmissionname(var_9ea95904), 0, 3), 1);
		}
	#/
}

/*
	Name: function_b729c951
	Namespace: devgui
	Checksum: 0x901B88B7
	Offset: 0x1518
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_b729c951()
{
	/#
		for(itemindex = 1; itemindex < 76; itemindex++)
		{
			self stats::set_stat(#"itemstats", itemindex, #"stats", #"kills", #"statvalue", 999);
		}
	#/
}

/*
	Name: function_d1f1f7b0
	Namespace: devgui
	Checksum: 0x7E3C9B0C
	Offset: 0x15A8
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_d1f1f7b0()
{
	/#
		for(itemindex = 1; itemindex < 76; itemindex++)
		{
			self stats::set_stat(#"itemstats", itemindex, #"xp", 1000000);
		}
	#/
}

/*
	Name: function_38ea35b
	Namespace: devgui
	Checksum: 0x25946E51
	Offset: 0x1618
	Size: 0xD0
	Parameters: 0
	Flags: None
*/
function function_38ea35b()
{
	/#
		if(!isdefined(getrootmapname()))
		{
			return;
		}
		foreach(var_9ea95904 in skipto::function_228558fd())
		{
			self stats::set_stat(#"playerstatsbymap", var_9ea95904, #"hash_1e0160af4fd80dff", 4, 1);
		}
	#/
}

/*
	Name: function_895ead7c
	Namespace: devgui
	Checksum: 0xAF0743B8
	Offset: 0x16F0
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_895ead7c()
{
	/#
		if(is_true(self.var_f031ddbc))
		{
			self closeluimenu(self.var_f031ddbc);
		}
		self.var_f031ddbc = self openluimenu("");
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
		while(response != "")
		{
			waitresult = undefined;
			waitresult = self waittill(#"menuresponse");
			menu = waitresult.menu;
			response = waitresult.response;
		}
		self closeluimenu(self.var_f031ddbc);
	#/
}

/*
	Name: function_8c36f50
	Namespace: devgui
	Checksum: 0x4C47526F
	Offset: 0x1818
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function function_8c36f50()
{
	/#
		var_16e5e46 = skipto::function_228558fd();
		foreach(mission_name in var_16e5e46)
		{
			self stats::set_stat(#"playerstatsbymap", mission_name, #"hasbeencompleted", 1);
		}
	#/
}

/*
	Name: function_fa6a74c3
	Namespace: devgui
	Checksum: 0xDE1E1499
	Offset: 0x18E8
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_fa6a74c3(var_32db513)
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		self addrankxpvalue("", var_32db513);
	#/
}

/*
	Name: function_c11f6cfe
	Namespace: devgui
	Checksum: 0x281A8BCB
	Offset: 0x1968
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function function_c11f6cfe(var_32db513)
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		weapon_ref = self.currentweapon.rootweapon.name;
		weapon_index = getitemindexfromref(weapon_ref);
		var_2888ab1b = self stats::get_stat(#"itemstats", weapon_index, #"xp");
		self stats::set_stat(#"itemstats", weapon_index, #"xp", var_32db513 + var_2888ab1b);
	#/
}

/*
	Name: devgui_invulnerable
	Namespace: devgui
	Checksum: 0x53BCA6F4
	Offset: 0x1A78
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function devgui_invulnerable(onoff)
{
	/#
		if(onoff)
		{
			self val::set(#"devgui", "", 0);
		}
		else
		{
			self val::reset(#"devgui", "");
		}
	#/
}

/*
	Name: function_c60fba82
	Namespace: devgui
	Checksum: 0x981AE4F0
	Offset: 0x1AF8
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_c60fba82(teamname)
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		self.team = teamname;
		self.sessionteam = teamname;
		self.pers[#"team"] = teamname;
	#/
}

/*
	Name: devgui_kill
	Namespace: devgui
	Checksum: 0x8EB4D408
	Offset: 0x1B90
	Size: 0x114
	Parameters: 0
	Flags: None
*/
function devgui_kill()
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		if(isalive(self))
		{
			self val::set(#"devgui_kill", "", 1);
			death_from = (randomfloatrange(-20, 20), randomfloatrange(-20, 20), randomfloatrange(-20, 20));
			self dodamage(self.health + 666, self.origin + death_from);
		}
	#/
}

/*
	Name: devgui_toggle_ammo
	Namespace: devgui
	Checksum: 0x99CBFAC6
	Offset: 0x1CB0
	Size: 0x15E
	Parameters: 0
	Flags: None
*/
function devgui_toggle_ammo()
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		if(!isalive(self))
		{
			return;
		}
		self notify(#"devgui_toggle_ammo");
		self endon(#"devgui_toggle_ammo");
		self.ammo4evah = !is_true(self.ammo4evah);
		while(isdefined(self) && self.ammo4evah)
		{
			weapon = self getcurrentweapon();
			if(weapon != level.weaponnone)
			{
				self setweaponoverheating(0, 0);
				max = weapon.maxammo;
				if(isdefined(max))
				{
					self setweaponammostock(weapon, max);
				}
			}
			wait(1);
		}
	#/
}

/*
	Name: devgui_toggle_ignore
	Namespace: devgui
	Checksum: 0x586FDCF2
	Offset: 0x1E18
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function devgui_toggle_ignore()
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		if(!isalive(self))
		{
			return;
		}
		self val::set(#"devgui_toggle_ignore", "", !self.ignoreme);
	#/
}

/*
	Name: devgui_revive
	Namespace: devgui
	Checksum: 0x188A937A
	Offset: 0x1EC0
	Size: 0x116
	Parameters: 0
	Flags: None
*/
function devgui_revive()
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		if(!isalive(self))
		{
			return;
		}
		self reviveplayer();
		if(isdefined(self.revivetrigger))
		{
			self.revivetrigger delete();
			self.revivetrigger = undefined;
		}
		self allowjump(1);
		self.laststand = undefined;
		self callback::callback(#"on_player_revived");
		self notify(#"player_revived", {#reviver:self});
	#/
}

/*
	Name: maintain_maxhealth
	Namespace: devgui
	Checksum: 0xD03B9B18
	Offset: 0x1FE0
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function maintain_maxhealth(maxhealth)
{
	/#
		self endon(#"disconnect", #"devgui_give_health");
		while(true)
		{
			wait(1);
			if(self.maxhealth != maxhealth)
			{
				self.maxhealth = maxhealth;
				self.health = self.maxhealth;
			}
		}
	#/
}

/*
	Name: devgui_give_health
	Namespace: devgui
	Checksum: 0x3D21DF4
	Offset: 0x2060
	Size: 0xFA
	Parameters: 0
	Flags: None
*/
function devgui_give_health()
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		if(!isalive(self))
		{
			return;
		}
		self notify(#"devgui_give_health");
		if(self.maxhealth >= 2000 && isdefined(self.orgmaxhealth))
		{
			self.maxhealth = self.orgmaxhealth;
		}
		else
		{
			self.orgmaxhealth = self.maxhealth;
			self.maxhealth = 2000;
			self thread maintain_maxhealth(self.maxhealth);
		}
		self.health = self.maxhealth;
	#/
}

/*
	Name: devgui_player_weapons
	Namespace: devgui
	Checksum: 0x60466BC5
	Offset: 0x2168
	Size: 0x4E4
	Parameters: 0
	Flags: None
*/
function devgui_player_weapons()
{
	/#
		level endon(#"game_ended");
		if(is_true(game.devgui_weapons_added))
		{
			return;
		}
		level flag::wait_till("");
		wait(0.1);
		a_weapons = enumerateweapons("");
		a_weapons_cp = [];
		a_grenades_cp = [];
		a_misc_cp = [];
		for(i = 0; i < a_weapons.size; i++)
		{
			if(weapons::is_primary_weapon(a_weapons[i]) || weapons::is_side_arm(a_weapons[i]))
			{
				arrayinsert(a_weapons_cp, a_weapons[i], 0);
				continue;
			}
			if(weapons::is_grenade(a_weapons[i]))
			{
				arrayinsert(a_grenades_cp, a_weapons[i], 0);
				continue;
			}
			arrayinsert(a_misc_cp, a_weapons[i], 0);
		}
		player_devgui_base_cp = "";
		adddebugcommand((((player_devgui_base_cp + "") + "") + "") + "");
		adddebugcommand((((player_devgui_base_cp + "") + "") + "") + "");
		adddebugcommand((((player_devgui_base_cp + "") + "") + "") + "");
		level thread devgui_add_player_weapons(player_devgui_base_cp, "", 0, a_grenades_cp, "");
		level thread devgui_add_player_weapons(player_devgui_base_cp, "", 0, a_weapons_cp, "");
		level thread devgui_add_player_weapons(player_devgui_base_cp, "", 0, a_misc_cp, "");
		devgui_add_player_gun_attachments(player_devgui_base_cp, "", 0, a_weapons_cp, "");
		players = getplayers();
		size = players.size;
		if(size > 2)
		{
			size = 2;
		}
		for(i = 0; i < size; i++)
		{
			ip1 = i + 1;
			adddebugcommand((((player_devgui_base_cp + players[i].playername) + "") + "") + "");
			adddebugcommand((((player_devgui_base_cp + players[i].playername) + "") + "") + "");
			adddebugcommand((((player_devgui_base_cp + players[i].playername) + "") + "") + "");
			level thread devgui_add_player_weapons(player_devgui_base_cp, players[i].playername, ip1, a_grenades_cp, "");
			level thread devgui_add_player_weapons(player_devgui_base_cp, players[i].playername, ip1, a_weapons_cp, "");
			level thread devgui_add_player_weapons(player_devgui_base_cp, players[i].playername, ip1, a_misc_cp, "");
			level thread devgui_add_player_gun_attachments(player_devgui_base_cp, players[i].playername, ip1, a_weapons_cp, "");
		}
		game.devgui_weapons_added = 1;
	#/
}

/*
	Name: devgui_add_player_gun_attachments
	Namespace: devgui
	Checksum: 0x6BD41E41
	Offset: 0x2658
	Size: 0x218
	Parameters: 5
	Flags: None
*/
function devgui_add_player_gun_attachments(root, pname, index, a_weapons, weapon_type)
{
	/#
		level endon(#"game_ended");
		player_devgui_root = ((((root + pname) + "") + "") + weapon_type) + "";
		attachments = [];
		foreach(weapon in a_weapons)
		{
			foreach(supportedattachment in weapon.supportedattachments)
			{
				array::add(attachments, supportedattachment, 0);
			}
		}
		pid = "" + index;
		foreach(att in attachments)
		{
			devgui_add_player_attachment_command(player_devgui_root, pid, att, 1);
		}
	#/
}

/*
	Name: devgui_add_player_weapons
	Namespace: devgui
	Checksum: 0x59B7074A
	Offset: 0x2878
	Size: 0x21C
	Parameters: 5
	Flags: None
*/
function devgui_add_player_weapons(root, pname, index, a_weapons, weapon_type)
{
	/#
		level endon(#"game_ended");
		player_devgui_root = ((((root + pname) + "") + "") + weapon_type) + "";
		pid = "" + index;
		if(isdefined(a_weapons))
		{
			for(i = 0; i < a_weapons.size; i++)
			{
				if(weapon_type == "")
				{
					attachments = [];
				}
				else
				{
					attachments = a_weapons[i].supportedattachments;
				}
				name = function_a16a090d(a_weapons[i]);
				if(attachments.size)
				{
					devgui_add_player_weap_command((player_devgui_root + name) + "", pid, name, i + 1);
					foreach(att in attachments)
					{
						if(att != "")
						{
							devgui_add_player_weap_command((player_devgui_root + name) + "", pid, (name + "") + att, i + 1);
						}
					}
					continue;
				}
				devgui_add_player_weap_command(player_devgui_root, pid, name, i + 1);
			}
		}
	#/
}

/*
	Name: devgui_add_player_weap_command
	Namespace: devgui
	Checksum: 0xB831317B
	Offset: 0x2AA0
	Size: 0xA4
	Parameters: 4
	Flags: None
*/
function devgui_add_player_weap_command(root, pid, weap_name, cmdindex)
{
	/#
		util::waittill_can_add_debug_command();
		adddebugcommand((((((((((pid + cmdindex) + "") + "") + "") + weap_name) + "") + "") + "") + cmdindex) + "");
	#/
}

/*
	Name: devgui_add_player_attachment_command
	Namespace: devgui
	Checksum: 0x2B698C81
	Offset: 0x2B50
	Size: 0xA4
	Parameters: 4
	Flags: None
*/
function devgui_add_player_attachment_command(root, pid, attachment_name, cmdindex)
{
	/#
		util::waittill_can_add_debug_command();
		adddebugcommand((((((((((pid + cmdindex) + "") + "") + "") + attachment_name) + "") + "") + "") + cmdindex) + "");
	#/
}

/*
	Name: devgui_weapon_think
	Namespace: devgui
	Checksum: 0xB4669269
	Offset: 0x2C00
	Size: 0x128
	Parameters: 0
	Flags: None
*/
function devgui_weapon_think()
{
	/#
		for(;;)
		{
			weapon_name = getdvarstring(#"cp_weap_devgui");
			if(weapon_name != "")
			{
				devgui_handle_player_command(weapon_name, &devgui_give_weapon, weapon_name);
				setdvar(#"cp_weap_devgui", "");
			}
			attachmentname = getdvarstring(#"cp_attachment_devgui");
			if(attachmentname != "")
			{
				devgui_handle_player_command(attachmentname, &devgui_give_attachment, attachmentname);
				setdvar(#"cp_attachment_devgui", "");
			}
			wait(0.5);
		}
	#/
}

/*
	Name: devgui_weapon_asset_name_display_think
	Namespace: devgui
	Checksum: 0xFCF6CF9E
	Offset: 0x2D30
	Size: 0x3C6
	Parameters: 0
	Flags: None
*/
function devgui_weapon_asset_name_display_think()
{
	/#
		update_time = 0.5;
		print_duration = int(update_time / (float(function_60d95f53()) / 1000));
		printlnbold_update = int(1 / update_time);
		printlnbold_counter = 0;
		colors = [];
		colors[colors.size] = (1, 1, 1);
		colors[colors.size] = (1, 0, 0);
		colors[colors.size] = (0, 1, 0);
		colors[colors.size] = (1, 1, 0);
		colors[colors.size] = (1, 0, 1);
		colors[colors.size] = (0, 1, 1);
		for(;;)
		{
			wait(update_time);
			display = getdvarint(#"cp_weap_asset_name_display_devgui", 0);
			if(!display)
			{
				continue;
			}
			if(!printlnbold_counter)
			{
				iprintlnbold(function_a16a090d(level.players[0] getcurrentweapon()));
			}
			printlnbold_counter++;
			if(printlnbold_counter >= printlnbold_update)
			{
				printlnbold_counter = 0;
			}
			color_index = 0;
			for(i = 1; i < level.players.size; i++)
			{
				player = level.players[i];
				weapon = player getcurrentweapon();
				if(!isdefined(weapon) || level.weaponnone == weapon)
				{
					continue;
				}
				print3d(player gettagorigin(""), function_a16a090d(weapon), colors[color_index], 1, 0.15, print_duration);
				color_index++;
				if(color_index >= colors.size)
				{
					color_index = 0;
				}
			}
			color_index = 0;
			ai_list = getaiarray();
			for(i = 0; i < ai_list.size; i++)
			{
				ai = ai_list[i];
				if(isvehicle(ai))
				{
					weapon = ai.turretweapon;
				}
				else
				{
					weapon = ai.weapon;
				}
				if(!isdefined(weapon) || level.weaponnone == weapon)
				{
					continue;
				}
				print3d(ai gettagorigin(""), function_a16a090d(weapon), colors[color_index], 1, 0.15, print_duration);
				color_index++;
				if(color_index >= colors.size)
				{
					color_index = 0;
				}
			}
		}
	#/
}

/*
	Name: devgui_give_weapon
	Namespace: devgui
	Checksum: 0xAA8579FD
	Offset: 0x3100
	Size: 0x31C
	Parameters: 1
	Flags: None
*/
function devgui_give_weapon(weapon_name)
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		if(!isalive(self))
		{
			return;
		}
		self notify(#"devgui_give_ammo");
		self endon(#"devgui_give_ammo");
		currentweapon = self getcurrentweapon();
		split = strtok(weapon_name, "");
		switch(split.size)
		{
			case 1:
			default:
			{
				weapon = getweapon(split[0]);
				break;
			}
			case 2:
			{
				weapon = getweapon(split[0], split[1]);
				break;
			}
			case 3:
			{
				weapon = getweapon(split[0], split[1], split[2]);
				break;
			}
			case 4:
			{
				weapon = getweapon(split[0], split[1], split[2], split[3]);
				break;
			}
			case 5:
			{
				weapon = getweapon(split[0], split[1], split[2], split[3], split[4]);
				break;
			}
		}
		if(currentweapon != weapon)
		{
			if(getdvarint(#"cp_weap_use_give_console_command_devgui", 0))
			{
				adddebugcommand("" + weapon_name);
				waitframe(1);
			}
			else
			{
				self takeweapon(currentweapon);
				self giveweapon(weapon);
				self switchtoweapon(weapon);
			}
			max = weapon.maxammo;
			if(max)
			{
				self setweaponammostock(weapon, max);
			}
		}
	#/
}

/*
	Name: devgui_give_attachment
	Namespace: devgui
	Checksum: 0x9D84CC8
	Offset: 0x3428
	Size: 0x41C
	Parameters: 1
	Flags: None
*/
function devgui_give_attachment(attachment_name)
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		if(!isalive(self))
		{
			return;
		}
		self notify(#"devgui_give_attachment");
		self endon(#"devgui_give_attachment");
		currentweapon = self getcurrentweapon();
		attachmentsupported = 0;
		split = strtok(function_a16a090d(currentweapon), "");
		foreach(attachment in currentweapon.supportedattachments)
		{
			if(attachment == attachment_name)
			{
				attachmentsupported = 1;
			}
		}
		if(attachmentsupported == 0)
		{
			iprintlnbold((("" + attachment_name) + "") + split[0]);
			attachmentsstring = "";
			if(currentweapon.supportedattachments.size == 0)
			{
				attachmentsstring = attachmentsstring + "";
			}
			foreach(attachment in currentweapon.supportedattachments)
			{
				attachmentsstring = attachmentsstring + ("" + attachment);
			}
			iprintlnbold(attachmentsstring);
			return;
		}
		foreach(currentattachment in split)
		{
			if(currentattachment == attachment_name)
			{
				iprintlnbold((("" + attachment_name) + "") + function_a16a090d(currentweapon));
				return;
			}
		}
		split[split.size] = attachment_name;
		for(index = split.size; index < 9; index++)
		{
			split[index] = "";
		}
		self takeweapon(currentweapon);
		newweapon = getweapon(split[0], split[1], split[2], split[3], split[4], split[5], split[6], split[7]);
		self giveweapon(newweapon);
		self switchtoweapon(newweapon);
	#/
}

/*
	Name: init_debug_center_screen
	Namespace: devgui
	Checksum: 0xD1133159
	Offset: 0x3850
	Size: 0x12C
	Parameters: 0
	Flags: None
*/
function init_debug_center_screen()
{
	/#
		zero_idle_movement = 0;
		for(;;)
		{
			if(getdvarint(#"debug_center_screen", 0))
			{
				if(!isdefined(level.center_screen_debug_hudelem_active) || level.center_screen_debug_hudelem_active == 0)
				{
					thread debug_center_screen();
					zero_idle_movement = getdvarint(#"zero_idle_movement", 0);
					if(zero_idle_movement == 0)
					{
						setdvar(#"zero_idle_movement", 1);
						zero_idle_movement = 1;
					}
				}
			}
			else
			{
				level notify(#"hash_63054d2b7dcb7739");
				if(zero_idle_movement == 1)
				{
					setdvar(#"zero_idle_movement", 0);
					zero_idle_movement = 0;
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: debug_center_screen
	Namespace: devgui
	Checksum: 0x90C4FF4
	Offset: 0x3988
	Size: 0x238
	Parameters: 0
	Flags: None
*/
function debug_center_screen()
{
	/#
		level.center_screen_debug_hudelem_active = 1;
		wait(0.1);
		level.center_screen_debug_hudelem1 = newdebughudelem(level.players[0]);
		level.center_screen_debug_hudelem1.alignx = "";
		level.center_screen_debug_hudelem1.aligny = "";
		level.center_screen_debug_hudelem1.fontscale = 1;
		level.center_screen_debug_hudelem1.alpha = 0.5;
		level.center_screen_debug_hudelem1.x = 320 - 1;
		level.center_screen_debug_hudelem1.y = 240;
		level.center_screen_debug_hudelem1 setshader("", 1000, 1);
		level.center_screen_debug_hudelem2 = newdebughudelem(level.players[0]);
		level.center_screen_debug_hudelem2.alignx = "";
		level.center_screen_debug_hudelem2.aligny = "";
		level.center_screen_debug_hudelem2.fontscale = 1;
		level.center_screen_debug_hudelem2.alpha = 0.5;
		level.center_screen_debug_hudelem2.x = 320 - 1;
		level.center_screen_debug_hudelem2.y = 240;
		level.center_screen_debug_hudelem2 setshader("", 1, 480);
		level waittill(#"hash_63054d2b7dcb7739");
		level.center_screen_debug_hudelem1 destroy();
		level.center_screen_debug_hudelem2 destroy();
		level.center_screen_debug_hudelem_active = 0;
	#/
}

/*
	Name: function_5a9c86f0
	Namespace: devgui
	Checksum: 0x9AB51DB6
	Offset: 0x3BC8
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_5a9c86f0()
{
	/#
		setdvar(#"hash_646be3524c8b225b", 0);
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		level thread function_505cd4da();
	#/
}

/*
	Name: function_505cd4da
	Namespace: devgui
	Checksum: 0xBFD3E9BA
	Offset: 0x3C78
	Size: 0x288
	Parameters: 0
	Flags: None
*/
function function_505cd4da()
{
	/#
		level notify(#"hash_242671403e167291");
		level endon(#"hash_242671403e167291");
		while(true)
		{
			cmd = getdvarstring(#"hash_646be3524c8b225b");
			var_6019e2d9 = [];
			if(isarray(level.var_ef4974d7))
			{
				var_6019e2d9 = getarraykeys(level.var_ef4974d7);
			}
			switch(cmd)
			{
				case "hash_12e35667bc66baa9":
				{
					ui::function_f7aafb81("");
					break;
				}
				case "hash_22ed7cc6e9fda6c2":
				{
					ui::function_bb62027a("");
					break;
				}
				case "hash_679b069e13fed10c":
				{
					level.var_738bd204 = 1;
					foreach(var_fd2ef744 in var_6019e2d9)
					{
						ui::function_f7aafb81(var_fd2ef744);
					}
					break;
				}
				case "hash_421b1673272a4585":
				{
					level.var_738bd204 = undefined;
					foreach(var_fd2ef744 in var_6019e2d9)
					{
						ui::function_bb62027a(var_fd2ef744);
					}
					break;
				}
			}
			setdvar(#"hash_646be3524c8b225b", 0);
			wait(0.5);
		}
	#/
}

/*
	Name: function_57edec18
	Namespace: devgui
	Checksum: 0x305ADB3B
	Offset: 0x3F08
	Size: 0x1BE
	Parameters: 0
	Flags: Private
*/
function private function_57edec18()
{
	/#
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		while(true)
		{
			if(getdvarint(#"hash_428eca4823d65134", 0))
			{
				if(isdefined(level.var_6460e605))
				{
					waitframe(1);
					continue;
				}
				player = getplayers()[0];
				if(!isdefined(player))
				{
					waitframe(1);
					continue;
				}
				var_6460e605 = spawnvehicle("", player.origin + vectorscale((0, 0, 1), 150), player.angles, "");
				var_6460e605.ignoreme = 1;
				var_6460e605 usevehicle(player, 0);
				level.var_6460e605 = var_6460e605;
			}
			else if(isdefined(level.var_6460e605))
			{
				driver = level.var_6460e605 getseatoccupant(0);
				if(isdefined(driver))
				{
					driver unlink();
				}
				level.var_6460e605 delete();
			}
			waitframe(1);
		}
	#/
}

