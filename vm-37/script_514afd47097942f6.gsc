#using script_14f4a3c583c77d4b;
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_e699d70d;

/*
	Name: function_89f2df9
	Namespace: namespace_e699d70d
	Checksum: 0xE85FC823
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_51d483b647ad272e", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e699d70d
	Checksum: 0x2CD69F0A
	Offset: 0x100
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_3d10e2fd98b0c3ab", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_e699d70d
	Checksum: 0x71D0359
	Offset: 0x168
	Size: 0x29C
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	callback::on_spawned(&function_dc856fd8);
	callback::on_ai_spawned(&on_ai_spawned);
	foreach(player in getplayers())
	{
		player namespace_b22c99a5::function_8677ce00(1);
		player allowads(0);
		player._allow_ads = 0;
		player thread function_dc856fd8();
		player thread function_16824dc3();
		player thread function_2d961b95();
		player namespace_b22c99a5::function_9bf8e274();
		foreach(var_64225f6c in level.zombie_weapons)
		{
			if(zm_loadout::is_lethal_grenade(var_64225f6c.weapon) || zm_loadout::is_melee_weapon(var_64225f6c.weapon))
			{
				player function_28602a03(var_64225f6c.weapon, 1, 1);
			}
		}
		player namespace_b22c99a5::function_dc9ab223(1, 1);
	}
	callback::function_33f0ddd3(&function_33f0ddd3);
	level zm_trial::function_44200d07(1);
	level zm_trial::function_cd75b690(1);
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_e699d70d
	Checksum: 0xB2A7BE24
	Offset: 0x410
	Size: 0x27C
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	callback::remove_on_spawned(&function_dc856fd8);
	callback::function_824d206(&function_33f0ddd3);
	callback::remove_on_ai_spawned(&on_ai_spawned);
	foreach(player in getplayers())
	{
		player notify(#"allow_ads");
		player._allow_ads = undefined;
		player allowads(1);
		player function_4488a530(0);
		player namespace_b22c99a5::function_73ff0096();
		foreach(var_64225f6c in level.zombie_weapons)
		{
			if(zm_loadout::is_lethal_grenade(var_64225f6c.weapon) || zm_loadout::is_melee_weapon(var_64225f6c.weapon))
			{
				player unlockweapon(var_64225f6c.weapon);
			}
		}
		player namespace_b22c99a5::function_dc9ab223(0, 1);
		player namespace_b22c99a5::function_8677ce00(0);
	}
	level zm_trial::function_44200d07(0);
	level zm_trial::function_cd75b690(0);
}

/*
	Name: on_ai_spawned
	Namespace: namespace_e699d70d
	Checksum: 0x5EB318F5
	Offset: 0x698
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function on_ai_spawned(params)
{
	self disableaimassist();
}

/*
	Name: function_dc856fd8
	Namespace: namespace_e699d70d
	Checksum: 0x4C76D2E8
	Offset: 0x6C8
	Size: 0xC0
	Parameters: 0
	Flags: Private
*/
function private function_dc856fd8()
{
	self notify("7b8b17371dc9188f");
	self endon("7b8b17371dc9188f");
	self endon(#"disconnect", #"allow_ads");
	self allowads(0);
	while(true)
	{
		self waittill(#"hash_7fd32c9551894e64", #"hash_424834e6dee13bc3", #"bgb_update");
		if(isalive(self))
		{
			self allowads(0);
		}
	}
}

/*
	Name: function_16824dc3
	Namespace: namespace_e699d70d
	Checksum: 0x122DECFB
	Offset: 0x790
	Size: 0xEA
	Parameters: 0
	Flags: Private
*/
function private function_16824dc3()
{
	self endon(#"disconnect", #"allow_ads");
	while(true)
	{
		var_f2a06582 = self getcurrentweapon();
		if(isalive(self) && self adsbuttonpressed() && (var_f2a06582.dualwieldweapon === level.weaponnone || var_f2a06582.isriotshield))
		{
			self namespace_b22c99a5::function_97444b02();
			while(self adsbuttonpressed())
			{
				waitframe(1);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_33f0ddd3
	Namespace: namespace_e699d70d
	Checksum: 0xF43176E2
	Offset: 0x888
	Size: 0xAC
	Parameters: 1
	Flags: Private
*/
function private function_33f0ddd3(s_event)
{
	if(s_event.event === "give_weapon")
	{
		self function_28602a03(s_event.weapon, 0, 1);
		if(zm_loadout::is_melee_weapon(s_event.weapon) || zm_loadout::is_lethal_grenade(s_event.weapon))
		{
			self function_28602a03(s_event.weapon, 1, 1);
		}
	}
}

/*
	Name: function_2d961b95
	Namespace: namespace_e699d70d
	Checksum: 0x6252B6BB
	Offset: 0x940
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function function_2d961b95()
{
	self endon(#"disconnect", #"allow_ads");
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = self waittill(#"weapon_change");
		if(isalive(self))
		{
			if(var_be17187b.weapon.isriotshield)
			{
				self function_4488a530(1);
			}
			else
			{
				self function_4488a530(0);
			}
		}
	}
}

