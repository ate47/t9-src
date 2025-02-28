#using script_5660bae5b402a1eb;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_powerup_free_perk;

/*
	Name: function_89f2df9
	Namespace: zm_powerup_free_perk
	Checksum: 0x62220FE7
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_powerup_free_perk", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_free_perk
	Checksum: 0x939707D
	Offset: 0x138
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::register_powerup("free_perk", &grab_free_perk);
	if(zm_powerups::function_cc33adc8())
	{
		str_model = zm_powerups::function_bcfcc27e();
		zm_powerups::add_zombie_powerup("free_perk", str_model, #"hash_165c84a677f7a58c", &zm_powerups::func_should_never_drop, 0, 0, 0);
	}
}

/*
	Name: grab_free_perk
	Namespace: zm_powerup_free_perk
	Checksum: 0xF2E5F224
	Offset: 0x1E0
	Size: 0x128
	Parameters: 1
	Flags: Linked
*/
function grab_free_perk(var_a3878cd)
{
	foreach(e_player in getplayers())
	{
		if(!e_player laststand::player_is_in_laststand() && e_player.sessionstate != "spectator")
		{
			var_16c042b8 = e_player zm_perks::function_b2cba45a();
		}
		if(isdefined(e_player) && isplayer(e_player) && isdefined(self.hint))
		{
			e_player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", self.hint);
		}
	}
}

