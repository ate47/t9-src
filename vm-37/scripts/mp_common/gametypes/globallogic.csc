#using script_13da4e6b98ca81a1;
#using script_1bd5a845bf9ba498;
#using script_4029012c9af5b12a;
#using script_6ad3fda349f49bf9;
#using script_6f7d15a072a2565;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\dogtags.csc;
#using scripts\core_common\killcam_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;

#namespace globallogic;

/*
	Name: function_89f2df9
	Namespace: globallogic
	Checksum: 0x1E53EFA
	Offset: 0x3A0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"globallogic", &function_70a657d8, undefined, undefined, #"visionset_mgr");
}

/*
	Name: function_70a657d8
	Namespace: globallogic
	Checksum: 0xB2230182
	Offset: 0x3F0
	Size: 0xB84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	visionset_mgr::register_visionset_info("mpintro", 1, 31, undefined, "mpintro");
	visionset_mgr::register_visionset_info("crithealth", 1, 25, undefined, "critical_health");
	animation::add_notetrack_func(#"globallogic::play_plant_sound", &play_plant_sound);
	clientfield::register("world", "game_ended", 1, 1, "int", &on_end_game, 1, 1);
	clientfield::register("world", "post_game", 1, 1, "int", &post_game, 1, 1);
	registerclientfield("playercorpse", "firefly_effect", 1, 2, "int", &firefly_effect_cb, 0);
	registerclientfield("playercorpse", "annihilate_effect", 1, 1, "int", &annihilate_effect_cb, 0);
	registerclientfield("playercorpse", "pineapplegun_effect", 1, 1, "int", &pineapplegun_effect_cb, 0);
	registerclientfield("actor", "annihilate_effect", 1, 1, "int", &annihilate_effect_cb, 0);
	registerclientfield("actor", "pineapplegun_effect", 1, 1, "int", &pineapplegun_effect_cb, 0);
	clientfield::function_5b7d846d("hudItems.team1.roundsWon", #"hash_410fe12a68d6e801", [1:#"roundswon", 0:#"team1"], 1, 4, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.team2.roundsWon", #"hash_410fe12a68d6e801", [1:#"roundswon", 0:#"team2"], 1, 4, "int", undefined, 0, 0);
	teamcount = getgametypesetting(#"teamcount");
	for(i = 1; i <= teamcount; i++)
	{
		clientfield::function_5b7d846d(("hudItems.team" + i) + ".livesCount", #"hash_410fe12a68d6e801", [1:#"livescount", 0:#"team" + i], 1, 8, "int", undefined, 0, 0);
		clientfield::function_5b7d846d(("hudItems.team" + i) + ".noRespawnsLeft", #"hash_410fe12a68d6e801", [1:#"hash_76037d6f2477675a", 0:#"team" + i], 1, 1, "int", undefined, 0, 0);
	}
	clientfield::function_a8bbc967("hudItems.armorIsOnCooldown", #"hud_items", #"hash_2f36ddfd4c373968", 1, 1, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.hideOutcomeUI", #"hud_items", #"hideoutcomeui", 1, 1, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.captureCrateState", #"hud_items", #"capturecratestate", 1, 2, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.captureCrateTotalTime", #"hud_items", #"capturecratetotaltime", 1, 13, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.playerLivesCount", #"hud_items", #"hash_44630db9c3f712e2", 1, 8, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("huditems.killedByEntNum", #"hud_items", #"hash_2079d1575aee92da", 1, 4, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("huditems.killedByAttachmentCount", #"hud_items", #"hash_274d099fe70992df", 1, 4, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("huditems.killedByItemIndex", #"hud_items", #"hash_27e698bb4bd0cf62", 1, 10, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("huditems.killedByMOD", #"hud_items", #"hash_6974ee9ad621feeb", 1, 8, "int", undefined, 0, 0);
	for(index = 0; index < 5; index++)
	{
		clientfield::function_a8bbc967("huditems.killedByAttachment" + index, #"hud_items", #"hash_173e5db4d7c14570" + (isdefined(index) ? "" + index : ""), 1, 6, "int", undefined, 0, 0);
	}
	clientfield::register("toplayer", "thermal_sight", 1, 1, "int", &function_765b7c63, 0, 0);
	clientfield::register("toplayer", "strobe_light", 1, 1, "int", &function_e1af467, 0, 0);
	clientfield::register("allplayers", "cold_blooded", 1, 1, "int", &function_194072a7, 0, 0);
	level._effect[#"pineapplegun_explosion"] = undefined;
	level.gamestarted = 0;
	level.gameended = 0;
	level.postgame = 0;
	level.new_health_model = getdvarint(#"new_health_model", 1) > 0;
	level.var_90bb9821 = getgametypesetting(#"playermaxhealth") - 150;
	setdvar(#"hash_6028c4687677bbc9", getgametypesetting(#"boastenabled"));
	boastallowcam = getgametypesetting(#"boastallowcam");
	setdvar(#"hash_23c5d7207ebc0bf9", boastallowcam);
	setdvar(#"hash_62833d3c5e6d7380", boastallowcam);
	setdvar(#"hash_e099986c072eb0f", getgametypesetting(#"hash_104f124f56f0f20a"));
	setdvar(#"hash_553ad8f9db24bf22", int(1000 * getgametypesetting(#"hash_1614b9cbe0df6f75")));
	setdvar(#"hash_442d42efc73d739a", 25);
	callback::on_spawned(&on_player_spawned);
	callback::add_callback(#"hash_361e06db4b210e", &function_977fa24b);
	namespace_81c567a8::init_shared();
	level.droppedtagrespawn = getgametypesetting(#"droppedtagrespawn");
	if(is_true(level.droppedtagrespawn))
	{
		dogtags::init();
	}
}

/*
	Name: on_player_spawned
	Namespace: globallogic
	Checksum: 0x70BB012F
	Offset: 0xF80
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_player_spawned(localclientnum)
{
	self function_36b630a3(1);
}

/*
	Name: function_977fa24b
	Namespace: globallogic
	Checksum: 0x68D6B3CF
	Offset: 0xFB0
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_977fa24b(localclientnum)
{
	level.gamestarted = 1;
}

/*
	Name: on_end_game
	Namespace: globallogic
	Checksum: 0x9044AA5E
	Offset: 0xFD8
	Size: 0xA0
	Parameters: 7
	Flags: Linked
*/
function on_end_game(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump && !level.gameended)
	{
		callback::callback(#"on_end_game", fieldname);
		level notify(#"game_ended");
		level.gameended = 1;
	}
}

/*
	Name: post_game
	Namespace: globallogic
	Checksum: 0x75A61472
	Offset: 0x1080
	Size: 0x78
	Parameters: 7
	Flags: Linked
*/
function post_game(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump && !level.postgame)
	{
		level notify(#"post_game");
		level.postgame = 1;
	}
}

/*
	Name: firefly_effect_cb
	Namespace: globallogic
	Checksum: 0x133CD566
	Offset: 0x1100
	Size: 0x4E
	Parameters: 7
	Flags: Linked
*/
function firefly_effect_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

/*
	Name: annihilate_effect_cb
	Namespace: globallogic
	Checksum: 0xD081AF82
	Offset: 0x1158
	Size: 0x16C
	Parameters: 7
	Flags: Linked
*/
function annihilate_effect_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump && !fieldname)
	{
		character_index = self getcharacterbodytype();
		fields = getcharacterfields(character_index, currentsessionmode());
		if(isdefined(fields.fullbodyexplosion) && fields.fullbodyexplosion != "")
		{
			if(util::is_mature() && !util::is_gib_restricted_build())
			{
				where = self gettagorigin("J_SpineLower");
				if(!isdefined(where))
				{
					where = self.origin;
					where = where + vectorscale((0, 0, 1), 40);
				}
				playfx(binitialsnap, fields.fullbodyexplosion, where);
			}
		}
	}
}

/*
	Name: pineapplegun_effect_cb
	Namespace: globallogic
	Checksum: 0xE9C72B0
	Offset: 0x12D0
	Size: 0xEC
	Parameters: 7
	Flags: Linked
*/
function pineapplegun_effect_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump && !fieldname)
	{
		if(isdefined(level._effect[#"pineapplegun_explosion"]))
		{
			where = self gettagorigin("J_SpineLower");
			if(!isdefined(where))
			{
				where = self.origin;
				where = where + vectorscale((0, 0, 1), 40);
			}
			playfx(binitialsnap, level._effect[#"pineapplegun_explosion"], where);
		}
	}
}

/*
	Name: play_plant_sound
	Namespace: globallogic
	Checksum: 0x10CDB64A
	Offset: 0x13C8
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function play_plant_sound(param1, param2)
{
	if(function_1e6822f(self, "No Plant Sounds"))
	{
		return;
	}
	tagpos = self gettagorigin("j_ring_ri_2");
	self playsound(self.localclientnum, #"hash_769978b2a32a4d77", tagpos);
}

/*
	Name: updateenemyequipment
	Namespace: globallogic
	Checksum: 0xDD8A90F4
	Offset: 0x1460
	Size: 0x194
	Parameters: 2
	Flags: Linked
*/
function updateenemyequipment(local_client_num, newval)
{
	if(codcaster::function_b8fe9b52(newval))
	{
		var_7eda7144 = (self codcaster::is_friendly(newval) ? #"friendly" : #"enemy");
		var_c43ac0da = (self codcaster::is_friendly(newval) ? #"hash_2476e7ae62469f70" : #"hash_2476eaae6246a489");
		self renderoverridebundle::function_c8d97b8e(newval, var_7eda7144, var_c43ac0da);
		return;
	}
	if(isdefined(level.var_58253868))
	{
		self renderoverridebundle::function_c8d97b8e(newval, #"friendly", #"hash_66ac79c57723c169");
	}
	if(isdefined(level.var_420d7d7e))
	{
		self renderoverridebundle::function_c8d97b8e(newval, #"enemy", #"hash_691f7dc47ae8aa08");
	}
	self renderoverridebundle::function_c8d97b8e(newval, #"friendly", #"hash_ebb37dab2ee0ae3");
}

/*
	Name: function_116b413e
	Namespace: globallogic
	Checksum: 0x2A917C81
	Offset: 0x1600
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_116b413e(local_client_num, newval)
{
	self killstreak_detect::function_d859c344(local_client_num, newval);
}

/*
	Name: function_765b7c63
	Namespace: globallogic
	Checksum: 0xF723A90F
	Offset: 0x1638
	Size: 0x26C
	Parameters: 7
	Flags: Linked
*/
function function_765b7c63(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(newval)
	{
		if(!is_true(self.var_33b61b6f))
		{
			self.var_8e7f416f = self playloopsound(#"hash_a93a3bf58dbd89d");
			self.var_33b61b6f = 1;
		}
	}
	else if(is_true(self.var_33b61b6f))
	{
		self stoploopsound(self.var_8e7f416f);
		self.var_33b61b6f = 0;
	}
	level notify(#"hash_2452fc0a6548ed2d");
	players = getplayers(local_client_num);
	foreach(player in players)
	{
		if(util::function_fbce7263(player.team, self.team) && player hasperk(local_client_num, #"specialty_immunenvthermal"))
		{
			player function_194072a7(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
		}
	}
	util::clean_deleted(level.enemyequip);
	array::thread_all(level.enemyequip, &updateenemyequipment, local_client_num, newval);
	util::clean_deleted(level.enemyvehicles);
	array::thread_all(level.enemyvehicles, &function_116b413e, local_client_num, newval);
}

/*
	Name: function_e1af467
	Namespace: globallogic
	Checksum: 0x89C525A7
	Offset: 0x18B0
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_e1af467(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(function_1cbf351b(fieldname))
	{
		return;
	}
	if(bwastimejump && !self function_6c32d092(fieldname, #"talent_resistance"))
	{
		self function_36b630a3(0);
	}
	else
	{
		self function_36b630a3(1);
	}
}

/*
	Name: function_194072a7
	Namespace: globallogic
	Checksum: 0x34AAD7DC
	Offset: 0x1988
	Size: 0xE4
	Parameters: 7
	Flags: Linked
*/
function function_194072a7(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!function_4e3684f2(fieldname))
	{
		if(bwastimejump)
		{
			self function_5d482e78(#"rob_sonar_set_enemy");
			self function_bf9d3071(#"rob_sonar_set_enemy_cold");
		}
		else
		{
			self function_5d482e78(#"rob_sonar_set_enemy_cold");
			self function_bf9d3071(#"rob_sonar_set_enemy");
		}
	}
}

