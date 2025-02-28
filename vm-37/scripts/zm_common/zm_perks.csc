#using script_12282e6b2cc91b42;
#using script_709bf7c56eb65adf;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace zm_perks;

/*
	Name: init
	Namespace: zm_perks
	Checksum: 0xAC5A3D0
	Offset: 0x2F0
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	if(!isdefined(level.var_c3e5c4cd))
	{
		level.var_c3e5c4cd = zm_utility::function_166646a6();
	}
	callback::on_start_gametype(&init_perk_machines_fx);
	init_custom_perks();
	perks_register_clientfield();
	init_perk_custom_threads();
}

/*
	Name: function_f3c80d73
	Namespace: zm_perks
	Checksum: 0x6A0A7D77
	Offset: 0x378
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_f3c80d73(var_d7e9261c, var_136e2645)
{
	if(zm_utility::function_166646a6() == 1 || !isdefined(var_136e2645))
	{
		var_920c5fbb = getweapon(var_d7e9261c);
	}
	else
	{
		var_920c5fbb = getweapon(var_136e2645);
	}
	forcestreamxmodel(var_920c5fbb.viewmodel, -1, -1);
	forcestreamxmodel(var_920c5fbb.worldmodel, 1, 1);
}

/*
	Name: perks_register_clientfield
	Namespace: zm_perks
	Checksum: 0x10E8F921
	Offset: 0x438
	Size: 0x100
	Parameters: 0
	Flags: Linked
*/
function perks_register_clientfield()
{
	if(is_true(level.zombiemode_using_perk_intro_fx))
	{
		clientfield::register("scriptmover", "clientfield_perk_intro_fx", 1, 1, "int", &perk_meteor_fx, 0, 0);
	}
	if(level._custom_perks.size > 0)
	{
		a_keys = getarraykeys(level._custom_perks);
		for(i = 0; i < a_keys.size; i++)
		{
			if(isdefined(level._custom_perks[a_keys[i]].clientfield_register))
			{
				level [[level._custom_perks[a_keys[i]].clientfield_register]]();
			}
		}
	}
}

/*
	Name: function_89e748a7
	Namespace: zm_perks
	Checksum: 0x613E46AF
	Offset: 0x540
	Size: 0xB9C
	Parameters: 0
	Flags: None
*/
function function_89e748a7()
{
	for(i = 0; i < 4; i++)
	{
		clientfield::function_a8bbc967(("hudItems.perkVapor." + i) + ".itemIndex", #"hash_5d152bf7cbeda3ad", [1:#"itemindex", 0:hash((isdefined(i) ? "" + i : ""))], 1, 5, "int", undefined, 0, 0);
		clientfield::function_a8bbc967(("hudItems.perkVapor." + i) + ".state", #"hash_5d152bf7cbeda3ad", [1:#"state", 0:hash((isdefined(i) ? "" + i : ""))], 1, 2, "int", undefined, 0, 0);
		clientfield::function_a8bbc967(("hudItems.perkVapor." + i) + ".progress", #"hash_5d152bf7cbeda3ad", [1:#"progress", 0:hash((isdefined(i) ? "" + i : ""))], 1, 5, "float", undefined, 0, 0);
		clientfield::function_a8bbc967(("hudItems.perkVapor." + i) + ".chargeCount", #"hash_5d152bf7cbeda3ad", [1:#"hash_4fe247d6da765068", 0:hash((isdefined(i) ? "" + i : ""))], 1, 3, "int", undefined, 0, 0);
		clientfield::function_a8bbc967(("hudItems.perkVapor." + i) + ".timerActive", #"hash_5d152bf7cbeda3ad", [1:#"hash_6d6a2eda1509aa84", 0:hash((isdefined(i) ? "" + i : ""))], 1, 1, "int", undefined, 0, 0);
		clientfield::function_a8bbc967(("hudItems.perkVapor." + i) + ".bleedoutOrderIndex", #"hash_5d152bf7cbeda3ad", [1:#"hash_221fac20f0f689a5", 0:hash((isdefined(i) ? "" + i : ""))], 1, 2, "int", undefined, 0, 0);
		clientfield::function_a8bbc967(("hudItems.perkVapor." + i) + ".bleedoutActive", #"hash_5d152bf7cbeda3ad", [1:#"hash_27bc83bb19fa9d87", 0:hash((isdefined(i) ? "" + i : ""))], 1, 1, "int", undefined, 0, 0);
		clientfield::function_a8bbc967(("hudItems.perkVapor." + i) + ".specialEffectActive", #"hash_5d152bf7cbeda3ad", [1:#"hash_88f5acb77f97dd3", 0:hash((isdefined(i) ? "" + i : ""))], 1, 1, "int", undefined, 0, 0);
		clientfield::function_a8bbc967(("hudItems.perkVapor." + i) + ".modifierActive", #"hash_5d152bf7cbeda3ad", [1:#"hash_4cacf65aae1d4ba", 0:hash((isdefined(i) ? "" + i : ""))], 6000, 1, "int", undefined, 0, 0);
	}
	clientfield::function_a8bbc967("hudItems.perkVapor.bleedoutProgress", #"hash_5d152bf7cbeda3ad", #"hash_61f69c89f907915e", 9000, 8, "float", undefined, 0, 0);
	for(i = 0; i < 6; i++)
	{
		n_version = 1;
		if(i >= 4)
		{
			n_version = 8000;
		}
		clientfield::function_a8bbc967(("hudItems.extraPerkVapor." + i) + ".itemIndex", #"hash_77ee4bf4c3af9d1c", [1:#"itemindex", 0:hash((isdefined(i) ? "" + i : ""))], n_version, 5, "int", undefined, 0, 0);
		clientfield::function_a8bbc967(("hudItems.extraPerkVapor." + i) + ".state", #"hash_77ee4bf4c3af9d1c", [1:#"state", 0:hash((isdefined(i) ? "" + i : ""))], n_version, 2, "int", undefined, 0, 0);
		clientfield::function_a8bbc967(("hudItems.extraPerkVapor." + i) + ".progress", #"hash_77ee4bf4c3af9d1c", [1:#"progress", 0:hash((isdefined(i) ? "" + i : ""))], n_version, 5, "float", undefined, 0, 0);
		clientfield::function_a8bbc967(("hudItems.extraPerkVapor." + i) + ".chargeCount", #"hash_77ee4bf4c3af9d1c", [1:#"hash_4fe247d6da765068", 0:hash((isdefined(i) ? "" + i : ""))], n_version, 3, "int", undefined, 0, 0);
		clientfield::function_a8bbc967(("hudItems.extraPerkVapor." + i) + ".timerActive", #"hash_77ee4bf4c3af9d1c", [1:#"hash_6d6a2eda1509aa84", 0:hash((isdefined(i) ? "" + i : ""))], n_version, 1, "int", undefined, 0, 0);
		clientfield::function_a8bbc967(("hudItems.extraPerkVapor." + i) + ".specialEffectActive", #"hash_77ee4bf4c3af9d1c", [1:#"hash_88f5acb77f97dd3", 0:hash((isdefined(i) ? "" + i : ""))], n_version, 1, "int", undefined, 0, 0);
	}
	if(level.var_c3e5c4cd == 2)
	{
		clientfield::register("world", "" + #"hash_46334db9e3c76275", 1, 1, "int", &function_9b4bc8e7, 0, 0);
		clientfield::register("scriptmover", "" + #"hash_50eb488e58f66198", 1, 1, "int", &function_52c149b2, 0, 0);
		clientfield::register("allplayers", "" + #"hash_222c3403d2641ea6", 1, 3, "int", &function_ab7cd429, 0, 0);
		clientfield::register("toplayer", "" + #"hash_17283692696da23b", 1, 1, "counter", &function_ccbdf992, 0, 0);
	}
	level thread perk_init_code_callbacks();
}

/*
	Name: perk_init_code_callbacks
	Namespace: zm_perks
	Checksum: 0x92BFB3AE
	Offset: 0x10E8
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function perk_init_code_callbacks()
{
	wait(0.1);
	if(level._custom_perks.size > 0)
	{
		a_keys = getarraykeys(level._custom_perks);
		for(i = 0; i < a_keys.size; i++)
		{
			if(isdefined(level._custom_perks[a_keys[i]].clientfield_code_callback))
			{
				level [[level._custom_perks[a_keys[i]].clientfield_code_callback]]();
			}
		}
	}
}

/*
	Name: init_custom_perks
	Namespace: zm_perks
	Checksum: 0xCD9674B7
	Offset: 0x1198
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function init_custom_perks()
{
	if(!isdefined(level._custom_perks))
	{
		level._custom_perks = [];
	}
}

/*
	Name: register_perk_clientfields
	Namespace: zm_perks
	Checksum: 0x848067B5
	Offset: 0x11C0
	Size: 0x66
	Parameters: 3
	Flags: Linked
*/
function register_perk_clientfields(str_perk, func_clientfield_register, func_code_callback)
{
	_register_undefined_perk(str_perk);
	level._custom_perks[str_perk].clientfield_register = func_clientfield_register;
	level._custom_perks[str_perk].clientfield_code_callback = func_code_callback;
}

/*
	Name: register_perk_effects
	Namespace: zm_perks
	Checksum: 0x5326C3D9
	Offset: 0x1230
	Size: 0x46
	Parameters: 2
	Flags: Linked
*/
function register_perk_effects(str_perk, str_light_effect)
{
	_register_undefined_perk(str_perk);
	level._custom_perks[str_perk].machine_light_effect = str_light_effect;
}

/*
	Name: register_perk_init_thread
	Namespace: zm_perks
	Checksum: 0x636CF47E
	Offset: 0x1280
	Size: 0x46
	Parameters: 2
	Flags: Linked
*/
function register_perk_init_thread(str_perk, func_init_thread)
{
	_register_undefined_perk(str_perk);
	level._custom_perks[str_perk].init_thread = func_init_thread;
}

/*
	Name: function_b60f4a9f
	Namespace: zm_perks
	Checksum: 0x5C2B8CE3
	Offset: 0x12D0
	Size: 0x8E
	Parameters: 4
	Flags: None
*/
function function_b60f4a9f(str_perk, var_4fbc4ea9, var_347c72d2, var_51f1a532)
{
	_register_undefined_perk(str_perk);
	level._custom_perks[str_perk].var_4fbc4ea9 = var_4fbc4ea9;
	level._custom_perks[str_perk].var_347c72d2 = var_347c72d2;
	if(isdefined(var_51f1a532))
	{
		level._custom_perks[str_perk].var_51f1a532 = var_51f1a532;
	}
}

/*
	Name: init_perk_custom_threads
	Namespace: zm_perks
	Checksum: 0x58EC4E06
	Offset: 0x1368
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function init_perk_custom_threads()
{
	if(level._custom_perks.size > 0)
	{
		a_keys = getarraykeys(level._custom_perks);
		for(i = 0; i < a_keys.size; i++)
		{
			if(isdefined(level._custom_perks[a_keys[i]].init_thread))
			{
				level thread [[level._custom_perks[a_keys[i]].init_thread]]();
			}
		}
	}
}

/*
	Name: _register_undefined_perk
	Namespace: zm_perks
	Checksum: 0x5347EF6A
	Offset: 0x1410
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function _register_undefined_perk(str_perk)
{
	if(!isdefined(level._custom_perks))
	{
		level._custom_perks = [];
	}
	if(!isdefined(level._custom_perks[str_perk]))
	{
		level._custom_perks[str_perk] = spawnstruct();
	}
}

/*
	Name: perk_meteor_fx
	Namespace: zm_perks
	Checksum: 0x17633851
	Offset: 0x1478
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function perk_meteor_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.meteor_fx = util::playfxontag(fieldname, level._effect[#"perk_meteor"], self, "tag_origin");
	}
	else if(isdefined(self.meteor_fx))
	{
		stopfx(fieldname, self.meteor_fx);
	}
}

/*
	Name: init_perk_machines_fx
	Namespace: zm_perks
	Checksum: 0x9844E1C9
	Offset: 0x1538
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function init_perk_machines_fx(localclientnum)
{
	if(!level.enable_magic)
	{
		return;
	}
	wait(0.1);
	machines = struct::get_array("zm_perk_machine", "targetname");
	array::thread_all(machines, &perk_start_up);
}

/*
	Name: perk_start_up
	Namespace: zm_perks
	Checksum: 0xFC405445
	Offset: 0x15B0
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function perk_start_up()
{
	if(isdefined(self.script_int))
	{
		power_zone = self.script_int;
		int = undefined;
		while(int != power_zone)
		{
			waitresult = undefined;
			waitresult = level waittill(#"power_on");
			int = waitresult.is_on;
		}
	}
	else
	{
		level waittill(#"power_on");
	}
	timer = 0;
	duration = 0.1;
	while(true)
	{
		if(isdefined(level._custom_perks[self.script_noteworthy]) && isdefined(level._custom_perks[self.script_noteworthy].machine_light_effect))
		{
			self thread vending_machine_flicker_light(level._custom_perks[self.script_noteworthy].machine_light_effect, duration);
		}
		timer = timer + duration;
		duration = duration + 0.2;
		if(timer >= 3)
		{
			break;
		}
		wait(duration);
	}
}

/*
	Name: vending_machine_flicker_light
	Namespace: zm_perks
	Checksum: 0x3F250622
	Offset: 0x1710
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function vending_machine_flicker_light(fx_light, duration)
{
	players = level.localplayers;
	for(i = 0; i < players.size; i++)
	{
		self thread play_perk_fx_on_client(i, fx_light, duration);
	}
}

/*
	Name: play_perk_fx_on_client
	Namespace: zm_perks
	Checksum: 0x4BA6DA3A
	Offset: 0x1780
	Size: 0xC4
	Parameters: 3
	Flags: Linked
*/
function play_perk_fx_on_client(client_num, fx_light, duration)
{
	fxobj = spawn(client_num, self.origin + (vectorscale((0, 0, -1), 50)), "script_model");
	fxobj setmodel(#"tag_origin");
	util::playfxontag(client_num, level._effect[fx_light], fxobj, "tag_origin");
	wait(duration);
	fxobj delete();
}

/*
	Name: function_ccbdf992
	Namespace: zm_perks
	Checksum: 0xACB3C5AE
	Offset: 0x1850
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function function_ccbdf992(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self function_bf9d3071(#"hash_4659ecede94f0b38", "tag_accessory_left");
	}
}

/*
	Name: function_35ba0b0e
	Namespace: zm_perks
	Checksum: 0xC764EEBA
	Offset: 0x18C8
	Size: 0x152
	Parameters: 2
	Flags: None
*/
function function_35ba0b0e(localclientnum, n_slot)
{
	level endon(#"demo_jump");
	self endon(#"death");
	self zm_loadout::function_622d8349(localclientnum);
	n_perk = n_slot + 1;
	var_3e311473 = self zm_loadout::function_2dfb9150(localclientnum, "specialty" + n_perk);
	if(!isdefined(var_3e311473))
	{
		return;
	}
	s_perk = getunlockableiteminfofromindex(var_3e311473, 3);
	if(!isdefined(s_perk) || !isdefined(s_perk.specialties) || !isdefined(s_perk.specialties[0]))
	{
		return;
	}
	str_perk = s_perk.specialties[0];
	if(isstring(str_perk))
	{
		var_16c042b8 = hash(str_perk);
	}
	return var_16c042b8;
}

/*
	Name: function_5b123b68
	Namespace: zm_perks
	Checksum: 0x4F4B5E84
	Offset: 0x1A28
	Size: 0x136
	Parameters: 3
	Flags: None
*/
function function_5b123b68(localclientnum, b_show, b_use_offset)
{
	if(!isdefined(b_use_offset))
	{
		b_use_offset = 0;
	}
	if(isdefined(self.var_d67a4862))
	{
		stopfx(localclientnum, self.var_d67a4862);
	}
	if(b_show)
	{
		v_angles = self gettagangles("fx_tag_base_emblem");
		v_origin = self gettagorigin("fx_tag_base_emblem");
		if(b_use_offset && isdefined(self.var_7ad76c54))
		{
			v_origin = v_origin - (anglestoforward(v_angles) * self.var_7ad76c54);
		}
		self.var_d67a4862 = playfx(localclientnum, self.var_be82764e, v_origin, anglestoforward(v_angles));
	}
	else
	{
		self.var_d67a4862 = undefined;
	}
}

/*
	Name: function_be3ae9c5
	Namespace: zm_perks
	Checksum: 0xA028A4E9
	Offset: 0x1B68
	Size: 0x52
	Parameters: 2
	Flags: Private
*/
function private function_be3ae9c5(n_value, var_51e3f61d)
{
	if(!isdefined(var_51e3f61d))
	{
		var_51e3f61d = 0;
	}
	if(n_value < 5)
	{
		if(var_51e3f61d && n_value == 0)
		{
			return true;
		}
		return false;
	}
	return true;
}

/*
	Name: function_9b4bc8e7
	Namespace: zm_perks
	Checksum: 0x321D7694
	Offset: 0x1BC8
	Size: 0x104
	Parameters: 7
	Flags: Linked
*/
function function_9b4bc8e7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"demo_jump");
	if(bwastimejump)
	{
		while(!isdefined(level.var_aaf8da70))
		{
			waitframe(1);
			level.var_aaf8da70 = getent(fieldname, "zeus_bird_head", "targetname");
		}
		util::playfxontag(fieldname, level._effect[#"hash_46334db9e3c76275"], level.var_aaf8da70, "bird_follow_jnt");
		level.var_aaf8da70 thread function_6a0a572d(fieldname);
	}
}

/*
	Name: function_6a0a572d
	Namespace: zm_perks
	Checksum: 0xE99E9EB9
	Offset: 0x1CD8
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function function_6a0a572d(localclientnum)
{
	level endon(#"demo_jump");
	self endon(#"death");
	while(true)
	{
		wait(randomintrange(5, 20));
		self playsound(localclientnum, #"hash_62f87027921fa5b4");
	}
}

/*
	Name: function_52c149b2
	Namespace: zm_perks
	Checksum: 0x46D1986D
	Offset: 0x1D68
	Size: 0xC2
	Parameters: 7
	Flags: Linked
*/
function function_52c149b2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(level.var_aaf8da70))
		{
			level.var_aaf8da70 = util::spawn_model(fieldname, "p8_fxanim_zm_vapor_altar_zeus_bird_head_mod", self gettagorigin("tag_bird_head"), self gettagangles("tag_bird_head"));
			level.var_aaf8da70.targetname = "zeus_bird_head";
		}
	}
}

/*
	Name: function_ab7cd429
	Namespace: zm_perks
	Checksum: 0x4FCB42B0
	Offset: 0x1E38
	Size: 0x2A4
	Parameters: 7
	Flags: Linked
*/
function function_ab7cd429(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"demo_jump");
	if(!isdefined(level.var_aaf8da70))
	{
		level.var_aaf8da70 = getent(fieldname, "zeus_bird_head", "targetname");
	}
	var_aaf8da70 = level.var_aaf8da70;
	if(!isdefined(var_aaf8da70))
	{
		return;
	}
	var_aaf8da70 endon(#"death");
	if(!isdefined(level.var_245eb09f))
	{
		level.var_245eb09f = var_aaf8da70.angles;
		if(level.var_245eb09f[1] == 360)
		{
			level.var_245eb09f = (0, 0, 0);
		}
	}
	level notify(#"hash_4d8d403fdb281b69");
	wait(0.5);
	if(bwastimejump == 0)
	{
		var_6d877f48 = array::random(array(vectorscale((1, 1, 1), 7), vectorscale((-1, -1, -1), 7), vectorscale((-1, 1, 1), 7), vectorscale((1, -1, -1), 7)));
		var_aaf8da70 rotateto(level.var_245eb09f + var_6d877f48, 0.2);
		wait(0.8);
		var_aaf8da70 rotateto(level.var_245eb09f, 0.1);
	}
	else
	{
		var_165f12bb = array::random(array((17, 30, 25), (-10, -30, -25), (-10, 30, 25), (17, -30, -25)));
		var_aaf8da70 rotateto(level.var_245eb09f + var_165f12bb, 0.15);
		var_aaf8da70 thread function_1625e105(self);
	}
}

/*
	Name: function_1625e105
	Namespace: zm_perks
	Checksum: 0xA985BA6
	Offset: 0x20E8
	Size: 0x160
	Parameters: 1
	Flags: Linked
*/
function function_1625e105(e_player)
{
	if(!isdefined(e_player))
	{
		return;
	}
	level endon(#"demo_jump", #"hash_4d8d403fdb281b69");
	e_player endon(#"death");
	self endon(#"death");
	wait(1);
	while(isdefined(e_player))
	{
		var_d1d1cc92 = e_player gettagorigin("j_head");
		if(!isdefined(var_d1d1cc92))
		{
			var_d1d1cc92 = e_player.origin;
		}
		if(vectordot(vectornormalize(var_d1d1cc92 - self.origin), anglestoforward(level.var_245eb09f)) > 0.5)
		{
			var_a8dcfa = vectortoangles(var_d1d1cc92 - self.origin);
			self rotateto(var_a8dcfa, 0.15);
		}
		wait(0.15);
	}
}

