#using script_13114d8a31c6152a;
#using script_256b8879317373de;
#using script_35ae72be7b4fec10;
#using script_37f9ff47f340fbe8;
#using script_4937c6974f43bb71;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\serverfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\util.gsc;

#namespace namespace_3bb22a53;

/*
	Name: function_89f2df9
	Namespace: namespace_3bb22a53
	Checksum: 0xA3223549
	Offset: 0x310
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register("spy_camera", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_3bb22a53
	Checksum: 0xF248DD
	Offset: 0x350
	Size: 0x20C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::function_f77ced93(&function_f77ced93);
	callback::on_spawned(&function_ab7ec803);
	clientfield::register("toplayer", "spy_camera_state", 1, 2, "int");
	clientfield::register("toplayer", "binoculars_overlay", 1, 1, "int");
	clientfield::register("toplayer", "spy_camera_tagging", 1, 1, "int");
	clientfield::register("actor", "spy_camera_remove_highlight", 1, 1, "int");
	var_1e935eba = array("actor", "scriptmover");
	foreach(str_type in var_1e935eba)
	{
		clientfield::register(str_type, "spy_camera_object_of_interest", 1, 2, "int");
	}
	level.var_e3f5eafc = getweapon("eq_spy_camera");
	level.var_42db149f = getweapon("eq_binoculars");
}

/*
	Name: function_f785d9e9
	Namespace: namespace_3bb22a53
	Checksum: 0x42CC5BA6
	Offset: 0x568
	Size: 0x150
	Parameters: 3
	Flags: None
*/
function function_f785d9e9(objects, var_7eb1c6be, var_354b19f1)
{
	if(!isdefined(var_7eb1c6be))
	{
		var_7eb1c6be = 0;
	}
	if(!isdefined(objects))
	{
		objects = [];
	}
	else if(!isarray(objects))
	{
		objects = array(objects);
	}
	val = 1;
	if(var_7eb1c6be)
	{
		val = 2;
	}
	foreach(object in objects)
	{
		object clientfield::set("spy_camera_object_of_interest", val);
		object thread function_654fa552(var_354b19f1);
		if(var_7eb1c6be)
		{
			object thread function_a6928964(var_354b19f1);
		}
	}
}

/*
	Name: function_654fa552
	Namespace: namespace_3bb22a53
	Checksum: 0xBBFE481F
	Offset: 0x6C0
	Size: 0x90
	Parameters: 1
	Flags: Linked, Private
*/
function private function_654fa552(var_57e553fd)
{
	self endon(#"death", #"hash_54e0f219fc10204a");
	self waittillmatch({#fieldvalue:1, #hash_aad36d51:0}, #"hash_72a5fe161eb7a0ce");
	self notify(#"hash_4e1642d862c17b5b");
	if(isdefined(var_57e553fd))
	{
		var_57e553fd notify(#"hash_4e1642d862c17b5b");
	}
}

/*
	Name: function_a6928964
	Namespace: namespace_3bb22a53
	Checksum: 0x84AD4780
	Offset: 0x758
	Size: 0xAC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a6928964(var_57e553fd)
{
	self endon(#"death", #"hash_4e1642d862c17b5b", #"hash_54e0f219fc10204a");
	while(true)
	{
		self waittillmatch({#fieldvalue:2, #hash_aad36d51:0}, #"hash_72a5fe161eb7a0ce");
		self notify(#"hash_54596dc066040d8c");
		if(isdefined(var_57e553fd))
		{
			var_57e553fd notify(#"hash_54596dc066040d8c");
		}
	}
}

/*
	Name: function_b28ab5a9
	Namespace: namespace_3bb22a53
	Checksum: 0x77F46263
	Offset: 0x810
	Size: 0x40
	Parameters: 1
	Flags: None
*/
function function_b28ab5a9(object)
{
	object clientfield::set("spy_camera_object_of_interest", 0);
	object notify(#"hash_54e0f219fc10204a");
}

/*
	Name: function_69190c4e
	Namespace: namespace_3bb22a53
	Checksum: 0xAC83C987
	Offset: 0x858
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_69190c4e()
{
	clientfield::set_to_player("spy_camera_tagging", 1);
}

/*
	Name: function_c11bdcc0
	Namespace: namespace_3bb22a53
	Checksum: 0x5FE61820
	Offset: 0x888
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_c11bdcc0()
{
	clientfield::set_to_player("spy_camera_tagging", 0);
}

/*
	Name: function_f77ced93
	Namespace: namespace_3bb22a53
	Checksum: 0xB09E746A
	Offset: 0x8B0
	Size: 0x1BC
	Parameters: 1
	Flags: Linked
*/
function function_f77ced93(params)
{
	var_b67a0cc6 = is_true(self.var_340d4e74) || (params.last_weapon !== level.weaponnone && (params.last_weapon === level.var_e3f5eafc || params.last_weapon === level.var_42db149f));
	if(var_b67a0cc6 || (params.last_weapon === level.weaponnone && self clientfield::get_to_player("spy_camera_state") != 0))
	{
		self.var_340d4e74 = undefined;
		self thread function_d704edcd(params.last_weapon === level.var_42db149f);
	}
	var_d14812a6 = params.weapon !== level.weaponnone && (params.weapon === level.var_e3f5eafc || params.weapon === level.var_42db149f);
	if(var_d14812a6)
	{
		var_c5c03b2 = params.weapon === level.var_42db149f;
		var_e047216a = "ges_spy_camera_ads";
		self.var_340d4e74 = 1;
		if(var_c5c03b2)
		{
			var_e047216a = "ges_binoculars_ads";
		}
		self thread function_b917e313(params.weapon, var_e047216a, var_c5c03b2);
	}
}

/*
	Name: function_ab7ec803
	Namespace: namespace_3bb22a53
	Checksum: 0x3BA29518
	Offset: 0xA78
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_ab7ec803()
{
	level flag::delay_set(0.1, "flg_spy_cam_player_spawned");
}

/*
	Name: function_6de171e9
	Namespace: namespace_3bb22a53
	Checksum: 0x782C58C
	Offset: 0xAB0
	Size: 0x9A
	Parameters: 1
	Flags: None
*/
function function_6de171e9(slot)
{
	if(!isdefined(slot))
	{
		slot = 4;
	}
	/#
		assert(level.var_e3f5eafc != level.weaponnone);
	#/
	self giveweapon(level.var_e3f5eafc);
	self setactionslot(slot, "weapon", level.var_e3f5eafc);
	self.var_390003ff = slot;
}

/*
	Name: function_8606cd15
	Namespace: namespace_3bb22a53
	Checksum: 0x98D41D60
	Offset: 0xB58
	Size: 0x9A
	Parameters: 1
	Flags: None
*/
function function_8606cd15(slot)
{
	if(!isdefined(slot))
	{
		slot = 4;
	}
	/#
		assert(level.var_42db149f != level.weaponnone);
	#/
	self giveweapon(level.var_42db149f);
	self setactionslot(slot, "weapon", level.var_42db149f);
	self.var_5915e3c5 = slot;
}

/*
	Name: function_b83af2a9
	Namespace: namespace_3bb22a53
	Checksum: 0xC88BB042
	Offset: 0xC00
	Size: 0xC6
	Parameters: 0
	Flags: None
*/
function function_b83af2a9()
{
	player = undefined;
	if(isplayer(self))
	{
		player = self;
	}
	else
	{
		player = getplayers()[0];
	}
	if(player hasweapon(level.var_e3f5eafc))
	{
		player takeweapon(level.var_e3f5eafc);
	}
	if(isdefined(player.var_390003ff))
	{
		player setactionslot(player.var_390003ff, "");
		player.var_390003ff = undefined;
	}
}

/*
	Name: remove_binoculars
	Namespace: namespace_3bb22a53
	Checksum: 0xB385086F
	Offset: 0xCD0
	Size: 0xC6
	Parameters: 0
	Flags: None
*/
function remove_binoculars()
{
	player = undefined;
	if(isplayer(self))
	{
		player = self;
	}
	else
	{
		player = getplayers()[0];
	}
	if(player hasweapon(level.var_42db149f))
	{
		player takeweapon(level.var_42db149f);
	}
	if(isdefined(player.var_5915e3c5))
	{
		player setactionslot(player.var_5915e3c5, "");
		player.var_5915e3c5 = undefined;
	}
}

/*
	Name: function_f91a82ef
	Namespace: namespace_3bb22a53
	Checksum: 0x8D724463
	Offset: 0xDA0
	Size: 0xFC
	Parameters: 4
	Flags: None
*/
function function_f91a82ef(b_enabled, var_b3649521, initial_delay, var_34487abc)
{
	if(!isdefined(b_enabled))
	{
		b_enabled = 1;
	}
	if(!isdefined(var_b3649521))
	{
		var_b3649521 = #"hash_12be6ba1327c64b1";
	}
	if(!isdefined(initial_delay))
	{
		initial_delay = 8000;
	}
	level.var_e3f5eafc.var_f91a82ef = b_enabled;
	level.var_e3f5eafc.var_7d598677 = var_b3649521;
	level.var_e3f5eafc.var_3a0d6cd6 = initial_delay;
	level.var_e3f5eafc.var_257480e5 = var_34487abc;
	if(b_enabled == 0)
	{
		level flag::wait_till("flg_spy_cam_player_spawned");
		getplayers()[0] thread util::hide_hint_text();
	}
}

/*
	Name: function_de6d9b74
	Namespace: namespace_3bb22a53
	Checksum: 0xE76D0156
	Offset: 0xEA8
	Size: 0x100
	Parameters: 1
	Flags: None
*/
function function_de6d9b74(prompts)
{
	/#
		assert(isarray(prompts) || function_7a600918(prompts));
	#/
	level.var_af143f1d = [];
	if(isarray(prompts))
	{
		level.var_af143f1d = prompts;
	}
	else
	{
		if(!isdefined(level.var_af143f1d))
		{
			level.var_af143f1d = [];
		}
		else if(!isarray(level.var_af143f1d))
		{
			level.var_af143f1d = array(level.var_af143f1d);
		}
		level.var_af143f1d[level.var_af143f1d.size] = prompts;
	}
}

/*
	Name: function_b917e313
	Namespace: namespace_3bb22a53
	Checksum: 0x24DD45B6
	Offset: 0xFB0
	Size: 0xB20
	Parameters: 3
	Flags: Linked, Private
*/
function private function_b917e313(camera, var_e047216a, var_c5c03b2)
{
	self endon(#"death", #"hash_84ab457ebc19a5a");
	if(!isdefined(self.var_3bb22a53))
	{
		self.var_3bb22a53 = spawnstruct();
	}
	var_f94537f6 = 0;
	var_d587d9d3 = 0;
	var_ff17ab00 = 0;
	var_697c5b2b = int(2 * 1000);
	var_a05f9c5f = 0;
	var_83cf950f = self getgesturestarttime(var_e047216a, "loop") * 1000;
	var_4308b3d8 = 0;
	var_a30db60b = 0;
	self val::set("spy_camera", "disable_weapon_fire", 1);
	self notify(#"hash_1f7aaeb7335319e5");
	if(!var_c5c03b2)
	{
		self notify(#"hash_2afde4f84491f78a");
		self thread function_2d8ba5c4();
		setuimodelvalue(getuimodel(function_90d058e8(#"hash_3b49d2db23128dc5"), "stream"), 1);
	}
	else
	{
		setuimodelvalue(getuimodel(function_90d058e8(#"hash_3b49d2db23128dc5"), "stream"), 2);
	}
	while(true)
	{
		if(!self isswitchingweapons() && !self isreloading() && self adsbuttonpressed())
		{
			if(!var_a30db60b)
			{
				var_a30db60b = 1;
				self playgestureviewmodel(var_e047216a, undefined, 1);
				var_4308b3d8 = var_83cf950f + gettime();
				var_d587d9d3 = 0;
				self notify(#"hash_19f1b179d8ebf1dd");
				self val::set("spy_camera", "freezecontrols_allowlook", 1);
				self val::set("spy_camera", "disable_weapon_cycling", 1);
			}
			else if(self isgestureplaying(var_e047216a) && gettime() > var_4308b3d8)
			{
				if(!var_f94537f6)
				{
					var_f94537f6 = 1;
					self notify(#"hash_59b80e9e535f9788");
				}
				if(var_a05f9c5f != 1)
				{
					var_a05f9c5f = 1;
					self clientfield::set_to_player("spy_camera_state", 1);
					namespace_82bfe441::fade(1, "FadeFast");
					if(var_c5c03b2)
					{
						self clientfield::set_to_player("binoculars_overlay", 1);
						namespace_61e6d095::create(#"binoculars", #"hash_1703896731dc6998");
					}
					self thread function_376f686f();
					self hideviewmodel();
					self val::reset("spy_camera", "disable_weapon_fire");
					namespace_c8e236da::function_c27f93d5();
					if(!isdefined(level.var_af143f1d) || level.var_af143f1d.size == 0)
					{
						level.var_af143f1d = [];
						if(self gamepadusedlast())
						{
							if(!isdefined(level.var_af143f1d))
							{
								level.var_af143f1d = [];
							}
							else if(!isarray(level.var_af143f1d))
							{
								level.var_af143f1d = array(level.var_af143f1d);
							}
							level.var_af143f1d[level.var_af143f1d.size] = #"hash_4d41512a9dd19c05";
						}
						else
						{
							if(!isdefined(level.var_af143f1d))
							{
								level.var_af143f1d = [];
							}
							else if(!isarray(level.var_af143f1d))
							{
								level.var_af143f1d = array(level.var_af143f1d);
							}
							level.var_af143f1d[level.var_af143f1d.size] = #"hash_d4008a2e030bdb1";
							if(!isdefined(level.var_af143f1d))
							{
								level.var_af143f1d = [];
							}
							else if(!isarray(level.var_af143f1d))
							{
								level.var_af143f1d = array(level.var_af143f1d);
							}
							level.var_af143f1d[level.var_af143f1d.size] = #"hash_2057dc2d69c5cb2";
						}
						if(!var_c5c03b2)
						{
							if(!isdefined(level.var_af143f1d))
							{
								level.var_af143f1d = [];
							}
							else if(!isarray(level.var_af143f1d))
							{
								level.var_af143f1d = array(level.var_af143f1d);
							}
							level.var_af143f1d[level.var_af143f1d.size] = #"hash_38a90a5154d5fa9a";
						}
					}
					foreach(item in level.var_af143f1d)
					{
						namespace_c8e236da::function_ebf737f8(item);
					}
				}
				else if(!var_c5c03b2 && self attackbuttonpressed() && gettime() > var_ff17ab00)
				{
					var_a05f9c5f = 2;
					var_ff17ab00 = var_697c5b2b + gettime();
					self clientfield::set_to_player("spy_camera_state", 2);
					namespace_c8e236da::function_f7362969(hash("spy_camera_photo_taken"));
					self notify(#"take_picture");
					self val::set("spy_camera", "disable_weapon_fire", 1);
					self util::delay((float(var_697c5b2b) / 1000) - 0.5, "death", &namespace_c8e236da::function_f7362969, hash("spy_camera_photo_taken"), 0);
					wait((float(var_697c5b2b) / 1000) - 0.25);
				}
			}
		}
		else if(var_a30db60b)
		{
			var_a30db60b = 0;
			if(var_f94537f6)
			{
				var_f94537f6 = 0;
				namespace_c8e236da::function_c27f93d5();
			}
			if(var_a05f9c5f != 0)
			{
				self lui::screen_fade_out(0.1);
				var_a05f9c5f = 0;
				self clientfield::set_to_player("spy_camera_state", 0);
				wait(0.1);
				namespace_82bfe441::fade(0, "FadeFast");
				if(var_c5c03b2)
				{
					self clientfield::set_to_player("binoculars_overlay", 0);
					namespace_61e6d095::remove(#"binoculars");
				}
				self lui::screen_fade_in(0.05);
				self showviewmodel();
				self val::set("spy_camera", "disable_weapon_fire", 1);
			}
			self stopgestureviewmodel(var_e047216a);
			self notifyonplayercommandremove("toggle_stance", "+stance");
			self notifyonplayercommandremove("go_stand", "+gostand");
			self notify(#"hash_5512f0799022267");
			self val::reset("spy_camera", "freezecontrols_allowlook");
			self val::reset("spy_camera", "disable_weapon_cycling");
			while(self isgestureplaying(var_e047216a))
			{
				waitframe(1);
			}
			self notify(#"hash_2c04af2e3bf6a169");
		}
		waitframe(1);
	}
}

/*
	Name: function_376f686f
	Namespace: namespace_3bb22a53
	Checksum: 0x47B1FF67
	Offset: 0x1AD8
	Size: 0x148
	Parameters: 0
	Flags: Linked, Private
*/
function private function_376f686f()
{
	self endon(#"hash_5512f0799022267", #"hash_84ab457ebc19a5a", #"death");
	self notifyonplayercommand("toggle_stance", "+stance");
	self notifyonplayercommand("go_stand", "+gostand");
	while(true)
	{
		ret = undefined;
		ret = self waittill(#"hash_158f4ec720008ac2", #"hash_35101c34998acadc");
		if(ret._notify == "go_stand" || self getstance() != "stand")
		{
			self setstance("stand");
		}
		else
		{
			self setstance("crouch");
		}
		wait(0.5);
	}
}

/*
	Name: function_d704edcd
	Namespace: namespace_3bb22a53
	Checksum: 0xA2A177AB
	Offset: 0x1C28
	Size: 0x254
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d704edcd(var_c5c03b2)
{
	self notify(#"hash_84ab457ebc19a5a");
	namespace_c8e236da::function_c27f93d5();
	self val::reset("spy_camera", "freezecontrols_allowlook");
	self val::reset("spy_camera", "disable_weapon_cycling");
	self clientfield::set_to_player("spy_camera_state", 0);
	namespace_82bfe441::fade(0, "FadeFast");
	self lui::function_a6eb5334(0);
	if(namespace_61e6d095::exists(#"binoculars"))
	{
		self clientfield::set_to_player("binoculars_overlay", 0);
		namespace_61e6d095::remove(#"binoculars");
	}
	self notify(#"hash_2977cbecfddfcab6");
	self notify(#"hash_167fe97f3e95d4c2");
	self notify(#"hash_31eeefcdd1870ad5");
	level.var_af143f1d = [];
	self showviewmodel();
	self val::reset_all("spy_camera");
	self notifyonplayercommandremove("toggle_stance", "+stance");
	self notifyonplayercommandremove("go_stand", "+gostand");
	setuimodelvalue(getuimodel(function_90d058e8(#"hash_3b49d2db23128dc5"), "stream"), 0);
}

/*
	Name: function_2d8ba5c4
	Namespace: namespace_3bb22a53
	Checksum: 0xBCD02672
	Offset: 0x1E88
	Size: 0x2CC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2d8ba5c4()
{
	self notify(#"hash_2977cbecfddfcab6");
	self endon(#"hash_2977cbecfddfcab6", #"death");
	var_acca0715 = gettime();
	if(!isdefined(level.var_e3f5eafc.var_7d598677))
	{
		level.var_e3f5eafc.var_7d598677 = #"hash_12be6ba1327c64b1";
	}
	if(!isdefined(level.var_e3f5eafc.var_3a0d6cd6))
	{
		level.var_e3f5eafc.var_3a0d6cd6 = 8000;
	}
	if(!isdefined(level.var_e3f5eafc.var_f91a82ef))
	{
		level.var_e3f5eafc.var_f91a82ef = 1;
	}
	while(true)
	{
		var_b3fccd4b = gettime();
		var_496bb3bc = var_b3fccd4b - var_acca0715;
		if(is_true(level.var_e3f5eafc.var_f91a82ef) && var_496bb3bc >= level.var_e3f5eafc.var_3a0d6cd6 && !self scene::function_c935c42() && !self flag::get(#"lockpicking"))
		{
			var_34487abc = (isdefined(level.var_e3f5eafc.var_257480e5) ? level.var_e3f5eafc.var_257480e5 : "hide_camera_unequip_hint");
			self util::show_hint_text(level.var_e3f5eafc.var_7d598677, undefined, var_34487abc, 4000);
			self waittill(#"hash_19f1b179d8ebf1dd");
			self util::hide_hint_text(0);
		}
		else if(self scene::function_c935c42() || self flag::get(#"lockpicking"))
		{
			wait(1);
			var_acca0715 = gettime();
		}
		if(self isgestureplaying(#"hash_56d282b2049f223e"))
		{
			self waittill(#"hash_2c04af2e3bf6a169");
			var_acca0715 = gettime();
		}
		wait(0.5);
	}
}

