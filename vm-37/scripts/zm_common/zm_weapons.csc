#using script_101d8280497ff416;
#using script_1611421ee9b880d3;
#using script_1ca35695cd4aeeea;
#using script_3d35e2ff167b3a82;
#using script_618d6f5ff5d18933;
#using script_680dddbda86931fa;
#using script_709bf7c56eb65adf;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace zm_weapons;

/*
	Name: function_89f2df9
	Namespace: zm_weapons
	Checksum: 0x82A611A8
	Offset: 0x130
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_weapons", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_weapons
	Checksum: 0xFCC3E014
	Offset: 0x188
	Size: 0x12C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level flag::init("weapon_table_loaded");
	callback::on_localclient_connect(&on_player_connect);
	level.weaponnone = getweapon(#"none");
	level.weaponnull = getweapon(#"weapon_null");
	level.var_78032351 = getweapon(#"defaultweapon");
	level.weaponbasemelee = getweapon(#"knife");
	if(!isdefined(level.zombie_weapons_upgraded))
	{
		level.zombie_weapons_upgraded = [];
	}
	if(!isdefined(level.var_11173af4))
	{
		level.var_11173af4 = [];
	}
	weapons::init_shared();
}

/*
	Name: function_8ac3bea9
	Namespace: zm_weapons
	Checksum: 0x4CDA5A1D
	Offset: 0x2C0
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	init_weapons();
	function_8389c033(#"ray_gun", #"ray_gun");
	level.var_69fa4969 = &function_2bcaec6f;
}

/*
	Name: function_8389c033
	Namespace: zm_weapons
	Checksum: 0xD7B34C31
	Offset: 0x328
	Size: 0x11A
	Parameters: 2
	Flags: Linked
*/
function function_8389c033(weapon_name, var_b72e8856)
{
	weapon = getweapon(weapon_name);
	var_6ae93843 = getweapon(var_b72e8856);
	if(!isdefined(level.var_11173af4[weapon]))
	{
		level.var_11173af4[weapon] = [];
	}
	if(!isdefined(level.var_11173af4[weapon]))
	{
		level.var_11173af4[weapon] = [];
	}
	else if(!isarray(level.var_11173af4[weapon]))
	{
		level.var_11173af4[weapon] = array(level.var_11173af4[weapon]);
	}
	level.var_11173af4[weapon][level.var_11173af4[weapon].size] = var_6ae93843;
}

/*
	Name: function_2bcaec6f
	Namespace: zm_weapons
	Checksum: 0xF775132
	Offset: 0x450
	Size: 0x312
	Parameters: 2
	Flags: Linked
*/
function function_2bcaec6f(localclientnum, var_a6762160)
{
	if(!(isdefined(var_a6762160) && isdefined(var_a6762160.weapon)) || !isdefined(localclientnum))
	{
		return;
	}
	data = item_world::function_a7e98a1a(localclientnum);
	current_weapon = getcurrentweapon(localclientnum);
	current_weapon = get_base_weapon(current_weapon);
	var_3ccb716f = get_base_weapon(var_a6762160.weapon);
	weapon1 = data.inventory.items[17 + 1];
	weapon2 = data.inventory.items[((17 + 1) + 8) + 1];
	weapon1 = self namespace_a0d533d1::function_2b83d3ff(weapon1);
	weapon2 = self namespace_a0d533d1::function_2b83d3ff(weapon2);
	if(!(isdefined(weapon1) && isdefined(weapon2)))
	{
		return true;
	}
	weapon1 = get_base_weapon(weapon1);
	weapon2 = get_base_weapon(weapon2);
	if(isarray(level.var_11173af4[var_3ccb716f]))
	{
		var_36e0edce = 0;
		var_7bdcb52a = 0;
		foreach(var_6ae93843 in level.var_11173af4[var_3ccb716f])
		{
			if(weapon1 == var_6ae93843 || weapon2 == var_6ae93843)
			{
				var_36e0edce = 1;
				break;
			}
		}
		foreach(var_6ae93843 in level.var_11173af4[var_3ccb716f])
		{
			if(current_weapon == var_6ae93843)
			{
				var_7bdcb52a = 1;
			}
		}
		if(var_36e0edce && current_weapon != var_3ccb716f && !var_7bdcb52a)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: get_base_weapon
	Namespace: zm_weapons
	Checksum: 0x78A9E12
	Offset: 0x770
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function get_base_weapon(upgradedweapon)
{
	if(isdefined(upgradedweapon.rootweapon))
	{
		upgradedweapon = upgradedweapon.rootweapon;
	}
	if(isdefined(level.zombie_weapons_upgraded[upgradedweapon]))
	{
		return level.zombie_weapons_upgraded[upgradedweapon];
	}
	return upgradedweapon;
}

/*
	Name: on_player_connect
	Namespace: zm_weapons
	Checksum: 0x7092209A
	Offset: 0x7D0
	Size: 0x190
	Parameters: 1
	Flags: Linked, Private
*/
function private on_player_connect(localclientnum)
{
	if(getmigrationstatus(localclientnum))
	{
		return;
	}
	resetweaponcosts(localclientnum);
	level flag::wait_till("weapon_table_loaded");
	if(getgametypesetting(#"hash_51a2cf319e12d9ae"))
	{
		level flag::wait_till("weapon_wallbuys_created");
	}
	if(isdefined(level.weapon_costs))
	{
		foreach(weaponcost in level.weapon_costs)
		{
			player_cost = compute_player_weapon_ammo_cost(weaponcost.weapon, weaponcost.ammo_cost, weaponcost.upgraded);
			setweaponcosts(localclientnum, weaponcost.weapon, weaponcost.cost, weaponcost.ammo_cost, player_cost, weaponcost.upgradedweapon);
		}
	}
}

/*
	Name: is_weapon_included
	Namespace: zm_weapons
	Checksum: 0x51ADB9E
	Offset: 0x968
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function is_weapon_included(weapon)
{
	if(!isdefined(level._included_weapons))
	{
		return 0;
	}
	return isdefined(level._included_weapons[weapon.rootweapon]);
}

/*
	Name: compute_player_weapon_ammo_cost
	Namespace: zm_weapons
	Checksum: 0x2D72F965
	Offset: 0x9A8
	Size: 0xFE
	Parameters: 5
	Flags: Linked
*/
function compute_player_weapon_ammo_cost(weapon, cost, upgraded, n_base_non_wallbuy_cost, n_upgraded_non_wallbuy_cost)
{
	if(!isdefined(n_base_non_wallbuy_cost))
	{
		n_base_non_wallbuy_cost = 750;
	}
	if(!isdefined(n_upgraded_non_wallbuy_cost))
	{
		n_upgraded_non_wallbuy_cost = 5000;
	}
	w_root = weapon.rootweapon;
	if(upgraded)
	{
		if(zm_wallbuy::is_wallbuy(level.zombie_weapons_upgraded[w_root]))
		{
			n_ammo_cost = 4000;
		}
		else
		{
			n_ammo_cost = n_upgraded_non_wallbuy_cost;
		}
	}
	else
	{
		if(zm_wallbuy::is_wallbuy(w_root))
		{
			n_ammo_cost = cost;
			n_ammo_cost = zm_utility::halve_score(n_ammo_cost);
		}
		else
		{
			n_ammo_cost = n_base_non_wallbuy_cost;
		}
	}
	return n_ammo_cost;
}

/*
	Name: include_weapon
	Namespace: zm_weapons
	Checksum: 0x2049A743
	Offset: 0xAB0
	Size: 0x31C
	Parameters: 5
	Flags: Linked
*/
function include_weapon(weapon_name, display_in_box, cost, ammo_cost, upgraded)
{
	if(!isdefined(upgraded))
	{
		upgraded = 0;
	}
	if(!isdefined(level._included_weapons))
	{
		level._included_weapons = [];
	}
	weapon = getweapon(weapon_name);
	level._included_weapons[weapon] = weapon;
	if(!isdefined(level.weapon_costs))
	{
		level.weapon_costs = [];
	}
	if(!isdefined(level.weapon_costs[weapon_name]))
	{
		level.weapon_costs[weapon_name] = spawnstruct();
		level.weapon_costs[weapon_name].weapon = weapon;
		level.weapon_costs[weapon_name].upgradedweapon = level.weaponnone;
	}
	level.weapon_costs[weapon_name].cost = cost;
	if(!isdefined(ammo_cost) || ammo_cost == 0)
	{
		ammo_cost = zm_utility::round_up_to_ten(int(cost * 0.5));
	}
	level.weapon_costs[weapon_name].ammo_cost = ammo_cost;
	level.weapon_costs[weapon_name].upgraded = upgraded;
	if(isdefined(display_in_box) && !display_in_box)
	{
		return;
	}
	if(!isdefined(level._resetzombieboxweapons))
	{
		level._resetzombieboxweapons = 1;
		resetzombieboxweapons();
	}
	if(!isdefined(weapon.worldmodel))
	{
		/#
			thread util::error(("" + function_9e72a96(weapon_name)) + "");
		#/
		return;
	}
	if(!isdefined(level.var_1d1c6c28))
	{
		level.var_1d1c6c28 = [];
	}
	if(!isdefined(level.var_1d1c6c28))
	{
		level.var_1d1c6c28 = [];
	}
	else if(!isarray(level.var_1d1c6c28))
	{
		level.var_1d1c6c28 = array(level.var_1d1c6c28);
	}
	if(!isinarray(level.var_1d1c6c28, weapon.worldmodel))
	{
		level.var_1d1c6c28[level.var_1d1c6c28.size] = weapon.worldmodel;
	}
	addzombieboxweapon(weapon, weapon.worldmodel, weapon.isdualwield);
}

/*
	Name: include_upgraded_weapon
	Namespace: zm_weapons
	Checksum: 0x610DBE70
	Offset: 0xDD8
	Size: 0xE2
	Parameters: 5
	Flags: Linked
*/
function include_upgraded_weapon(weapon_name, upgrade_name, display_in_box, cost, ammo_cost)
{
	include_weapon(upgrade_name, display_in_box, cost, ammo_cost, 1);
	if(!isdefined(level.zombie_weapons_upgraded))
	{
		level.zombie_weapons_upgraded = [];
	}
	weapon = getweapon(weapon_name);
	upgrade = getweapon(upgrade_name);
	level.zombie_weapons_upgraded[upgrade] = weapon;
	if(isdefined(level.weapon_costs[weapon_name]))
	{
		level.weapon_costs[weapon_name].upgradedweapon = upgrade;
	}
}

/*
	Name: is_weapon_upgraded
	Namespace: zm_weapons
	Checksum: 0x4353C4CF
	Offset: 0xEC8
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function is_weapon_upgraded(weapon)
{
	if(!isdefined(level.zombie_weapons_upgraded))
	{
		level.zombie_weapons_upgraded = [];
	}
	rootweapon = weapon.rootweapon;
	if(isdefined(level.zombie_weapons_upgraded[rootweapon]))
	{
		return true;
	}
	return false;
}

/*
	Name: checkstringvalid
	Namespace: zm_weapons
	Checksum: 0x18A2FF0A
	Offset: 0xF30
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function checkstringvalid(str)
{
	if(str != "")
	{
		return str;
	}
	return undefined;
}

/*
	Name: init_weapons
	Namespace: zm_weapons
	Checksum: 0x8706A701
	Offset: 0xF60
	Size: 0xAE
	Parameters: 0
	Flags: Linked
*/
function init_weapons()
{
	level.var_c60359dc = [];
	var_4ef031c9 = #"hash_2298893b58cc2885";
	load_weapon_spec_from_table(var_4ef031c9, 0);
	if(isdefined(level.var_d0ab70a2))
	{
		load_weapon_spec_from_table(level.var_d0ab70a2, 0);
	}
	level thread function_350ee41();
	level flag::set("weapon_table_loaded");
	level.var_c60359dc = undefined;
}

/*
	Name: function_15827c82
	Namespace: zm_weapons
	Checksum: 0xF35473EF
	Offset: 0x1018
	Size: 0x148
	Parameters: 1
	Flags: Linked
*/
function function_15827c82(var_904df15f)
{
	if(var_904df15f.type === "itemspawnlist")
	{
		foreach(var_b67f9e10 in var_904df15f.itemlist)
		{
			if(var_b67f9e10.type === "itemspawnlist")
			{
				function_15827c82(var_b67f9e10);
				continue;
			}
			if(!isdefined(level.var_8bd4028f))
			{
				level.var_8bd4028f = [];
			}
			else if(!isarray(level.var_8bd4028f))
			{
				level.var_8bd4028f = array(level.var_8bd4028f);
			}
			level.var_8bd4028f[level.var_8bd4028f.size] = var_b67f9e10.var_a6762160;
		}
	}
}

/*
	Name: function_350ee41
	Namespace: zm_weapons
	Checksum: 0xF9FB1D01
	Offset: 0x1168
	Size: 0x288
	Parameters: 0
	Flags: Linked, Private
*/
function private function_350ee41()
{
	if(!isdefined(level.var_82b76a68))
	{
		level.var_82b76a68 = "zm_magicbox_item_list";
	}
	s_bundle = getscriptbundle(level.var_82b76a68);
	foreach(var_b67f9e10 in s_bundle.itemlist)
	{
		if(var_b67f9e10.type === "itemspawnlist")
		{
			function_15827c82(var_b67f9e10);
		}
		if(!isdefined(level.var_8bd4028f))
		{
			level.var_8bd4028f = [];
		}
		else if(!isarray(level.var_8bd4028f))
		{
			level.var_8bd4028f = array(level.var_8bd4028f);
		}
		level.var_8bd4028f[level.var_8bd4028f.size] = var_b67f9e10.var_a6762160;
		var_89230090 = getscriptbundle(var_b67f9e10.var_a6762160);
		weapon = namespace_ad5a0cd6::function_35e06774(var_89230090, isdefined(var_89230090.attachments));
		if(isweapon(weapon))
		{
			if(!isdefined(level.var_c8b5248e))
			{
				level.var_c8b5248e = [];
			}
			else if(!isarray(level.var_c8b5248e))
			{
				level.var_c8b5248e = array(level.var_c8b5248e);
			}
			if(!isinarray(level.var_c8b5248e, weapon))
			{
				level.var_c8b5248e[level.var_c8b5248e.size] = weapon;
			}
			addzombieboxweapon(weapon, weapon.worldmodel, weapon.isdualwield);
		}
	}
}

/*
	Name: load_weapon_spec_from_table
	Namespace: zm_weapons
	Checksum: 0x4E8AFC5C
	Offset: 0x13F8
	Size: 0x352
	Parameters: 2
	Flags: Linked
*/
function load_weapon_spec_from_table(table, first_row)
{
	gametype = util::function_5df4294();
	index = first_row;
	row = tablelookuprow(table, index);
	while(isdefined(row))
	{
		weapon_name = checkstringvalid(row[0]);
		if(isinarray(level.var_c60359dc, weapon_name))
		{
			index++;
			row = tablelookuprow(table, index);
			continue;
		}
		if(!isdefined(level.var_c60359dc))
		{
			level.var_c60359dc = [];
		}
		else if(!isarray(level.var_c60359dc))
		{
			level.var_c60359dc = array(level.var_c60359dc);
		}
		level.var_c60359dc[level.var_c60359dc.size] = weapon_name;
		upgrade_name = checkstringvalid(row[1]);
		cost = row[3];
		weaponvo = checkstringvalid(row[4]);
		weaponvoresp = checkstringvalid(row[5]);
		ammo_cost = row[6];
		create_vox = row[7];
		is_zcleansed = row[8];
		in_box = row[9];
		upgrade_in_box = row[10];
		is_limited = row[11];
		limit = row[12];
		upgrade_limit = row[13];
		content_restrict = row[14];
		wallbuy_autospawn = row[15];
		weapon_class = checkstringvalid(row[16]);
		is_wonder_weapon = row[18];
		tier = row[19];
		include_weapon(weapon_name, in_box, cost, ammo_cost, 0);
		if(isdefined(upgrade_name))
		{
			include_upgraded_weapon(weapon_name, upgrade_name, upgrade_in_box, cost, 4500);
		}
		index++;
		row = tablelookuprow(table, index);
	}
}

