#using scripts\core_common\system_shared.gsc;

#namespace namespace_c41a7a56;

/*
	Name: function_e73b7350
	Namespace: namespace_c41a7a56
	Checksum: 0xF59B44A
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e73b7350()
{
	level notify(1197734255);
}

/*
	Name: ignore_systems
	Namespace: namespace_c41a7a56
	Checksum: 0xA7875D4E
	Offset: 0x88
	Size: 0x3604
	Parameters: 0
	Flags: AutoExec
*/
function autoexec ignore_systems()
{
	system::ignore(#"hash_4236b7e69638cde7");
	system::ignore(#"hash_17158d9655e9dc58");
	system::ignore(#"hash_1b51a976dc0202c7");
	system::ignore(#"hash_7bd5e0fb2a57c52f");
	system::ignore(#"hash_4713d315c3e40cdc");
	system::ignore(#"hash_26dee29e21290041");
	system::ignore(#"awareness");
	system::ignore(#"archetype_avogadro");
	system::ignore(#"ac130");
	system::ignore(#"recon_car");
	system::ignore(#"land_mine");
	system::ignore(#"satchel_charge");
	system::ignore(#"planemortar");
	system::ignore(#"ultimate_turret");
	system::ignore(#"mp_bot_position");
	system::ignore(#"aat");
	system::ignore(#"ability_gadgets");
	system::ignore(#"ability_player");
	system::ignore(#"activecamo");
	system::ignore(#"hash_64a2c698e44452a3");
	system::ignore(#"hash_68f737a6647aee3f");
	system::ignore(#"hash_7e51b62fb1d59a7b");
	system::ignore(#"ai_squads");
	system::ignore(#"hash_21eea21fa15063b6");
	system::ignore(#"arena");
	system::ignore(#"armor_station");
	system::ignore(#"art");
	system::ignore(#"as_debug");
	system::ignore(#"ballistic_knife");
	system::ignore(#"battlechatter");
	system::ignore(#"bgb");
	system::ignore(#"bot_chain");
	system::ignore(#"hash_9ecdbde5a95aedc");
	system::ignore(#"bot_mp");
	system::ignore(#"character_banter");
	system::ignore(#"character_unlock");
	system::ignore(#"character_unlock_ajax");
	system::ignore(#"character_unlock_fixup");
	system::ignore(#"character_unlock_bruno");
	system::ignore(#"character_unlock_bruno_fixup");
	system::ignore(#"character_unlock_crash");
	system::ignore(#"character_unlock_crash_fixup");
	system::ignore(#"character_unlock_dempsey");
	system::ignore(#"character_unlock_dempsey_fixup");
	system::ignore(#"character_unlock_diego");
	system::ignore(#"character_unlock_diego_fixup");
	system::ignore(#"character_unlock_firebreak");
	system::ignore(#"character_unlock_firebreak_fixup");
	system::ignore(#"character_unlock_fixup");
	system::ignore(#"hash_17e03a4259356820");
	system::ignore(#"character_unlock_ix_bruno_fixup");
	system::ignore(#"character_unlock_ix_diego");
	system::ignore(#"character_unlock_ix_diego_fixup");
	system::ignore(#"character_unlock_ix_scarlett");
	system::ignore(#"character_unlock_ix_scarlett_fixup");
	system::ignore(#"hash_432d2ed90d4221b9");
	system::ignore(#"hash_d23efe71e585b90");
	system::ignore(#"character_unlock_mason");
	system::ignore(#"character_unlock_mason_fixup");
	system::ignore(#"character_unlock_menendez");
	system::ignore(#"character_unlock_menendez_fixup");
	system::ignore(#"character_unlock_nikolai");
	system::ignore(#"character_unlock_nikolai_fixup");
	system::ignore(#"character_unlock_nomad");
	system::ignore(#"character_unlock_nomad_fixup");
	system::ignore(#"character_unlock_outrider");
	system::ignore(#"character_unlock_outrider_fixup");
	system::ignore(#"character_unlock_prophet");
	system::ignore(#"character_unlock_prophet_fixup");
	system::ignore(#"character_unlock_reaper");
	system::ignore(#"character_unlock_reaper_fixup");
	system::ignore(#"character_unlock_recon");
	system::ignore(#"character_unlock_recon_fixup");
	system::ignore(#"character_unlock_reznov");
	system::ignore(#"character_unlock_reznov_fixup");
	system::ignore(#"character_unlock_richtofen");
	system::ignore(#"character_unlock_richtofen_fixup");
	system::ignore(#"character_unlock_ruin");
	system::ignore(#"character_unlock_ruin_fixup");
	system::ignore(#"character_unlock_scarlett");
	system::ignore(#"character_unlock_scarlett_fixup");
	system::ignore(#"character_unlock_seraph");
	system::ignore(#"character_unlock_seraph_fixup");
	system::ignore(#"character_unlock_spectre");
	system::ignore(#"character_unlock_spectre_fixup");
	system::ignore(#"hash_381cd19e62520883");
	system::ignore(#"hash_bff403c2cb59a3a");
	system::ignore(#"character_unlock_takeo");
	system::ignore(#"character_unlock_takeo_fixup");
	system::ignore(#"character_unlock_torque");
	system::ignore(#"character_unlock_torque_fixup");
	system::ignore(#"character_unlock_woods");
	system::ignore(#"character_unlock_woods_fixup");
	system::ignore(#"character_unlock_zero");
	system::ignore(#"character_unlock_zero_fixup");
	system::ignore(#"challenges_shared");
	system::ignore(#"chopper_gunner");
	system::ignore(#"colors");
	system::ignore(#"hash_19a39574bfda1b56");
	system::ignore(#"counteruav");
	system::ignore(#"demo");
	system::ignore(#"draft");
	system::ignore(#"flashlight");
	system::ignore(#"gadget_cleanse");
	system::ignore(#"gadget_concertina_wire");
	system::ignore(#"gadget_health_regen");
	system::ignore(#"gadget_hero_weapon");
	system::ignore(#"gadget_icepick");
	system::ignore(#"gadget_jammer");
	system::ignore(#"gadget_other");
	system::ignore(#"gadget_radiation_field");
	system::ignore(#"gadget_smart_cover");
	system::ignore(#"hash_363580133778f9a4");
	system::ignore(#"gadget_tripwire");
	system::ignore(#"gadget_vision_pulse");
	system::ignore(#"healthoverlay");
	system::ignore(#"killstreak_dog");
	system::ignore(#"helicopter");
	system::ignore(#"helicopter_guard");
	system::ignore(#"hash_3a7ac32272007c6d");
	system::ignore(#"infection");
	system::ignore(#"influencers_shared");
	system::ignore(#"hash_5b407861db3825b2");
	system::ignore(#"item_world");
	system::ignore(#"item_drop");
	system::ignore(#"item_inventory");
	system::ignore(#"hash_637836cd1d98abbd");
	system::ignore(#"hash_c70352f852fda84");
	system::ignore(#"killcam");
	system::ignore(#"killstreaks");
	system::ignore(#"laststand");
	system::ignore(#"laststand_mp");
	system::ignore(#"mechz");
	system::ignore(#"hash_30f3aa1706b7cb3d");
	system::ignore(#"mp_platoons");
	system::ignore(#"napalm_strike");
	system::ignore(#"planemortar");
	system::ignore(#"proximity_grenade");
	system::ignore(#"planner_commander");
	system::ignore(#"planner_commander_utility");
	system::ignore(#"hash_233e4730c6fdfb2");
	system::ignore(#"hash_432f3eb0cc2e347f");
	system::ignore(#"hash_363beb0dbbf3d8bb");
	system::ignore(#"hash_75440eb9162352b6");
	system::ignore(#"hash_698dcdb18ce4f995");
	system::ignore(#"player_monitor");
	system::ignore(#"zipline_player");
	system::ignore(#"hash_7da9887a9375293");
	system::ignore(#"ping");
	system::ignore(#"potm");
	system::ignore(#"popups");
	system::ignore(#"rank");
	system::ignore(#"recon_plane");
	system::ignore(#"remotemissile");
	system::ignore(#"spectating");
	system::ignore(#"hash_7710b10c0110b17");
	system::ignore(#"hash_5d70c94021e00856");
	system::ignore(#"hash_79fe34c9f8a0e44c");
	system::ignore(#"hash_5cb28995c23c44a");
	system::ignore(#"hash_2d064899850813e2");
	system::ignore(#"hash_5f664b2f64605e81");
	system::ignore(#"hash_4d705d24a0c7546f");
	system::ignore(#"hash_57d1b71f57332413");
	system::ignore(#"straferun");
	system::ignore(#"strategic_command");
	system::ignore(#"supplydrop");
	system::ignore(#"swat");
	system::ignore(#"spike_charge_siegebot");
	system::ignore(#"hash_7f7d199d7a02e5fe");
	system::ignore(#"teams");
	system::ignore(#"tweakables");
	system::ignore(#"hash_3c80acaf1d791b8c");
	system::ignore(#"uav");
	system::ignore(#"wave_manager");
	system::ignore(#"wz_ai");
	system::ignore(#"hash_56457c8e4440e055");
	system::ignore(#"zm_ai_brutus");
	system::ignore(#"hash_6977117f54c58849");
	system::ignore(#"hash_4d14e34831830ee6");
	system::ignore(#"hash_3e908e1bf3ee5f53");
	system::ignore(#"hash_7ed80abf6d76c7bc");
	system::ignore(#"hash_3eface5a7fc2cf8b");
	system::ignore(#"hash_3434169163ecaa3e");
	system::ignore(#"wz_dynents");
	system::ignore(#"hash_2cc19c7ccaa4e97f");
	system::ignore(#"wz_infection");
	system::ignore(#"wz_loadouts");
	system::ignore(#"hash_18eda3a46ae92419");
	system::ignore(#"wz_medals");
	system::ignore(#"wz_spectre");
	system::ignore(#"hash_3793eb4a6c52c66f");
	system::ignore(#"hash_572ed1def3a8dbda");
	system::ignore(#"hash_7ed80abf6d76c7bc");
	system::ignore(#"serversettings");
	system::ignore(#"ai_puppeteer");
	system::ignore(#"hash_f81b9dea74f0ee");
	system::ignore(#"debug");
	system::ignore(#"dev");
	system::ignore(#"dev_class");
	system::ignore(#"cymbal_monkey");
	system::ignore(#"objective_manager");
	system::ignore(#"hash_5ff56dba9074b0b4");
	system::ignore(#"zm_audio");
	system::ignore(#"hash_5bcba15330839867");
	system::ignore(#"zm_destination_manager");
	system::ignore(#"hash_7f844a124cb54e5a");
	system::ignore(#"zm");
	system::ignore(#"zm_devqui");
	system::ignore(#"zm_load");
	system::ignore(#"hash_13a43d760497b54d");
	system::ignore(#"zm_perk_staminup");
	system::ignore(#"contracts");
	system::ignore(#"hash_794c3bb2e36b3278");
	system::ignore(#"hash_49e3cc2797ad6fbc");
	system::ignore(#"hash_2e2ae8534f387ccf");
	system::ignore(#"zm_characters");
	system::ignore(#"gestures");
	system::ignore(#"hash_1f8830cd01b39f8f");
	system::ignore(#"hash_7b30b3878fc15536");
	system::ignore(#"hash_74761c506cae8855");
	system::ignore(#"warmachine");
	system::ignore(#"flamethrower");
	system::ignore(#"annihilator");
	system::ignore(#"scythe");
	system::ignore(#"ray_gun");
	system::ignore(#"hash_607f0336b64df630");
	system::ignore(#"zm_aat_brain_decay");
	system::ignore(#"zm_aat_frostbite");
	system::ignore(#"zm_aat_kill_o_watt");
	system::ignore(#"zm_aat_plasmatic_burst");
	system::ignore(#"hash_308dff40d53a7287");
	system::ignore(#"zm_ai_utility");
	system::ignore(#"zm_ai_dog");
	system::ignore(#"zm_ai_raz");
	system::ignore(#"hash_50d62958d724dac2");
	system::ignore(#"zm_aoe");
	system::ignore(#"zm_armor");
	system::ignore(#"zm_attachments");
	system::ignore(#"zm_attackables");
	system::ignore(#"zm_audio");
	system::ignore(#"zm_bgb_aftertaste");
	system::ignore(#"zm_bgb_alchemical_antithesis");
	system::ignore(#"zm_bgb_always_done_swiftly");
	system::ignore(#"zm_bgb_anti_entrapment");
	system::ignore(#"zm_bgb_anywhere_but_here");
	system::ignore(#"zm_bgb_armamental_accomplishment");
	system::ignore(#"zm_bgb_arms_grace");
	system::ignore(#"zm_bgb_arsenal_accelerator");
	system::ignore(#"hash_74496e1b656c6651");
	system::ignore(#"hash_5f90cc4bac8e9ee1");
	system::ignore(#"zm_bgb_board_games");
	system::ignore(#"zm_bgb_bullet_boost");
	system::ignore(#"zm_bgb_burned_out");
	system::ignore(#"zm_bgb_cache_back");
	system::ignore(#"zm_fasttravel");
	system::ignore(#"hash_63e00d742a373f5f");
	system::ignore(#"zm_bgb_conflagration_liquidation");
	system::ignore(#"zm_bgb_crate_power");
	system::ignore(#"zm_bgb_crawl_space");
	system::ignore(#"zm_bgb_ctrl_z");
	system::ignore(#"zm_bgb_danger_closest");
	system::ignore(#"zm_bgb_dead_of_nuclear_winter");
	system::ignore(#"zm_bgb_dividend_yield");
	system::ignore(#"zm_bgb_equip_mint");
	system::ignore(#"zm_bgb_extra_credit");
	system::ignore(#"zm_bgb_free_fire");
	system::ignore(#"zm_bgb_head_drama");
	system::ignore(#"zm_bgb_head_scan");
	system::ignore(#"zm_bgb_immolation_liquidation");
	system::ignore(#"zm_bgb_in_plain_sight");
	system::ignore(#"zm_bgb_join_the_party");
	system::ignore(#"zm_bgb_kill_joy");
	system::ignore(#"zm_bgb_licensed_contractor");
	system::ignore(#"zm_bgb_near_death_experience");
	system::ignore(#"zm_bgb_newtonian_negation");
	system::ignore(#"zm_bgb_now_you_see_me");
	system::ignore(#"zm_bgb_nowhere_but_there");
	system::ignore(#"zm_bgb_perk_up");
	system::ignore(#"zm_bgb_perkaholic");
	system::ignore(#"zm_bgb_phantom_reload");
	system::ignore(#"zm_bgb_phoenix_up");
	system::ignore(#"zm_bgb_point_drops");
	system::ignore(#"zm_bgb_pop_shocks");
	system::ignore(#"zm_bgb_power_keg");
	system::ignore(#"hash_6fb67bdac2e54d8");
	system::ignore(#"zm_bgb_power_vacuum");
	system::ignore(#"hash_1455490b99d4cbbb");
	system::ignore(#"zm_bgb_refresh_mint");
	system::ignore(#"zm_bgb_reign_drops");
	system::ignore(#"zm_bgb_respin_cycle");
	system::ignore(#"zm_bgb_secret_shopper");
	system::ignore(#"zm_bgb_shields_up");
	system::ignore(#"zm_bgb_shopping_free");
	system::ignore(#"zm_bgb_stock_option");
	system::ignore(#"zm_bgb_sword_flay");
	system::ignore(#"zm_bgb_talkin_bout_regeneration");
	system::ignore(#"hash_78fd2ad2d95d9947");
	system::ignore(#"zm_bgb_temporal_gift");
	system::ignore(#"zm_bgb_undead_man_walking");
	system::ignore(#"zm_bgb_wall_power");
	system::ignore(#"hash_4a6b297c85fafec1");
	system::ignore(#"zm_blockers");
	system::ignore(#"zm_bot");
	system::ignore(#"hash_6d3c5317001d4fc6");
	system::ignore(#"zm_callings");
	system::ignore(#"zm_camos");
	system::ignore(#"zm_challenges");
	system::ignore(#"zm_characters");
	system::ignore(#"zm_crafting");
	system::ignore(#"zm_daily_challenges");
	system::ignore(#"zm_devgui");
	system::ignore(#"zm_equipment");
	system::ignore(#"zm_escape_util");
	system::ignore(#"hash_7576c66086ab62aa");
	system::ignore(#"hash_13a43d760497b54d");
	system::ignore(#"hash_62a392bb15b68ccd");
	system::ignore(#"hash_36a2cb0be45d9374");
	system::ignore(#"hash_2e174447c1bc5bd6");
	system::ignore(#"zm_gametype");
	system::ignore(#"zm_hero_weapon");
	system::ignore(#"hash_d287d6d0be9f28c");
	system::ignore(#"zm_hud");
	system::ignore(#"zm_items");
	system::ignore(#"zm_laststand");
	system::ignore(#"zm_loadout");
	system::ignore(#"hash_32b5086207157433");
	system::ignore(#"zm_magicbox");
	system::ignore(#"zm_pack_a_punch");
	system::ignore(#"zm_perk_deadshot");
	system::ignore(#"zm_perk_doubletap2");
	system::ignore(#"zm_perk_juggernaut");
	system::ignore(#"zm_perk_quick_revive");
	system::ignore(#"zm_perk_sleight_of_hand");
	system::ignore(#"zm_perk_tombstone");
	system::ignore(#"hash_1e8eafe505e52c51");
	system::ignore(#"zm_player");
	system::ignore(#"zm_power");
	system::ignore(#"zm_powerup_bonfire_sale");
	system::ignore(#"zm_powerup_bonus_points_player");
	system::ignore(#"zm_powerup_bonus_points_team");
	system::ignore(#"zm_powerup_carpenter");
	system::ignore(#"zm_powerup_double_points");
	system::ignore(#"hash_6119ea2d427fdf8a");
	system::ignore(#"zm_powerup_fire_sale");
	system::ignore(#"zm_powerup_free_perk");
	system::ignore(#"zm_powerup_full_ammo");
	system::ignore(#"zm_powerup_hero_weapon_power");
	system::ignore(#"zm_powerup_insta_kill");
	system::ignore(#"zm_powerup_nuke");
	system::ignore(#"hash_7587f8ddd6b0d47a");
	system::ignore(#"zm_powerup_shield_charge");
	system::ignore(#"zm_powerup_small_ammo");
	system::ignore(#"hash_3aa7d3f1b004dd6c");
	system::ignore(#"zm_round_logic");
	system::ignore(#"archetype_mimic");
	system::ignore(#"hash_11b091d0ce567b82");
	system::ignore(#"hash_4b9d2976864eeabd");
	system::ignore(#"zm_score");
	system::ignore(#"zm_spectating");
	system::ignore(#"hash_3a0015e9f67cadaf");
	system::ignore(#"zm_stats");
	system::ignore(#"zm_talisman_box_guarantee_box_only");
	system::ignore(#"zm_talisman_box_guarantee_lmg");
	system::ignore(#"zm_talisman_coagulant");
	system::ignore(#"zm_talisman_extra_claymore");
	system::ignore(#"zm_talisman_extra_frag");
	system::ignore(#"zm_talisman_extra_miniturret");
	system::ignore(#"zm_talisman_extra_molotov");
	system::ignore(#"zm_talisman_extra_self_revive");
	system::ignore(#"zm_talisman_extra_semtex");
	system::ignore(#"zm_talisman_impatient");
	system::ignore(#"zm_talisman_perk_mod_single");
	system::ignore(#"zm_talisman_perk_permanent_1");
	system::ignore(#"zm_talisman_perk_permanent_2");
	system::ignore(#"zm_talisman_perk_permanent_3");
	system::ignore(#"zm_talisman_perk_permanent_4");
	system::ignore(#"zm_talisman_perk_reducecost_1");
	system::ignore(#"zm_talisman_perk_reducecost_2");
	system::ignore(#"zm_talisman_perk_reducecost_3");
	system::ignore(#"zm_talisman_perk_reducecost_4");
	system::ignore(#"zm_talisman_perk_start_1");
	system::ignore(#"zm_talisman_perk_start_2");
	system::ignore(#"zm_talisman_perk_start_3");
	system::ignore(#"zm_talisman_perk_start_4");
	system::ignore(#"zm_talisman_permanent_heroweap_armor");
	system::ignore(#"zm_talisman_shield_durability_legendary");
	system::ignore(#"zm_talisman_shield_durability_rare");
	system::ignore(#"zm_talisman_shield_price");
	system::ignore(#"zm_talisman_special_startlv2");
	system::ignore(#"zm_talisman_special_startlv3");
	system::ignore(#"zm_talisman_special_xp_rate");
	system::ignore(#"zm_talisman_start_weapon_ar");
	system::ignore(#"zm_talisman_start_weapon_lmg");
	system::ignore(#"zm_talisman_start_weapon_smg");
	system::ignore(#"zm_talisman_weapon_reducepapcost");
	system::ignore(#"zm_traps");
	system::ignore(#"zm_trial");
	system::ignore(#"hash_2ef1591c234e8773");
	system::ignore(#"hash_7b354b317eaf8341");
	system::ignore(#"hash_5e833052f96b85bd");
	system::ignore(#"hash_42f44652a16988d8");
	system::ignore(#"hash_388ce832b10c2f83");
	system::ignore(#"hash_6e3eb3affb730b9a");
	system::ignore(#"hash_491590ee8fe06753");
	system::ignore(#"hash_771cd3c1dc16ee32");
	system::ignore(#"hash_4229d59c5b830185");
	system::ignore(#"hash_7c9607fd2f57a1c7");
	system::ignore(#"zm_trial_no_powerups");
	system::ignore(#"zm_trial_randomize_perks");
	system::ignore(#"zm_trial_reset_loadout");
	system::ignore(#"hash_1848c770303c538f");
	system::ignore(#"hash_48e0e8f7de7eaf3c");
	system::ignore(#"hash_41cb195ec280085c");
	system::ignore(#"zm_trial_util");
	system::ignore(#"hash_23b05089013ba630");
	system::ignore(#"zm_unitrigger");
	system::ignore(#"zm_vo");
	system::ignore(#"zm_wallbuy");
	system::ignore(#"zm_weap_homunculus");
	system::ignore(#"hash_36cdf1547e49b57a");
	system::ignore(#"zm_weapons");
	system::ignore(#"zm_zonemgr");
	system::ignore(#"hash_5f19cd68b4607f52");
	system::ignore(#"hash_770956d673fdbba2");
	system::ignore(#"zm_escape_util");
	system::ignore(#"zm_hero_weapons");
	system::ignore(#"zm_ai_catalyst");
	system::ignore(#"hash_6750752a31e788e2");
	system::ignore(#"zm_escape_traps");
	system::ignore(#"zm_utility");
	system::ignore(#"hash_49946b57ce6e712f");
	system::ignore(#"hash_4fce085585f422db");
}

