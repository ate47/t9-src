#using scripts\zm_common\zm_trial.csc;
#using scripts\zm\perk\zm_perk_death_perception.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm.csc;

#namespace namespace_5507dc3;

/*
	Name: function_5f3d11c7
	Namespace: namespace_5507dc3
	Checksum: 0x8753D91F
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5f3d11c7()
{
	level notify(484304518);
}

/*
	Name: function_89f2df9
	Namespace: namespace_5507dc3
	Checksum: 0x4DC99839
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_6eed28033e443596", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_5507dc3
	Checksum: 0x435C999D
	Offset: 0xE8
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_5d3b4424c6d47835", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_5507dc3
	Checksum: 0x1A1B5706
	Offset: 0x150
	Size: 0x2C
	Parameters: 2
	Flags: Private
*/
function private on_begin(local_client_num, params)
{
	level thread function_40349f7c();
}

/*
	Name: function_40349f7c
	Namespace: namespace_5507dc3
	Checksum: 0xAA41718B
	Offset: 0x188
	Size: 0x1B0
	Parameters: 1
	Flags: None
*/
function function_40349f7c(localclientnum)
{
	level endon(#"hash_38932f8deb28b470", #"end_game");
	wait(12);
	level.var_dc60105c = 1;
	maxclients = getmaxlocalclients();
	for(localclientnum = 0; localclientnum < maxclients; localclientnum++)
	{
		if(isdefined(function_5c10bd79(localclientnum)))
		{
			foreach(player in getplayers(localclientnum))
			{
				player zm::function_92f0c63(localclientnum);
			}
			foreach(player in getplayers(localclientnum))
			{
				player zm_perk_death_perception::function_25410869(localclientnum);
			}
		}
	}
}

/*
	Name: on_end
	Namespace: namespace_5507dc3
	Checksum: 0xA3998CFC
	Offset: 0x340
	Size: 0x198
	Parameters: 1
	Flags: Private
*/
function private on_end(local_client_num)
{
	level notify(#"hash_38932f8deb28b470");
	level.var_dc60105c = undefined;
	maxclients = getmaxlocalclients();
	for(localclientnum = 0; localclientnum < maxclients; localclientnum++)
	{
		if(isdefined(function_5c10bd79(localclientnum)))
		{
			foreach(player in getplayers(localclientnum))
			{
				player zm::function_92f0c63(localclientnum);
			}
			foreach(player in getplayers(localclientnum))
			{
				player zm_perk_death_perception::function_25410869(localclientnum);
			}
		}
	}
}

