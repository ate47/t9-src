#using script_72401f526ba71638;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_d2304f18;

/*
	Name: function_89f2df9
	Namespace: namespace_d2304f18
	Checksum: 0x3E44B043
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_493e4f8e3fb8b3d7", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d2304f18
	Checksum: 0x56D7CC72
	Offset: 0x130
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::register_powerup("hero_weapon_power", &hero_weapon_power);
	if(zm_powerups::function_cc33adc8())
	{
		if(zm_utility::function_c200446c())
		{
			zm_powerups::add_zombie_powerup("hero_weapon_power", "p8_zm_powerup_full_power", #"hash_50af8943ead42bcc", &function_7e51ac0f, 0, 0, 0);
		}
		else
		{
			zm_powerups::add_zombie_powerup("hero_weapon_power", "p8_zm_powerup_full_power", #"hash_50af8943ead42bcc", &zm_powerups::func_should_never_drop, 0, 0, 0);
		}
	}
}

/*
	Name: function_7e51ac0f
	Namespace: namespace_d2304f18
	Checksum: 0x64685145
	Offset: 0x220
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function function_7e51ac0f()
{
	return level.var_197c8eb1;
}

/*
	Name: hero_weapon_power
	Namespace: namespace_d2304f18
	Checksum: 0x31F7F391
	Offset: 0x238
	Size: 0x1FE
	Parameters: 1
	Flags: Linked
*/
function hero_weapon_power(e_player)
{
	foreach(player in function_a1ef346b())
	{
		if(isdefined(player) && isplayer(player) && isdefined(self.hint))
		{
			player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", self.hint);
		}
		if(!isalive(player) || !isdefined(player.inventory.items[12].count) || !isdefined(player.var_c9448182))
		{
			continue;
		}
		var_41db60bc = player.inventory.items[12].count;
		if(var_41db60bc < player.var_c9448182)
		{
			player namespace_1b527536::function_6457e4cd(player.var_87f72f8);
			var_41db60bc = player.inventory.items[12].count;
			if(var_41db60bc == player.var_c9448182)
			{
				player.var_8da24ed0 = player.var_fc8023b4;
				player clientfield::set_player_uimodel("hud_items.ammoCooldowns.fieldUpgrade", 1);
			}
			waitframe(1);
		}
	}
}

