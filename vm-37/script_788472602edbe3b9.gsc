#using script_18f0d22c75b141a7;
#using script_256b8879317373de;
#using script_2dc48f46bfeac894;
#using script_3f9e54c7a9a7e1e2;
#using script_4663ec59d864e437;
#using script_47fb62300ac0bd60;
#using script_5399f402045d7abd;
#using script_56ca01b3b31455b5;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using scripts\core_common\armor.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\healthoverlay.gsc;
#using scripts\core_common\loadout_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\mp_common\gametypes\dev.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;

#namespace loadout;

/*
	Name: function_313e9d31
	Namespace: loadout
	Checksum: 0x92AFDC41
	Offset: 0x640
	Size: 0x238
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_313e9d31()
{
	callback::on_start_gametype(&function_dd840c5f);
	level.var_49aba988 = getgametypesetting(#"hash_7dcb6b2e14d55fb9");
	level.var_621fba36 = getgametypesetting(#"hash_163acba9ae202312");
	level.var_efe72173 = getgametypesetting(#"hash_3a380fd140cfd77f");
	level.var_86fd5bf3 = [];
	level.var_86fd5bf3[0] = getscriptbundle(#"hash_133d2a86644e762d");
	if(is_true(getgametypesetting(#"hash_ec059b9a7f28627")))
	{
		level.var_5c3d0fba = [];
		level.var_5c3d0fba[0] = 126;
		level.var_5c3d0fba[1] = 130;
		level.var_5c3d0fba[2] = 134;
	}
	var_7496e9fb = getscriptbundle(#"hash_4af43f6babe27d21");
	foreach(wildcard in var_7496e9fb.var_7496e9fb)
	{
		var_43645456 = wildcard.var_86fd5bf3;
		var_86fd5bf3 = getscriptbundle(var_43645456);
		level.var_86fd5bf3[var_86fd5bf3.var_9bb0ceab] = var_86fd5bf3;
	}
}

/*
	Name: function_dd840c5f
	Namespace: loadout
	Checksum: 0x7BA62404
	Offset: 0x880
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function function_dd840c5f()
{
	function_11b299fc();
}

/*
	Name: function_9f888e75
	Namespace: loadout
	Checksum: 0x3E5EA42D
	Offset: 0x8A8
	Size: 0x594
	Parameters: 1
	Flags: Linked
*/
function function_9f888e75(var_b918343e)
{
	level.var_697e9965 = getweapon(#"sig_minigun");
	level.var_bb448b5f = getweapon(#"hero_annihilator");
	level.weaponbasemeleeheld = getweapon(#"bare_hands");
	level.weaponknifeloadout = getweapon(#"knife_loadout");
	level.var_cbb9b660 = getweapon(#"melee_club_t8");
	level.var_6e2f43e = getweapon(#"melee_coinbag_t8");
	level.var_2192f04e = getweapon(#"melee_cutlass_t8");
	level.var_82303435 = getweapon(#"melee_demohammer_t8");
	level.var_6011eec9 = getweapon(#"melee_secretsanta_t8");
	level.var_2313b59b = getweapon(#"melee_slaybell_t8");
	if(!isdefined(level.meleeweapons))
	{
		level.meleeweapons = [];
	}
	else if(!isarray(level.meleeweapons))
	{
		level.meleeweapons = array(level.meleeweapons);
	}
	level.meleeweapons[level.meleeweapons.size] = level.weaponknifeloadout;
	if(!isdefined(level.meleeweapons))
	{
		level.meleeweapons = [];
	}
	else if(!isarray(level.meleeweapons))
	{
		level.meleeweapons = array(level.meleeweapons);
	}
	level.meleeweapons[level.meleeweapons.size] = level.var_cbb9b660;
	if(!isdefined(level.meleeweapons))
	{
		level.meleeweapons = [];
	}
	else if(!isarray(level.meleeweapons))
	{
		level.meleeweapons = array(level.meleeweapons);
	}
	level.meleeweapons[level.meleeweapons.size] = level.var_6e2f43e;
	if(!isdefined(level.meleeweapons))
	{
		level.meleeweapons = [];
	}
	else if(!isarray(level.meleeweapons))
	{
		level.meleeweapons = array(level.meleeweapons);
	}
	level.meleeweapons[level.meleeweapons.size] = level.var_2192f04e;
	if(!isdefined(level.meleeweapons))
	{
		level.meleeweapons = [];
	}
	else if(!isarray(level.meleeweapons))
	{
		level.meleeweapons = array(level.meleeweapons);
	}
	level.meleeweapons[level.meleeweapons.size] = level.var_82303435;
	if(!isdefined(level.meleeweapons))
	{
		level.meleeweapons = [];
	}
	else if(!isarray(level.meleeweapons))
	{
		level.meleeweapons = array(level.meleeweapons);
	}
	level.meleeweapons[level.meleeweapons.size] = level.var_6011eec9;
	if(!isdefined(level.meleeweapons))
	{
		level.meleeweapons = [];
	}
	else if(!isarray(level.meleeweapons))
	{
		level.meleeweapons = array(level.meleeweapons);
	}
	level.meleeweapons[level.meleeweapons.size] = level.var_2313b59b;
	level.weaponshotgunenergy = getweapon(#"shotgun_energy");
	level.weaponpistolenergy = getweapon(#"pistol_energy");
	level.var_c1954e36 = getweapon(#"hash_721bd01efec90239");
}

/*
	Name: function_5be71695
	Namespace: loadout
	Checksum: 0xCC72B040
	Offset: 0xE48
	Size: 0x314
	Parameters: 0
	Flags: Linked
*/
function function_5be71695()
{
	level.classmap[#"class_smg"] = "CLASS_SMG";
	level.classmap[#"class_cqb"] = "CLASS_CQB";
	level.classmap[#"class_assault"] = "CLASS_ASSAULT";
	level.classmap[#"class_lmg"] = "CLASS_LMG";
	level.classmap[#"class_sniper"] = "CLASS_SNIPER";
	level.classmap[#"custom0"] = "CLASS_CUSTOM1";
	level.classmap[#"custom1"] = "CLASS_CUSTOM2";
	level.classmap[#"custom2"] = "CLASS_CUSTOM3";
	level.classmap[#"custom3"] = "CLASS_CUSTOM4";
	level.classmap[#"custom4"] = "CLASS_CUSTOM5";
	level.classmap[#"custom5"] = "CLASS_CUSTOM6";
	level.classmap[#"custom6"] = "CLASS_CUSTOM7";
	level.classmap[#"custom7"] = "CLASS_CUSTOM8";
	level.classmap[#"custom8"] = "CLASS_CUSTOM9";
	level.classmap[#"custom9"] = "CLASS_CUSTOM10";
	level.classmap[#"custom10"] = "CLASS_CUSTOM_BONUS1";
	level.classmap[#"hash_1343c87502a79034"] = "CLASS_CUSTOM_BONUS2";
	level.classmap[#"hash_1343cb7502a7954d"] = level.classmap[#"class_smg"];
	level.classmap[#"hash_1343ca7502a7939a"] = level.classmap[#"class_cqb"];
	level.classmap[#"hash_1343c57502a78b1b"] = level.classmap[#"class_assault"];
	level.classmap[#"hash_1343c47502a78968"] = level.classmap[#"class_lmg"];
	level.classmap[#"hash_1343c77502a78e81"] = level.classmap[#"class_sniper"];
}

/*
	Name: function_5f206535
	Namespace: loadout
	Checksum: 0xEFB04923
	Offset: 0x1168
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_5f206535()
{
	if(!function_87bcb1b())
	{
		return;
	}
	function_5be71695();
	level.defaultclass = "CLASS_CUSTOM1";
	create_class_exclusion_list();
	function_445ac5cc("CLASS_CUSTOM_BONUS1", 10);
	function_445ac5cc("CLASS_CUSTOM_BONUS2", 11);
	load_default_loadout("CLASS_SMG", 12);
	load_default_loadout("CLASS_CQB", 13);
	load_default_loadout("CLASS_ASSAULT", 14);
	load_default_loadout("CLASS_LMG", 15);
	load_default_loadout("CLASS_SNIPER", 16);
}

/*
	Name: function_11b299fc
	Namespace: loadout
	Checksum: 0x2060E07F
	Offset: 0x12A0
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function function_11b299fc()
{
	level.maxkillstreaks = 4;
	level.maxspecialties = 6;
	level.maxallocation = getgametypesetting(#"maxallocation");
	level.loadoutkillstreaksenabled = getgametypesetting(#"loadoutkillstreaksenabled");
	level.var_a1c77c9c = &give_loadout;
	level.prestigenumber = 5;
	function_6bc4927f();
	level thread function_8624b793();
	function_9f888e75();
	function_5f206535();
	callback::on_connecting(&on_player_connecting);
	if(!function_f99d2668())
	{
		ability_player::register_gadget_activation_callbacks(23, undefined, &function_6dd64ede);
	}
}

/*
	Name: create_class_exclusion_list
	Namespace: loadout
	Checksum: 0x2CA464B5
	Offset: 0x13E8
	Size: 0xF8
	Parameters: 0
	Flags: Linked, Private
*/
function private create_class_exclusion_list()
{
	currentdvar = 0;
	level.itemexclusions = [];
	while(getdvarint("item_exclusion_" + currentdvar, 0))
	{
		level.itemexclusions[currentdvar] = getdvarint("item_exclusion_" + currentdvar, 0);
		currentdvar++;
	}
	level.attachmentexclusions = [];
	for(currentdvar = 0; (getdvarstring("attachment_exclusion_" + currentdvar)) != ""; currentdvar++)
	{
		level.attachmentexclusions[currentdvar] = getdvarstring("attachment_exclusion_" + currentdvar);
	}
}

/*
	Name: is_attachment_excluded
	Namespace: loadout
	Checksum: 0xD6B113D3
	Offset: 0x14E8
	Size: 0x5E
	Parameters: 1
	Flags: Private
*/
function private is_attachment_excluded(attachment)
{
	numexclusions = level.attachmentexclusions.size;
	for(exclusionindex = 0; exclusionindex < numexclusions; exclusionindex++)
	{
		if(attachment == level.attachmentexclusions[exclusionindex])
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_445ac5cc
	Namespace: loadout
	Checksum: 0x2782E33
	Offset: 0x1550
	Size: 0x24
	Parameters: 2
	Flags: Linked, Private
*/
function private function_445ac5cc(weaponclass, classnum)
{
	level.var_f9f569c2[weaponclass] = classnum;
}

/*
	Name: load_default_loadout
	Namespace: loadout
	Checksum: 0x3E1C0C43
	Offset: 0x1580
	Size: 0x34
	Parameters: 2
	Flags: Linked, Private
*/
function private load_default_loadout(weaponclass, classnum)
{
	level.classtoclassnum[weaponclass] = classnum;
	level.var_8e1db8ee[classnum] = weaponclass;
}

/*
	Name: weapon_class_register
	Namespace: loadout
	Checksum: 0xCED32E2E
	Offset: 0x15C0
	Size: 0x174
	Parameters: 2
	Flags: Linked, Private
*/
function private weapon_class_register(weaponname, weapon_type)
{
	if(issubstr("weapon_smg weapon_cqb weapon_assault weapon_tactical weapon_lmg weapon_sniper weapon_shotgun weapon_launcher weapon_knife weapon_special", weapon_type))
	{
		level.primary_weapon_array[getweapon(weaponname)] = 1;
	}
	else
	{
		if(issubstr("weapon_pistol", weapon_type))
		{
			level.side_arm_array[getweapon(weaponname)] = 1;
		}
		else
		{
			if(issubstr("weapon_grenade hero", weapon_type))
			{
				level.grenade_array[getweapon(weaponname)] = 1;
			}
			else
			{
				if(weapon_type == "weapon_explosive")
				{
					level.inventory_array[getweapon(weaponname)] = 1;
				}
				else
				{
					if(weapon_type == "weapon_rifle")
					{
						level.inventory_array[getweapon(weaponname)] = 1;
					}
					else
					{
						/#
							assert(0, (("" + weapon_type) + "") + weaponname);
						#/
					}
				}
			}
		}
	}
}

/*
	Name: heavy_weapon_register_dialog
	Namespace: loadout
	Checksum: 0xE6BB83E
	Offset: 0x1740
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private heavy_weapon_register_dialog(weapon)
{
	readyvo = weapon.name + "_ready";
	game.dialog[readyvo] = readyvo;
}

/*
	Name: function_6bc4927f
	Namespace: loadout
	Checksum: 0x43B70A5A
	Offset: 0x1788
	Size: 0x304
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6bc4927f()
{
	level.meleeweapons = [];
	level.primary_weapon_array = [];
	level.side_arm_array = [];
	level.grenade_array = [];
	level.inventory_array = [];
	level.perkicons = [];
	level.perkspecialties = [];
	level.killstreakicons = [];
	level.killstreakindices = [];
	level.var_3cb4abe7 = [];
	level.var_b29e45cf = [];
	level.var_b3c95dd8 = [];
	for(i = 0; i < 1024; i++)
	{
		iteminfo = getunlockableiteminfofromindex(i, 0);
		if(isdefined(iteminfo))
		{
			group_s = iteminfo.itemgroupname;
			reference_s = iteminfo.name;
			var_da0b29d2 = iteminfo.var_3cf2d21;
			display_name_s = iteminfo.displayname;
			if(issubstr(group_s, "weapon_") || group_s == "hero")
			{
				if(group_s != "" && var_da0b29d2 != "")
				{
					weapon_class_register(var_da0b29d2, group_s);
				}
				continue;
			}
			if(group_s == "specialty")
			{
				level.perkspecialties[display_name_s] = reference_s;
				continue;
			}
			if(group_s == "killstreak")
			{
				level.tbl_killstreakdata[i] = var_da0b29d2;
				level.killstreakindices[var_da0b29d2] = i;
				if(isdefined(iteminfo.var_3cb4abe7))
				{
					level.var_3cb4abe7[var_da0b29d2] = iteminfo.var_3cb4abe7 / 100;
					/#
						assert(level.var_3cb4abe7[var_da0b29d2] <= 1);
					#/
				}
				if(isdefined(iteminfo.var_b29e45cf))
				{
					level.var_b29e45cf[var_da0b29d2] = iteminfo.var_b29e45cf;
					/#
						assert(level.var_b29e45cf[var_da0b29d2] > 0);
					#/
				}
				if(isdefined(iteminfo.var_b3c95dd8))
				{
					level.var_b3c95dd8[var_da0b29d2] = iteminfo.var_b3c95dd8;
					/#
						assert(level.var_b3c95dd8[var_da0b29d2] > 0);
					#/
				}
			}
		}
	}
}

/*
	Name: function_8624b793
	Namespace: loadout
	Checksum: 0x91AC53C7
	Offset: 0x1A98
	Size: 0x184
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8624b793()
{
	/#
		wait(0.5);
		for(i = 0; i < 1024; i++)
		{
			iteminfo = getunlockableiteminfofromindex(i, 0);
			if(!isdefined(iteminfo))
			{
				continue;
			}
			reference_s = iteminfo.name;
			if(reference_s == "")
			{
				continue;
			}
			group_s = iteminfo.itemgroupname;
			display_name_s = iteminfo.displayname;
			if(group_s == "")
			{
				dev::add_perk_devgui(display_name_s, reference_s);
				continue;
			}
			if(group_s == "")
			{
				if(strstartswith(iteminfo.name, ""))
				{
					dev::function_8263c0d5(reference_s, "");
					continue;
				}
				postfix = "" + sessionmodeabbreviation();
				dev::function_373068ca(reference_s, postfix);
			}
		}
	#/
}

/*
	Name: function_97d216fa
	Namespace: loadout
	Checksum: 0x868C1BB8
	Offset: 0x1C28
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_97d216fa(response)
{
	/#
		assert(isdefined(level.classmap));
	#/
	/#
		assert(isdefined(response));
	#/
	return level.classmap[response];
}

/*
	Name: function_f8157311
	Namespace: loadout
	Checksum: 0xF193DFB8
	Offset: 0x1C88
	Size: 0x12A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f8157311(weaponclass, killstreaknum)
{
	killstreaknum++;
	killstreakstring = "killstreak" + killstreaknum;
	/#
		if(getdvarint("" + killstreakstring, 0) > 0)
		{
			return getdvarint("" + killstreakstring, 0);
		}
	#/
	if(getdvarint(#"custom_killstreak_mode", 0) == 2)
	{
		return getdvarint("custom_" + killstreakstring, 0);
	}
	if(isdefined(level.var_5c3d0fba) && isdefined(level.var_5c3d0fba[killstreaknum - 1]))
	{
		return level.var_5c3d0fba[killstreaknum - 1];
	}
	return self getloadoutitem(weaponclass, killstreakstring);
}

/*
	Name: function_8881abec
	Namespace: loadout
	Checksum: 0x6AB6549E
	Offset: 0x1DC0
	Size: 0x136
	Parameters: 0
	Flags: Linked
*/
function function_8881abec()
{
	player = self;
	if(isdefined(player.killstreak))
	{
		foreach(killstreak in player.killstreak)
		{
			killstreaktype = killstreaks::get_by_menu_name(killstreak);
			if(isdefined(killstreaktype))
			{
				killstreakweapon = killstreaks::get_killstreak_weapon(killstreaktype);
				player takeweapon(killstreakweapon);
			}
		}
		for(i = 0; i < level.maxkillstreaks; i++)
		{
			player function_b181bcbd(i);
		}
	}
	player.killstreak = [];
}

/*
	Name: function_51dceab7
	Namespace: loadout
	Checksum: 0xE02E8502
	Offset: 0x1F00
	Size: 0x194
	Parameters: 0
	Flags: Linked
*/
function function_51dceab7()
{
	self function_8881abec();
	if(!level.loadoutkillstreaksenabled || level.var_bc4f0fc1 === 1)
	{
		return;
	}
	classnum = self.class_num_for_global_weapons;
	sortedkillstreaks = [];
	for(killstreaknum = 0; killstreaknum < level.maxkillstreaks; killstreaknum++)
	{
		killstreakindex = function_f8157311(classnum, killstreaknum);
		if(isdefined(killstreakindex) && killstreakindex > 0)
		{
			give_killstreak(killstreakindex, sortedkillstreaks);
		}
	}
	var_2e1bd530 = [];
	var_2e1bd530[0] = 3;
	var_2e1bd530[1] = 1;
	var_2e1bd530[2] = 0;
	if(level.usingmomentum === 1)
	{
		for(sortindex = 0; sortindex < sortedkillstreaks.size && sortindex < var_2e1bd530.size; sortindex++)
		{
			if(sortedkillstreaks[sortindex].weapon != level.weaponnone)
			{
				self function_d9b9c4c6(var_2e1bd530[sortindex], sortedkillstreaks[sortindex].weapon);
			}
		}
	}
}

/*
	Name: function_6573eeeb
	Namespace: loadout
	Checksum: 0xE5430F06
	Offset: 0x20A0
	Size: 0x1BC
	Parameters: 0
	Flags: Linked
*/
function function_6573eeeb()
{
	if(!getdvar(#"hash_61dac11dea7f8b8d", 0))
	{
		return;
	}
	if(!getdvar(#"hash_db579ad2a3dd6b", 0))
	{
		return;
	}
	var_e3096d6e = getdvarstring(#"hash_466a4b312707e780", "");
	if(var_e3096d6e != "" && self function_3a054f03(hash(var_e3096d6e)))
	{
		self giveexecution(hash(var_e3096d6e));
		return;
	}
	var_71575725 = self function_7683b07();
	if(var_71575725 != "")
	{
		self giveexecution(var_71575725);
	}
	else
	{
		/#
			self giveexecution(hash(getdvarstring(#"hash_13d12c0b5b9b9738")));
			return;
		#/
		if(getdvarstring(#"hash_13d12c0b5b9b9738") != "")
		{
		}
		self clearexecution();
	}
}

/*
	Name: give_killstreak
	Namespace: loadout
	Checksum: 0x1718EB2A
	Offset: 0x2268
	Size: 0x38E
	Parameters: 2
	Flags: Linked
*/
function give_killstreak(var_523d9b33, &var_58335e4f)
{
	/#
		assert(isdefined(level.tbl_killstreakdata[var_523d9b33]), ("" + var_523d9b33) + "");
	#/
	if(isdefined(level.tbl_killstreakdata[var_523d9b33]))
	{
		if(isitemrestricted(level.tbl_killstreakdata[var_523d9b33]))
		{
			return;
		}
		self.killstreak[self.killstreak.size] = level.tbl_killstreakdata[var_523d9b33];
		if(level.usingmomentum === 1)
		{
			killstreaktype = killstreaks::get_by_menu_name(self.killstreak[self.killstreak.size - 1]);
			if(isdefined(killstreaktype))
			{
				weapon = killstreaks::get_killstreak_weapon(killstreaktype);
				if(!isdefined(weapon))
				{
					return;
				}
				self giveweapon(weapon);
				if(level.usingscorestreaks === 1)
				{
					if(weapon.iscarriedkillstreak)
					{
						if(!isdefined(self.pers[#"held_killstreak_ammo_count"][weapon]))
						{
							self.pers[#"held_killstreak_ammo_count"][weapon] = 0;
						}
						if(!isdefined(self.pers[#"held_killstreak_clip_count"][weapon]))
						{
							self.pers[#"held_killstreak_clip_count"][weapon] = 0;
						}
						if(self.pers[#"held_killstreak_ammo_count"][weapon] > 0)
						{
							self killstreaks::function_fa6e0467(weapon);
						}
						else
						{
							self function_3ba6ee5d(weapon, 0);
						}
					}
					else
					{
						self setweaponammoclip(weapon, (isdefined(self.pers[#"killstreak_quantity"][weapon]) ? self.pers[#"killstreak_quantity"][weapon] : 0));
					}
				}
				sortdata = spawnstruct();
				sortdata.cost = self function_dceb5542(level.killstreaks[killstreaktype].itemindex);
				sortdata.weapon = weapon;
				sortindex = 0;
				for(sortindex = 0; sortindex < var_58335e4f.size; sortindex++)
				{
					if(var_58335e4f[sortindex].cost > sortdata.cost)
					{
						break;
					}
				}
				for(i = var_58335e4f.size; i > sortindex; i--)
				{
					var_58335e4f[i] = var_58335e4f[i - 1];
				}
				var_58335e4f[sortindex] = sortdata;
			}
		}
	}
}

/*
	Name: reset_specialty_slots
	Namespace: loadout
	Checksum: 0x99E82640
	Offset: 0x2600
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private reset_specialty_slots(class_num)
{
	self.specialty = [];
}

/*
	Name: function_da96d067
	Namespace: loadout
	Checksum: 0xCCE411C8
	Offset: 0x2620
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function function_da96d067()
{
	self.staticweaponsstarttime = gettime();
}

/*
	Name: function_50797a7f
	Namespace: loadout
	Checksum: 0xC9A7A79F
	Offset: 0x2638
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_50797a7f(equipment_name)
{
	if(level.disabletacinsert && equipment_name === level.weapontacticalinsertion.name)
	{
		return false;
	}
	return true;
}

/*
	Name: init_player
	Namespace: loadout
	Checksum: 0x7A6B8016
	Offset: 0x2680
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function init_player(takeallweapons)
{
	if(takeallweapons)
	{
		self takeallweapons();
	}
	self.specialty = [];
	self function_8881abec();
	self notify(#"give_map");
}

/*
	Name: function_f8ae6f87
	Namespace: loadout
	Checksum: 0x15BD6375
	Offset: 0x26E8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f8ae6f87()
{
	self gestures::function_ae63f496();
}

/*
	Name: function_c84c77d8
	Namespace: loadout
	Checksum: 0x725DFA99
	Offset: 0x2710
	Size: 0xD6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c84c77d8(loadoutslot)
{
	switch(loadoutslot)
	{
		case 41:
		{
			self.var_86fd5bf3.var_a2ef45f8--;
			if(self.var_86fd5bf3.var_a2ef45f8 < 0)
			{
				return false;
			}
			break;
		}
		case 42:
		{
			self.var_86fd5bf3.var_cd3db98c--;
			if(self.var_86fd5bf3.var_cd3db98c < 0)
			{
				return false;
			}
			break;
		}
		case 43:
		{
			self.var_86fd5bf3.var_25a22f4--;
			if(self.var_86fd5bf3.var_25a22f4 < 0)
			{
				return false;
			}
			break;
		}
	}
	return true;
}

/*
	Name: function_c0a72f5c
	Namespace: loadout
	Checksum: 0xB4276F87
	Offset: 0x27F0
	Size: 0x38E
	Parameters: 1
	Flags: Linked
*/
function function_c0a72f5c(givingloadout)
{
	if(!isdefined(givingloadout))
	{
		givingloadout = 1;
	}
	pixbeginevent();
	self.var_c8836f02 = self function_fd62a2aa(self.class_num);
	foreach(var_ebdddedf in self.var_c8836f02)
	{
		if(var_ebdddedf.var_3cf2d21 == #"hash_6be738527a4213aa" && level.hardcoremode)
		{
			var_ebdddedf.var_3cf2d21 = #"hash_5c9c79c25b74b7bb";
		}
		var_b3ed76f5 = function_c84c77d8(var_ebdddedf.loadoutslot);
		if(var_b3ed76f5 && !self function_6c32d092(var_ebdddedf.var_3cf2d21))
		{
			self function_b5feff95(var_ebdddedf.var_3cf2d21);
		}
	}
	var_621c7d1e = 0;
	wildcards = self function_6f2c0492(self.class_num);
	if(isdefined(wildcards) && wildcards.size > 0)
	{
		foreach(var_9bb0ceab in wildcards)
		{
			if(var_9bb0ceab === #"hash_4a12859000892dda")
			{
				var_621c7d1e = 1;
			}
		}
	}
	if(var_621c7d1e)
	{
		self function_b5feff95(#"hash_25c2dcf9ec4c42e2");
		var_72c4edde = 0;
		if(givingloadout)
		{
			if(self function_b958b70d(self.class_num, "secondarygrenade") == #"eq_stimshot")
			{
				var_72c4edde = 1;
			}
		}
		else
		{
			loadout = self function_e27dc453("secondarygrenade");
			if(isdefined(loadout.weapon) && loadout.weapon.name == #"eq_stimshot")
			{
				var_72c4edde = 1;
			}
		}
		if(var_72c4edde)
		{
			if(level.var_222e62a6 === 1)
			{
				self function_b5feff95(#"hash_57fda90308c272ea");
			}
			else
			{
				self function_b5feff95(#"hash_1ef9a210c389803a");
			}
		}
	}
	pixendevent();
}

/*
	Name: function_5ac66375
	Namespace: loadout
	Checksum: 0xD170B63D
	Offset: 0x2B88
	Size: 0x136
	Parameters: 0
	Flags: Linked
*/
function function_5ac66375()
{
	pixbeginevent();
	self.specialty = self getloadoutperks(self.class_num);
	self setplayerstateloadoutweapons(self.class_num);
	self setplayerstateloadoutbonuscards(self.class_num);
	if(level.leaguematch)
	{
		for(i = 0; i < self.specialty.size; i++)
		{
			if(isitemrestricted(self.specialty[i]))
			{
				arrayremoveindex(self.specialty, i);
				i--;
			}
		}
	}
	self register_perks();
	if(self hasperk(#"specialty_immunenvthermal"))
	{
		self clientfield::set("cold_blooded", 1);
	}
	pixendevent();
}

/*
	Name: function_f436358b
	Namespace: loadout
	Checksum: 0x47B19428
	Offset: 0x2CC8
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_f436358b(weaponclass)
{
	self.class_num = function_6972fdbb(weaponclass);
	if(issubstr(weaponclass, "CLASS_CUSTOM"))
	{
		pixbeginevent();
		self.class_num_for_global_weapons = self.class_num;
		self reset_specialty_slots(self.class_num);
		pixendevent();
	}
	else
	{
		pixbeginevent();
		/#
			assert(isdefined(self.pers[#"class"]), "");
		#/
		self.class_num_for_global_weapons = 0;
		pixendevent();
	}
	self recordloadoutindex(self.class_num);
}

/*
	Name: function_6972fdbb
	Namespace: loadout
	Checksum: 0x65308960
	Offset: 0x2DC0
	Size: 0x228
	Parameters: 1
	Flags: Linked
*/
function function_6972fdbb(weaponclass)
{
	/#
		assert(isdefined(weaponclass));
	#/
	var_d131d1b2 = "CLASS_CUSTOM";
	var_8bba14bc = self function_b69de520();
	var_8bba14bc = max(var_8bba14bc, 0);
	if(isstring(weaponclass) && issubstr(weaponclass, "CLASS_CUSTOM_BONUS"))
	{
		class_num = level.var_f9f569c2[weaponclass];
	}
	else
	{
		if(isstring(weaponclass) && issubstr(weaponclass, var_d131d1b2))
		{
			var_3858e4e = getsubstr(weaponclass, var_d131d1b2.size);
			class_num = int(var_3858e4e) - 1;
			if(class_num == -1)
			{
				class_num = var_8bba14bc;
			}
			/#
				assert(isdefined(class_num));
			#/
			if(class_num < 0 || class_num > var_8bba14bc)
			{
				class_num = 0;
			}
			/#
				assert(class_num >= 0 && class_num <= var_8bba14bc);
			#/
		}
		else
		{
			class_num = level.classtoclassnum[weaponclass];
		}
	}
	if(!isdefined(class_num))
	{
		class_num = self stats::get_stat(#"hash_2a738807be622e31");
		if(!isdefined(class_num))
		{
			class_num = 0;
		}
	}
	/#
		assert(isdefined(class_num));
	#/
	return class_num;
}

/*
	Name: function_d81e599e
	Namespace: loadout
	Checksum: 0xB7BFFDF9
	Offset: 0x2FF0
	Size: 0x92
	Parameters: 0
	Flags: Private
*/
function private function_d81e599e()
{
	self.spawnweapon = level.weaponbasemeleeheld;
	self giveweapon(level.weaponbasemeleeheld);
	self.pers[#"spawnweapon"] = self.spawn_weapon;
	switchimmediate = isdefined(self.alreadysetspawnweapononce);
	self setspawnweapon(self.spawnweapon, switchimmediate);
	self.alreadysetspawnweapononce = 1;
}

/*
	Name: function_297a521e
	Namespace: loadout
	Checksum: 0xD747BF12
	Offset: 0x3090
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_297a521e(type_index)
{
	return self function_6eff28b5(self.class_num, type_index);
}

/*
	Name: function_2ada6938
	Namespace: loadout
	Checksum: 0x9634E4CB
	Offset: 0x30C8
	Size: 0xAA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2ada6938(slot)
{
	weapon = self getloadoutweapon(self.class_num, slot);
	if(weapon.iscarriedkillstreak)
	{
		weapon = level.weaponnull;
	}
	var_348d3044 = weapon.name;
	if(slot == "primary" || slot == "secondary")
	{
		var_4d371861 = self getweaponoptic(weapon);
	}
	return weapon;
}

/*
	Name: give_weapon
	Namespace: loadout
	Checksum: 0x2849B687
	Offset: 0x3180
	Size: 0x1F2
	Parameters: 4
	Flags: Linked, Private
*/
function private give_weapon(weapon, slot, var_a6a8156, var_bc218695)
{
	pixbeginevent();
	if(weapon != level.weaponnull)
	{
		if(isdefined(var_a6a8156))
		{
			weapon_options = self [[var_a6a8156]](var_bc218695);
			var_699a03ed = self function_e601ff48(self.class_num, var_bc218695);
			var_4bd49a71 = self function_1c228d69(self.class_num, var_bc218695);
		}
		else
		{
			weapon_options = 0;
			var_699a03ed = 0;
			var_4bd49a71 = 0;
		}
		self giveweapon(weapon, weapon_options, var_699a03ed, var_4bd49a71);
		self function_442539(slot, weapon);
		if(self hasperk(#"specialty_extraammo") || self function_db654c9(self.class_num, #"hash_4a12859000892dda"))
		{
			self givemaxammo(weapon);
		}
		var_7d1f0fee = self.pers[#"changed_specialist"];
		if(weapon.isgadget)
		{
			self ability_util::gadget_reset(weapon, self.pers[#"changed_class"], !util::isoneround(), util::isfirstround(), var_7d1f0fee);
		}
	}
	pixendevent();
	return weapon;
}

/*
	Name: function_d35292b6
	Namespace: loadout
	Checksum: 0x697D548B
	Offset: 0x3380
	Size: 0x68
	Parameters: 4
	Flags: Linked, Private
*/
function private function_d35292b6(var_c41b864, new_weapon, var_9691c281, var_8feec653)
{
	spawn_weapon = var_9691c281;
	if(var_8feec653 != level.weaponnull)
	{
		if(spawn_weapon == level.weaponnull)
		{
			spawn_weapon = var_8feec653;
		}
	}
	return spawn_weapon;
}

/*
	Name: function_286ee0b6
	Namespace: loadout
	Checksum: 0x59B79087
	Offset: 0x33F0
	Size: 0x98
	Parameters: 2
	Flags: Linked, Private
*/
function private function_286ee0b6(previous_weapon, spawn_weapon)
{
	if(!self hasmaxprimaryweapons())
	{
		if(!isusingt7melee())
		{
			self giveweapon(level.weaponbasemeleeheld);
			return self function_d35292b6(spawn_weapon, level.weaponbasemeleeheld, previous_weapon, level.weaponbasemeleeheld);
		}
	}
	return spawn_weapon;
}

/*
	Name: function_ee9b8d55
	Namespace: loadout
	Checksum: 0xE893AB3B
	Offset: 0x3490
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ee9b8d55()
{
	primary_weapon = function_18a77b37("primary");
	secondary_weapon = function_18a77b37("secondary");
	self bbclasschoice(self.class_num, primary_weapon, secondary_weapon);
}

/*
	Name: function_d9035e42
	Namespace: loadout
	Checksum: 0x744CCD16
	Offset: 0x3508
	Size: 0xDC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d9035e42(weapon)
{
	itemindex = getbaseweaponitemindex(weapon);
	iteminfo = getunlockableiteminfofromindex(itemindex, 1);
	if(iteminfo.loadoutslotname === "primary")
	{
		self.var_86fd5bf3.var_42aa9c3--;
		if(self.var_86fd5bf3.var_42aa9c3 < 0)
		{
			return false;
		}
	}
	else if(iteminfo.loadoutslotname === "secondary")
	{
		self.var_86fd5bf3.var_ab1984e9--;
		if(self.var_86fd5bf3.var_ab1984e9 < 0)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_ad874c55
	Namespace: loadout
	Checksum: 0xFA637130
	Offset: 0x35F0
	Size: 0x98
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ad874c55(weapon)
{
	foreach(attachment in weapon.attachments)
	{
		if(attachment === "custom2")
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_3aa744b9
	Namespace: loadout
	Checksum: 0x2950B70D
	Offset: 0x3690
	Size: 0x15C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3aa744b9(slot, weapon)
{
	num_attachments = weapon.attachments.size;
	if(function_ad874c55(weapon))
	{
		num_attachments--;
	}
	if(slot === "primary")
	{
		self.var_86fd5bf3.var_355c3581 = self.var_86fd5bf3.var_355c3581 - num_attachments;
		if(self.var_86fd5bf3.var_355c3581 < 0)
		{
			return false;
		}
		if(weapon.isdualwield)
		{
			self.var_86fd5bf3.var_882b6b71--;
			if(self.var_86fd5bf3.var_882b6b71 < 0)
			{
				return false;
			}
		}
	}
	else if(slot === "secondary")
	{
		self.var_86fd5bf3.var_934131b6 = self.var_86fd5bf3.var_934131b6 - num_attachments;
		if(self.var_86fd5bf3.var_934131b6 < 0)
		{
			return false;
		}
		if(weapon.isdualwield)
		{
			self.var_86fd5bf3.var_c3fc8c73--;
			if(self.var_86fd5bf3.var_c3fc8c73 < 0)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_d126318c
	Namespace: loadout
	Checksum: 0x988F6C9A
	Offset: 0x37F8
	Size: 0x15A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d126318c(slot, weapon)
{
	var_b5bd8bd9 = 0;
	if(slot === "primary")
	{
		var_b5bd8bd9 = self.var_86fd5bf3.var_355c3581;
	}
	else if(slot === "secondary")
	{
		var_b5bd8bd9 = self.var_86fd5bf3.var_934131b6;
	}
	attachments = arraycopy(weapon.attachments);
	max_index = attachments.size + var_b5bd8bd9;
	for(i = attachments.size - 1; i >= max_index; i--)
	{
		arrayremoveindex(attachments, i);
	}
	rootweaponname = weapon.rootweapon.name;
	if(weapon.isdualwield)
	{
		if(#"hash_1b055fadc5573c29" == rootweaponname)
		{
			rootweaponname = #"smg_handling_t8";
		}
	}
	return getweapon(rootweaponname, attachments);
}

/*
	Name: function_68c2f1dc
	Namespace: loadout
	Checksum: 0xD700A19F
	Offset: 0x3960
	Size: 0x13A
	Parameters: 5
	Flags: Linked, Private
*/
function private function_68c2f1dc(slot, previous_weapon, var_c41b864, var_fe5710f, var_60b97679)
{
	loadout = self function_e27dc453(slot);
	var_8feec653 = loadout.weapon;
	weapon = self function_2ada6938(slot);
	if(weapon != level.weaponnull)
	{
		if(!self function_d9035e42(weapon))
		{
			weapon = level.weaponnull;
		}
		else if(!self function_3aa744b9(slot, weapon))
		{
			weapon = self function_d126318c(slot, weapon);
		}
	}
	self give_weapon(weapon, slot, var_60b97679, var_fe5710f);
	return self function_d35292b6(var_c41b864, weapon, previous_weapon, var_8feec653);
}

/*
	Name: function_cba7f33e
	Namespace: loadout
	Checksum: 0xA7021210
	Offset: 0x3AA8
	Size: 0x9A
	Parameters: 4
	Flags: Linked, Private
*/
function private function_cba7f33e(slot, previous_weapon, var_c41b864, var_4571c11d)
{
	var_8feec653 = self function_18a77b37(slot);
	weapon = self function_2ada6938(slot);
	self [[var_4571c11d]](slot, previous_weapon);
	return self function_d35292b6(var_c41b864, weapon, previous_weapon, var_8feec653);
}

/*
	Name: function_f20f595a
	Namespace: loadout
	Checksum: 0x53F40D1C
	Offset: 0x3B50
	Size: 0xB2
	Parameters: 3
	Flags: Linked, Private
*/
function private function_f20f595a(previous_weapon, var_c41b864, var_4571c11d)
{
	var_8feec653 = self function_18a77b37("ultimate");
	if(isdefined(self.playerrole) && isdefined(self.playerrole.var_ec20b2a))
	{
		weapon = getweapon(self.playerrole.var_ec20b2a);
		self [[var_4571c11d]]("ultimate", previous_weapon);
	}
	return var_c41b864;
}

/*
	Name: function_d98a8122
	Namespace: loadout
	Checksum: 0x57D2517B
	Offset: 0x3C10
	Size: 0x15A
	Parameters: 1
	Flags: Linked
*/
function function_d98a8122(spawn_weapon)
{
	if(!isdefined(self.spawnweapon) && isdefined(self.pers[#"spawnweapon"]))
	{
		self.spawnweapon = self.pers[#"spawnweapon"];
	}
	if(isdefined(self.spawnweapon) && doesweaponreplacespawnweapon(self.spawnweapon, spawn_weapon) && !self.pers[#"changed_class"])
	{
		spawn_weapon = self.spawnweapon;
	}
	self thread initweaponattachments(spawn_weapon);
	self.pers[#"changed_class"] = 0;
	self.spawnweapon = spawn_weapon;
	self.pers[#"spawn_weapon"] = self.spawnweapon;
	if(spawn_weapon != level.weaponnone)
	{
		switchimmediate = isdefined(self.alreadysetspawnweapononce);
		self setspawnweapon(spawn_weapon, switchimmediate);
		self.alreadysetspawnweapononce = 1;
	}
}

/*
	Name: give_weapons
	Namespace: loadout
	Checksum: 0x5EC6F12F
	Offset: 0x3D78
	Size: 0x256
	Parameters: 1
	Flags: Linked, Private
*/
function private give_weapons(previous_weapon)
{
	/#
		if(getdvarint(#"hash_91ed3579d86e71", 0))
		{
			function_d81e599e();
			function_d98a8122(level.weaponbasemeleeheld);
			return;
		}
	#/
	pixbeginevent();
	self.primaryloadoutgunsmithvariantindex = self getloadoutgunsmithvariantindex(self.class_num, 0);
	self.secondaryloadoutgunsmithvariantindex = self getloadoutgunsmithvariantindex(self.class_num, 1);
	spawn_weapon = self function_68c2f1dc("primary", previous_weapon, level.weaponnull, 0, &function_297a521e);
	spawn_weapon = self function_68c2f1dc("secondary", previous_weapon, spawn_weapon, 1, &function_297a521e);
	spawn_weapon = self function_286ee0b6(previous_weapon, spawn_weapon);
	spawn_weapon = self function_cba7f33e("primarygrenade", previous_weapon, spawn_weapon, &function_8e961216);
	spawn_weapon = self function_cba7f33e("secondarygrenade", previous_weapon, spawn_weapon, &function_c3448ab0);
	spawn_weapon = self function_cba7f33e("specialgrenade", previous_weapon, spawn_weapon, &function_215f4f21);
	spawn_weapon = self function_f20f595a(previous_weapon, spawn_weapon, &function_c4d5300a);
	self function_d98a8122(spawn_weapon);
	self function_da96d067();
	self function_ee9b8d55();
	pixendevent();
}

/*
	Name: function_cdb86a18
	Namespace: loadout
	Checksum: 0x4AC954D6
	Offset: 0x3FD8
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function function_cdb86a18()
{
	function_5536bd9e();
}

/*
	Name: function_5536bd9e
	Namespace: loadout
	Checksum: 0x96F23018
	Offset: 0x3FF8
	Size: 0x294
	Parameters: 0
	Flags: Linked
*/
function function_5536bd9e()
{
	has_specialty_armor = self hasperk(#"specialty_armor");
	healthtoassign = self.spawnhealth;
	if(isdefined(level.maxspawnhealthboostprct))
	{
		self.bonusspawnhealth = int(level.maxspawnhealthboostprct * self.spawnhealth);
		healthtoassign = healthtoassign + self.bonusspawnhealth;
	}
	if(isdefined(self.var_71a70093))
	{
		healthtoassign = self.var_71a70093;
	}
	self player::function_9080887a(healthtoassign);
	self.maxhealth = healthtoassign + (isdefined(level.var_90bb9821) ? level.var_90bb9821 : 0);
	new_health = (self.var_66cb03ad > 0 ? self.var_66cb03ad : healthtoassign);
	give_armor = has_specialty_armor && (!isdefined(self.var_a06951b7) || self.var_a06951b7 < gettime());
	armor = (give_armor ? self.spawnarmor : 0);
	self.health = new_health;
	self armor::set_armor(armor, armor, 0, self function_e95ae03(#"hash_56055daf9601d89e"), self function_e95ae03(#"hash_e7550a3c852687e"), self function_e95ae03(#"hash_5a20313f9a8825a9"), self function_e95ae03(#"hash_7c24b2a7dce26e8f"), 1, 1, 1);
	self.var_ed2f8b3a = self.spawnhealth;
	if(give_armor || (isdefined(self.var_a06951b7) && self.var_a06951b7 < gettime()))
	{
		self.var_a06951b7 = undefined;
		clientfield::set_player_uimodel("hudItems.armorIsOnCooldown", 0);
	}
	self healthoverlay::restart_player_health_regen();
}

/*
	Name: function_8e961216
	Namespace: loadout
	Checksum: 0x941A430F
	Offset: 0x4298
	Size: 0x446
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8e961216(slot, previous_weapon)
{
	pixbeginevent();
	changedclass = self.pers[#"changed_class"];
	roundbased = !util::isoneround();
	firstround = util::isfirstround();
	var_7d1f0fee = self.pers[#"changed_specialist"];
	primaryoffhand = level.weaponnone;
	primaryoffhandcount = 0;
	primaryoffhandname = self function_b958b70d(self.class_num, "primarygrenade");
	if(primaryoffhandname == "default_specialist_equipment" && isdefined(self.playerrole) && isdefined(self.playerrole.var_a7e7cb46))
	{
		primaryoffhandname = #"weapon_null";
	}
	if(primaryoffhandname != #"" && primaryoffhandname != #"weapon_null")
	{
		primaryoffhand = getweapon(primaryoffhandname);
		primaryoffhandcount = 1 + self getloadoutitem(self.class_num, "primarygrenadecount");
		if(isdefined(self.pers[#"primarygrenadecount"]) && self.pers[#"primarygrenadecount"] < primaryoffhandcount && isdefined(self.pers[#"held_gadgets_power"]) && isdefined(self.pers[#"held_gadgets_power"][primaryoffhand]))
		{
			self.pers[#"held_gadgets_power"][primaryoffhand] = self.pers[#"held_gadgets_power"][primaryoffhand] * (self.pers[#"primarygrenadecount"] / primaryoffhandcount);
		}
		self.pers[#"primarygrenadecount"] = primaryoffhandcount;
	}
	if(isitemrestricted(primaryoffhand.name) || !function_50797a7f(primaryoffhand.name))
	{
		primaryoffhand = level.weaponnone;
		primaryoffhandcount = 0;
	}
	if(primaryoffhand == level.weaponnone || is_true(level.var_49aba988))
	{
		primaryoffhand = level.var_34d27b26;
		primaryoffhandcount = 0;
	}
	if(primaryoffhand != level.weaponnull)
	{
		self giveweapon(primaryoffhand);
		self setweaponammoclip(primaryoffhand, primaryoffhandcount);
		self switchtooffhand(primaryoffhand);
		loadout = self function_e27dc453(previous_weapon);
		loadout.weapon = primaryoffhand;
		loadout.count = primaryoffhandcount;
		self ability_util::gadget_reset(primaryoffhand, changedclass, roundbased, firstround, var_7d1f0fee);
	}
	if(primaryoffhand.gadget_type == 0)
	{
		self giveweapon(level.var_34d27b26);
		self setweaponammoclip(level.var_34d27b26, 0);
	}
	pixendevent();
}

/*
	Name: function_c3448ab0
	Namespace: loadout
	Checksum: 0xBFB18E95
	Offset: 0x46E8
	Size: 0x4D6
	Parameters: 3
	Flags: Linked
*/
function function_c3448ab0(slot, previous_weapon, force_give_gadget_health_regen)
{
	if(!isdefined(force_give_gadget_health_regen))
	{
		force_give_gadget_health_regen = 1;
	}
	pixbeginevent();
	changedclass = self.pers[#"changed_class"];
	roundbased = !util::isoneround();
	firstround = util::isfirstround();
	var_7d1f0fee = self.pers[#"changed_specialist"];
	secondaryoffhand = level.weaponnone;
	secondaryoffhandcount = 0;
	if(getdvarint(#"equipmentasgadgets", 0) == 1)
	{
		if(isdefined(self.playerrole) && isdefined(self.playerrole.var_743dc11d))
		{
			secondaryoffhand = self.playerrole.var_743dc11d;
			secondaryoffhandcount = secondaryoffhand.startammo;
		}
	}
	else
	{
		secondaryoffhandname = self function_b958b70d(self.class_num, "secondarygrenade");
		if(secondaryoffhandname != #"" && secondaryoffhandname != #"weapon_null")
		{
			secondaryoffhand = getweapon(secondaryoffhandname);
			secondaryoffhandcount = 1 + self getloadoutitem(self.class_num, "secondarygrenadecount");
		}
	}
	if(isitemrestricted(secondaryoffhand.name) || !function_50797a7f(secondaryoffhand.name))
	{
		secondaryoffhand = level.weaponnone;
		secondaryoffhandcount = 0;
	}
	if(secondaryoffhand == level.weaponnone || is_true(level.var_621fba36))
	{
		secondaryoffhand = level.var_6388e216;
		secondaryoffhandcount = 0;
	}
	if(globallogic_utils::function_308e3379())
	{
		secondaryoffhand = getweapon(#"hash_28323cd36d8b5f93");
		secondaryoffhandcount = 0;
	}
	else if(force_give_gadget_health_regen === 1 && level.new_health_model && getdvarint(#"hash_ef13b0a277ba1f6", 0) != 0)
	{
		if(getdvarint(#"hash_7f9cfdea69a18091", 1) == 1)
		{
			secondaryoffhand = getweapon(#"hash_788c96e19cc7a46e");
		}
		else if(secondaryoffhand == level.var_6388e216)
		{
			secondaryoffhand = getweapon(#"gadget_health_regen");
		}
		secondaryoffhandcount = 0;
	}
	if(getdvarint(#"hash_5cf1725e36a7104", 0) > 0)
	{
		secondaryoffhand = level.weaponnone;
		secondaryoffhandcount = 0;
	}
	if(secondaryoffhand != level.weaponnull)
	{
		self giveweapon(secondaryoffhand);
		self setweaponammoclip(secondaryoffhand, secondaryoffhandcount);
		self switchtooffhand(secondaryoffhand);
		loadout = self function_e27dc453(previous_weapon);
		loadout.weapon = secondaryoffhand;
		loadout.count = secondaryoffhandcount;
		if(secondaryoffhand.gadget_type != 0)
		{
			if(force_give_gadget_health_regen === 1 && secondaryoffhand.gadget_type == 23)
			{
				self ability_util::function_36a15b60(secondaryoffhand);
			}
			else
			{
				self ability_util::gadget_reset(secondaryoffhand, changedclass, roundbased, firstround, var_7d1f0fee);
			}
		}
	}
	pixendevent();
}

/*
	Name: function_215f4f21
	Namespace: loadout
	Checksum: 0xE391C106
	Offset: 0x4BC8
	Size: 0x41E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_215f4f21(slot, previous_weapon)
{
	pixbeginevent();
	changedclass = self.pers[#"changed_class"];
	roundbased = !util::isoneround();
	firstround = util::isfirstround();
	var_7d1f0fee = self.pers[#"changed_specialist"];
	specialoffhand = level.weaponnone;
	var_4ee2888b = 0;
	specialoffhandcount = 0;
	var_d07d57b2 = self function_b958b70d(self.class_num, "specialgrenade");
	if(var_d07d57b2 != #"" && var_d07d57b2 != #"weapon_null")
	{
		specialoffhand = getweapon(var_d07d57b2);
		var_4ee2888b = self getloadoutitem(self.class_num, "specialgrenadecount");
		specialoffhandcount = (var_4ee2888b > 0 ? 2 : 1);
		if(isdefined(self.pers[#"specialgrenadecount"]) && self.pers[#"specialgrenadecount"] < specialoffhandcount && isdefined(self.pers[#"held_gadgets_power"]) && isdefined(self.pers[#"held_gadgets_power"][specialoffhand]))
		{
			self.pers[#"held_gadgets_power"][specialoffhand] = self.pers[#"held_gadgets_power"][specialoffhand] * (self.pers[#"specialgrenadecount"] / specialoffhandcount);
		}
		self.pers[#"specialgrenadecount"] = specialoffhandcount;
	}
	if(isitemrestricted(specialoffhand.name) || !function_50797a7f(specialoffhand.name) || is_true(level.var_efe72173))
	{
		specialoffhand = level.weaponnone;
		specialoffhandcount = 0;
	}
	if(specialoffhand != level.weaponnull)
	{
		self giveweapon(specialoffhand);
		if(getdvarint(#"hash_65c6d6e72413571b", 0))
		{
			self setweaponammoclip(specialoffhand, specialoffhandcount);
		}
		self switchtooffhand(specialoffhand);
		loadout = self function_e27dc453(previous_weapon);
		loadout.weapon = specialoffhand;
		loadout.count = specialoffhandcount;
		self ability_util::gadget_reset(specialoffhand, changedclass, roundbased, firstround, var_7d1f0fee);
	}
	if(specialoffhand.gadget_type == 0)
	{
		self giveweapon(level.var_43a51921);
		self setweaponammoclip(level.var_43a51921, 0);
	}
	pixendevent();
}

/*
	Name: function_c4d5300a
	Namespace: loadout
	Checksum: 0x115877E8
	Offset: 0x4FF0
	Size: 0x2F6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c4d5300a(slot, previous_weapon)
{
	pixbeginevent();
	changedclass = self.pers[#"changed_class"];
	roundbased = !util::isoneround();
	firstround = util::isfirstround();
	var_7d1f0fee = self.pers[#"changed_specialist"];
	classnum = self.class_num_for_global_weapons;
	ultimate = level.weaponnone;
	var_36aac800 = 0;
	if(isdefined(self.playerrole) && isdefined(self.playerrole.var_ec20b2a))
	{
		ultimate = getweapon(self.playerrole.var_ec20b2a);
		var_36aac800 = ultimate.startammo;
	}
	/#
		if(getdvarstring(#"hash_488ee9aa10c06400") != "")
		{
			var_92d4ff6c = getdvarstring(#"hash_488ee9aa10c06400");
			ultimate = level.weaponnone;
			if(var_92d4ff6c != "")
			{
				ultimate = getweapon(var_92d4ff6c);
			}
		}
	#/
	if(isitemrestricted(ultimate.name) || !function_50797a7f(ultimate.name))
	{
		ultimate = level.weaponnone;
		var_36aac800 = 0;
	}
	if(ultimate == level.weaponnone)
	{
		ultimate = level.var_387e902c;
		var_36aac800 = 0;
	}
	if(ultimate != level.weaponnull)
	{
		self giveweapon(ultimate);
		self setweaponammoclip(ultimate, var_36aac800);
		loadout = self function_e27dc453("ultimate");
		loadout.weapon = ultimate;
		loadout.count = var_36aac800;
		self ability_util::gadget_reset(ultimate, changedclass, roundbased, firstround, var_7d1f0fee);
		self function_442539(previous_weapon, ultimate);
	}
	pixendevent();
}

/*
	Name: function_3d16577a
	Namespace: loadout
	Checksum: 0x65B1F9A1
	Offset: 0x52F0
	Size: 0x4E
	Parameters: 2
	Flags: None
*/
function function_3d16577a(team, weaponclass)
{
	/#
		level.var_8314ef9f = 1;
		self give_loadout(team, weaponclass);
		level.var_8314ef9f = undefined;
	#/
}

/*
	Name: give_loadout
	Namespace: loadout
	Checksum: 0x585EB973
	Offset: 0x5348
	Size: 0x556
	Parameters: 3
	Flags: Linked
*/
function give_loadout(team, weaponclass, var_e0f216b9)
{
	self endon(#"death");
	pixbeginevent();
	self clientfield::set("cold_blooded", 0);
	if(function_87bcb1b())
	{
		/#
			assert(isdefined(self.curclass));
		#/
		self function_d7c205b9(self.curclass, #"give_loadout");
		var_c8f2f688 = 1;
		/#
			if(level.var_8314ef9f === 1)
			{
				var_c8f2f688 = 0;
			}
		#/
		current_weapon = self getcurrentweapon();
		if(isdefined(self.var_560765bb) && self.var_560765bb >= gettime() && current_weapon != level.weaponnone)
		{
			pixendevent();
			return;
		}
		if(current_weapon == level.weaponnone && isdefined(self.class_num))
		{
			current_weapon = self getloadoutweapon(self.class_num, "primary");
		}
		actionslot3 = (getdvarint(#"hash_449fa75f87a4b5b4", 0) > 0 ? "ping_callouts" : "flourish_callouts");
		self setactionslot(3, actionslot3);
		actionslot4 = (getdvarint(#"hash_23270ec9008cb656", 0) > 0 ? "sprays_boasts" : "scorestreak_wheel");
		self setactionslot(4, actionslot4);
		if(isdefined(level.givecustomloadout))
		{
			spawn_weapon = self [[level.givecustomloadout]]();
			if(isdefined(spawn_weapon))
			{
				self thread initweaponattachments(spawn_weapon);
			}
			self.spawnweapon = spawn_weapon;
		}
		else
		{
			self init_player(1);
			function_f436358b(weaponclass);
			allocationspent = self getloadoutallocation(self.class_num);
			overallocation = allocationspent > level.maxallocation;
			self function_8aa3ff4e();
			if(var_c8f2f688)
			{
				self function_e6f9e3cd();
				function_c0a72f5c();
			}
			function_5ac66375();
			give_weapons(current_weapon);
			function_5536bd9e();
			function_f8ae6f87();
			function_51dceab7();
			function_6573eeeb();
			self.attackeraccuracy = self function_968b6c6a();
		}
	}
	else if(isdefined(level.givecustomloadout))
	{
		spawn_weapon = self [[level.givecustomloadout]]();
		if(isdefined(spawn_weapon))
		{
			self thread initweaponattachments(spawn_weapon);
		}
		self.spawnweapon = spawn_weapon;
	}
	self detachall();
	if(isdefined(self.movementspeedmodifier))
	{
		self setmovespeedscale(self.movementspeedmodifier * self getmovespeedscale());
	}
	else
	{
		self setmovespeedscale(1);
	}
	self cac_selector();
	self.firstspawn = 0;
	primary_weapon = function_18a77b37("primary");
	self function_43048d33(self.spawnweapon, primary_weapon, var_e0f216b9);
	self notify(#"loadout_given");
	callback::callback(#"on_loadout");
	self thread function_b61852e1();
	pixendevent();
}

/*
	Name: function_b61852e1
	Namespace: loadout
	Checksum: 0x1F3A019D
	Offset: 0x58A8
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b61852e1()
{
	self endon(#"disconnect");
	self notify("862a138fc0965e");
	self endon("862a138fc0965e");
	waitframe(1);
	self luinotifyevent(#"hash_21e30e91084f7e66", 0);
	wait(0.1);
	self luinotifyevent(#"hash_21e30e91084f7e66", 0);
	wait(0.5);
	self luinotifyevent(#"hash_21e30e91084f7e66", 0);
}

/*
	Name: function_43048d33
	Namespace: loadout
	Checksum: 0x407CD24A
	Offset: 0x5960
	Size: 0x1FC
	Parameters: 3
	Flags: Linked, Private
*/
function private function_43048d33(spawn_weapon, primaryweapon, var_e0f216b9)
{
	if(!isdefined(var_e0f216b9))
	{
		var_e0f216b9 = 0;
	}
	if(!isdefined(self.firstspawn) || var_e0f216b9)
	{
		if(isdefined(spawn_weapon))
		{
			self initialweaponraise(spawn_weapon);
			if(isdefined(self.firstspawn))
			{
				self function_6edc650b(spawn_weapon);
			}
		}
		else if(isdefined(primaryweapon))
		{
			self initialweaponraise(primaryweapon);
			if(isdefined(self.firstspawn))
			{
				self function_6edc650b(primaryweapon);
			}
		}
	}
	else
	{
		self seteverhadweaponall(1);
	}
	if(!var_e0f216b9)
	{
		if(isdefined(spawn_weapon))
		{
			self function_c9a111a(spawn_weapon);
		}
		else if(isdefined(primaryweapon))
		{
			self function_c9a111a(primaryweapon);
		}
	}
	self.firstspawn = 0;
	self.switchedteamsresetgadgets = 0;
	self.var_560765bb = gettime();
	if(is_true(self.pers[#"changed_specialist"]))
	{
		self notify(#"changed_specialist");
		self callback::callback(#"changed_specialist");
		self.var_228b6835 = 1;
	}
	else
	{
		self.var_228b6835 = 0;
	}
	self.pers[#"changed_specialist"] = 0;
	self flag::set(#"loadout_given");
}

/*
	Name: on_player_connecting
	Namespace: loadout
	Checksum: 0x3374C592
	Offset: 0x5B68
	Size: 0xDC
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_connecting()
{
	if(!isdefined(self))
	{
		return;
	}
	self.pers[#"loadoutindex"] = 0;
	if(function_87bcb1b())
	{
		if(!isdefined(self.pers[#"class"]))
		{
			self.pers[#"class"] = "";
		}
		self.curclass = self.pers[#"class"];
		self.lastclass = "";
		self function_c67222df();
		self function_d7c205b9(self.curclass);
	}
}

/*
	Name: function_53b62db1
	Namespace: loadout
	Checksum: 0x1514BD88
	Offset: 0x5C50
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function function_53b62db1(newclass)
{
	self.curclass = newclass;
}

/*
	Name: function_d7c205b9
	Namespace: loadout
	Checksum: 0xEE657D38
	Offset: 0x5C78
	Size: 0x1BC
	Parameters: 2
	Flags: Linked
*/
function function_d7c205b9(newclass, var_eead10f0)
{
	if(!isdefined(var_eead10f0))
	{
		var_eead10f0 = #"unspecified";
	}
	loadoutindex = (isdefined(newclass) ? function_6972fdbb(newclass) : undefined);
	self.pers[#"loadoutindex"] = loadoutindex;
	var_45843e9a = var_eead10f0 == #"give_loadout";
	var_7f8c24df = 0;
	if(!var_45843e9a)
	{
		var_7f8c24df = isdefined(game) && isdefined(game.state) && game.state == #"playing" && isalive(self);
		if(var_7f8c24df && self.sessionstate == "playing")
		{
			var_25b0cd7 = self.usingsupplystation === 1;
			if(is_true(level.ingraceperiod) && !is_true(self.hasdonecombat) || var_25b0cd7)
			{
				var_7f8c24df = 0;
			}
		}
	}
	if(var_7f8c24df)
	{
		return;
	}
	if(isdefined(loadoutindex))
	{
		self function_ad20e845(loadoutindex);
		self setplayerstateloadoutweapons(loadoutindex);
	}
}

/*
	Name: init_dvars
	Namespace: loadout
	Checksum: 0xF7284056
	Offset: 0x5E40
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function init_dvars()
{
	level.cac_armorpiercing_data = getdvarint(#"perk_armorpiercing", 40) / 100;
	level.cac_bulletdamage_data = getdvarint(#"perk_bulletdamage", 35);
	level.cac_fireproof_data = getdvarint(#"perk_fireproof", 20);
	level.cac_armorvest_data = getdvarint(#"perk_armorvest", 80);
	level.cac_flakjacket_data = getdvarint(#"perk_flakjacket", 35);
	level.cac_flakjacket_hardcore_data = getdvarint(#"perk_flakjacket_hardcore", 9);
}

/*
	Name: cac_selector
	Namespace: loadout
	Checksum: 0x9469B8CF
	Offset: 0x5F78
	Size: 0x7E
	Parameters: 0
	Flags: Linked, Private
*/
function private cac_selector()
{
	self.detectexplosives = 0;
	if(isdefined(self.specialty))
	{
		perks = self.specialty;
		for(i = 0; i < perks.size; i++)
		{
			perk = perks[i];
			if(perk == "specialty_detectexplosive")
			{
				self.detectexplosives = 1;
			}
		}
	}
}

/*
	Name: register_perks
	Namespace: loadout
	Checksum: 0x620C5C2C
	Offset: 0x6000
	Size: 0xF6
	Parameters: 0
	Flags: Linked
*/
function register_perks()
{
	pixbeginevent();
	perks = self.specialty;
	perks::function_3cd6f625();
	if(isdefined(perks) && is_true(level.perksenabled))
	{
		for(i = 0; i < perks.size; i++)
		{
			perk = perks[i];
			if(perk == #"specialty_null" || perk == #"weapon_null")
			{
				continue;
			}
			self perks::function_7637bafa(perk);
		}
	}
	/#
		dev::giveextraperks();
	#/
	pixendevent();
}

/*
	Name: cac_modified_damage
	Namespace: loadout
	Checksum: 0xA23BB985
	Offset: 0x6100
	Size: 0x616
	Parameters: 7
	Flags: Linked
*/
function cac_modified_damage(victim, attacker, damage, mod, weapon, inflictor, hitloc)
{
	/#
		assert(isdefined(victim));
	#/
	/#
		assert(isdefined(attacker));
	#/
	/#
		assert(isplayer(victim));
	#/
	attacker_is_player = isplayer(attacker);
	if(damage <= 0)
	{
		return damage;
	}
	/#
		debug = 0;
		if(getdvarint(#"scr_perkdebug", 0))
		{
			debug = 1;
			if(!isdefined(attacker.name))
			{
				attacker.name = "";
			}
		}
	#/
	final_damage = damage;
	if(victim != attacker)
	{
		var_81ca51d = 1;
		if(attacker_is_player && attacker hasperk(#"specialty_bulletdamage") && isprimarydamage(mod))
		{
			if(victim hasperk(#"specialty_armorvest") && !function_4c80bca1(hitloc))
			{
				/#
					if(debug)
					{
						println(((("" + victim.name) + "") + attacker.name) + "");
					}
				#/
			}
			else
			{
				final_damage = (damage * (100 + level.cac_bulletdamage_data)) / 100;
				/#
					if(debug)
					{
						println((("" + attacker.name) + "") + victim.name);
					}
				#/
			}
		}
		else
		{
			if(victim hasperk(#"specialty_armorvest") && isprimarydamage(mod) && !function_4c80bca1(hitloc))
			{
				final_damage = damage * (level.cac_armorvest_data * 0.01);
				/#
					if(debug)
					{
						println((("" + attacker.name) + "") + victim.name);
					}
				#/
			}
			else
			{
				if(victim hasperk(#"specialty_fireproof") && weapons::isfiredamage(weapon, mod))
				{
					final_damage = damage * (level.cac_fireproof_data * 0.01);
					/#
						if(debug)
						{
							println((("" + attacker.name) + "") + victim.name);
						}
					#/
				}
				else if(!var_81ca51d && victim hasperk(#"specialty_flakjacket") && weapons::isexplosivedamage(mod) && !weapon.ignoresflakjacket && !victim grenade_stuck(inflictor))
				{
					cac_data = (level.hardcoremode ? level.cac_flakjacket_hardcore_data : level.cac_flakjacket_data);
					final_damage = int(damage * (cac_data / 100));
					/#
						if(debug)
						{
							println(((("" + victim.name) + "") + attacker.name) + "");
						}
					#/
				}
			}
		}
	}
	/#
		victim.cac_debug_damage_type = tolower(mod);
		victim.cac_debug_original_damage = damage;
		victim.cac_debug_final_damage = final_damage;
		victim.cac_debug_location = tolower(hitloc);
		victim.cac_debug_weapon = weapon.displayname;
		victim.cac_debug_range = int(distance(attacker.origin, victim.origin));
		if(debug)
		{
			println((((("" + (final_damage / damage)) + "") + damage) + "") + final_damage);
		}
	#/
	final_damage = int(final_damage);
	if(final_damage < 1)
	{
		final_damage = 1;
	}
	return final_damage;
}

/*
	Name: function_4c80bca1
	Namespace: loadout
	Checksum: 0x42507D68
	Offset: 0x6720
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4c80bca1(hitloc)
{
	return hitloc == "helmet" || hitloc == "head" || hitloc == "neck";
}

/*
	Name: grenade_stuck
	Namespace: loadout
	Checksum: 0x3BD4737E
	Offset: 0x6768
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private grenade_stuck(inflictor)
{
	return isdefined(inflictor) && isdefined(inflictor.stucktoplayer) && inflictor.stucktoplayer == self;
}

/*
	Name: function_6dd64ede
	Namespace: loadout
	Checksum: 0x33A2871D
	Offset: 0x67A8
	Size: 0x4C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6dd64ede(slot, weapon)
{
	self gadgetdeactivate(self.gadget_health_regen_slot, self.gadget_health_regen_weapon);
	thread function_c57586b8();
}

/*
	Name: function_c57586b8
	Namespace: loadout
	Checksum: 0x1739DD93
	Offset: 0x6800
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c57586b8()
{
	self endon(#"disconnect");
	wait(0.5);
	self gadget_health_regen::power_off();
	if(isdefined(self.gadget_health_regen_slot))
	{
		self function_19ed70ca(self.gadget_health_regen_slot, 1);
	}
}

/*
	Name: function_8aa3ff4e
	Namespace: loadout
	Checksum: 0x6C71143D
	Offset: 0x6870
	Size: 0x56E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8aa3ff4e()
{
	wildcards = self function_6f2c0492(self.class_num);
	self.var_86fd5bf3 = spawnstruct();
	self.var_86fd5bf3.var_42aa9c3 = (isdefined(level.var_86fd5bf3[0].var_42aa9c3) ? level.var_86fd5bf3[0].var_42aa9c3 : 0);
	self.var_86fd5bf3.var_355c3581 = (isdefined(level.var_86fd5bf3[0].var_355c3581) ? level.var_86fd5bf3[0].var_355c3581 : 0);
	self.var_86fd5bf3.var_882b6b71 = (isdefined(level.var_86fd5bf3[0].var_882b6b71) ? level.var_86fd5bf3[0].var_882b6b71 : 0);
	self.var_86fd5bf3.var_ab1984e9 = (isdefined(level.var_86fd5bf3[0].var_ab1984e9) ? level.var_86fd5bf3[0].var_ab1984e9 : 0);
	self.var_86fd5bf3.var_934131b6 = (isdefined(level.var_86fd5bf3[0].var_934131b6) ? level.var_86fd5bf3[0].var_934131b6 : 0);
	self.var_86fd5bf3.var_c3fc8c73 = (isdefined(level.var_86fd5bf3[0].var_c3fc8c73) ? level.var_86fd5bf3[0].var_c3fc8c73 : 0);
	self.var_86fd5bf3.var_a2ef45f8 = (isdefined(level.var_86fd5bf3[0].var_a2ef45f8) ? level.var_86fd5bf3[0].var_a2ef45f8 : 0);
	self.var_86fd5bf3.var_cd3db98c = (isdefined(level.var_86fd5bf3[0].var_cd3db98c) ? level.var_86fd5bf3[0].var_cd3db98c : 0);
	self.var_86fd5bf3.var_25a22f4 = (isdefined(level.var_86fd5bf3[0].var_25a22f4) ? level.var_86fd5bf3[0].var_25a22f4 : 0);
	if(isdefined(wildcards) && wildcards.size > 0)
	{
		foreach(var_9bb0ceab in wildcards)
		{
			var_47dbd1c3 = level.var_86fd5bf3[var_9bb0ceab];
			if(isdefined(var_47dbd1c3))
			{
				self.var_86fd5bf3.var_42aa9c3 = self.var_86fd5bf3.var_42aa9c3 + (isdefined(var_47dbd1c3.var_42aa9c3) ? var_47dbd1c3.var_42aa9c3 : 0);
				self.var_86fd5bf3.var_355c3581 = self.var_86fd5bf3.var_355c3581 + (isdefined(var_47dbd1c3.var_355c3581) ? var_47dbd1c3.var_355c3581 : 0);
				self.var_86fd5bf3.var_882b6b71 = self.var_86fd5bf3.var_882b6b71 + (isdefined(var_47dbd1c3.var_882b6b71) ? var_47dbd1c3.var_882b6b71 : 0);
				self.var_86fd5bf3.var_ab1984e9 = self.var_86fd5bf3.var_ab1984e9 + (isdefined(var_47dbd1c3.var_ab1984e9) ? var_47dbd1c3.var_ab1984e9 : 0);
				self.var_86fd5bf3.var_934131b6 = self.var_86fd5bf3.var_934131b6 + (isdefined(var_47dbd1c3.var_934131b6) ? var_47dbd1c3.var_934131b6 : 0);
				self.var_86fd5bf3.var_c3fc8c73 = self.var_86fd5bf3.var_c3fc8c73 + (isdefined(var_47dbd1c3.var_c3fc8c73) ? var_47dbd1c3.var_c3fc8c73 : 0);
				self.var_86fd5bf3.var_a2ef45f8 = self.var_86fd5bf3.var_a2ef45f8 + (isdefined(var_47dbd1c3.var_a2ef45f8) ? var_47dbd1c3.var_a2ef45f8 : 0);
				self.var_86fd5bf3.var_cd3db98c = self.var_86fd5bf3.var_cd3db98c + (isdefined(var_47dbd1c3.var_cd3db98c) ? var_47dbd1c3.var_cd3db98c : 0);
				self.var_86fd5bf3.var_25a22f4 = self.var_86fd5bf3.var_25a22f4 + (isdefined(var_47dbd1c3.var_25a22f4) ? var_47dbd1c3.var_25a22f4 : 0);
			}
		}
	}
}

