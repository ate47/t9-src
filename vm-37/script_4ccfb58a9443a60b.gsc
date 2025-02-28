#using script_1287f54612f9bfce;
#using script_18077945bb84ede7;
#using script_1c65dbfc2f1c8d8f;
#using script_1caf36ff04a85ff6;
#using script_3751b21462a54a7d;
#using script_3ddf84b7bb3bf47d;
#using script_4108035fe400ce67;
#using script_471b31bd963b388e;
#using script_47fb62300ac0bd60;
#using script_68d2ee1489345a1d;
#using script_7bacb32f8222fa3e;
#using script_7d7ac1f663edcdc8;
#using script_7fc996fe8678852;
#using script_ab890501c40b73c;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_1cc7b406;

/*
	Name: function_89f2df9
	Namespace: namespace_1cc7b406
	Checksum: 0x48F20A40
	Offset: 0x238
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_49e3cc2797ad6fbc", &function_70a657d8, &function_8ac3bea9, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_1cc7b406
	Checksum: 0xD1F21027
	Offset: 0x298
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.var_3ed9fd33 = sr_crafting_table_menu::register();
	namespace_52c8f34d::function_70a657d8();
	/#
		level.var_633b283d = &function_633b283d;
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_1cc7b406
	Checksum: 0x527D2C95
	Offset: 0x2E8
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
	sr_scrap::init();
	clientfield::register("scriptmover", "crafting_Table_spawn_fx", 1, 1, "int");
	var_f5ae494f = struct::get_array(#"hash_313be7fccc870cdd", "variantname");
	if(zm_utility::is_classic() || getdvarint(#"hash_34cae673a047c202", 0) && isdefined(var_f5ae494f) && var_f5ae494f.size > 0)
	{
		level thread function_3aa5909e(var_f5ae494f[0]);
	}
}

/*
	Name: function_7dddb953
	Namespace: namespace_1cc7b406
	Checksum: 0xD0237104
	Offset: 0x3E0
	Size: 0xC0
	Parameters: 3
	Flags: None
*/
function function_7dddb953(var_beee4994, hint_string, model)
{
	if(!isdefined(model))
	{
		return;
	}
	foreach(var_7d0e37f8 in model)
	{
		function_db05041b(var_7d0e37f8, #"hash_1e1b751abcb0c5b6", &function_e3ad9f54);
	}
}

/*
	Name: function_db05041b
	Namespace: namespace_1cc7b406
	Checksum: 0xA37ABDF2
	Offset: 0x4A8
	Size: 0x27C
	Parameters: 3
	Flags: Linked
*/
function function_db05041b(struct, hint_string, callbackfunction)
{
	/#
		assert(isstruct(struct), "");
	#/
	/#
		assert(isfunctionptr(callbackfunction), "");
	#/
	/#
		assert(isdefined(hint_string), "");
	#/
	scriptmodel = namespace_8b6a9d79::spawn_script_model(struct, #"p9_fxanim_zm_gp_crafting_xmodel", 1);
	zm_utility::function_ca960904(scriptmodel);
	objid = zm_utility::function_4a4cf79a(#"hash_72c703e01db3de5d", scriptmodel);
	struct.objectiveid = objid;
	scriptmodel.objectiveid = objid;
	if(!isdefined(level.var_6bf8ee58))
	{
		level.var_6bf8ee58 = [];
	}
	else if(!isarray(level.var_6bf8ee58))
	{
		level.var_6bf8ee58 = array(level.var_6bf8ee58);
	}
	level.var_6bf8ee58[level.var_6bf8ee58.size] = objid;
	trigger = namespace_8b6a9d79::function_214737c7(struct, callbackfunction, hint_string, undefined, 128, 128, undefined, vectorscale((0, 0, 1), 50));
	trigger.scriptmodel = scriptmodel;
	scriptmodel.trigger = trigger;
	scriptmodel clientfield::set("crafting_Table_spawn_fx", 1);
	scriptmodel clientfield::set("item_machine_spawn_rob", 1);
	playsoundatposition(#"hash_5c2fc4437449ddb4", struct.origin);
	playfx("sr/fx9_safehouse_mchn_workbench_spawn", struct.origin);
}

/*
	Name: function_e3ad9f54
	Namespace: namespace_1cc7b406
	Checksum: 0xD04B8963
	Offset: 0x730
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_e3ad9f54(eventstruct)
{
	player = eventstruct.activator;
	machine = self.scriptmodel;
	/#
		assert(isdefined(machine), "");
	#/
	if(isplayer(player))
	{
		if(!isdefined(player.var_1a69e47f))
		{
			player.var_1a69e47f = [];
		}
		if(!level.var_3ed9fd33 sr_crafting_table_menu::is_open(player) && !player clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
		{
			player notify(#"hash_5f178db4550eeae9");
			level.var_3ed9fd33 sr_crafting_table_menu::open(player, 0);
			player thread function_4b23ad31(machine, self);
			player namespace_553954de::function_14bada94();
		}
	}
}

/*
	Name: function_6c71e778
	Namespace: namespace_1cc7b406
	Checksum: 0x4EB01E2E
	Offset: 0x870
	Size: 0x156
	Parameters: 2
	Flags: Linked
*/
function function_6c71e778(machine, trigger)
{
	if(!isplayer(self) || !isdefined(level.var_3ed9fd33))
	{
		return;
	}
	if(isdefined(machine) && isdefined(trigger))
	{
		trigger sethintstringforplayer(self, #"hash_1e1b751abcb0c5b6");
		if(isdefined(machine.objectiveid))
		{
			objective_setvisibletoplayer(machine.objectiveid, self);
			zm_utility::function_e8f4d47b(self, machine.objectiveid, 0);
		}
	}
	if(level.var_3ed9fd33 sr_crafting_table_menu::is_open(self) && self clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
	{
		level.var_3ed9fd33 sr_crafting_table_menu::close(self);
		self namespace_553954de::function_548f282();
	}
	self notify(#"hash_8a8d04156e14d76");
}

/*
	Name: function_366ba7f6
	Namespace: namespace_1cc7b406
	Checksum: 0x1A00FD1C
	Offset: 0x9D0
	Size: 0xAA
	Parameters: 0
	Flags: None
*/
function function_366ba7f6()
{
	self notify("776103a74268cdbd");
	self endon("776103a74268cdbd");
	self endon(#"death");
	if(!isdefined(self.var_496b54df))
	{
		self.var_496b54df = 0;
	}
	if(!self.var_496b54df)
	{
		self.var_496b54df = 1;
		playsoundatposition(#"hash_12cfa31c1fb4a04", self.origin + vectorscale((0, 0, 1), 50));
	}
	else
	{
		wait(30);
		self.var_496b54df = 0;
	}
}

/*
	Name: function_2c5b6acc
	Namespace: namespace_1cc7b406
	Checksum: 0x87604E7E
	Offset: 0xA88
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_2c5b6acc(var_438da649)
{
	return var_438da649.var_b5ec8024;
}

/*
	Name: function_eac1873d
	Namespace: namespace_1cc7b406
	Checksum: 0x1F1F7DD1
	Offset: 0xAA8
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_eac1873d(var_82e23366)
{
	loadoutslotname = var_82e23366.loadoutslotname;
	return strstartswith(tolower(loadoutslotname), "killstreak");
}

/*
	Name: function_3d272dc5
	Namespace: namespace_1cc7b406
	Checksum: 0x2D321C4B
	Offset: 0xB00
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_3d272dc5(var_438da649)
{
	return var_438da649.var_2d7d77d0;
}

/*
	Name: function_a4aa10f4
	Namespace: namespace_1cc7b406
	Checksum: 0x4085C84F
	Offset: 0xB20
	Size: 0x124
	Parameters: 2
	Flags: Linked
*/
function function_a4aa10f4(machine, trigger)
{
	self endon(#"disconnect", #"death", #"hash_8a8d04156e14d76");
	start_origin = self.origin;
	while(distance2d(self.origin, start_origin) < 32 && !self laststand::player_is_in_laststand() && !self isinvehicle())
	{
		waitframe(1);
		if(!isdefined(machine))
		{
			break;
		}
	}
	if(level.var_3ed9fd33 sr_crafting_table_menu::is_open(self) && self clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
	{
		self function_6c71e778(machine, trigger);
	}
}

/*
	Name: function_3c3d4f17
	Namespace: namespace_1cc7b406
	Checksum: 0xC68B5379
	Offset: 0xC50
	Size: 0x5CE
	Parameters: 1
	Flags: Linked
*/
function function_3c3d4f17(var_1a988176)
{
	if(!isdefined(var_1a988176))
	{
		return false;
	}
	switch(var_1a988176)
	{
		case "hash_7ab18956a0660839":
		{
			if(!is_true(getgametypesetting(#"hash_22e96504754e8375")))
			{
				return false;
			}
			break;
		}
		case "hash_689c84ba4e75b1c8":
		{
			if(!is_true(getgametypesetting(#"hash_52f19cd89938e56a")))
			{
				return false;
			}
			break;
		}
		case "hash_6ab225c69027e657":
		{
			if(!is_true(getgametypesetting(#"hash_6a5453075de4b0b3")))
			{
				return false;
			}
			break;
		}
		case "hash_7f37566c7dd7ecb":
		{
			if(!is_true(getgametypesetting(#"hash_240adf6a97ca2bdc")))
			{
				return false;
			}
			break;
		}
		case "hash_49b7001ce02a0797":
		{
			if(!is_true(getgametypesetting(#"hash_55a58334a47dd0cb")))
			{
				return false;
			}
			break;
		}
		case "hash_49c0448e11cb523c":
		{
			if(!is_true(getgametypesetting(#"hash_76986c7749f63b9a")))
			{
				return false;
			}
			break;
		}
		case "hash_6174ad2674c82ec3":
		{
			if(!is_true(getgametypesetting(#"hash_5d8dd9151ffe3c3f")))
			{
				return false;
			}
			break;
		}
		case "hash_1223df8e913d431b":
		{
			if(!is_true(getgametypesetting(#"hash_f8c884a70b46f1f")))
			{
				return false;
			}
			break;
		}
		case "hash_61247be669e9b732":
		{
			if(!is_true(getgametypesetting(#"hash_1ab1a89d032f7080")))
			{
				return false;
			}
			break;
		}
		case "hash_2cdb76a587cf7a3b":
		{
			if(!is_true(getgametypesetting(#"hash_3e70ce2c501807dc")))
			{
				return false;
			}
			break;
		}
		case "hash_cefb3af28fb800b":
		{
			if(!is_true(getgametypesetting(#"hash_7edbf65b1ef09118")))
			{
				return false;
			}
			break;
		}
		case "hash_541f29266c6b7df8":
		{
			if(!is_true(getgametypesetting(#"hash_6a0b096c6bbfd5eb")))
			{
				return false;
			}
			break;
		}
		case "hash_ba416827a85877c":
		{
			if(!is_true(getgametypesetting(#"hash_58c821bc828f5ebe")))
			{
				return false;
			}
			break;
		}
		case "hash_24a1df9928527c11":
		{
			if(!is_true(getgametypesetting(#"hash_72ad1c2b51381a57")))
			{
				return false;
			}
			break;
		}
		case "hash_18ed63a25d0c43d1":
		{
			if(!is_true(getgametypesetting(#"hash_115a6ae50a238213")))
			{
				return false;
			}
			break;
		}
		case "hash_54877da1f10e40b5":
		{
			if(!is_true(getgametypesetting(#"hash_3ab300fc07c95c32")))
			{
				return false;
			}
			break;
		}
		case "hash_5f6d7361258230a":
		{
			if(!is_true(getgametypesetting(#"hash_3c47218eb5aa98c9")))
			{
				return false;
			}
			break;
		}
		case "hash_2294e52d4ac78b9a":
		{
			if(!is_true(getgametypesetting(#"hash_4cec0e29a8901e65")))
			{
				return false;
			}
			break;
		}
	}
	return true;
}

/*
	Name: function_4b23ad31
	Namespace: namespace_1cc7b406
	Checksum: 0x4B75C088
	Offset: 0x1228
	Size: 0x60E
	Parameters: 2
	Flags: Linked
*/
function function_4b23ad31(machine, trigger)
{
	self endon(#"hash_5f178db4550eeae9");
	trigger sethintstringforplayer(self, "");
	if(isdefined(machine.objectiveid))
	{
		zm_utility::function_e8f4d47b(self, machine.objectiveid, 1);
		objective_setinvisibletoplayer(machine.objectiveid, self);
	}
	self endoncallback(&function_6c71e778, #"death");
	self thread function_a4aa10f4(machine, trigger);
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
		intpayload = waitresult.intpayload;
		if(menu == #"sr_crafting_table_menu")
		{
			switch(waitresult.response)
			{
				case "hash_300cd920d1c2290e":
				{
					var_82e23366 = getunlockableiteminfofromindex(intpayload, 1);
					var_438da649 = function_b143666d(intpayload, 1);
					var_1a988176 = function_3d272dc5(var_438da649);
					if(function_3c3d4f17(var_1a988176))
					{
						var_eac1873d = function_eac1873d(var_82e23366);
						var_1d1d4a2a = function_2c5b6acc(var_438da649);
						if(!isdefined(var_1d1d4a2a))
						{
							var_1d1d4a2a = 0;
						}
						has_enough = 0;
						if(var_eac1873d)
						{
							has_enough = self sr_scrap::function_415b1e(var_1d1d4a2a);
						}
						else
						{
							has_enough = self sr_scrap::function_c29a8aa1(var_1d1d4a2a);
						}
						if(has_enough)
						{
							self playrumbleonentity(#"hash_410bd55524ae7d");
							self function_52df229a(var_1a988176);
							switch(var_1a988176)
							{
								case "hash_7f37566c7dd7ecb":
								case "hash_7f37566c7dd7ecb":
								case "hash_1223df8e913d431b":
								case "hash_49b7001ce02a0797":
								case "hash_49c0448e11cb523c":
								case "hash_61247be669e9b732":
								case "hash_6174ad2674c82ec3":
								case "hash_689c84ba4e75b1c8":
								case "hash_6ab225c69027e657":
								case "hash_7ab18956a0660839":
								{
									self stats::function_622feb0d(var_82e23366.var_3cf2d21, #"crafted", 1);
									self contracts::function_5b88297d(#"hash_5db7e053c5f4765f");
									break;
								}
								case "hash_5f6d7361258230a":
								case "hash_ba416827a85877c":
								case "hash_cefb3af28fb800b":
								case "hash_18ed63a25d0c43d1":
								case "hash_2294e52d4ac78b9a":
								case "hash_24a1df9928527c11":
								case "hash_2cdb76a587cf7a3b":
								case "hash_541f29266c6b7df8":
								case "hash_54877da1f10e40b5":
								{
									self contracts::function_5b88297d(#"hash_2ee6ab7ed0517a10");
									break;
								}
							}
							if(var_eac1873d)
							{
								self sr_scrap::function_8bfa3267(var_1d1d4a2a);
								machine thread scene::play("p9_fxanim_zm_gp_crafting_bundle", "Shot 2", machine);
							}
							else
							{
								self sr_scrap::function_3610299b(var_1d1d4a2a);
								machine thread scene::play("p9_fxanim_zm_gp_crafting_bundle", "Shot 1", machine);
							}
							self.var_1a69e47f[var_1a988176] = 1;
							self callback::callback(#"hash_34d402e0ae123ca6");
						}
						else
						{
							machine playsoundtoplayer(#"uin_default_action_denied", self);
						}
					}
					else
					{
						machine playsoundtoplayer(#"uin_default_action_denied", self);
					}
					break;
				}
				case "hash_383c519d3bdac984":
				{
					self notify(#"hash_8a8d04156e14d76");
					self function_6c71e778(machine, trigger);
					return;
				}
			}
		}
	}
}

/*
	Name: function_52df229a
	Namespace: namespace_1cc7b406
	Checksum: 0x80942DEF
	Offset: 0x1840
	Size: 0x2EC
	Parameters: 1
	Flags: Linked
*/
function function_52df229a(itemname)
{
	self endon(#"death");
	if(!isdefined(itemname) || itemname == #"")
	{
		return;
	}
	item = function_4ba8fde(itemname);
	currentweapon = self getcurrentweapon();
	if(isdefined(item))
	{
		self notify(#"hash_4506f189fa360331");
		var_fa3df96 = self namespace_b376ff3f::function_e66dcff5(item);
		if(isdefined(var_fa3df96))
		{
			if(!namespace_ad5a0cd6::function_db35e94f(item.var_bd027dd9))
			{
				item.var_bd027dd9 = namespace_ad5a0cd6::function_970b8d86(var_fa3df96);
			}
			if(isdefined(currentweapon) && killstreaks::is_killstreak_weapon(currentweapon) && var_fa3df96 == 17)
			{
				var_c5eb2acf = self.inventory.items[17 + 1];
				var_c5eb2acf = self namespace_a0d533d1::function_2b83d3ff(var_c5eb2acf);
				self switchtoweapon(var_c5eb2acf, 1);
				self waittill(#"weapon_change");
				waitframe(1);
			}
			item.var_8e092725 = 0;
			if(item.var_a6762160.itemtype === #"scorestreak")
			{
				if(self.inventory.items[var_fa3df96].var_bd027dd9 != 32767)
				{
					self namespace_b376ff3f::function_fba40e6c(item);
				}
				else
				{
					item_world::function_de2018e3(item, self, var_fa3df96);
				}
			}
			else
			{
				if(self.inventory.items[var_fa3df96].var_bd027dd9 != 32767 && self.inventory.items[var_fa3df96].var_a6762160.name != item.var_a6762160.name)
				{
					self namespace_b376ff3f::function_fba40e6c(item);
				}
				else
				{
					item_world::function_de2018e3(item, self, var_fa3df96);
				}
			}
		}
		else
		{
			item_world::function_de2018e3(item, self);
		}
	}
}

/*
	Name: function_ff9ddbfa
	Namespace: namespace_1cc7b406
	Checksum: 0x3417B044
	Offset: 0x1B38
	Size: 0x1AC
	Parameters: 2
	Flags: None
*/
function function_ff9ddbfa(itemname, var_738dfc81)
{
	for(i = 0; i < var_738dfc81; i++)
	{
		point = function_4ba8fde(itemname);
		if(isdefined(point) && isdefined(point.var_a6762160))
		{
			dropitem = self item_drop::drop_item(i, point.var_a6762160.weapon, 1, point.var_a6762160.amount, point.id, self.origin, self.angles);
			if(isdefined(dropitem))
			{
				var_641d3dc2 = dropitem.var_a6762160.itemtype != #"attachment";
				var_a6762160 = dropitem.var_a6762160;
				var_1035544d = self item_world::pickup_item(dropitem, var_641d3dc2);
				if(is_true(var_1035544d))
				{
					if(isdefined(var_a6762160))
					{
						var_b619c089 = self namespace_b376ff3f::function_8babc9f9(var_a6762160);
					}
					if(isdefined(var_b619c089))
					{
						self namespace_b376ff3f::function_c8bedf1b(var_b619c089);
					}
					continue;
				}
				self namespace_b376ff3f::function_fba40e6c(dropitem);
			}
		}
	}
}

/*
	Name: function_3aa5909e
	Namespace: namespace_1cc7b406
	Checksum: 0x2AAF8087
	Offset: 0x1CF0
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_3aa5909e(destination)
{
	level flag::wait_till("start_zombie_round_logic");
	waittillframeend();
	function_18dfa93a(destination);
}

/*
	Name: function_18dfa93a
	Namespace: namespace_1cc7b406
	Checksum: 0xFCE6AD0C
	Offset: 0x1D40
	Size: 0x164
	Parameters: 1
	Flags: Linked
*/
function function_18dfa93a(destination)
{
	foreach(location in destination.locations)
	{
		crafting_table = location.instances[#"crafting_table"];
		if(isdefined(crafting_table))
		{
			children = namespace_8b6a9d79::function_f703a5a(crafting_table);
			foreach(child in children)
			{
				function_db05041b(child, #"hash_1e1b751abcb0c5b6", &function_e3ad9f54);
			}
		}
	}
}

/*
	Name: function_633b283d
	Namespace: namespace_1cc7b406
	Checksum: 0xEEE4E75D
	Offset: 0x1EB0
	Size: 0x4F4
	Parameters: 0
	Flags: None
*/
function function_633b283d()
{
	/#
		level endon(#"game_ended");
		setdvar(#"hash_3b28c5b5ac46d28d", "");
		adddebugcommand(("" + function_9e72a96(#"hash_6ab225c69027e657")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_7f37566c7dd7ecb")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_ba416827a85877c")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_24a1df9928527c11")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_49b7001ce02a0797")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_5f6d7361258230a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_1223df8e913d431b")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_61247be669e9b732")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_689c84ba4e75b1c8")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_2cdb76a587cf7a3b")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_6174ad2674c82ec3")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_cefb3af28fb800b")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_49c0448e11cb523c")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_541f29266c6b7df8")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_18ed63a25d0c43d1")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_2294e52d4ac78b9a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_7ab18956a0660839")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_54877da1f10e40b5")) + "");
		function_cd140ee9(#"hash_3b28c5b5ac46d28d", &function_7a1fc37c);
	#/
}

/*
	Name: function_7a1fc37c
	Namespace: namespace_1cc7b406
	Checksum: 0x5A683DE0
	Offset: 0x23B0
	Size: 0x11C
	Parameters: 1
	Flags: None
*/
function function_7a1fc37c(params)
{
	/#
		self notify("");
		self endon("");
		waitframe(1);
		foreach(player in getplayers())
		{
			if(params.name === #"hash_3b28c5b5ac46d28d")
			{
				player function_52df229a(hash(params.value));
			}
		}
		setdvar(#"hash_3b28c5b5ac46d28d", "");
	#/
}

