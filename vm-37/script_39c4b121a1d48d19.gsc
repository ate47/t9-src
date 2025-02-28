#using script_67ce8e728d8f37ba;
#using script_6c8abe14025b47c4;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\scene_shared.gsc;

#namespace mp_moscow;

/*
	Name: main
	Namespace: mp_moscow
	Checksum: 0xB485CE3D
	Offset: 0x140
	Size: 0x12C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_66d6aa44::function_3f3466c9();
	killstreaks::function_257a5f13("straferun", 40);
	killstreaks::function_257a5f13("helicopter_comlink", 75);
	load::main();
	compass::setupminimap("");
	scene::function_497689f6(#"cin_mp_moscow_intro_cia", "intro_van_moscow", "tag_probe_attach", "prb_tn_mos_eu_van");
	scene::function_497689f6(#"cin_mp_moscow_intro_kgb", "helicopter", "tag_probe_attach", "prb_tn_mos_heli_light_cabin");
	level.cleandepositpoints = array((1183, -1170, 204), (1074, 722, 132));
}

