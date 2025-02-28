#using script_58860a35d0555f74;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_silver_ffotd;

/*
	Name: function_67f43f1e
	Namespace: zm_silver_ffotd
	Checksum: 0x490E0C86
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_67f43f1e()
{
	level notify(780767230);
}

/*
	Name: __init__system__
	Namespace: zm_silver_ffotd
	Checksum: 0x38318076
	Offset: 0x150
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_silver_ffotd", &function_70a657d8, &postinit, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_silver_ffotd
	Checksum: 0x80F724D1
	Offset: 0x1A8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: postinit
	Namespace: zm_silver_ffotd
	Checksum: 0x7B52CE56
	Offset: 0x1B8
	Size: 0x554
	Parameters: 0
	Flags: Linked, Private
*/
function private postinit()
{
	spawncollision("collision_clip_wall_64x64x10", "collider", (392.963, -57.25, -546.976), vectorscale((0, 1, 0), 180));
	spawncollision("collision_clip_wall_64x64x10", "collider", (392.963, -75.75, -546.976), vectorscale((0, 1, 0), 180));
	spawncollision("collision_clip_wall_64x64x10", "collider", (392.963, -57.25, -483.476), vectorscale((0, 1, 0), 180));
	spawncollision("collision_clip_wall_64x64x10", "collider", (392.963, -75.75, -483.476), vectorscale((0, 1, 0), 180));
	spawncollision("collision_clip_wall_128x128x10", "collider", (383.59, -958.093, -146.533), vectorscale((0, 1, 0), 246.737));
	spawncollision("collision_clip_wall_128x128x10", "collider", (-1012.39, 2374.6, 116.898), vectorscale((0, 1, 0), 289.716));
	spawncollision("collision_clip_wall_128x128x10", "collider", (-1119.89, 2336.6, 116.898), vectorscale((0, 1, 0), 289.716));
	spawncollision("collision_clip_wall_64x64x10", "collider", (-1527, 1505, 164.042), vectorscale((0, 1, 0), 44.499));
	spawncollision("collision_clip_128x128x128", "collider", (551.949, -94.5506, -379.603), vectorscale((0, 1, 0), 315));
	spawncollision("collision_clip_128x128x128", "collider", (543.449, -103.051, -379.603), vectorscale((0, 1, 0), 315));
	spawncollision("collision_clip_128x128x128", "collider", (539.449, -90.051, -379.603), vectorscale((0, 1, 0), 315));
	spawncollision("collision_clip_wall_64x64x10", "collider", (239.812, 2123.97, 283.86), (0, 0, 0));
	spawncollision("collision_clip_128x128x128", "collider", (-200.8, 1669.01, -101.08), (0, 0, 0));
	spawncollision("collision_clip_64x64x256", "collider", (-958.033, 2.664, -311.792), vectorscale((0, 1, 0), 315));
	spawncollision("collision_clip_64x64x256", "collider", (854.728, -864.741, -173.75), vectorscale((0, 1, 0), 45));
	spawncollision("collision_clip_128x128x128", "collider", (-143.915, -87.5, 356.035), (0, 0, 0));
	spawncollision("collision_clip_128x128x128", "collider", (-34.917, -102.022, 356.035), vectorscale((0, 1, 0), 345));
	spawncollision("collision_clip_wall_128x128x10", "collider", (-192, -33, 208), (0, 0, 0));
	namespace_1fd59e39::function_1376ec37((352, 733, 353), 100);
	namespace_1fd59e39::function_1376ec37((1403, 1282, 210), 200);
	level thread function_69e91dea();
}

/*
	Name: function_69e91dea
	Namespace: zm_silver_ffotd
	Checksum: 0x9065D6DC
	Offset: 0x718
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_69e91dea()
{
	var_79f2a81a = (536, 1192, -355);
	namespace_1fd59e39::function_1376ec37(var_79f2a81a, 200);
	index = level.var_ff7ae671.size - 1;
	level flag::wait_till("connect_trans_to_particle_accelerator");
	arrayremoveindex(level.var_ff7ae671, index);
}

