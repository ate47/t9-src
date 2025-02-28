#using script_1883fa4e60abbf9f;
#using script_268625b0934ee2ce;
#using script_3ad66e3076c279ab;
#using script_42e8ee8721f5e6ef;
#using script_6c5ee33879e077f8;
#using script_7e3221b6c80d8cc4;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\cp_common\gametypes\battlechatter.gsc;

#namespace manager;

/*
	Name: scalevolume
	Namespace: manager
	Checksum: 0x376272A3
	Offset: 0x168
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function scalevolume(ent, vol)
{
}

#namespace namespace_393f6012;

/*
	Name: function_89f2df9
	Namespace: namespace_393f6012
	Checksum: 0x5FCB91FF
	Offset: 0x188
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"stealth", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_393f6012
	Checksum: 0x18CE6733
	Offset: 0x1D0
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_ai_spawned(&on_ai_spawned);
	main();
}

/*
	Name: main
	Namespace: namespace_393f6012
	Checksum: 0x3309D180
	Offset: 0x210
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function main()
{
	function_f9682fd();
	/#
		assert(isdefined(level.stealth), "");
	#/
	level.stealth.fnplayerlootenabled = undefined;
	level.stealth.fngetcorpseorigin = &get_corpse_origin;
	level.stealth.fnsetbattlechatter = undefined;
	level.stealth.fnaddeventplaybcs = &addeventplaybcs;
	level.stealth.fnthreatsightsetstateparameters = &threat_sight_set_state_parameters;
	level.stealth.fnthreatsightplayersightaudio = &threat_sight_player_sight_audio;
	level.stealth.fnsetstealthmode = &set_stealth_mode_sp;
	var_cb867b36 = [];
	var_cb867b36[var_cb867b36.size] = #"hash_4f5d6c44d95415a7";
	var_cb867b36[var_cb867b36.size] = #"hash_55d9a1cd61f046";
	namespace_bec1e8ca::function_c5dda35e("stealth", var_cb867b36);
}

/*
	Name: get_corpse_origin
	Namespace: namespace_393f6012
	Checksum: 0x158D3028
	Offset: 0x370
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function get_corpse_origin()
{
	return self getcorpsephysicsorigin();
}

/*
	Name: on_ai_spawned
	Namespace: namespace_393f6012
	Checksum: 0x393C72E7
	Offset: 0x398
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private on_ai_spawned()
{
	if(!isdefined(self.script_stealthgroup) && is_true(self.script_stealth))
	{
		self.script_stealthgroup = "_default";
	}
	if(isdefined(self.script_stealthgroup))
	{
		self namespace_b2b86d39::stealth_call_thread("do_stealth");
	}
}

/*
	Name: set_stealth_mode_sp
	Namespace: namespace_393f6012
	Checksum: 0x94A3B5D3
	Offset: 0x410
	Size: 0x138
	Parameters: 3
	Flags: Linked
*/
function set_stealth_mode_sp(enabled, var_901d9fb2, var_4a9f6f96)
{
	if(var_4a9f6f96)
	{
		foreach(player in getplayers())
		{
			player thread stealth_player::ambient_player_thread();
		}
	}
	else
	{
		foreach(player in getplayers())
		{
			player thread stealth_player::ambient_player_stop();
		}
	}
}

/*
	Name: threat_sight_set_state_parameters
	Namespace: namespace_393f6012
	Checksum: 0xD3BA583E
	Offset: 0x550
	Size: 0x2E2
	Parameters: 1
	Flags: Linked
*/
function threat_sight_set_state_parameters(statename)
{
	var_8c0a9bbb = 1;
	var_f0ed2edb = 1;
	if(!isdefined(statename))
	{
		statename = self.stealth.threat_sight_state;
	}
	if(isdefined(self.stealth.threatsightratescale))
	{
		var_8c0a9bbb = var_8c0a9bbb * self.stealth.threatsightratescale;
	}
	if(isdefined(self.stealth.threatsightdistscale))
	{
		var_f0ed2edb = var_f0ed2edb * self.stealth.threatsightdistscale;
	}
	if(isdefined(level.stealth.threatsightratescale))
	{
		var_8c0a9bbb = var_8c0a9bbb * level.stealth.threatsightratescale;
	}
	if(isdefined(level.stealth.threatsightdistscale))
	{
		var_f0ed2edb = var_f0ed2edb * level.stealth.threatsightdistscale;
	}
	var_218126c3 = level.player.maxvisibledist;
	var_bb0a10d2 = min(200, var_218126c3 * 0.33);
	switch(statename)
	{
		case "hash_5689f41e8c0ad00":
		case "investigate":
		{
			self.threatsightratemin = 0.6 * var_8c0a9bbb;
			self.threatsightratemax = 0.5 * var_8c0a9bbb;
			break;
		}
		case "hash_34309b724f4a2e41":
		{
			self.threatsightratemin = 1 * var_8c0a9bbb;
			self.threatsightratemax = 0.8 * var_8c0a9bbb;
			break;
		}
		case "hash_4b55a59a56c4bdb3":
		{
			self.threatsightratemin = 1 * var_8c0a9bbb;
			self.threatsightratemax = 0.8 * var_8c0a9bbb;
			break;
		}
		default:
		{
			self.threatsightratemin = 0.6 * var_8c0a9bbb;
			self.threatsightratemax = 0.4 * var_8c0a9bbb;
			break;
		}
	}
	self.threatsightdistmin = min(var_bb0a10d2, var_218126c3) * var_f0ed2edb;
	self.threatsightdistmax = max(self.threatsightdistmin, var_218126c3 * var_f0ed2edb);
}

/*
	Name: threat_sight_player_sight_audio
	Namespace: namespace_393f6012
	Checksum: 0x60826212
	Offset: 0x840
	Size: 0x97C
	Parameters: 3
	Flags: Linked
*/
function threat_sight_player_sight_audio(var_56a7a731, maxthreat, var_2107b994)
{
	var_999aef6a = 180;
	var_4d4a8597 = 0.01;
	var_f41a2c65 = 0.05;
	var_c7f21015 = 0.125;
	self endon(#"disconnect");
	self endon(#"death");
	self notify(#"threat_sight_player_sight_audio");
	self endon(#"threat_sight_player_sight_audio");
	/#
		if(!isdefined(var_2107b994))
		{
			var_2107b994 = 0;
		}
	#/
	aliases = [2:"ui_stealth_threat_high_lp", 1:"ui_stealth_threat_med_lp", 0:"ui_stealth_threat_low_lp"];
	if(!getdvarint(#"hash_28758912434b7866", 0))
	{
		maxthreat = 0;
	}
	if(!isdefined(self.stealth.threat_sight_snd_ent) && var_56a7a731 && maxthreat > 0)
	{
		self.stealth.threat_sight_snd_ent = [];
		self.stealth.threat_sight_snd_vol = 0;
		self.stealth.threat_sight_snd_threat = 0;
		foreach(alias in aliases)
		{
			snd_ent = spawn("script_origin", self.origin);
			if(!isplayer(self))
			{
				self thread util::delete_on_death(snd_ent);
			}
			snd_ent linkto(self);
			snd_ent.isplaying = 0;
			self.stealth.threat_sight_snd_ent[alias] = snd_ent;
		}
	}
	/#
		if(var_2107b994)
		{
			debug2dtext((32, 492, 0), ((("" + maxthreat) + "") + var_56a7a731) + "", (1, 1, 1), 1.5);
		}
	#/
	if(isdefined(self.stealth.threat_sight_snd_ent))
	{
		self.stealth.threat_sight_snd_threat = self.stealth.threat_sight_snd_threat - (self.stealth.threat_sight_snd_threat * var_c7f21015);
		self.stealth.threat_sight_snd_threat = self.stealth.threat_sight_snd_threat + (maxthreat * var_c7f21015);
		if(self.stealth.threat_sight_snd_threat < 0.0001)
		{
			self.stealth.threat_sight_snd_threat = 0;
		}
		maxthreat = self.stealth.threat_sight_snd_threat;
	}
	while(isdefined(self.stealth.threat_sight_snd_ent))
	{
		index = 0;
		var_7fe1c557 = 0;
		if(maxthreat > 0)
		{
			if(maxthreat < var_f41a2c65)
			{
				var_9afcb603 = math::clamp(maxthreat, 0, var_f41a2c65);
				mu = var_9afcb603 / var_f41a2c65;
				var_61543340 = 1 - var_4d4a8597;
				var_e425bbd0 = var_4d4a8597 + (var_61543340 * mu);
				self.stealth.threat_sight_snd_vol = var_e425bbd0;
			}
			else
			{
				self.stealth.threat_sight_snd_vol = 1;
			}
		}
		else
		{
			self.stealth.threat_sight_snd_vol = 0;
			self.stealth.threat_sight_snd_threat = 0;
		}
		self.stealth.threat_sight_snd_vol = math::clamp(self.stealth.threat_sight_snd_vol, 0, 1);
		/#
			if(var_2107b994)
			{
				debug2dtext((32, 508, 0), "" + self.stealth.threat_sight_snd_threat, (1, 1, 1), 1.5);
				debug2dtext((32, 524, 0), "" + self.stealth.threat_sight_snd_vol, (1, 1, 1), 1.5);
			}
		#/
		foreach(snd_ent in self.stealth.threat_sight_snd_ent)
		{
			var_3d454e88 = 1;
			switch(index)
			{
				case 0:
				{
					if(maxthreat < 0.75)
					{
						var_3d454e88 = cos((var_999aef6a * maxthreat) * 0.666);
					}
					else
					{
						var_3d454e88 = 0;
					}
					break;
				}
				case 1:
				{
					if(maxthreat < 0.75)
					{
						var_3d454e88 = sin((var_999aef6a * maxthreat) * 0.666);
					}
					else
					{
						if(maxthreat < 1)
						{
							var_3d454e88 = sin((var_999aef6a * (1 - maxthreat)) * 2);
						}
						else
						{
							var_3d454e88 = 0;
						}
					}
					break;
				}
				case 2:
				{
					if(maxthreat < 0.75)
					{
						var_3d454e88 = 0;
					}
					else
					{
						var_3d454e88 = cos((var_999aef6a * (1 - maxthreat)) * 2);
					}
					break;
				}
			}
			vol = math::clamp(self.stealth.threat_sight_snd_vol * var_3d454e88, 0, 1);
			if(vol > 0)
			{
				var_7fe1c557 = 1;
				if(snd_ent.isplaying == 0)
				{
					snd_ent.isplaying = 1;
				}
			}
			else if(snd_ent.isplaying == 1)
			{
				snd_ent.isplaying = 0;
			}
			/#
				if(var_2107b994)
				{
					debug2dtext((32, 540 + (index * 16), 0), (("" + index) + "") + vol, (1, 1, 1), 1.5);
					debug2dtext((384, 540 + (index * 16), 0), "" + var_3d454e88, (1, 1, 1), 1.5);
				}
			#/
			index++;
		}
		if(!var_7fe1c557)
		{
			foreach(snd_ent in self.stealth.threat_sight_snd_ent)
			{
				snd_ent stoploopsound();
				snd_ent delete();
			}
			self.stealth.threat_sight_snd_ent = undefined;
			self.stealth.threat_sight_snd_vol = undefined;
			self.stealth.threat_sight_snd_threat = undefined;
		}
		wait(0.05);
	}
}

/*
	Name: addeventplaybcs
	Namespace: namespace_393f6012
	Checksum: 0x7B9F7BCB
	Offset: 0x11C8
	Size: 0x206
	Parameters: 7
	Flags: Linked
*/
function addeventplaybcs(eventaction, eventtype, modifier, delay, eventstruct, force, var_9c201ccd)
{
	/#
		assert(isdefined(force));
	#/
	alias = undefined;
	responses = undefined;
	switch(force)
	{
		case "idle":
		case "hash_7f696e6d1dbd7282":
		{
			self.stealth.investigatecallin = 0;
			var_9c201ccd = "callin";
			if(math::cointoss())
			{
				var_9c201ccd = "checkin";
			}
			if(var_9c201ccd == "checkin")
			{
				self.checkin = 1;
			}
			else
			{
				self.stealth.callin = 1;
			}
			break;
		}
		case "radio":
		{
			break;
		}
		case "investigate":
		{
			var_9c201ccd = "update";
			if(!is_true(self.stealth.investigatecallin))
			{
				var_2a1d88cd = "callin";
				self.stealth.callin = 1;
				self.stealth.investigatecallin = 1;
			}
			else
			{
				self.update = 1;
			}
			break;
		}
		case "hunt":
		{
			self.stealth.investigatecallin = 0;
			break;
		}
	}
	self battlechatter::function_4e7b6f6d("stealth", force, var_9c201ccd);
	return false;
}

