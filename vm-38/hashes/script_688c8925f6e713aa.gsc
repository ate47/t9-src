#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_3be6f96;

/*
	Name: function_b5a185f8
	Namespace: namespace_3be6f96
	Checksum: 0x24E83935
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b5a185f8()
{
	level notify(693324278);
}

/*
	Name: __init__system__
	Namespace: namespace_3be6f96
	Checksum: 0x57E54611
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_ac585b1d038f6a6", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_3be6f96
	Checksum: 0x8F48F76C
	Offset: 0xE8
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
	zm_trial::register_challenge(#"hash_3ad93d68c19802af", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_3be6f96
	Checksum: 0x4F73ABEB
	Offset: 0x150
	Size: 0x90
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	foreach(player in getplayers())
	{
		player thread function_7bc122af();
	}
}

/*
	Name: on_end
	Namespace: namespace_3be6f96
	Checksum: 0xC9CBEA0
	Offset: 0x1E8
	Size: 0x1B2
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	if(!round_reset)
	{
		var_696c3b4 = [];
		foreach(player in getplayers())
		{
			if(!player.var_53531c80)
			{
				if(!isdefined(var_696c3b4))
				{
					var_696c3b4 = [];
				}
				else if(!isarray(var_696c3b4))
				{
					var_696c3b4 = array(var_696c3b4);
				}
				var_696c3b4[var_696c3b4.size] = player;
			}
		}
		if(var_696c3b4.size)
		{
			zm_trial::fail(#"hash_6a7d01641de1f5c3", var_696c3b4);
		}
	}
	foreach(player in getplayers())
	{
		player zm_trial_util::function_f3aacffb();
		player.var_53531c80 = undefined;
	}
}

/*
	Name: function_7bc122af
	Namespace: namespace_3be6f96
	Checksum: 0x14E7B0A4
	Offset: 0x3A8
	Size: 0x266
	Parameters: 0
	Flags: Private
*/
function private function_7bc122af()
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656", #"end_game");
	self.var_53531c80 = 0;
	self zm_trial_util::function_63060af4(0);
	while(true)
	{
		a_weapons = self getweaponslistprimaries();
		var_1a3ca504 = self zm_loadout::get_player_lethal_grenade();
		if(!isdefined(a_weapons))
		{
			a_weapons = [];
		}
		else if(!isarray(a_weapons))
		{
			a_weapons = array(a_weapons);
		}
		a_weapons[a_weapons.size] = var_1a3ca504;
		var_94020d2 = 1;
		foreach(weapon in a_weapons)
		{
			n_clip_size = self function_f09c133d(weapon);
			var_2cf11630 = self getweaponammoclip(weapon);
			var_45193587 = self getweaponammostock(weapon);
			n_stock_size = min(weapon.maxammo, weapon.startammo);
			if(var_2cf11630 < n_clip_size || var_45193587 < n_stock_size)
			{
				var_94020d2 = 0;
				break;
			}
		}
		if(self.var_53531c80 != var_94020d2)
		{
			self.var_53531c80 = var_94020d2;
			self zm_trial_util::function_63060af4(self.var_53531c80);
		}
		waitframe(1);
	}
}

