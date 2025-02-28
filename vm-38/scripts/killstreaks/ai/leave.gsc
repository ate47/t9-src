#using scripts\killstreaks\ai\state.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace leave;

/*
	Name: function_a405a1d0
	Namespace: leave
	Checksum: 0xBE5F77A6
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a405a1d0()
{
	level notify(1853785604);
}

#namespace ai_leave;

/*
	Name: init
	Namespace: ai_leave
	Checksum: 0x50082918
	Offset: 0xA8
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function init()
{
	ai_state::function_e9b061a8(2, &make_leave, &update_leave, undefined, &update_enemy, &function_4af1ff64, &function_a78474f2);
}

/*
	Name: init_leave
	Namespace: ai_leave
	Checksum: 0x5B875FB3
	Offset: 0x118
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function init_leave(var_edc20efd)
{
	/#
		assert(isdefined(self.ai));
	#/
	self.ai.leave = {#hash_edc20efd:var_edc20efd, #state:0};
}

/*
	Name: function_4af1ff64
	Namespace: ai_leave
	Checksum: 0x663EAE22
	Offset: 0x188
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function function_4af1ff64()
{
	return self.ai.leave.var_edc20efd;
}

/*
	Name: function_a78474f2
	Namespace: ai_leave
	Checksum: 0xBBA1EFC8
	Offset: 0x1B0
	Size: 0xA
	Parameters: 0
	Flags: None
*/
function function_a78474f2()
{
	return self.origin;
}

/*
	Name: update_enemy
	Namespace: ai_leave
	Checksum: 0x789003B7
	Offset: 0x1C8
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function update_enemy()
{
	if(is_true(self.ai.hasseenfavoriteenemy))
	{
		self.ai.leave.state = 2;
		return;
	}
	if(self.ai.leave.state != 1)
	{
		self thread make_leave();
	}
}

/*
	Name: update_leave
	Namespace: ai_leave
	Checksum: 0x80F724D1
	Offset: 0x250
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function update_leave()
{
}

/*
	Name: function_e35eee4d
	Namespace: ai_leave
	Checksum: 0x9F132F03
	Offset: 0x260
	Size: 0x138
	Parameters: 0
	Flags: None
*/
function function_e35eee4d()
{
	self endon(#"death");
	level endon(#"game_ended");
	while(true)
	{
		players = getplayers();
		var_2282e309 = 0;
		foreach(player in players)
		{
			if(sighttracepassed(self geteye(), player geteye(), 0, undefined))
			{
				var_2282e309 = 1;
				break;
			}
		}
		if(!var_2282e309)
		{
			self delete();
		}
		wait(0.5);
	}
}

/*
	Name: make_leave
	Namespace: ai_leave
	Checksum: 0xE688CAA8
	Offset: 0x3A0
	Size: 0x164
	Parameters: 0
	Flags: None
*/
function make_leave()
{
	self endon(#"death");
	self notify(#"make_leave");
	self endon(#"make_leave");
	self callback::callback(#"hash_c3f225c9fa3cb25");
	self.ai.leave.state = 1;
	if(!isdefined(self.exit_spawn))
	{
		util::wait_network_frame(2);
		self delete();
	}
	self thread function_e35eee4d();
	self function_d4c687c9();
	self pathmode("move allowed");
	self setgoal(self.exit_spawn.origin, 0, 32);
	self waittilltimeout(10, #"goal");
	waittillframeend();
	self delete();
}

/*
	Name: function_233ddd28
	Namespace: ai_leave
	Checksum: 0xF134DA4B
	Offset: 0x510
	Size: 0xFE
	Parameters: 2
	Flags: None
*/
function function_233ddd28(origin, team)
{
	spawns = level.spawn_start[team];
	closest = undefined;
	closest_dist = 10000000;
	foreach(spawn in spawns)
	{
		dist = distancesquared(spawn.origin, origin);
		if(dist < closest_dist)
		{
			closest_dist = dist;
			closest = spawn;
		}
	}
	return closest;
}

