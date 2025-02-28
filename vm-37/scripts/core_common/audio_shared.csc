#using script_59f62971655f7103;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\battlechatter.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\trigger_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace audio;

/*
	Name: function_89f2df9
	Namespace: audio
	Checksum: 0x3A0C226E
	Offset: 0x5C8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"audio", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: audio
	Checksum: 0x1C510D43
	Offset: 0x610
	Size: 0x184
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	snd_snapshot_init();
	callback::on_localclient_connect(&player_init);
	callback::on_localplayer_spawned(&local_player_spawn);
	callback::on_localplayer_spawned(&sndsprintbreath);
	callback::on_localplayer_spawned(&function_aa906715);
	callback::function_2870abef(&function_45e99595);
	callback::function_b27200db(&function_bc0a8bd8);
	level thread register_clientfields();
	level thread sndkillcam();
	setsoundcontext("plr_impact", "flesh");
	util::register_system(#"duckcmd", &function_c037c7cd);
	level.var_4fe1773a = getdvarint(#"hash_287dc342cd15a144", 1);
}

/*
	Name: function_d3790fe
	Namespace: audio
	Checksum: 0xB7B5151C
	Offset: 0x7A0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_d3790fe()
{
	function_62ff8d93(1);
	level.var_4fe1773a = 1;
}

/*
	Name: function_21f8b7c3
	Namespace: audio
	Checksum: 0xD317C6E1
	Offset: 0x7D8
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_21f8b7c3()
{
	function_62ff8d93(0);
	level.var_4fe1773a = 0;
}

/*
	Name: register_clientfields
	Namespace: audio
	Checksum: 0x85A73B00
	Offset: 0x808
	Size: 0x43C
	Parameters: 0
	Flags: Linked
*/
function register_clientfields()
{
	clientfield::register("world", "sndMatchSnapshot", 1, 2, "int", &sndmatchsnapshot, 1, 0);
	clientfield::register("scriptmover", "sndRattle", 1, 1, "counter", &sndrattle_server, 1, 0);
	clientfield::register("allplayers", "sndRattle", 1, 1, "counter", &sndrattle_server, 1, 0);
	clientfield::register("toplayer", "sndMelee", 1, 1, "int", &weapon_butt_sounds, 1, 1);
	clientfield::register("vehicle", "sndSwitchVehicleContext", 1, 3, "int", &sndswitchvehiclecontext, 0, 0);
	clientfield::register("toplayer", "sndCCHacking", 1, 2, "int", &sndcchacking, 1, 1);
	clientfield::register("toplayer", "sndTacRig", 1, 1, "int", &sndtacrig, 0, 1);
	clientfield::register("toplayer", "sndLevelStartSnapOff", 1, 1, "int", &sndlevelstartsnapoff, 0, 1);
	clientfield::register("world", "sndIGCsnapshot", 1, 4, "int", &sndigcsnapshot, 1, 0);
	clientfield::register("world", "sndChyronLoop", 1, 1, "int", &sndchyronloop, 0, 0);
	clientfield::register("world", "sndZMBFadeIn", 1, 1, "int", &sndzmbfadein, 1, 0);
	clientfield::register("world", "sndDeactivateSquadSpawnMusic", 1, 1, "int", &snddeactivatesquadspawnmusic, 0, 0);
	clientfield::register("toplayer", "sndVehicleDamageAlarm", 1, 1, "counter", &sndvehicledamagealarm, 0, 0);
	clientfield::register("toplayer", "sndCriticalHealth", 1, 1, "int", &sndcriticalhealth, 0, 1);
	clientfield::register("toplayer", "sndLastStand", 1, 1, "int", &sndlaststand, 0, 0);
}

/*
	Name: local_player_spawn
	Namespace: audio
	Checksum: 0x2C352070
	Offset: 0xC50
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function local_player_spawn(localclientnum)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	if(!sessionmodeismultiplayergame() && !function_f99d2668())
	{
		self thread sndmusicdeathwatcher();
	}
	self thread snd_underwater(localclientnum);
	self thread clientvoicesetup(localclientnum);
}

/*
	Name: player_init
	Namespace: audio
	Checksum: 0xF6F4328E
	Offset: 0xCF8
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function player_init(localclientnum)
{
	if(issplitscreenhost(localclientnum))
	{
		level thread bump_trigger_start(localclientnum);
		level thread init_audio_triggers(localclientnum);
		startsoundrandoms(localclientnum);
		startsoundloops();
		startlineemitters();
		startrattles();
	}
}

/*
	Name: snddeactivatesquadspawnmusic
	Namespace: audio
	Checksum: 0x33ADDD5D
	Offset: 0xDA0
	Size: 0x54
	Parameters: 7
	Flags: Linked
*/
function snddeactivatesquadspawnmusic(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level.var_acf54eb7 = 1;
	}
}

/*
	Name: function_45e99595
	Namespace: audio
	Checksum: 0xA5FFD872
	Offset: 0xE00
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_45e99595(localclientnum)
{
	if(!isdefined(self.var_ef6eb2d4))
	{
		self.var_ef6eb2d4 = self battlechatter::get_player_dialog_alias("exertMantLight");
	}
	if(isdefined(self.var_ef6eb2d4) && soundexists(self.var_ef6eb2d4))
	{
		self playsound(0, self.var_ef6eb2d4);
	}
}

/*
	Name: function_bc0a8bd8
	Namespace: audio
	Checksum: 0x50A574CD
	Offset: 0xE90
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_bc0a8bd8(localclientnum)
{
	if(!isdefined(self.var_3991ee40))
	{
		self.var_3991ee40 = self battlechatter::get_player_dialog_alias("exertMantHeavy");
	}
	if(isdefined(self.var_3991ee40) && soundexists(self.var_3991ee40))
	{
		self playsound(0, self.var_3991ee40);
	}
}

/*
	Name: function_c037c7cd
	Namespace: audio
	Checksum: 0x2B0609E7
	Offset: 0xF20
	Size: 0x34
	Parameters: 3
	Flags: Linked
*/
function function_c037c7cd(clientnum, state, oldstate)
{
	snd_set_snapshot(oldstate);
}

/*
	Name: snddoublejump_watcher
	Namespace: audio
	Checksum: 0x40906E4A
	Offset: 0xF60
	Size: 0x108
	Parameters: 0
	Flags: None
*/
function snddoublejump_watcher()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"doublejump_start");
		trace = tracepoint(self.origin, self.origin - vectorscale((0, 0, 1), 100000));
		trace_surface_type = trace[#"surfacetype"];
		trace_origin = trace[#"position"];
		if(!isdefined(trace) || !isdefined(trace_origin))
		{
			continue;
		}
		if(!isdefined(trace_surface_type))
		{
			trace_surface_type = "default";
		}
		playsound(0, #"veh_jetpack_surface_" + trace_surface_type, trace_origin);
	}
}

/*
	Name: clientvoicesetup
	Namespace: audio
	Checksum: 0x73AE02A0
	Offset: 0x1070
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function clientvoicesetup(localclientnum)
{
	self endon(#"death");
	if(isdefined(level.clientvoicesetup))
	{
		[[level.clientvoicesetup]](localclientnum);
		return;
	}
	self thread sndvonotify("playerbreathinsound", "exert_sniper_hold");
	self thread sndvonotify("playerbreathoutsound", "exert_sniper_exhale");
	self thread sndvonotify("playerbreathgaspsound", "exert_sniper_gasp");
}

/*
	Name: sndvonotify
	Namespace: audio
	Checksum: 0x35315FDC
	Offset: 0x1138
	Size: 0xD8
	Parameters: 2
	Flags: Linked
*/
function sndvonotify(notifystring, dialog)
{
	self endon(#"death");
	for(;;)
	{
		self waittill(notifystring);
		if(!isdefined(self.voiceprefix))
		{
			bundle = self getmpdialogname();
			playerbundle = getscriptbundle(bundle);
			if(!isdefined(playerbundle.voiceprefix))
			{
				continue;
			}
			self.voiceprefix = playerbundle.voiceprefix;
		}
		soundalias = self.voiceprefix + dialog;
		self playsound(0, soundalias);
	}
}

/*
	Name: snd_snapshot_init
	Namespace: audio
	Checksum: 0x1BD3A362
	Offset: 0x1218
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function snd_snapshot_init()
{
	level._sndactivesnapshot = "default";
	level._sndnextsnapshot = "default";
	if(!util::function_3f165ee8())
	{
		if(sessionmodeiscampaigngame() && !function_22a92b8b() && !function_c9705ad4())
		{
			level._sndactivesnapshot = "cmn_level_start";
			level._sndnextsnapshot = "cmn_level_start";
			level thread sndlevelstartduck_shutoff();
		}
		if(sessionmodeiszombiesgame())
		{
			level._sndactivesnapshot = "zmb_game_start_nofade";
			level._sndnextsnapshot = "zmb_game_start_nofade";
		}
	}
	setgroupsnapshot(level._sndactivesnapshot);
	thread snd_snapshot_think();
}

/*
	Name: sndlevelstartduck_shutoff
	Namespace: audio
	Checksum: 0x4D5822BA
	Offset: 0x1340
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function sndlevelstartduck_shutoff()
{
	level waittill(#"sndlevelstartduck_shutoff");
	snd_set_snapshot("default");
}

/*
	Name: function_22a92b8b
	Namespace: audio
	Checksum: 0x24EE4395
	Offset: 0x1380
	Size: 0xFE
	Parameters: 0
	Flags: Linked
*/
function function_22a92b8b()
{
	ignore = 1;
	mapname = util::function_53bbf9d2();
	switch(mapname)
	{
		case "hash_15642edd0e4376f1":
		case "hash_5562580f1b903614":
		case "hash_65a6e39408662d48":
		case "hash_68bac554964f4148":
		case "hash_7bdf016123a0147b":
		{
			ignore = 0;
			break;
		}
	}
	gametype = hash(util::function_5df4294());
	switch(gametype)
	{
		case "download":
		{
			ignore = 1;
			break;
		}
	}
	return ignore;
}

/*
	Name: function_c9705ad4
	Namespace: audio
	Checksum: 0xBCFC0C13
	Offset: 0x1488
	Size: 0x86
	Parameters: 0
	Flags: Linked
*/
function function_c9705ad4()
{
	ignore = 1;
	gametype = hash(util::function_5df4294());
	switch(gametype)
	{
		case "coop":
		case "pvp":
		{
			ignore = 0;
			break;
		}
	}
	return ignore;
}

/*
	Name: snd_set_snapshot
	Namespace: audio
	Checksum: 0x787F256F
	Offset: 0x1518
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function snd_set_snapshot(state)
{
	level._sndnextsnapshot = state;
	/#
		println(("" + state) + "");
	#/
	level notify(#"new_bus");
}

/*
	Name: snd_snapshot_think
	Namespace: audio
	Checksum: 0x8E6D3495
	Offset: 0x1580
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function snd_snapshot_think()
{
	for(;;)
	{
		if(level._sndactivesnapshot == level._sndnextsnapshot)
		{
			level waittill(#"new_bus");
		}
		if(level._sndactivesnapshot == level._sndnextsnapshot)
		{
			continue;
		}
		/#
			assert(isdefined(level._sndnextsnapshot));
		#/
		/#
			assert(isdefined(level._sndactivesnapshot));
		#/
		setgroupsnapshot(level._sndnextsnapshot);
		level._sndactivesnapshot = level._sndnextsnapshot;
	}
}

/*
	Name: soundrandom_thread
	Namespace: audio
	Checksum: 0xF9A33876
	Offset: 0x1650
	Size: 0x210
	Parameters: 2
	Flags: Linked
*/
function soundrandom_thread(localclientnum, randsound)
{
	if(!isdefined(randsound.script_wait_min))
	{
		randsound.script_wait_min = 1;
	}
	if(!isdefined(randsound.script_wait_max))
	{
		randsound.script_wait_max = 3;
	}
	notify_name = undefined;
	if(isdefined(randsound.script_string))
	{
		notify_name = randsound.script_string;
	}
	if(!isdefined(notify_name) && isdefined(randsound.script_sound))
	{
		createsoundrandom(randsound.origin, randsound.script_sound, randsound.script_wait_min, randsound.script_wait_max);
		return;
	}
	randsound.playing = 1;
	if(isdefined(randsound.script_int))
	{
		randsound.playing = randsound.script_int != 0;
	}
	level thread soundrandom_notifywait(notify_name, randsound);
	while(true)
	{
		wait(randomfloatrange(randsound.script_wait_min, randsound.script_wait_max));
		if(isdefined(randsound.script_sound) && is_true(randsound.playing))
		{
			playsound(localclientnum, randsound.script_sound, randsound.origin);
		}
		/#
			if(getdvarint(#"debug_audio", 0) > 0)
			{
				print3d(randsound.origin, function_9e72a96(randsound.script_sound), vectorscale((0, 1, 0), 0.8), 1, 3, 45);
			}
		#/
	}
}

/*
	Name: soundrandom_notifywait
	Namespace: audio
	Checksum: 0x3C2D047
	Offset: 0x1868
	Size: 0x66
	Parameters: 2
	Flags: Linked
*/
function soundrandom_notifywait(notify_name, randsound)
{
	while(true)
	{
		level waittill(notify_name);
		if(is_true(randsound.playing))
		{
			randsound.playing = 0;
		}
		else
		{
			randsound.playing = 1;
		}
	}
}

/*
	Name: startsoundrandoms
	Namespace: audio
	Checksum: 0x8E0C6F2C
	Offset: 0x18D8
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function startsoundrandoms(localclientnum)
{
	level.randoms = struct::get_array("random", "script_label");
	if(isdefined(level.randoms) && level.randoms.size > 0)
	{
		nscriptthreadedrandoms = 0;
		for(i = 0; i < level.randoms.size; i++)
		{
			if(isdefined(level.randoms[i].script_scripted))
			{
				nscriptthreadedrandoms++;
			}
		}
		allocatesoundrandoms(level.randoms.size - nscriptthreadedrandoms);
		for(i = 0; i < level.randoms.size; i++)
		{
			level.randoms[i].angles = undefined;
			thread soundrandom_thread(localclientnum, level.randoms[i]);
		}
	}
}

/*
	Name: soundloopthink
	Namespace: audio
	Checksum: 0xB9676386
	Offset: 0x1A18
	Size: 0x16A
	Parameters: 0
	Flags: Linked
*/
function soundloopthink()
{
	if(!isdefined(self.script_sound))
	{
		return;
	}
	if(!isdefined(self.origin))
	{
		return;
	}
	notifyname = "";
	/#
		assert(isdefined(notifyname));
	#/
	if(isdefined(self.script_string))
	{
		notifyname = self.script_string;
	}
	/#
		assert(isdefined(notifyname));
	#/
	started = 1;
	if(isdefined(self.script_int))
	{
		started = self.script_int != 0;
	}
	if(started)
	{
		soundloopemitter(self.script_sound, self.origin);
	}
	if(notifyname != "")
	{
		for(;;)
		{
			level waittill(notifyname);
			if(started)
			{
				soundstoploopemitter(self.script_sound, self.origin);
				self thread soundloopcheckpointrestore();
			}
			else
			{
				soundloopemitter(self.script_sound, self.origin);
			}
			started = !started;
		}
	}
}

/*
	Name: soundloopcheckpointrestore
	Namespace: audio
	Checksum: 0x1086D69E
	Offset: 0x1B90
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function soundloopcheckpointrestore()
{
	level waittill(#"save_restore");
	soundloopemitter(self.script_sound, self.origin);
}

/*
	Name: soundlinethink
	Namespace: audio
	Checksum: 0x26A25520
	Offset: 0x1BD8
	Size: 0x17A
	Parameters: 0
	Flags: Linked
*/
function soundlinethink()
{
	if(!isdefined(self.target))
	{
		return;
	}
	target = struct::get(self.target, "targetname");
	if(!isdefined(target))
	{
		return;
	}
	notifyname = "";
	if(isdefined(self.script_string))
	{
		notifyname = self.script_string;
	}
	started = 1;
	if(isdefined(self.script_int))
	{
		started = self.script_int != 0;
	}
	if(started)
	{
		soundlineemitter(self.script_sound, self.origin, target.origin);
	}
	if(notifyname != "")
	{
		for(;;)
		{
			level waittill(notifyname);
			if(started)
			{
				soundstoplineemitter(self.script_sound, self.origin, target.origin);
				self thread soundlinecheckpointrestore(target);
			}
			else
			{
				soundlineemitter(self.script_sound, self.origin, target.origin);
			}
			started = !started;
		}
	}
}

/*
	Name: soundlinecheckpointrestore
	Namespace: audio
	Checksum: 0x4190875C
	Offset: 0x1D60
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function soundlinecheckpointrestore(target)
{
	level waittill(#"save_restore");
	soundlineemitter(self.script_sound, self.origin, target.origin);
}

/*
	Name: startsoundloops
	Namespace: audio
	Checksum: 0x520B3F13
	Offset: 0x1DB8
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function startsoundloops()
{
	level.loopers = struct::get_array("looper", "script_label");
	if(isdefined(level.loopers) && level.loopers.size > 0)
	{
		delay = 0;
		/#
			if(getdvarint(#"debug_audio", 0) > 0)
			{
				println(("" + level.loopers.size) + "");
			}
		#/
		for(i = 0; i < level.loopers.size; i++)
		{
			level.loopers[i].angles = undefined;
			level.loopers[i].script_label = undefined;
			level.loopers[i] thread soundloopthink();
			delay = delay + 1;
			if((delay % 20) == 0)
			{
				waitframe(1);
			}
		}
	}
	else
	{
		/#
			println("");
		#/
		if(getdvarint(#"debug_audio", 0) > 0)
		{
		}
	}
}

/*
	Name: startlineemitters
	Namespace: audio
	Checksum: 0x35AABBD8
	Offset: 0x1F68
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function startlineemitters()
{
	level.lineemitters = struct::get_array("line_emitter", "script_label");
	if(isdefined(level.lineemitters) && level.lineemitters.size > 0)
	{
		delay = 0;
		/#
			if(getdvarint(#"debug_audio", 0) > 0)
			{
				println(("" + level.lineemitters.size) + "");
			}
		#/
		for(i = 0; i < level.lineemitters.size; i++)
		{
			level.lineemitters[i].angles = undefined;
			level.lineemitters[i].script_label = undefined;
			level.lineemitters[i] thread soundlinethink();
			delay = delay + 1;
			if((delay % 20) == 0)
			{
				waitframe(1);
			}
		}
	}
	else
	{
		/#
			println("");
		#/
		if(getdvarint(#"debug_audio", 0) > 0)
		{
		}
	}
}

/*
	Name: startrattles
	Namespace: audio
	Checksum: 0x3888045A
	Offset: 0x2118
	Size: 0x160
	Parameters: 0
	Flags: Linked
*/
function startrattles()
{
	rattles = struct::get_array("sound_rattle", "script_label");
	if(isdefined(rattles))
	{
		/#
			println(("" + rattles.size) + "");
		#/
		delay = 0;
		for(i = 0; i < rattles.size; i++)
		{
			soundrattlesetup(rattles[i].script_sound, rattles[i].origin);
			delay = delay + 1;
			if((delay % 20) == 0)
			{
				waitframe(1);
			}
		}
	}
	foreach(rattle in rattles)
	{
		rattle struct::delete();
	}
}

/*
	Name: init_audio_triggers
	Namespace: audio
	Checksum: 0x985714F0
	Offset: 0x2280
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function init_audio_triggers(localclientnum)
{
	util::waitforclient(localclientnum);
	steptrigs = getentarray(localclientnum, "audio_step_trigger", "targetname");
	materialtrigs = getentarray(localclientnum, "audio_material_trigger", "targetname");
	/#
		if(getdvarint(#"debug_audio", 0) > 0)
		{
			println(("" + steptrigs.size) + "");
			println(("" + materialtrigs.size) + "");
		}
	#/
	array::thread_all(steptrigs, &audio_step_trigger, localclientnum);
	array::thread_all(materialtrigs, &audio_material_trigger, localclientnum);
}

/*
	Name: audio_step_trigger
	Namespace: audio
	Checksum: 0xA1C4A21
	Offset: 0x23D8
	Size: 0xBE
	Parameters: 1
	Flags: Linked
*/
function audio_step_trigger(localclientnum)
{
	var_887fc615 = self getentitynumber();
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		if(!waitresult.activator trigger::ent_already_in(var_887fc615))
		{
			self thread trigger::function_521edc64(waitresult.activator, &trig_enter_audio_step_trigger, &trig_leave_audio_step_trigger);
		}
		waitframe(1);
	}
}

/*
	Name: audio_material_trigger
	Namespace: audio
	Checksum: 0xA886B17A
	Offset: 0x24A0
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function audio_material_trigger(trig)
{
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		self thread trigger::function_521edc64(waitresult.activator, &trig_enter_audio_material_trigger, &trig_leave_audio_material_trigger);
	}
}

/*
	Name: trig_enter_audio_material_trigger
	Namespace: audio
	Checksum: 0xC6167B6F
	Offset: 0x2518
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function trig_enter_audio_material_trigger(player)
{
	if(!isdefined(player.inmaterialoverridetrigger))
	{
		player.inmaterialoverridetrigger = 0;
	}
	if(isdefined(self.script_label))
	{
		player.inmaterialoverridetrigger++;
		player.audiomaterialoverride = self.script_label;
		player setmaterialoverride(self.script_label);
	}
}

/*
	Name: trig_leave_audio_material_trigger
	Namespace: audio
	Checksum: 0x6DAC9A36
	Offset: 0x2590
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function trig_leave_audio_material_trigger(player)
{
	if(isdefined(self.script_label))
	{
		player.inmaterialoverridetrigger--;
		/#
			/#
				assert(player.inmaterialoverridetrigger >= 0);
			#/
		#/
		if(player.inmaterialoverridetrigger <= 0)
		{
			player.audiomaterialoverride = undefined;
			player.inmaterialoverridetrigger = 0;
			player clearmaterialoverride();
		}
	}
}

/*
	Name: trig_enter_audio_step_trigger
	Namespace: audio
	Checksum: 0x61380D54
	Offset: 0x2628
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function trig_enter_audio_step_trigger(trigplayer)
{
	localclientnum = self._localclientnum;
	if(!isdefined(trigplayer.insteptrigger))
	{
		trigplayer.insteptrigger = 0;
	}
	suffix = "_npc";
	if(trigplayer function_21c0fa55())
	{
		suffix = "_plr";
	}
	if(isdefined(self.script_step_alias))
	{
		trigplayer.step_sound = self.script_step_alias;
		trigplayer.insteptrigger = trigplayer.insteptrigger + 1;
		trigplayer setsteptriggersound(self.script_step_alias + suffix);
	}
	if(isdefined(self.script_step_alias_enter) && trigplayer getmovementtype() == "sprint")
	{
		volume = get_vol_from_speed(trigplayer);
		trigplayer playsound(localclientnum, self.script_step_alias_enter + suffix, self.origin, volume);
	}
}

/*
	Name: trig_leave_audio_step_trigger
	Namespace: audio
	Checksum: 0xDE578787
	Offset: 0x2770
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function trig_leave_audio_step_trigger(trigplayer)
{
	localclientnum = self._localclientnum;
	suffix = "_npc";
	if(trigplayer function_21c0fa55())
	{
		suffix = "_plr";
	}
	if(isdefined(self.script_step_alias_exit) && trigplayer getmovementtype() == "sprint")
	{
		volume = get_vol_from_speed(trigplayer);
		trigplayer playsound(localclientnum, self.script_step_alias_exit + suffix, self.origin, volume);
	}
	if(isdefined(self.script_step_alias))
	{
		trigplayer.insteptrigger = trigplayer.insteptrigger - 1;
	}
	if(trigplayer.insteptrigger < 0)
	{
		/#
			println("");
		#/
		trigplayer.insteptrigger = 0;
	}
	if(trigplayer.insteptrigger == 0)
	{
		trigplayer.step_sound = "none";
		trigplayer clearsteptriggersound();
	}
}

/*
	Name: bump_trigger_start
	Namespace: audio
	Checksum: 0xC925DBBB
	Offset: 0x28D8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function bump_trigger_start(localclientnum)
{
	bump_trigs = getentarray(localclientnum, "audio_bump_trigger", "targetname");
	for(i = 0; i < bump_trigs.size; i++)
	{
		bump_trigs[i] thread thread_bump_trigger(localclientnum);
	}
}

/*
	Name: thread_bump_trigger
	Namespace: audio
	Checksum: 0xAAE5EBD3
	Offset: 0x2960
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function thread_bump_trigger(localclientnum)
{
	self thread bump_trigger_listener();
	if(!isdefined(self.script_activated))
	{
		self.script_activated = 1;
	}
	self._localclientnum = localclientnum;
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		self thread trigger::function_521edc64(waitresult.activator, &trig_enter_bump, &trig_leave_bump);
	}
}

/*
	Name: trig_enter_bump
	Namespace: audio
	Checksum: 0xD5BAFE24
	Offset: 0x2A10
	Size: 0x1F4
	Parameters: 1
	Flags: Linked
*/
function trig_enter_bump(ent)
{
	if(!isdefined(ent))
	{
		return;
	}
	if(!isdefined(self.script_bump_volume_threshold))
	{
		self.script_bump_volume_threshold = 0.75;
	}
	localclientnum = self._localclientnum;
	volume = get_vol_from_speed(ent);
	if(!sessionmodeiszombiesgame())
	{
		if(isplayer(ent) && ent hasperk(localclientnum, "specialty_quieter"))
		{
			volume = volume / 2;
		}
	}
	if(isdefined(self.script_bump_alias) && self.script_activated)
	{
		self playsound(localclientnum, self.script_bump_alias, self.origin, volume);
	}
	if(isdefined(self.script_bump_alias_soft) && self.script_bump_volume_threshold > volume && self.script_activated)
	{
		self playsound(localclientnum, self.script_bump_alias_soft, self.origin, volume);
	}
	if(isdefined(self.script_bump_alias_hard) && self.script_bump_volume_threshold <= volume && self.script_activated)
	{
		self playsound(localclientnum, self.script_bump_alias_hard, self.origin, volume);
	}
	if(isdefined(self.script_mantle_alias) && self.script_activated)
	{
		ent thread mantle_wait(self.script_mantle_alias, localclientnum);
	}
}

/*
	Name: mantle_wait
	Namespace: audio
	Checksum: 0xB153DD8
	Offset: 0x2C10
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function mantle_wait(alias, localclientnum)
{
	self endon(#"death");
	self endon(#"left_mantle");
	self waittill(#"traversesound");
	self playsound(localclientnum, alias, self.origin, 1);
}

/*
	Name: trig_leave_bump
	Namespace: audio
	Checksum: 0x65117C12
	Offset: 0x2C88
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function trig_leave_bump(ent)
{
	wait(1);
	ent notify(#"left_mantle");
}

/*
	Name: bump_trigger_listener
	Namespace: audio
	Checksum: 0x7B378F13
	Offset: 0x2CB8
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function bump_trigger_listener()
{
	if(isdefined(self.script_label))
	{
		level waittill(self.script_label);
		self.script_activated = 0;
	}
}

/*
	Name: scale_speed
	Namespace: audio
	Checksum: 0x7238C332
	Offset: 0x2CF0
	Size: 0xA4
	Parameters: 5
	Flags: Linked
*/
function scale_speed(x1, x2, y1, y2, z)
{
	if(z < x1)
	{
		z = x1;
	}
	if(z > x2)
	{
		z = x2;
	}
	dx = x2 - x1;
	n = (z - x1) / dx;
	dy = y2 - y1;
	w = (n * dy) + y1;
	return w;
}

/*
	Name: get_vol_from_speed
	Namespace: audio
	Checksum: 0x29A883C3
	Offset: 0x2DA0
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function get_vol_from_speed(player)
{
	min_speed = 20;
	max_speed = 200;
	max_vol = 1;
	min_vol = 0.1;
	speed = player getspeed();
	abs_speed = absolute_value(int(speed));
	volume = scale_speed(min_speed, max_speed, min_vol, max_vol, abs_speed);
	return volume;
}

/*
	Name: absolute_value
	Namespace: audio
	Checksum: 0xF9DA9F52
	Offset: 0x2E78
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function absolute_value(fowd)
{
	if(fowd < 0)
	{
		return fowd * -1;
	}
	return fowd;
}

/*
	Name: closest_point_on_line_to_point
	Namespace: audio
	Checksum: 0x38C2E82E
	Offset: 0x2EB0
	Size: 0x1AE
	Parameters: 3
	Flags: Linked
*/
function closest_point_on_line_to_point(point, linestart, lineend)
{
	self endon(#"hash_66fcfbe39e07bd83");
	linemagsqrd = lengthsquared(lineend - linestart);
	t = (point[0] - linestart[0]) * (lineend[0] - linestart[0]) + (point[1] - linestart[1]) * (lineend[1] - linestart[1]) + (point[2] - linestart[2]) * (lineend[2] - linestart[2]) / linemagsqrd;
	if(t < 0)
	{
		self.origin = linestart;
	}
	else
	{
		if(t > 1)
		{
			self.origin = lineend;
		}
		else
		{
			start_x = linestart[0] + (t * (lineend[0] - linestart[0]));
			start_y = linestart[1] + (t * (lineend[1] - linestart[1]));
			start_z = linestart[2] + (t * (lineend[2] - linestart[2]));
			self.origin = (start_x, start_y, start_z);
		}
	}
}

/*
	Name: snd_play_auto_fx
	Namespace: audio
	Checksum: 0xF446C198
	Offset: 0x3068
	Size: 0x74
	Parameters: 9
	Flags: None
*/
function snd_play_auto_fx(fxid, alias, offsetx, offsety, offsetz, onground, area, threshold, alias_override)
{
	soundplayautofx(fxid, alias, offsetx, offsety, offsetz, onground, area, threshold, alias_override);
}

/*
	Name: snd_print_fx_id
	Namespace: audio
	Checksum: 0xA4B4025B
	Offset: 0x30E8
	Size: 0x74
	Parameters: 3
	Flags: None
*/
function snd_print_fx_id(fxid, type, ent)
{
	/#
		if(getdvarint(#"debug_audio", 0) > 0)
		{
			println((("" + type) + "") + ent);
		}
	#/
}

/*
	Name: debug_line_emitter
	Namespace: audio
	Checksum: 0xB9CB263B
	Offset: 0x3168
	Size: 0x10E
	Parameters: 0
	Flags: None
*/
function debug_line_emitter()
{
	while(true)
	{
		/#
			if(getdvarint(#"debug_audio", 0) > 0)
			{
				line(self.start, self.end, (0, 1, 0));
				print3d(self.start, "", vectorscale((0, 1, 0), 0.8), 1, 3, 1);
				print3d(self.end, "", vectorscale((0, 1, 0), 0.8), 1, 3, 1);
				print3d(self.origin, self.script_sound, vectorscale((0, 1, 0), 0.8), 1, 3, 1);
			}
			waitframe(1);
		#/
	}
}

/*
	Name: move_sound_along_line
	Namespace: audio
	Checksum: 0xEE355570
	Offset: 0x3280
	Size: 0x100
	Parameters: 0
	Flags: None
*/
function move_sound_along_line()
{
	closest_dist = undefined;
	/#
		self thread debug_line_emitter();
	#/
	while(true)
	{
		self closest_point_on_line_to_point(getlocalclientpos(0), self.start, self.end);
		if(isdefined(self.fake_ent))
		{
			self.fake_ent.origin = self.origin;
		}
		closest_dist = distancesquared(getlocalclientpos(0), self.origin);
		if(closest_dist > 1048576)
		{
			wait(2);
		}
		else
		{
			if(closest_dist > 262144)
			{
				wait(0.2);
			}
			else
			{
				wait(0.05);
			}
		}
	}
}

/*
	Name: playloopat
	Namespace: audio
	Checksum: 0xE327A3AB
	Offset: 0x3388
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function playloopat(aliasname, origin)
{
	soundloopemitter(aliasname, origin);
}

/*
	Name: stoploopat
	Namespace: audio
	Checksum: 0x4EAE86A7
	Offset: 0x33C0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function stoploopat(aliasname, origin)
{
	soundstoploopemitter(aliasname, origin);
}

/*
	Name: soundwait
	Namespace: audio
	Checksum: 0x9B3F7FF0
	Offset: 0x33F8
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function soundwait(id)
{
	while(soundplaying(id))
	{
		wait(0.1);
	}
}

/*
	Name: snd_underwater
	Namespace: audio
	Checksum: 0xFAA89287
	Offset: 0x3438
	Size: 0x378
	Parameters: 1
	Flags: Linked
*/
function snd_underwater(localclientnum)
{
	level endon(#"demo_jump");
	self endon(#"death");
	level endon("killcam_begin" + localclientnum);
	level endon("killcam_end" + localclientnum);
	self endon(#"sndenduwwatcher");
	if(!isdefined(level.audiosharedswimming))
	{
		level.audiosharedswimming = 0;
	}
	if(!isdefined(level.audiosharedunderwater))
	{
		level.audiosharedunderwater = 0;
	}
	setsoundcontext("water_global", "over");
	if(level.audiosharedswimming != isswimming(localclientnum))
	{
		level.audiosharedswimming = isswimming(localclientnum);
		if(level.audiosharedswimming)
		{
			swimbegin();
		}
		else
		{
			swimcancel(localclientnum);
		}
	}
	if(level.audiosharedunderwater != isunderwater(localclientnum))
	{
		level.audiosharedunderwater = isunderwater(localclientnum);
		if(level.audiosharedunderwater)
		{
			self underwaterbegin();
		}
		else
		{
			self underwaterend();
		}
	}
	while(true)
	{
		underwaternotify = undefined;
		underwaternotify = self waittill(#"underwater_begin", #"underwater_end", #"swimming_begin", #"swimming_end", #"death", #"sndenduwwatcher");
		if(underwaternotify._notify == "death")
		{
			self underwaterend();
			self swimend(localclientnum);
		}
		if(underwaternotify._notify == "underwater_begin")
		{
			self underwaterbegin();
		}
		else
		{
			if(underwaternotify._notify == "underwater_end")
			{
				self underwaterend();
			}
			else
			{
				if(underwaternotify._notify == "swimming_begin")
				{
					self swimbegin();
				}
				else if(underwaternotify._notify == "swimming_end" && isplayer(self) && isalive(self))
				{
					self swimend(localclientnum);
				}
			}
		}
	}
}

/*
	Name: underwaterbegin
	Namespace: audio
	Checksum: 0xF5D02801
	Offset: 0x37B8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function underwaterbegin()
{
	level.audiosharedunderwater = 1;
	setsoundcontext("water_global", "under");
}

/*
	Name: underwaterend
	Namespace: audio
	Checksum: 0xBC5D5953
	Offset: 0x37F8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function underwaterend()
{
	level.audiosharedunderwater = 0;
	setsoundcontext("water_global", "over");
}

/*
	Name: swimbegin
	Namespace: audio
	Checksum: 0xA5127FD2
	Offset: 0x3838
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function swimbegin()
{
	self.audiosharedswimming = 1;
}

/*
	Name: swimend
	Namespace: audio
	Checksum: 0x480FC92E
	Offset: 0x3858
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function swimend(localclientnum)
{
	self.audiosharedswimming = 0;
}

/*
	Name: swimcancel
	Namespace: audio
	Checksum: 0x62BE8C43
	Offset: 0x3878
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function swimcancel(localclientnum)
{
	self.audiosharedswimming = 0;
}

/*
	Name: soundplayuidecodeloop
	Namespace: audio
	Checksum: 0x40C944D3
	Offset: 0x3898
	Size: 0xD6
	Parameters: 2
	Flags: Linked
*/
function soundplayuidecodeloop(decodestring, playtimems)
{
	if(!isdefined(level.playinguidecodeloop) || !level.playinguidecodeloop)
	{
		level.playinguidecodeloop = 1;
		fake_ent = spawn(0, (0, 0, 0), "script_origin");
		if(isdefined(fake_ent))
		{
			fake_ent playloopsound(#"uin_notify_data_loop");
			wait(float(playtimems) / 1000);
			fake_ent stopallloopsounds(0);
		}
		level.playinguidecodeloop = undefined;
	}
}

/*
	Name: setcurrentambientstate
	Namespace: audio
	Checksum: 0x4686F69C
	Offset: 0x3978
	Size: 0x2C
	Parameters: 5
	Flags: Linked
*/
function setcurrentambientstate(ambientroom, ambientpackage, roomcollidercent, packagecollidercent, defaultroom)
{
}

/*
	Name: sndcriticalhealth
	Namespace: audio
	Checksum: 0xECE0F0E9
	Offset: 0x39B0
	Size: 0x11E
	Parameters: 7
	Flags: Linked
*/
function sndcriticalhealth(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::function_89a98f85();
	if(function_65b9eb0f(fieldname))
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!self function_21c0fa55())
	{
		return;
	}
	if(!isdefined(self.var_2f6077ac))
	{
		self.var_2f6077ac = self.origin;
	}
	if(bwastimejump)
	{
		playsound(fieldname, #"chr_health_lowhealth_enter", (0, 0, 0));
		playloopat("chr_health_lowhealth_loop", self.var_2f6077ac);
	}
	else
	{
		stoploopat("chr_health_lowhealth_loop", self.var_2f6077ac);
		self.var_2f6077ac = undefined;
	}
}

/*
	Name: sndlaststand
	Namespace: audio
	Checksum: 0xE6D42E99
	Offset: 0x3AD8
	Size: 0x11E
	Parameters: 7
	Flags: Linked
*/
function sndlaststand(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::function_89a98f85();
	if(function_65b9eb0f(fieldname))
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!self function_21c0fa55())
	{
		return;
	}
	if(!isdefined(self.sndlaststand))
	{
		self.sndlaststand = self.origin;
	}
	if(bwastimejump)
	{
		playsound(fieldname, #"chr_health_laststand_enter", (0, 0, 0));
		playloopat("chr_health_laststand_loop", self.sndlaststand);
	}
	else
	{
		stoploopat("chr_health_laststand_loop", self.sndlaststand);
		self.sndlaststand = undefined;
	}
}

/*
	Name: sndtacrig
	Namespace: audio
	Checksum: 0x4CAFDAF0
	Offset: 0x3C00
	Size: 0x62
	Parameters: 7
	Flags: Linked
*/
function sndtacrig(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.sndtacrigemergencyreserve = 1;
	}
	else
	{
		self.sndtacrigemergencyreserve = 0;
	}
}

/*
	Name: dorattle
	Namespace: audio
	Checksum: 0xFF0DA44E
	Offset: 0x3C70
	Size: 0x64
	Parameters: 3
	Flags: Linked
*/
function dorattle(origin, min, max)
{
	if(isdefined(min) && min > 0)
	{
		if(isdefined(max) && max <= 0)
		{
			max = undefined;
		}
		soundrattle(origin, min, max);
	}
}

/*
	Name: sndrattle_server
	Namespace: audio
	Checksum: 0xC739CE9F
	Offset: 0x3CE0
	Size: 0xEC
	Parameters: 7
	Flags: Linked
*/
function sndrattle_server(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(isdefined(self.model) && self.model == #"wpn_t7_bouncing_betty_world")
		{
			betty = getweapon(#"bouncingbetty");
			level dorattle(self.origin, betty.soundrattlerangemin, betty.soundrattlerangemax);
		}
		else
		{
			level dorattle(self.origin, 25, 600);
		}
	}
}

/*
	Name: function_b51c1cb9
	Namespace: audio
	Checksum: 0xDEB905F0
	Offset: 0x3DD8
	Size: 0x4C
	Parameters: 1
	Flags: Event
*/
event function_b51c1cb9(eventstruct)
{
	level dorattle(eventstruct.position, eventstruct.weapon.soundrattlerangemin, eventstruct.weapon.soundrattlerangemax);
}

/*
	Name: weapon_butt_sounds
	Namespace: audio
	Checksum: 0x2A3EB4A
	Offset: 0x3E30
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function weapon_butt_sounds(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.meleed = 1;
		level.mysnd = playsound(fieldname, #"chr_melee_tinitus", (0, 0, 0));
	}
	else
	{
		self.meleed = 0;
		if(isdefined(level.mysnd))
		{
			stopsound(level.mysnd);
		}
	}
}

/*
	Name: sndmatchsnapshot
	Namespace: audio
	Checksum: 0x7E524CC7
	Offset: 0x3EF0
	Size: 0x114
	Parameters: 7
	Flags: Linked
*/
function sndmatchsnapshot(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(function_f99d2668())
	{
		return;
	}
	if(bwastimejump)
	{
		switch(bwastimejump)
		{
			case 1:
			{
				snd_set_snapshot("mpl_prematch");
				break;
			}
			case 2:
			{
				snd_set_snapshot("mpl_postmatch");
				break;
			}
			case 3:
			{
				snd_set_snapshot("mpl_endmatch");
				break;
			}
		}
	}
	else
	{
		snd_set_snapshot("default");
	}
}

/*
	Name: sndkillcam
	Namespace: audio
	Checksum: 0xA31E2376
	Offset: 0x4010
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function sndkillcam()
{
	level thread sndfinalkillcam_slowdown();
	level thread sndfinalkillcam_deactivate();
}

/*
	Name: snddeath_activate
	Namespace: audio
	Checksum: 0xDCF43D70
	Offset: 0x4050
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function snddeath_activate()
{
	while(true)
	{
		level waittill(#"sndded");
		snd_set_snapshot("mpl_death");
	}
}

/*
	Name: snddeath_deactivate
	Namespace: audio
	Checksum: 0x4CF6EEB4
	Offset: 0x4098
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function snddeath_deactivate()
{
	while(true)
	{
		level waittill(#"snddede");
		snd_set_snapshot("default");
	}
}

/*
	Name: sndfinalkillcam_activate
	Namespace: audio
	Checksum: 0x2E386E4E
	Offset: 0x40E0
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function sndfinalkillcam_activate()
{
	while(true)
	{
		level waittill(#"sndfks");
	}
}

/*
	Name: sndfinalkillcam_slowdown
	Namespace: audio
	Checksum: 0x6A947A9A
	Offset: 0x4110
	Size: 0x28
	Parameters: 0
	Flags: Linked
*/
function sndfinalkillcam_slowdown()
{
	while(true)
	{
		level waittill(#"sndfksl");
	}
}

/*
	Name: sndfinalkillcam_deactivate
	Namespace: audio
	Checksum: 0x6EB8840B
	Offset: 0x4140
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function sndfinalkillcam_deactivate()
{
	while(true)
	{
		level waittill(#"sndfke");
		snd_set_snapshot("default");
	}
}

/*
	Name: sndswitchvehiclecontext
	Namespace: audio
	Checksum: 0xEBA69612
	Offset: 0x4188
	Size: 0xC4
	Parameters: 7
	Flags: Linked
*/
function sndswitchvehiclecontext(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self))
	{
		return;
	}
	if(self isvehicle() && self function_4add50a7())
	{
		setsoundcontext("plr_impact", "vehicle");
	}
	else
	{
		setsoundcontext("plr_impact", "flesh");
	}
}

/*
	Name: sndmusicdeathwatcher
	Namespace: audio
	Checksum: 0xDB8275A0
	Offset: 0x4258
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function sndmusicdeathwatcher()
{
	self waittill(#"death");
}

/*
	Name: sndcchacking
	Namespace: audio
	Checksum: 0xAEA4EF7D
	Offset: 0x4280
	Size: 0x1CC
	Parameters: 7
	Flags: Linked
*/
function sndcchacking(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		switch(bwastimejump)
		{
			case 1:
			{
				playsound(0, #"gdt_cybercore_hack_start_plr", (0, 0, 0));
				self.hsnd = self playloopsound(#"gdt_cybercore_hack_lp_plr", 0.5);
				break;
			}
			case 2:
			{
				playsound(0, #"gdt_cybercore_prime_upg_plr", (0, 0, 0));
				self.hsnd = self playloopsound(#"gdt_cybercore_prime_loop_plr", 0.5);
				break;
			}
		}
	}
	else
	{
		if(isdefined(self.hsnd))
		{
			self stoploopsound(self.hsnd, 0.5);
		}
		if(fieldname == 1)
		{
			playsound(0, #"gdt_cybercore_hack_success_plr", (0, 0, 0));
		}
		else if(fieldname == 2)
		{
			playsound(0, #"gdt_cybercore_activate_fail_plr", (0, 0, 0));
		}
	}
}

/*
	Name: sndigcsnapshot
	Namespace: audio
	Checksum: 0x6037D94B
	Offset: 0x4458
	Size: 0x184
	Parameters: 7
	Flags: Linked
*/
function sndigcsnapshot(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		switch(bwastimejump)
		{
			case 1:
			{
				snd_set_snapshot("cmn_igc_bg_lower");
				level.sndigcsnapshotoverride = 0;
				break;
			}
			case 2:
			{
				snd_set_snapshot("cmn_igc_amb_silent");
				level.sndigcsnapshotoverride = 1;
				break;
			}
			case 3:
			{
				snd_set_snapshot("cmn_igc_foley_lower");
				level.sndigcsnapshotoverride = 0;
				break;
			}
			case 4:
			{
				snd_set_snapshot("cmn_level_fadeout");
				level.sndigcsnapshotoverride = 0;
				break;
			}
			case 5:
			{
				snd_set_snapshot("cmn_level_fade_immediate");
				level.sndigcsnapshotoverride = 0;
				break;
			}
		}
	}
	else
	{
		level.sndigcsnapshotoverride = 0;
	}
}

/*
	Name: sndlevelstartsnapoff
	Namespace: audio
	Checksum: 0x941816FF
	Offset: 0x45E8
	Size: 0x5E
	Parameters: 7
	Flags: Linked
*/
function sndlevelstartsnapoff(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
	}
}

/*
	Name: sndzmbfadein
	Namespace: audio
	Checksum: 0x2AEDF3E2
	Offset: 0x4650
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function sndzmbfadein(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		snd_set_snapshot("default");
	}
}

/*
	Name: sndchyronloop
	Namespace: audio
	Checksum: 0x31C44972
	Offset: 0x46B8
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function sndchyronloop(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(level.chyronloop))
		{
			level.chyronloop = spawn(0, (0, 0, 0), "script_origin");
			level.chyronloop playloopsound(#"uin_chyron_loop");
		}
	}
	else if(isdefined(level.chyronloop))
	{
		level.chyronloop delete();
	}
}

/*
	Name: function_aa906715
	Namespace: audio
	Checksum: 0xB2700479
	Offset: 0x4798
	Size: 0x188
	Parameters: 0
	Flags: Linked
*/
function function_aa906715()
{
	self endon(#"death", #"disconnect", #"game_ended");
	if(self function_21c0fa55() && sessionmodeismultiplayergame() || function_f99d2668())
	{
		self.var_e4acdf73 = 0;
		var_1b0c36cc = self battlechatter::get_player_dialog_alias("exertGasCough");
		var_7f9cdb4f = self battlechatter::get_player_dialog_alias("exertGasGag");
		var_78ca4238 = self battlechatter::get_player_dialog_alias("exertGasGasp");
		if(!(isdefined(var_1b0c36cc) && (isdefined(var_7f9cdb4f) && isdefined(var_78ca4238))))
		{
			return;
		}
		while(true)
		{
			self waittill(#"hash_59dc3b94303bbeac");
			self thread function_f041ffdb(var_1b0c36cc, var_7f9cdb4f);
			self waittill(#"hash_71bef43cb9e9e9f4");
			self thread function_deedd8d0(var_78ca4238);
			wait(0.1);
		}
	}
}

/*
	Name: function_f041ffdb
	Namespace: audio
	Checksum: 0x5F51316B
	Offset: 0x4928
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function function_f041ffdb(var_1b0c36cc, var_7f9cdb4f)
{
	self endon(#"death", #"hash_71bef43cb9e9e9f4");
	if(isdefined(self))
	{
		self.var_7c77614c = gettime();
		self thread function_5e73e105(var_1b0c36cc, var_7f9cdb4f);
	}
}

/*
	Name: function_5e73e105
	Namespace: audio
	Checksum: 0xB763A03
	Offset: 0x4998
	Size: 0xF8
	Parameters: 2
	Flags: Linked
*/
function function_5e73e105(var_1b0c36cc, var_7f9cdb4f)
{
	self endon(#"death", #"disconnect", #"game_ended", #"hash_71bef43cb9e9e9f4");
	self.var_e4acdf73 = 1;
	while(true)
	{
		randomchance = randomfloatrange(0, 1);
		if(randomchance < 0.8)
		{
			self playsound(0, var_1b0c36cc);
		}
		else
		{
			self playsound(0, var_7f9cdb4f);
		}
		wait(randomfloatrange(1.5, 3.5));
	}
}

/*
	Name: function_deedd8d0
	Namespace: audio
	Checksum: 0x761B1AB2
	Offset: 0x4A98
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function function_deedd8d0(var_78ca4238)
{
	self endon(#"death", #"hash_59dc3b94303bbeac");
	if(self.var_e4acdf73 && (self.var_7c77614c + (float(3) / 1000)) > gettime())
	{
		self playsound(0, var_78ca4238);
		self.var_e4acdf73 = 0;
	}
}

/*
	Name: sndsprintbreath
	Namespace: audio
	Checksum: 0x532F5076
	Offset: 0x4B38
	Size: 0x18C
	Parameters: 1
	Flags: Linked
*/
function sndsprintbreath(localclientnum)
{
	self endon(#"death");
	if(self function_21c0fa55() && sessionmodeismultiplayergame() || function_f99d2668())
	{
		self.var_29054134 = 0;
		var_63112f76 = self battlechatter::get_player_dialog_alias("exertBreatheSprinting");
		var_dfb6f570 = self battlechatter::get_player_dialog_alias("exertBreatheSprintingEnd");
		if(!isdefined(var_63112f76) || !isdefined(var_dfb6f570))
		{
			return;
		}
		while(true)
		{
			if(isdefined(self))
			{
				if(self isplayersprinting())
				{
					self thread sndbreathstart(var_63112f76);
					self thread function_ee6d1a7f(var_dfb6f570);
					waitresult = undefined;
					waitresult = self waittill(#"hash_4e899fa9b2775b4d", #"death");
					if(waitresult._notify == "death")
					{
						return;
					}
				}
			}
			wait(0.1);
		}
	}
}

/*
	Name: sndbreathstart
	Namespace: audio
	Checksum: 0x90E12503
	Offset: 0x4CD0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function sndbreathstart(sound)
{
	self endon(#"hash_4e899fa9b2775b4d");
	self endon(#"death");
	self waittill(#"hash_1d827c5a5cd4a607");
	if(isdefined(self))
	{
		self thread function_d6bc7279(sound);
	}
}

/*
	Name: function_d6bc7279
	Namespace: audio
	Checksum: 0x64389E1A
	Offset: 0x4D40
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function function_d6bc7279(sound)
{
	self endon(#"death");
	self endon(#"hash_4e899fa9b2775b4d");
	self.var_29054134 = 1;
	while(true)
	{
		self playsound(0, sound);
		wait(2.5);
	}
}

/*
	Name: function_ee6d1a7f
	Namespace: audio
	Checksum: 0xBC966887
	Offset: 0x4DB0
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function function_ee6d1a7f(sound)
{
	self endon(#"death");
	self waittill(#"hash_4e899fa9b2775b4d");
	if(self.var_29054134)
	{
		self playsound(0, sound);
		self.var_29054134 = 0;
	}
}

/*
	Name: function_5da61577
	Namespace: audio
	Checksum: 0xED7869CC
	Offset: 0x4E18
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_5da61577(localclientnum)
{
	self endon(#"death");
	if(isdefined(self))
	{
		self thread function_bd07593a();
	}
}

/*
	Name: function_bd07593a
	Namespace: audio
	Checksum: 0x5F137F3D
	Offset: 0x4E60
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_bd07593a()
{
	self endon(#"death");
	while(true)
	{
		if(self util::is_on_side(#"allies"))
		{
			if(self isplayersprinting())
			{
				self playsound(0, #"hash_2dc9c76844261d06");
				wait(1);
			}
			else
			{
				self playsound(0, #"hash_70b507d0e243536d");
				wait(2.5);
			}
		}
		wait(0.1);
	}
}

/*
	Name: sndvehicledamagealarm
	Namespace: audio
	Checksum: 0x13F75E59
	Offset: 0x4F20
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function sndvehicledamagealarm(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self notify(#"sndvehicledamagealarm");
	self thread function_350920b9();
}

/*
	Name: function_350920b9
	Namespace: audio
	Checksum: 0x14907959
	Offset: 0x4F90
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_350920b9()
{
	self endon(#"death");
	self endon(#"disconnect");
	self endon(#"sndvehicledamagealarm");
	if(!isdefined(self.var_5730fa36))
	{
		self.var_5730fa36 = self playloopsound(#"hash_7a6b427867364957");
	}
	wait(2);
	if(isdefined(self.var_5730fa36))
	{
		self stoploopsound(self.var_5730fa36);
		self.var_5730fa36 = undefined;
	}
	self playsound(0, #"hash_26a4334032c725cb");
}

/*
	Name: function_31468a30
	Namespace: audio
	Checksum: 0x3EEF1BAF
	Offset: 0x5060
	Size: 0x164
	Parameters: 1
	Flags: None
*/
function function_31468a30(scriptstruct)
{
	/#
		soundloop = scriptstruct.soundstruct;
		if(isdefined(level.loopers))
		{
			for(i = 0; i < level.loopers.size; i++)
			{
				if(!isdefined(level.loopers[i].script_sound))
				{
					level.loopers[i].origin = soundloop.origin;
					level.loopers[i].script_sound = soundloop.script_sound;
					level.loopers[i] thread soundloopthink();
					return;
				}
			}
			index = level.loopers.size;
			arrayinsert(level.loopers, soundloop, index);
			level.loopers[index].angles = undefined;
			level.loopers[index].script_label = undefined;
			level.loopers[index] thread soundloopthink();
		}
	#/
}

/*
	Name: function_5470fa95
	Namespace: audio
	Checksum: 0x5AD5BA10
	Offset: 0x51D0
	Size: 0xC2
	Parameters: 1
	Flags: Event
*/
event function_5470fa95(scriptstruct)
{
	/#
		soundloop = scriptstruct.soundstruct;
		if(isdefined(level.loopers))
		{
			index = scriptstruct.index;
			if(index >= 0 && index < level.loopers.size)
			{
				soundstoploopemitter(soundloop.script_sound, soundloop.origin);
				level.loopers[index].origin = (0, 0, 0);
				level.loopers[index].script_sound = undefined;
			}
		}
	#/
}

/*
	Name: function_3fda4bf4
	Namespace: audio
	Checksum: 0x8A147C19
	Offset: 0x52A0
	Size: 0x15C
	Parameters: 1
	Flags: Event
*/
event function_3fda4bf4(scriptstruct)
{
	/#
		soundloop = scriptstruct.soundstruct;
		if(isdefined(level.loopers) && isdefined(soundloop) && isdefined(soundloop.script_sound) && isdefined(soundloop.script_looping))
		{
			index = scriptstruct.index;
			if(index >= 0 && index < level.loopers.size)
			{
				level.loopers[index].origin = soundloop.origin;
				level.loopers[index].script_sound = soundloop.script_sound;
				level.loopers[index].script_looping = soundloop.script_looping;
				function_f03b7c11(index, level.loopers[index].script_sound, level.loopers[index].origin);
			}
			else if(index == -2)
			{
				function_31468a30(scriptstruct);
			}
		}
	#/
}

/*
	Name: function_882b5910
	Namespace: audio
	Checksum: 0x706599BA
	Offset: 0x5408
	Size: 0xB2
	Parameters: 1
	Flags: Event
*/
event function_882b5910(scriptstruct)
{
	/#
		soundloop = scriptstruct.soundstruct;
		level.var_7acea05a = -1;
		if(isdefined(level.loopers))
		{
			for(i = 0; i < level.loopers.size; i++)
			{
				if(distancesquared(level.loopers[i].origin, soundloop.origin) < 1)
				{
					level.var_7acea05a = i;
					return;
				}
			}
		}
	#/
}

/*
	Name: function_4fb7ec9c
	Namespace: audio
	Checksum: 0x33FE1867
	Offset: 0x54C8
	Size: 0x184
	Parameters: 1
	Flags: None
*/
function function_4fb7ec9c(scriptstruct)
{
	/#
		var_2f7118b0 = scriptstruct.soundstruct;
		if(isdefined(level.lineemitters))
		{
			for(i = 0; i < level.lineemitters.size; i++)
			{
				if(!isdefined(level.lineemitters[i].script_sound))
				{
					level.lineemitters[i].origin = var_2f7118b0.origin;
					level.lineemitters[i].script_sound = var_2f7118b0.script_sound;
					level.lineemitters[i].target = var_2f7118b0.target;
					level.lineemitters[i] thread soundlinethink();
					return;
				}
			}
			index = level.lineemitters.size;
			arrayinsert(level.lineemitters, var_2f7118b0, index);
			level.lineemitters[index].angles = undefined;
			level.lineemitters[index].script_label = undefined;
			level.lineemitters[index] thread soundlinethink();
		}
	#/
}

/*
	Name: function_bbc6b84a
	Namespace: audio
	Checksum: 0xED5DDE93
	Offset: 0x5658
	Size: 0x122
	Parameters: 1
	Flags: Event
*/
event function_bbc6b84a(scriptstruct)
{
	/#
		var_2f7118b0 = scriptstruct.soundstruct;
		if(isdefined(level.lineemitters))
		{
			index = scriptstruct.index;
			if(index >= 0 && index < level.lineemitters.size)
			{
				target = struct::get(level.lineemitters[index].target, "");
				soundstoplineemitter(level.lineemitters[index].script_sound, level.lineemitters[index].origin, target.origin);
				level.lineemitters[index].origin = (0, 0, 0);
				level.lineemitters[index].script_sound = undefined;
			}
		}
	#/
}

/*
	Name: function_4910c05b
	Namespace: audio
	Checksum: 0xC490C1B0
	Offset: 0x5788
	Size: 0x184
	Parameters: 1
	Flags: Event
*/
event function_4910c05b(scriptstruct)
{
	/#
		var_2f7118b0 = scriptstruct.soundstruct;
		if(isdefined(level.lineemitters) && isdefined(var_2f7118b0))
		{
			index = scriptstruct.index;
			if(index >= 0 && index < level.lineemitters.size)
			{
				level.lineemitters[index].origin = var_2f7118b0.origin;
				level.lineemitters[index].script_sound = var_2f7118b0.script_sound;
				level.lineemitters[index].target = var_2f7118b0.target;
				target = struct::get(level.lineemitters[index].target, "");
				if(isdefined(target))
				{
					function_15b81494(index, level.lineemitters[index].script_sound, level.lineemitters[index].origin, target.origin);
				}
			}
			else if(index == -2)
			{
				function_4fb7ec9c(scriptstruct);
			}
		}
	#/
}

/*
	Name: function_ee6f0c88
	Namespace: audio
	Checksum: 0x3021C45E
	Offset: 0x5918
	Size: 0xB2
	Parameters: 1
	Flags: Event
*/
event function_ee6f0c88(scriptstruct)
{
	/#
		var_2f7118b0 = scriptstruct.soundstruct;
		level.var_7acea05a = -1;
		if(isdefined(level.lineemitters))
		{
			for(i = 0; i < level.lineemitters.size; i++)
			{
				if(distancesquared(level.lineemitters[i].origin, var_2f7118b0.origin) < 1)
				{
					level.var_7acea05a = i;
					return;
				}
			}
		}
	#/
}

/*
	Name: function_abd4ca1
	Namespace: audio
	Checksum: 0x39695413
	Offset: 0x59D8
	Size: 0x184
	Parameters: 1
	Flags: None
*/
function function_abd4ca1(scriptstruct)
{
	/#
		var_984110e5 = scriptstruct.soundstruct;
		if(isdefined(level.randoms))
		{
			for(i = 0; i < level.randoms.size; i++)
			{
				if(!isdefined(level.randoms[i].script_sound))
				{
					level.randoms[i].origin = var_984110e5.origin;
					level.randoms[i].script_sound = var_984110e5.script_sound;
					level.randoms[i] thread soundrandom_thread(0, level.randoms[i]);
					return;
				}
			}
			index = level.randoms.size;
			arrayinsert(level.randoms, var_984110e5, index);
			level.randoms[index].angles = undefined;
			level.randoms[index].script_label = undefined;
			level.randoms[index] thread soundrandom_thread(0, level.randoms[index]);
		}
	#/
}

/*
	Name: function_464598c8
	Namespace: audio
	Checksum: 0xE5FBC521
	Offset: 0x5B68
	Size: 0xCE
	Parameters: 1
	Flags: Event
*/
event function_464598c8(scriptstruct)
{
	/#
		var_984110e5 = scriptstruct.soundstruct;
		if(isdefined(level.randoms))
		{
			index = scriptstruct.index;
			if(index >= 0 && index < level.randoms.size)
			{
				function_dac8758d(level.randoms[index].origin);
				level.randoms[index].origin = (0, 0, 0);
				level.randoms[index].script_sound = undefined;
			}
		}
	#/
}

/*
	Name: function_12dface6
	Namespace: audio
	Checksum: 0x9E8BD5FF
	Offset: 0x5C40
	Size: 0x1B4
	Parameters: 1
	Flags: Event
*/
event function_12dface6(scriptstruct)
{
	/#
		var_984110e5 = scriptstruct.soundstruct;
		if(isdefined(level.randoms))
		{
			index = scriptstruct.index;
			neworigin = scriptstruct.neworigin;
			if(index >= 0 && index < level.randoms.size)
			{
				if(isdefined(var_984110e5.script_wait_min))
				{
					level.randoms[index].script_wait_min = var_984110e5.script_wait_min;
				}
				if(isdefined(var_984110e5.script_wait_max))
				{
					level.randoms[index].script_wait_max = var_984110e5.script_wait_max;
				}
				level.randoms[index].script_sound = var_984110e5.script_sound;
				function_12dface6(level.randoms[index].origin, neworigin, level.randoms[index].script_sound, level.randoms[index].script_wait_min, level.randoms[index].script_wait_max);
				level.randoms[index].origin = neworigin;
			}
			else if(index == -2)
			{
				scriptstruct.soundstruct.origin = neworigin;
				function_abd4ca1(scriptstruct);
			}
		}
	#/
}

/*
	Name: function_8673317e
	Namespace: audio
	Checksum: 0x1986E5FA
	Offset: 0x5E00
	Size: 0xB2
	Parameters: 1
	Flags: Event
*/
event function_8673317e(scriptstruct)
{
	/#
		var_984110e5 = scriptstruct.soundstruct;
		level.var_7acea05a = -1;
		if(isdefined(level.randoms))
		{
			for(i = 0; i < level.randoms.size; i++)
			{
				if(distancesquared(level.randoms[i].origin, var_984110e5.origin) < 1)
				{
					level.var_7acea05a = i;
					return;
				}
			}
		}
	#/
}

