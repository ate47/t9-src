#using script_263b7f2982258785;
#using script_31e9b35aaacbbd93;
#using script_3626f1b2cf51a99c;
#using script_3819e7a1427df6d2;
#using script_3b82b8c68189025e;
#using script_3dc93ca9902a9cda;
#using script_45e09f634c49fdba;
#using script_47fb62300ac0bd60;
#using script_4ae261b2785dda9f;
#using script_61cfc2ab8e60625;
#using script_671f58f0b7aa833d;
#using script_6809bf766eba194a;
#using script_74940ab70a48ee4e;
#using script_7b4396f5e8e35b28;
#using script_7d0013bbc05623b9;
#using script_9bfd3d8a6a89e5e;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\collectibles.gsc;
#using scripts\cp_common\gametypes\battlechatter.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\objectives.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\cp_common\util.gsc;

#namespace namespace_b995dbff;

/*
	Name: starting
	Namespace: namespace_b995dbff
	Checksum: 0x7F37DE40
	Offset: 0x988
	Size: 0x394
	Parameters: 1
	Flags: Linked
*/
function starting(str_skipto)
{
	thread objectives::scripted("obj_takedown_capture", undefined, #"hash_49c1d860c97e3792");
	player = getplayers()[0];
	var_8a3bb97c = getspawnerarray("raid_adler", "targetname");
	var_6534f716 = getspawnerarray("raid_woods", "targetname");
	level.adler = var_8a3bb97c[0] spawner::spawn(1);
	var_fcbd93e0 = struct::get("raid_capture_adler", "targetname");
	level.adler forceteleport(var_fcbd93e0.origin, var_fcbd93e0.angles);
	level.adler.ignoreall = 1;
	weapon = getweapon(#"pistol_semiauto_t9");
	level.adler aiutility::setprimaryweapon(weapon);
	level.adler ai::gun_switchto(weapon, "right");
	level.woods = var_6534f716[0] spawner::spawn(1);
	var_1100faeb = struct::get("raid_capture_woods", "targetname");
	level.woods forceteleport(var_1100faeb.origin, var_1100faeb.angles);
	level.woods.ignoreall = 1;
	exploder::exploder("lgt_vista_lights");
	level flag::set("flag_qasim_ready_for_interrogation");
	level scene::init("scene_tkd_hit2_rooftop");
	level thread function_daaa52d5();
	level.qasim = getactorarray("raid_qasim", "targetname")[0];
	level.qasim thread namespace_b100dd86::function_76bbdeec(undefined, "c_t9_cp_ira_militant_vip_qasim_head_nohat_injured");
	level.qasim thread namespace_b100dd86::function_f82142f8(undefined, "c_t9_cp_ira_militant_vip_qasim_tkd_body");
	level thread scene::skipto_end("scene_tkd_hit2_rooftop_slide_enemy2", "Shot 1", undefined, 1, 0);
	player util::delay(1, undefined, &util::set_low_ready, 1);
}

/*
	Name: function_daaa52d5
	Namespace: namespace_b995dbff
	Checksum: 0xC22A1EA5
	Offset: 0xD28
	Size: 0x2B0
	Parameters: 0
	Flags: Linked
*/
function function_daaa52d5()
{
	var_67de73de = getent("raid_capture_plant", "targetname");
	if(isdefined(var_67de73de))
	{
		level scene::init("scene_tkd_hit2_rooftop_props", [0:var_67de73de]);
	}
	level thread scene::play("scene_tkd_hit2_canal_ambience");
	level thread scene::init("bird_plantsmash_startle", "targetname");
	level thread function_bde24dd8();
	var_db9090e4 = getentarray("canal_boats", "targetname");
	foreach(boat in var_db9090e4)
	{
		if(isdefined(boat.target))
		{
			boat.var_dcc87061 = [];
			var_dcc87061 = getentarray(boat.target, "targetname");
			foreach(var_a8f6e856 in var_dcc87061)
			{
				if(isdefined(var_a8f6e856))
				{
					var_a8f6e856 linkto(boat);
					if(!isdefined(boat.var_dcc87061))
					{
						boat.var_dcc87061 = [];
					}
					else if(!isarray(boat.var_dcc87061))
					{
						boat.var_dcc87061 = array(boat.var_dcc87061);
					}
					boat.var_dcc87061[boat.var_dcc87061.size] = var_a8f6e856;
				}
			}
		}
		boat thread function_d40d301c();
	}
}

/*
	Name: function_bde24dd8
	Namespace: namespace_b995dbff
	Checksum: 0x41F09079
	Offset: 0xFE0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_bde24dd8()
{
	level waittill(#"hash_3e7de7a955d9aaa4");
	level thread scene::play("bird_plantsmash_startle", "targetname");
}

/*
	Name: function_d40d301c
	Namespace: namespace_b995dbff
	Checksum: 0x9ABF572B
	Offset: 0x1030
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_d40d301c()
{
	wait(randomfloatrange(0.5, 1.5));
	if(isdefined(self.script_noteworthy) && self.script_noteworthy == "boat_small")
	{
		self thread scene::play("scene_tkd_hit2_canal_ambience_boat_small", self);
	}
	else
	{
		self thread scene::play("scene_tkd_hit2_canal_ambience_boat_large", self);
	}
}

/*
	Name: main
	Namespace: namespace_b995dbff
	Checksum: 0x84D6F554
	Offset: 0x10C0
	Size: 0x534
	Parameters: 2
	Flags: Linked
*/
function main(str_skipto, b_starting)
{
	player = getplayers()[0];
	if(b_starting)
	{
		namespace_a052577e::function_724cb241();
	}
	level.var_b21fd7ea = [];
	scene::function_d0d7d9f7("scene_tkd_hit2_rooftop", &function_6c1a4c01);
	scene::function_d0d7d9f7("scene_tkd_hit2_rooftop_props", &function_6c1a4c01);
	level thread function_3dafee47();
	if(isdefined(level.adler))
	{
		level.var_d9f0cb5b = level.adler;
	}
	if(isdefined(level.woods))
	{
		level.var_e228f5df = level.woods;
	}
	level battlechatter::function_2ab9360b(0);
	player thread function_c0b643d5();
	level thread function_26e6230d();
	level thread function_ba74fe83();
	level waittill(#"hash_1971429b4a856253");
	player = getplayers()[0];
	while(!isplayer(player))
	{
		waitframe(1);
		player = getplayers()[0];
	}
	player thread util::delay(1, undefined, &disableweapons);
	level.adler thread function_e5aa773b("adler_leave_capture");
	level.woods thread function_e5aa773b("woods_leave_capture");
	player clientfield::set_to_player("lerp_fov", 0);
	namespace_a052577e::function_60c0a46b();
	level thread objectives::complete("obj_takedown_capture");
	namespace_a052577e::function_a5d5a125();
	level thread namespace_29a279dd::function_901ca209(1);
	wait(2);
	player disableweapons();
	level thread namespace_29a279dd::function_901ca209(2, #"hash_1b54ccd62c65b43a");
	wait(0.5);
	player setstance("stand");
	player freezecontrols(1);
	player util::set_low_ready(0);
	namespace_7d4dd7f0::function_a2015343();
	level thread scene::init("scene_tkd_hit3_intro");
	wait(2.5);
	if(isdefined(level.var_d9f0cb5b.magic_bullet_shield))
	{
		level thread util::stop_magic_bullet_shield(level.var_d9f0cb5b);
	}
	if(isdefined(level.var_e228f5df.magic_bullet_shield))
	{
		level thread util::stop_magic_bullet_shield(level.var_e228f5df);
	}
	level scene::stop("scene_tkd_hit2_rooftop", 1);
	level scene::stop("scene_tkd_hit2_rooftop_props", 1);
	level scene::stop("scene_tkd_hit2_canal_ambience", 1);
	corpses = getcorpsearray();
	foreach(corpse in corpses)
	{
		if(isactorcorpse(corpse))
		{
			corpse delete();
		}
	}
	if(isdefined(str_skipto))
	{
		skipto::objective_completed(str_skipto);
	}
}

/*
	Name: function_c0b643d5
	Namespace: namespace_b995dbff
	Checksum: 0xC72637BC
	Offset: 0x1600
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_c0b643d5()
{
	level waittill(#"hash_4fb9af0599362b26");
	self playrumbleonentity("damage_heavy");
}

/*
	Name: function_26e6230d
	Namespace: namespace_b995dbff
	Checksum: 0x7DF3ADD8
	Offset: 0x1648
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_26e6230d()
{
	if(!isdefined(level.qasim))
	{
		level.qasim = getactorarray("raid_qasim", "targetname")[0];
	}
	level.qasim endon(#"death");
	level.qasim.var_c681e4c1 = 1;
	level.qasim.ignoreall = 1;
	level.var_d9f0cb5b = level.adler;
	level.var_e228f5df = level.woods;
	level.var_862acc3d = level.qasim;
	level flag::wait_till("flag_qasim_ready_for_interrogation");
	level.qasim thread dialog_tree::function_cfa96cee(level.var_27da2f39, undefined, undefined, undefined, 100, 200, 15, vectorscale((0, 0, 1), 6), 1);
	level.qasim prompts::function_2557566(#"use", 5);
}

/*
	Name: function_e5aa773b
	Namespace: namespace_b995dbff
	Checksum: 0x7B916BDE
	Offset: 0x17A0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_e5aa773b(struct_name)
{
	struct = struct::get(struct_name, "targetname");
	self ai::set_behavior_attribute("demeanor", "patrol");
	self ai::force_goal(struct.origin, 0);
}

/*
	Name: function_6c1a4c01
	Namespace: namespace_b995dbff
	Checksum: 0x314C5BED
	Offset: 0x1828
	Size: 0x11C
	Parameters: 2
	Flags: Linked
*/
function function_6c1a4c01(a_ents, str_shot)
{
	foreach(ent in str_shot)
	{
		if(!isdefined(level.var_b21fd7ea))
		{
			level.var_b21fd7ea = [];
		}
		else if(!isarray(level.var_b21fd7ea))
		{
			level.var_b21fd7ea = array(level.var_b21fd7ea);
		}
		if(!isinarray(level.var_b21fd7ea, ent))
		{
			level.var_b21fd7ea[level.var_b21fd7ea.size] = ent;
		}
	}
}

/*
	Name: function_44f8874
	Namespace: namespace_b995dbff
	Checksum: 0xBA5E593B
	Offset: 0x1950
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function function_44f8874()
{
	level notify(#"hash_5737131f700cbdb");
	level.qasim stopsounds();
	level.qasim dialogue::function_47b06180();
	if(isdefined(level.var_30fc6630))
	{
		level.var_30fc6630 delete();
	}
	if(isdefined(level.var_d9f0cb5b.model) && level.var_d9f0cb5b.model != #"c_t9_usa_hero_adler_civ_amsterdam_body_no_dyn")
	{
		level.var_d9f0cb5b thread namespace_b100dd86::function_f82142f8(undefined, "c_t9_usa_hero_adler_civ_amsterdam_body_no_dyn");
	}
	level thread scene::play("scene_tkd_hit2_rooftop_props", "dt_enter");
	level scene::play("scene_tkd_hit2_rooftop", "dt_enter");
	level notify(#"hash_6fec65520df29efc");
	level thread scene::play("scene_tkd_hit2_rooftop", "dt_idle");
}

/*
	Name: function_8a6dd527
	Namespace: namespace_b995dbff
	Checksum: 0xA4E8A0A4
	Offset: 0x1AB8
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_8a6dd527()
{
	level waittill(#"hash_74f0b712a3680b18");
	self clientfield::set_to_player("lerp_fov", 5);
}

/*
	Name: function_3dafee47
	Namespace: namespace_b995dbff
	Checksum: 0x5ECBB10C
	Offset: 0x1B00
	Size: 0x49C
	Parameters: 0
	Flags: Linked
*/
function function_3dafee47()
{
	var_6139147e = [4:"vox_cp_tdwn_05100_adlr_newpresidentnew_27", 3:"vox_cp_tdwn_05100_adlr_ivesteppedthrou_86", 2:"vox_cp_tdwn_05100_qasm_youcantdothisyo_0e", 1:"vox_cp_tdwn_05100_adlr_idontthinkyouun_95", 0:"vox_cp_tdwn_05100_qasm_iijusthandlethe_6e"];
	level.var_27da2f39 = dialog_tree::function_82b16606(&function_44f8874, undefined, 1, 0, "scene_tkd_hit2_rooftop");
	level.var_27da2f39 dialog_tree::function_58d27b23(#"hash_3c66be703efed3de", undefined, "dt_1_res", "dt_idle", 1, undefined, undefined, &function_86b6bafa);
	level.var_27da2f39 dialog_tree::function_58d27b23(#"hash_318bdd24cc15cbb", undefined, "dt_1_res", "dt_idle", 1, undefined, undefined, &function_86b6bafa);
	dialog_tree::function_21780fc5(level.var_27da2f39, array(1340, 700));
	level.var_58759087 = dialog_tree::function_82b16606(undefined, undefined, 1, 0, "scene_tkd_hit2_rooftop");
	level.var_58759087 dialog_tree::function_58d27b23(#"hash_f2078633819f72a", undefined, "dt_2_res", "dt_idle", 1, undefined, undefined, &function_58efdf6d);
	level.var_58759087 dialog_tree::function_58d27b23(#"hash_18daf35010313d18", undefined, "dt_2_res", "dt_idle", 1, undefined, undefined, &function_58efdf6d);
	dialog_tree::function_21780fc5(level.var_58759087, array(1340, 700));
	level.var_4a3df400 = dialog_tree::function_82b16606(undefined, undefined, 1, 0, "scene_tkd_hit2_rooftop");
	level.var_4a3df400 dialog_tree::function_58d27b23(#"hash_349afebd4cf454c0", undefined, "dt_3_res", "dt_idle", 1, undefined, undefined, &function_6321f3d1);
	level.var_4a3df400 dialog_tree::function_58d27b23(#"hash_492dbe6eaab8aa2f", undefined, undefined, undefined, 1, undefined, undefined, &function_80b14544);
	dialog_tree::function_21780fc5(level.var_4a3df400, array(1340, 700));
	level.var_cb1375a9 = dialog_tree::function_82b16606(undefined, undefined, 1, 0, "scene_tkd_hit2_rooftop");
	level.var_cb1375a9 dialog_tree::function_58d27b23(#"hash_129166306e8bfcd3", undefined, undefined, undefined, 1, undefined, undefined, &function_4f4627e4);
	level.var_cb1375a9 dialog_tree::function_58d27b23(#"hash_492dbe6eaab8aa2f", undefined, undefined, undefined, 1, undefined, undefined, &function_80b14544);
	level.var_cb1375a9 dialog_tree::function_58d27b23(#"hash_48d4e67acff606fd", undefined, undefined, undefined, 1, undefined, undefined, &function_c29f52ec);
	dialog_tree::function_21780fc5(level.var_cb1375a9, array(1340, 700));
}

/*
	Name: function_86b6bafa
	Namespace: namespace_b995dbff
	Checksum: 0x243E9D6D
	Offset: 0x1FA8
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_86b6bafa()
{
	level thread namespace_a052577e::function_e88f8edb();
	self waittill(#"hash_12324459eb2bc76d");
	level.var_58759087 thread dialog_tree::run(level.qasim);
	level districts::function_a7d79fcb([1:"airfield_base", 0:"airfield_intro"]);
	level thread function_5f86b0a3();
	if(isdefined(level.var_d9f0cb5b.model) && level.var_d9f0cb5b.model != #"c_t9_usa_hero_adler_civ_amsterdam_body")
	{
		level.var_d9f0cb5b thread namespace_b100dd86::function_f82142f8(undefined, "c_t9_usa_hero_adler_civ_amsterdam_body");
	}
}

/*
	Name: function_b47183fb
	Namespace: namespace_b995dbff
	Checksum: 0xB8F58451
	Offset: 0x20B8
	Size: 0x1CC
	Parameters: 0
	Flags: Linked
*/
function function_b47183fb()
{
	if(!isdefined(level.var_5895f36c))
	{
		level.var_5895f36c = getent("raid_capture_street_vehicle", "targetname");
	}
	if(!isdefined(level.var_5895f36c))
	{
		return;
	}
	if(level.var_5895f36c haspart("tag_glass_windshield_d1"))
	{
		level.var_5895f36c hidepart("tag_glass_windshield_d1");
	}
	if(level.var_5895f36c haspart("tag_glass_hatch_d1"))
	{
		level.var_5895f36c hidepart("tag_glass_hatch_d1");
	}
	if(level.var_5895f36c haspart("tag_glass_right_side_d1"))
	{
		level.var_5895f36c hidepart("tag_glass_right_side_d1");
	}
	if(level.var_5895f36c haspart("tag_glass_left_side_d1"))
	{
		level.var_5895f36c hidepart("tag_glass_left_side_d1");
	}
	if(level.var_5895f36c haspart("tag_glass_right_front_d1"))
	{
		level.var_5895f36c hidepart("tag_glass_right_front_d1");
	}
	if(level.var_5895f36c haspart("tag_glass_left_front_d1"))
	{
		level.var_5895f36c hidepart("tag_glass_left_front_d1");
	}
}

/*
	Name: function_ba74fe83
	Namespace: namespace_b995dbff
	Checksum: 0xFAE726F8
	Offset: 0x2290
	Size: 0x3F4
	Parameters: 0
	Flags: Linked
*/
function function_ba74fe83()
{
	if(!isdefined(level.var_5895f36c))
	{
		level function_b47183fb();
	}
	if(!isdefined(level.var_5895f36c))
	{
		return;
	}
	level waittill(#"hash_6cb6f4903c20dbae");
	playfxontag("destruct/fx_dest_glass_shard_impact_burst", level.var_5895f36c, "tag_glass_windshield_d0");
	if(level.var_5895f36c haspart("tag_glass_windshield_d0"))
	{
		level.var_5895f36c hidepart("tag_glass_windshield_d0");
	}
	if(level.var_5895f36c haspart("tag_glass_windshield_d1"))
	{
		level.var_5895f36c showpart("tag_glass_windshield_d1");
	}
	playfxontag("destruct/fx_dest_glass_shard_impact_burst", level.var_5895f36c, "tag_glass_hatch_d0");
	if(level.var_5895f36c haspart("tag_glass_hatch_d0"))
	{
		level.var_5895f36c hidepart("tag_glass_hatch_d0");
	}
	if(level.var_5895f36c haspart("tag_glass_hatch_d1"))
	{
		level.var_5895f36c showpart("tag_glass_hatch_d1");
	}
	if(level.var_5895f36c haspart("tag_glass_right_side_d0"))
	{
		level.var_5895f36c hidepart("tag_glass_right_side_d0");
	}
	if(level.var_5895f36c haspart("tag_glass_right_side_d1"))
	{
		level.var_5895f36c showpart("tag_glass_right_side_d1");
	}
	playfxontag("destruct/fx_dest_glass_shard_impact_burst", level.var_5895f36c, "tag_glass_left_side_d0");
	if(level.var_5895f36c haspart("tag_glass_left_side_d0"))
	{
		level.var_5895f36c hidepart("tag_glass_left_side_d0");
	}
	if(level.var_5895f36c haspart("tag_glass_left_side_d1"))
	{
		level.var_5895f36c showpart("tag_glass_left_side_d1");
	}
	playfxontag("destruct/fx_dest_glass_shard_impact_burst", level.var_5895f36c, "tag_glass_right_front_d0");
	if(level.var_5895f36c haspart("tag_glass_right_front_d0"))
	{
		level.var_5895f36c hidepart("tag_glass_right_front_d0");
	}
	if(level.var_5895f36c haspart("tag_glass_right_front_d1"))
	{
		level.var_5895f36c showpart("tag_glass_right_front_d1");
	}
	if(level.var_5895f36c haspart("tag_glass_left_front_d0"))
	{
		level.var_5895f36c hidepart("tag_glass_left_front_d0");
	}
	if(level.var_5895f36c haspart("tag_glass_left_front_d1"))
	{
		level.var_5895f36c showpart("tag_glass_left_front_d1");
	}
}

/*
	Name: function_58efdf6d
	Namespace: namespace_b995dbff
	Checksum: 0xAC4E261D
	Offset: 0x2690
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_58efdf6d()
{
	self waittill(#"hash_12324459eb2bc76d");
	level.var_4a3df400 thread dialog_tree::run(level.qasim);
}

/*
	Name: function_6321f3d1
	Namespace: namespace_b995dbff
	Checksum: 0x8FFCACF
	Offset: 0x26D8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_6321f3d1()
{
	self waittill(#"hash_12324459eb2bc76d");
	collectibles::function_6cd091d2(1, 0);
	level.var_cb1375a9 thread dialog_tree::run(level.qasim);
}

/*
	Name: function_80b14544
	Namespace: namespace_b995dbff
	Checksum: 0x13CFE596
	Offset: 0x2738
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_80b14544()
{
	level thread scene::play("scene_tkd_hit2_rooftop", "dt_end_1_throw");
	music::playstinger("3.2_kill_stinger");
	player = getplayers()[0];
	player waittillmatch({#notetrack:"end"}, #"hash_b1f863e899edc77");
	player player_decision::function_a029a114(1);
	getplayers()[0] stats::function_dad108fa(#"cp_bloodthirty_qasim_dead", 1);
	player_decision::function_8c0836dd(1);
}

/*
	Name: function_5f86b0a3
	Namespace: namespace_b995dbff
	Checksum: 0x78984895
	Offset: 0x2848
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_5f86b0a3()
{
	clip = getent("slide_enemy2_clip", "targetname");
	clip delete();
}

/*
	Name: function_c29f52ec
	Namespace: namespace_b995dbff
	Checksum: 0x81FD4400
	Offset: 0x2898
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_c29f52ec()
{
	level thread scene::play("scene_tkd_hit2_rooftop", "dt_end_2_capture");
	thread function_1998b542();
}

/*
	Name: function_1998b542
	Namespace: namespace_b995dbff
	Checksum: 0xAF092066
	Offset: 0x28E0
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_1998b542()
{
	player = getplayers()[0];
	player waittillmatch({#notetrack:"end"}, #"hash_40acbc898ee5e354");
	player player_decision::function_a029a114(0);
	player player_decision::function_8c0836dd(2);
}

/*
	Name: function_4f4627e4
	Namespace: namespace_b995dbff
	Checksum: 0x89FB0A1D
	Offset: 0x2970
	Size: 0x10E
	Parameters: 0
	Flags: Linked
*/
function function_4f4627e4()
{
	util::delay(1, undefined, &dialogue::player_say, "vox_cp_tdwn_05100_masn_thereyougo_99");
	level thread scene::play("scene_tkd_hit2_rooftop", "dt_5_res");
	self thread function_95707bc7();
	level.qasim thread function_f48f4f4f();
	player = getplayers()[0];
	player util::delay(2, undefined, &util::set_low_ready, 0);
	player waittillmatch({#notetrack:"end"}, #"hash_576c5aac6ddaa60a");
}

/*
	Name: function_f48f4f4f
	Namespace: namespace_b995dbff
	Checksum: 0xFBC12AC7
	Offset: 0x2A88
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_f48f4f4f()
{
	level endon(#"hash_2871e831466dfa03");
	self waittill(#"hash_276984293d5e72ee");
	self thread dialogue::queue("vox_cp_tdwn_05100_qasm_thankyou_94");
	self waittill(#"hash_2ecc2687291f2139");
	self thread dialogue::queue("vox_cp_tdwn_05100_qasm_pleaseigaveyouw_d0");
}

/*
	Name: function_95707bc7
	Namespace: namespace_b995dbff
	Checksum: 0x4D4A8A2D
	Offset: 0x2B10
	Size: 0x1CC
	Parameters: 0
	Flags: Linked
*/
function function_95707bc7()
{
	player = getplayers()[0];
	level endon(#"hash_19e8d79db3b9786a");
	level.qasim thread function_fa343ac7();
	aiutility::addaioverridedamagecallback(level.qasim, &function_c5881277);
	waitresult = undefined;
	waitresult = level.qasim waittill(#"damage", #"hash_5e43e2867eb75c4b");
	if(waitresult._notify == "dt_5_res_over")
	{
		level thread scene::play("scene_tkd_hit2_rooftop", "dt_5_res_idle");
		level thread function_2ed341fb();
		level.qasim waittill(#"damage");
		level.qasim stopsounds();
	}
	player player_decision::function_a029a114(1);
	player_decision::function_8c0836dd(1);
	level notify(#"hash_2871e831466dfa03");
	level.qasim dialogue::function_47b06180();
	level scene::play("scene_tkd_hit2_rooftop", "dt_end_3_playershoots");
}

/*
	Name: function_e65b6174
	Namespace: namespace_b995dbff
	Checksum: 0x718ADA84
	Offset: 0x2CE8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_e65b6174()
{
	level.qasim thread head_shot();
	level.qasim thread function_c5f7e209();
}

/*
	Name: head_shot
	Namespace: namespace_b995dbff
	Checksum: 0x96C38370
	Offset: 0x2D28
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function head_shot()
{
	self dialogue::queue("evt_qasim_headshot");
	self dialogue::function_47b06180();
}

/*
	Name: function_c5f7e209
	Namespace: namespace_b995dbff
	Checksum: 0xFE18B077
	Offset: 0x2D70
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_c5f7e209()
{
	self dialogue::queue("vox_cp_tdwn_05100_qasm_aaahh_f4");
	self dialogue::function_47b06180();
}

/*
	Name: function_c5881277
	Namespace: namespace_b995dbff
	Checksum: 0x298E0288
	Offset: 0x2DB8
	Size: 0x130
	Parameters: 16
	Flags: Linked
*/
function function_c5881277(inflictor, attacker, damage, idflags, meansofdeath, weapon, var_fd90b0bb, point, dir, hitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	aiutility::removeaioverridedamagecallback(level.qasim, &function_c5881277);
	level endon(#"hash_19e8d79db3b9786a");
	if(vsurfacenormal === "helmet" || vsurfacenormal === "head")
	{
		level.qasim thread head_shot();
		return partname;
	}
	level.qasim thread function_c5f7e209();
	return partname;
}

/*
	Name: function_dd99245
	Namespace: namespace_b995dbff
	Checksum: 0xB79688A2
	Offset: 0x2EF8
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_dd99245(s_result)
{
	if(s_result.mod === "MOD_HEAD_SHOT")
	{
		iprintlnbold("HEAD SHOT!");
	}
	else
	{
		iprintlnbold("NOT HEAD SHOT");
	}
}

/*
	Name: function_fa343ac7
	Namespace: namespace_b995dbff
	Checksum: 0xBB4E0891
	Offset: 0x2F60
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function function_fa343ac7()
{
	self endon(#"death");
	self endon(#"damage");
	self waittillmatch({#notetrack:"end"}, #"hash_14f49c6f7696568c");
	self notify(#"hash_5e43e2867eb75c4b");
}

/*
	Name: function_2ed341fb
	Namespace: namespace_b995dbff
	Checksum: 0x56CC43B4
	Offset: 0x2FD0
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_2ed341fb()
{
	player = getplayers()[0];
	level endon(#"hash_2871e831466dfa03");
	wait(6);
	level notify(#"hash_19e8d79db3b9786a");
	aiutility::removeaioverridedamagecallback(level.qasim, &function_c5881277);
	player player_decision::function_a029a114(1);
	player_decision::function_8c0836dd(1);
	level scene::play("scene_tkd_hit2_rooftop", "dt_end_4_Adlershoots");
}

/*
	Name: cleanup
	Namespace: namespace_b995dbff
	Checksum: 0xEA7B098A
	Offset: 0x30B8
	Size: 0x41C
	Parameters: 4
	Flags: Linked
*/
function cleanup(name, starting, direct, player)
{
	if(isdefined(level.var_862acc3d))
	{
		if(isdefined(level.var_862acc3d.magic_bullet_shield))
		{
			level thread util::stop_magic_bullet_shield(level.var_862acc3d);
		}
		level.var_862acc3d delete();
	}
	if(isdefined(level.var_d9f0cb5b))
	{
		if(isdefined(level.var_d9f0cb5b.magic_bullet_shield))
		{
			level thread util::stop_magic_bullet_shield(level.var_d9f0cb5b);
		}
		level.var_d9f0cb5b delete();
	}
	if(isdefined(level.var_e228f5df))
	{
		if(isdefined(level.var_e228f5df.magic_bullet_shield))
		{
			level thread util::stop_magic_bullet_shield(level.var_e228f5df);
		}
		level.var_e228f5df delete();
	}
	var_5895f36c = getent("raid_capture_street_vehicle", "targetname");
	if(isdefined(var_5895f36c))
	{
		var_5895f36c delete();
	}
	var_67de73de = getent("raid_capture_plant", "targetname");
	if(isdefined(var_67de73de))
	{
		var_67de73de delete();
	}
	var_db9090e4 = getentarray("canal_boats", "targetname");
	if(isdefined(var_db9090e4))
	{
		foreach(boat in var_db9090e4)
		{
			if(isdefined(boat.target))
			{
				var_dcc87061 = getentarray(boat.target, "targetname");
				foreach(var_a8f6e856 in var_dcc87061)
				{
					if(isdefined(var_a8f6e856))
					{
						var_a8f6e856 delete();
					}
				}
			}
			if(isdefined(boat))
			{
				boat delete();
			}
		}
	}
	var_407b31ed = getent("canal_house_boat", "targetname");
	if(isdefined(var_407b31ed))
	{
		var_407b31ed delete();
	}
	var_86309a32 = getent("canal_small_boat", "targetname");
	if(isdefined(var_86309a32))
	{
		var_86309a32 delete();
	}
	guys = getaiteamarray("axis");
	array::delete_all(guys);
}

/*
	Name: init_flags
	Namespace: namespace_b995dbff
	Checksum: 0x80F724D1
	Offset: 0x34E0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_flags()
{
}

/*
	Name: init_clientfields
	Namespace: namespace_b995dbff
	Checksum: 0x80F724D1
	Offset: 0x34F0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
}

/*
	Name: init_scenes
	Namespace: namespace_b995dbff
	Checksum: 0x80F724D1
	Offset: 0x3500
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_scenes()
{
}

/*
	Name: function_2d0aefe0
	Namespace: namespace_b995dbff
	Checksum: 0x679E4B66
	Offset: 0x3510
	Size: 0x184
	Parameters: 2
	Flags: None
*/
function function_2d0aefe0(height, time)
{
	if(!isdefined(time))
	{
		time = 3;
	}
	self disableweapons();
	struct = struct::get("raid_zoom_out_pos", "targetname");
	namespace_a052577e::function_60c0a46b();
	var_4449f5d0 = spawn("script_model", self.origin + vectorscale((0, 0, 1), 120));
	var_4449f5d0.angles = struct.angles;
	var_4449f5d0 setmodel("tag_origin");
	self playerlinktoblend(var_4449f5d0, "tag_origin", 0.5, 0, 0, 0.5, 0, 0, 1);
	var_4449f5d0 moveto(struct.origin, time, 0.5, time / 3);
	wait(time);
	var_4449f5d0 util::delay(2, undefined, &delete);
}

