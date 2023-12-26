#using scripts\core_common\clientfield_shared.csc;

#namespace hud;

/*
	Name: function_c2797a36
	Namespace: hud
	Checksum: 0xE00F0634
	Offset: 0x378
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c2797a36()
{
	level notify(309320966);
}

/*
	Name: function_9b9cecdf
	Namespace: hud
	Checksum: 0xFD25CE6E
	Offset: 0x398
	Size: 0x77C
	Parameters: 0
	Flags: None
*/
function function_9b9cecdf()
{
	clientfield::function_5b7d846d("hudItems.warzone.reinsertionPassengerCount", #"hash_593f03dd48d5bc1f", #"reinsertionpassengercount", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.alivePlayerCount", #"hud_items", #"aliveplayercount", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.alivePlayerCountEnemy", #"hud_items", #"aliveplayercountenemy", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.aliveTeammateCount", #"hud_items", #"aliveteammatecount", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.spectatorsCount", #"hud_items", #"spectatorscount", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.playerKills", #"hud_items", #"playerkills", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.playerCleanUps", #"hud_items", #"playercleanups", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("presence.modeparam", #"hash_3645501c8ba141af", #"modeparam", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.hasBackpack", #"hud_items", #"hasbackpack", 1, 1, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.armorType", #"hud_items", #"armortype", 1, 2, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.streamerLoadFraction", #"hud_items", #"streamerloadfraction", 1, 5, "float", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.wzLoadFinished", #"hud_items", #"wzloadfinished", 1, 1, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.showReinsertionPassengerCount", #"hud_items", #"showreinsertionpassengercount", 1, 1, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.playerLivesRemaining", #"hud_items", #"playerlivesremaining", 7000, 4, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.playerCanRedeploy", #"hud_items", #"playercanredeploy", 7000, 1, "int", undefined, 0, 0);
	clientfield::register("toplayer", "realtime_multiplay", 1, 1, "int", &function_a1b40aa4, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.collapse", #"hash_593f03dd48d5bc1f", #"collapse", 7000, 21, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.waveRespawnTimer", #"hash_593f03dd48d5bc1f", #"waverespawntimer", 7000, 21, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.collapseIndex", #"hash_593f03dd48d5bc1f", #"collapseindex", 1, 3, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.collapseCount", #"hash_593f03dd48d5bc1f", #"collapsecount", 1, 3, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.reinsertionIndex", #"hash_593f03dd48d5bc1f", #"reinsertionindex", 1, 3, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.skydiveAltimeterVisible", #"hud_items", #"hash_4546996cf93b1697", 1, 1, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.skydiveAltimeterHeight", #"hash_410fe12a68d6e801", #"hash_34e492b27fa3f3dc", 1, 16, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.skydiveAltimeterSeaHeight", #"hash_410fe12a68d6e801", #"hash_7f022c556fec0bf9", 1, 16, "int", undefined, 0, 0);
}

/*
	Name: function_a1b40aa4
	Namespace: hud
	Checksum: 0x19966973
	Offset: 0xB20
	Size: 0xFC
	Parameters: 7
	Flags: None
*/
function function_a1b40aa4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	player = function_27673a7(binitialsnap);
	if(player != self)
	{
		return;
	}
	if(bwastimejump)
	{
		return;
	}
	if(!isplayer(player) || !isalive(player))
	{
		function_3f258626(binitialsnap);
		return;
	}
	if(fieldname == 1)
	{
		function_9e9a0604(binitialsnap);
	}
	else
	{
		function_3f258626(binitialsnap);
	}
}

