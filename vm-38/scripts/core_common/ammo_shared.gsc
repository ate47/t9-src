#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\ai\systems\shared.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;

#namespace ammo_shared;

/*
	Name: function_c4804780
	Namespace: ammo_shared
	Checksum: 0x225DE643
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c4804780()
{
	level notify(1205893502);
}

#namespace ammo;

/*
	Name: main
	Namespace: ammo
	Checksum: 0xE340F3B4
	Offset: 0xE0
	Size: 0x50
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	if(!isdefined(level.ai_ammo_throttle))
	{
		level.ai_ammo_throttle = new throttle();
		[[ level.ai_ammo_throttle ]]->initialize(1, 0.1);
	}
}

/*
	Name: dropaiammo
	Namespace: ammo
	Checksum: 0xE8B5CC3A
	Offset: 0x138
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function dropaiammo()
{
	self endon(#"death");
	if(!isdefined(self.ammopouch))
	{
		return;
	}
	if(is_true(self.disableammodrop))
	{
		return;
	}
	[[ level.ai_ammo_throttle ]]->waitinqueue(self);
	droppedweapon = shared::throwweapon(self.ammopouch, "tag_stowed_back", 1, 0);
	if(isdefined(droppedweapon))
	{
		droppedweapon thread ammo_pouch_think();
		droppedweapon setcontents(droppedweapon setcontents(0) & (~(((32768 | 16777216) | 2097152) | 8388608)));
	}
}

/*
	Name: ammo_pouch_think
	Namespace: ammo
	Checksum: 0x4EA8FA67
	Offset: 0x238
	Size: 0x624
	Parameters: 0
	Flags: None
*/
function ammo_pouch_think()
{
	self endon(#"death");
	waitresult = undefined;
	waitresult = self waittill(#"scavenger");
	player = waitresult.player;
	if(isdefined(level.var_a253061b))
	{
		self [[level.var_a253061b]](waitresult);
		return;
	}
	primary_weapons = player getweaponslistprimaries();
	offhand_weapons_and_alts = array::exclude(player getweaponslist(1), primary_weapons);
	arrayremovevalue(offhand_weapons_and_alts, level.weaponbasemelee);
	offhand_weapons_and_alts = array::reverse(offhand_weapons_and_alts);
	player playsound(#"wpn_ammo_pickup");
	player playlocalsound(#"wpn_ammo_pickup");
	if(is_true(level.b_disable_scavenger_icon))
	{
		player hud::function_4a4de0de();
	}
	for(i = 0; i < offhand_weapons_and_alts.size; i++)
	{
		weapon = offhand_weapons_and_alts[i];
		if(is_true(weapon.var_cc0ed831))
		{
			continue;
		}
		maxammo = 0;
		loadout = player loadout::find_loadout_slot(weapon);
		if(isdefined(loadout))
		{
			if(loadout.count > 0)
			{
				maxammo = loadout.count;
			}
			else if(weapon.isheavyweapon && is_true(level.overrideammodropheavyweapon))
			{
				maxammo = weapon.maxammo;
			}
		}
		else
		{
			if(weapon == player.grenadetypeprimary && isdefined(player.grenadetypeprimarycount) && player.grenadetypeprimarycount > 0)
			{
				maxammo = player.grenadetypeprimarycount;
			}
			else
			{
				if(weapon == player.grenadetypesecondary && isdefined(player.grenadetypesecondarycount) && player.grenadetypesecondarycount > 0)
				{
					maxammo = player.grenadetypesecondarycount;
				}
				else if(weapon.isheavyweapon && is_true(level.overrideammodropheavyweapon))
				{
					maxammo = weapon.maxammo;
				}
			}
		}
		if(isdefined(level.customloadoutscavenge))
		{
			maxammo = self [[level.customloadoutscavenge]](weapon);
		}
		if(maxammo == 0)
		{
			continue;
		}
		if(weapon.rootweapon == level.weaponsatchelcharge)
		{
			if(player weaponobjects::anyobjectsinworld(weapon.rootweapon))
			{
				continue;
			}
		}
		stock = player getweaponammostock(weapon);
		if(weapon.isheavyweapon && is_true(level.overrideammodropheavyweapon))
		{
			ammo = stock + weapon.clipsize;
			if(ammo > maxammo)
			{
				ammo = maxammo;
			}
			player setweaponammostock(weapon, ammo);
			player.scavenged = 1;
			continue;
		}
		if(stock < maxammo)
		{
			ammo = stock + 1;
			if(ammo > maxammo)
			{
				ammo = maxammo;
			}
			else if(isdefined(loadout))
			{
				if("primarygrenade" == player loadout::function_8435f729(weapon))
				{
					player callback::callback(#"scavenged_primary_grenade", {#weapon:weapon});
				}
			}
			player setweaponammostock(weapon, ammo);
			player.scavenged = 1;
		}
	}
	for(i = 0; i < primary_weapons.size; i++)
	{
		weapon = primary_weapons[i];
		if(is_true(weapon.var_cc0ed831))
		{
			continue;
		}
		stock = player getweaponammostock(weapon);
		start = player getfractionstartammo(weapon);
		clip = weapon.clipsize;
		clip = clip * getdvarfloat(#"scavenger_clip_multiplier", 1);
		clip = int(clip);
		maxammo = weapon.maxammo;
		if(stock < maxammo - (clip * 3))
		{
			ammo = stock + (clip * 3);
			player setweaponammostock(weapon, ammo);
			continue;
		}
		player setweaponammostock(weapon, maxammo);
	}
}

