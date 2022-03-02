#using script_18910f59cc847b42;
#using script_30c7fb449869910;
#using script_3314b730521b9666;
#using script_38635d174016f682;
#using script_42cbbdcd1e160063;
#using script_64e5d3ad71ce8140;
#using script_67049b48b589d81;
#using script_6b71c9befed901f2;
#using script_71603a58e2da0698;
#using script_75c3996cce8959f7;
#using script_76abb7986de59601;
#using script_77163d5a569e2071;
#using script_771f5bff431d8d57;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_7e1ec234;

/*
	Name: function_f06acf18
	Namespace: namespace_7e1ec234
	Checksum: 0x3206C4DE
	Offset: 0xD28
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f06acf18()
{
	level notify(1073070310);
}

/*
	Name: function_10d1200d
	Namespace: namespace_7e1ec234
	Checksum: 0xA4B5D554
	Offset: 0xD48
	Size: 0x11DC
	Parameters: 0
	Flags: Linked
*/
function function_10d1200d()
{
	namespace_83eb6304::function_4060ccb4("reset");
	namespace_83eb6304::function_4060ccb4("player_trail_green", undefined, undefined, 1, 1);
	namespace_83eb6304::function_4060ccb4("player_trail_blue", undefined, undefined, 1, 1);
	namespace_83eb6304::function_4060ccb4("player_trail_red", undefined, undefined, 1, 1);
	namespace_83eb6304::function_4060ccb4("player_trail_yellow", undefined, undefined, 1, 1);
	namespace_83eb6304::function_4060ccb4("glow_green", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("glow_blue", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("glow_red", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("glow_yellow", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("glow_white", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("glow_item", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("glow_weapon", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("generic_generator_die");
	namespace_83eb6304::function_4060ccb4("generic_generator_active");
	namespace_83eb6304::function_4060ccb4("zombie_generator_die");
	namespace_83eb6304::function_4060ccb4("skeleton_generator_die");
	namespace_83eb6304::function_4060ccb4("ai_zombie_riser", "special");
	namespace_83eb6304::function_4060ccb4("ai_blood_riser", "special");
	namespace_83eb6304::function_4060ccb4("gut_explode", "special");
	namespace_83eb6304::function_4060ccb4("saw_explode", "special");
	namespace_83eb6304::function_4060ccb4("boost_explode", "special");
	namespace_83eb6304::function_4060ccb4("delay_explode", "special");
	namespace_83eb6304::function_4060ccb4("annhilate", "special");
	namespace_83eb6304::function_4060ccb4("burn_zombie", "special");
	namespace_83eb6304::function_4060ccb4("zombie_chunk", "special", 1);
	namespace_83eb6304::function_4060ccb4("player_shield_short", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("player_shield_long", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("player_shield_short_sideView", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("player_shield_long_sideView", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("red_shield", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("red_shield_os", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("headshot");
	namespace_83eb6304::function_4060ccb4("headshot_nochunks");
	namespace_83eb6304::function_4060ccb4("bloodspurt");
	namespace_83eb6304::function_4060ccb4("chicken_explode");
	namespace_83eb6304::function_4060ccb4("treasure_chest_impact");
	namespace_83eb6304::function_4060ccb4("treasure_chest_explode");
	namespace_83eb6304::function_4060ccb4("teleporter_dungeon_light", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("demon_burst");
	namespace_83eb6304::function_4060ccb4("gem_trail_red");
	namespace_83eb6304::function_4060ccb4("gem_trail_white");
	namespace_83eb6304::function_4060ccb4("gem_trail_blue");
	namespace_83eb6304::function_4060ccb4("gem_trail_green");
	namespace_83eb6304::function_4060ccb4("gem_trail_yellow");
	namespace_83eb6304::function_4060ccb4("exit_fog_marker", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("boxing_pow", "tag_eye");
	namespace_83eb6304::function_4060ccb4("boxing_stars", "tag_eye");
	namespace_83eb6304::function_4060ccb4("turret_impact");
	namespace_83eb6304::function_4060ccb4("magnet_on", "tag_eye");
	namespace_83eb6304::function_4060ccb4("magnet_fade", "tag_eye");
	namespace_83eb6304::function_4060ccb4("boots");
	namespace_83eb6304::function_4060ccb4("divine_shield", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("timeshift_contact");
	namespace_83eb6304::function_4060ccb4("timeshift");
	namespace_83eb6304::function_4060ccb4("timeshift_fade");
	namespace_83eb6304::function_4060ccb4("teamshift");
	namespace_83eb6304::function_4060ccb4("teamshift_contact");
	namespace_83eb6304::function_4060ccb4("monkey_light");
	namespace_83eb6304::function_4060ccb4("monkey_reveal");
	namespace_83eb6304::function_4060ccb4("monkey_detonate");
	namespace_83eb6304::function_4060ccb4("stunbear_affected");
	namespace_83eb6304::function_4060ccb4("stunbear_contact");
	namespace_83eb6304::function_4060ccb4("stunbear", "tag_eye");
	namespace_83eb6304::function_4060ccb4("stunbear_fade", "tag_eye");
	namespace_83eb6304::function_4060ccb4("tesla_launch");
	namespace_83eb6304::function_4060ccb4("tesla_ball");
	namespace_83eb6304::function_4060ccb4("tesla_trail");
	namespace_83eb6304::function_4060ccb4("tesla_shock");
	namespace_83eb6304::function_4060ccb4("tesla_shock_eyes");
	namespace_83eb6304::function_4060ccb4("sprinkler_active");
	namespace_83eb6304::function_4060ccb4("sprinkler_land");
	namespace_83eb6304::function_4060ccb4("sprinkler_takeoff");
	namespace_83eb6304::function_4060ccb4("clone_orb");
	namespace_83eb6304::function_4060ccb4("clone_appear", "none");
	namespace_83eb6304::function_4060ccb4("clone_vanish");
	namespace_83eb6304::function_4060ccb4("egg_hatch");
	namespace_83eb6304::function_4060ccb4("egg_explode");
	namespace_83eb6304::function_4060ccb4("barrel_fire_top", "p9_zm_pro_barrel_explosive_red");
	namespace_83eb6304::function_4060ccb4("barrel_fire", "p9_zm_pro_barrel_explosive_red");
	namespace_83eb6304::function_4060ccb4("explode_lg", "none");
	namespace_83eb6304::function_4060ccb4("hazard_electric", "j_head", undefined, 1, 1);
	namespace_83eb6304::function_4060ccb4("hazard_electric_trap_green", "special", undefined, 1, 1);
	namespace_83eb6304::function_4060ccb4("hazard_electric_trap_red", "special", undefined, 1, 1);
	namespace_83eb6304::function_4060ccb4("hazard_electric_trap_active", "special", undefined, 1, 1);
	namespace_83eb6304::function_4060ccb4("shadow_appear", "special");
	namespace_83eb6304::function_4060ccb4("shadow_rez_in");
	namespace_83eb6304::function_4060ccb4("shadow_die", "special");
	namespace_83eb6304::function_4060ccb4("shadow_fade");
	namespace_83eb6304::function_4060ccb4("shadow_move", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("shadow_glow", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("spawnZombie");
	namespace_83eb6304::function_4060ccb4("weaponChargerActive", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("weaponChargerDone");
	namespace_83eb6304::function_4060ccb4("pungi_hint");
	namespace_83eb6304::function_4060ccb4("pungi_activate");
	namespace_83eb6304::function_4060ccb4("pungi_damage", "j_spine4");
	namespace_83eb6304::function_4060ccb4("nova_crawler_aura_fx", "j_spine4", undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("nova_crawler_burst");
	namespace_83eb6304::function_4060ccb4("nova_fx");
	namespace_83eb6304::function_4060ccb4("basketExplo");
	namespace_83eb6304::function_4060ccb4("silverback_launch");
	namespace_83eb6304::function_4060ccb4("silverback_land");
	namespace_83eb6304::function_4060ccb4("silverback_banana_explo");
	namespace_83eb6304::function_4060ccb4("explo_warning_light");
	namespace_83eb6304::function_4060ccb4("wild_portal");
	namespace_83eb6304::function_4060ccb4("lightningStrike", undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("wild_portal_elec_burst", undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("wild_portal_radial_burst", undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("dragonTrap", "tag_mouth_fx_anim");
	namespace_83eb6304::function_4060ccb4("fate_landing");
	namespace_83eb6304::function_4060ccb4("fate_explo");
	namespace_83eb6304::function_4060ccb4("crawler_generator_spawn");
	namespace_83eb6304::function_4060ccb4("electrical_explo");
	namespace_83eb6304::function_4060ccb4("axe_trail", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("ethereal_vapors", "j_spine4", 1);
	namespace_83eb6304::function_4060ccb4("fireworks");
	namespace_83eb6304::function_4060ccb4("blightfather_vomit", "tag_jaw", 1, undefined, 1);
	namespace_83eb6304::function_4060ccb4("player_respawn_green");
	namespace_83eb6304::function_4060ccb4("player_respawn_blue");
	namespace_83eb6304::function_4060ccb4("player_respawn_red");
	namespace_83eb6304::function_4060ccb4("player_respawn_yellow");
	namespace_83eb6304::function_4060ccb4("silverback_shield", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("ammo_unlimited", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("explode_red_barrel");
	namespace_83eb6304::function_4060ccb4("meat_explode");
	namespace_83eb6304::function_4060ccb4("player_heal", "j_spine4");
	namespace_83eb6304::function_4060ccb4("player_healOS", "j_spine4", undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("firstPersonMarker", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("lantern", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("lantern_fade");
	namespace_83eb6304::function_4060ccb4("ghosthound_death");
	namespace_83eb6304::function_4060ccb4("hellhound_death");
	namespace_83eb6304::function_4060ccb4("skeleton_death");
	namespace_83eb6304::function_4060ccb4("skeleton_giant_death");
	namespace_83eb6304::function_4060ccb4("skel_stomp_impact", "special", 1);
	namespace_83eb6304::function_4060ccb4("skeleton_hand_lightning", "j_wrist_le", undefined, 1);
	namespace_83eb6304::function_4060ccb4("skeleton_hand_energy", "j_wrist_le", undefined, 1, 1);
	namespace_83eb6304::function_4060ccb4("bombFuse", "tag_fuse", undefined, 1);
	namespace_83eb6304::function_4060ccb4("teleporter_disabled");
	namespace_83eb6304::function_4060ccb4("electrical_fire");
	namespace_83eb6304::function_4060ccb4("arcade_spark");
	namespace_83eb6304::function_4060ccb4("crab_bubbles", "special", 1);
	namespace_83eb6304::function_4060ccb4("incoming_impact", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("lawn_mower");
	namespace_83eb6304::function_4060ccb4("arena_barrier", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("giantSkelHeartGlow", "j_spinelower");
	namespace_83eb6304::function_4060ccb4("pole_blast");
	namespace_83eb6304::function_4060ccb4("pole_zombie_elecBurst", "special", 1);
	namespace_83eb6304::function_4060ccb4("muzzleFlash_md", "tag_flash");
	namespace_83eb6304::function_4060ccb4("water_explosion", undefined, 1);
	namespace_83eb6304::function_4060ccb4("water_geyser", undefined, 1);
	namespace_83eb6304::function_4060ccb4("water_geyser_sm", undefined, 1);
	namespace_83eb6304::function_4060ccb4("water_boil_ambient", undefined, 1, undefined, 1);
	namespace_83eb6304::function_4060ccb4("water_boil_deathzone", undefined, 1, undefined, 1);
	namespace_83eb6304::function_4060ccb4("remote_player_busy", undefined, undefined, undefined, 1);
	namespace_83eb6304::function_4060ccb4("nuke_dust");
	namespace_83eb6304::function_4060ccb4("divine_shield_ofF");
}

