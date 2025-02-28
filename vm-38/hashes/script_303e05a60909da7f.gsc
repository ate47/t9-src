#using scripts\mp_common\player\player_utils.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace high_value_target;

/*
	Name: function_dce756af
	Namespace: high_value_target
	Checksum: 0xEEBBD7AC
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dce756af()
{
	level notify(458403634);
}

/*
	Name: __init__system__
	Namespace: high_value_target
	Checksum: 0xF8831DA
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"high_value_target", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: high_value_target
	Checksum: 0x4FDEB691
	Offset: 0x110
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_8d51c9b1 = getgametypesetting(#"hash_6141cddd96ac214e");
	callback::on_spawned(&onplayerspawned);
	player::function_cf3aa03d(&onplayerkilled);
}

/*
	Name: onplayerspawned
	Namespace: high_value_target
	Checksum: 0xC5BC0185
	Offset: 0x188
	Size: 0xDA
	Parameters: 0
	Flags: Linked
*/
function onplayerspawned()
{
	killstreakcount = (isdefined(self.pers[#"cur_kill_streak"]) ? self.pers[#"cur_kill_streak"] : 0);
	if(killstreakcount < level.var_8d51c9b1)
	{
		if(self.ishvt !== 0)
		{
			self clientfield::set("high_value_target", 0);
			self.ishvt = 0;
		}
	}
	else if(self.ishvt !== 1)
	{
		self clientfield::set("high_value_target", 1);
		self.ishvt = 1;
	}
}

/*
	Name: onplayerkilled
	Namespace: high_value_target
	Checksum: 0x9909A996
	Offset: 0x270
	Size: 0x274
	Parameters: 9
	Flags: Linked
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(isdefined(psoffsettime) && isdefined(psoffsettime.pers[#"cur_kill_streak"]))
	{
		var_f5d993e3 = (isdefined(psoffsettime.pers[#"cur_kill_streak"]) ? psoffsettime.pers[#"cur_kill_streak"] : 0);
		if(var_f5d993e3 >= level.var_8d51c9b1 && psoffsettime clientfield::get("high_value_target") !== 1)
		{
			psoffsettime clientfield::set("high_value_target", 1);
			psoffsettime.ishvt = 1;
		}
	}
	if(isdefined(self) && self.ishvt === 1)
	{
		if(isdefined(psoffsettime) && isplayer(psoffsettime) && psoffsettime hasperk(#"hash_1c40ade36b54ff8") && psoffsettime != self && psoffsettime.team != self.team)
		{
			var_13f7eb29 = self.pers[#"kill_streak_before_death"];
			if(!isdefined(var_13f7eb29) || var_13f7eb29 < level.var_8d51c9b1)
			{
				return;
			}
			if(var_13f7eb29 > 20)
			{
				scoreevent = #"hash_782e222fd957d953" + 20;
			}
			else
			{
				scoreevent = #"hash_782e222fd957d953" + var_13f7eb29;
			}
			scoreevents::processscoreevent(scoreevent, psoffsettime, self, deathanimduration);
			psoffsettime contracts::increment_contract(#"hash_587a28da043d491d", 1);
		}
	}
}

