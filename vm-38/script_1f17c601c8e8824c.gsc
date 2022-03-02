#using script_396f7d71538c9677;
#using script_5399f402045d7abd;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_2987c8a4;

/*
	Name: function_d6c3ea57
	Namespace: namespace_2987c8a4
	Checksum: 0xEB04744B
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d6c3ea57()
{
	level notify(1672481474);
}

#namespace battlechatter;

/*
	Name: devgui_think
	Namespace: battlechatter
	Checksum: 0x62F70E41
	Offset: 0xC0
	Size: 0x408
	Parameters: 0
	Flags: None
*/
function devgui_think()
{
	/#
		setdvar(#"devgui_mpdialog", "");
		setdvar(#"testalias_player", "");
		setdvar(#"testalias_taacom", "");
		setdvar(#"testalias_commander", "");
		while(true)
		{
			wait(1);
			player = util::gethostplayer();
			if(!isdefined(player))
			{
				continue;
			}
			spacing = getdvarfloat(#"testdialog_spacing", 0.25);
			switch(getdvarstring(#"devgui_mpdialog", ""))
			{
				case "hash_7912e80189f9c6":
				{
					player thread test_player_dialog(0);
					player thread test_taacom_dialog(spacing);
					player thread test_commander_dialog(2 * spacing);
					break;
				}
				case "hash_69c6be086f76a9d4":
				{
					player thread test_player_dialog(0);
					player thread test_commander_dialog(spacing);
					break;
				}
				case "hash_3af5f0a904b3f8fa":
				{
					player thread test_other_dialog(0);
					player thread test_commander_dialog(spacing);
					break;
				}
				case "hash_32945da5f7ac491":
				{
					player thread test_taacom_dialog(0);
					player thread test_commander_dialog(spacing);
					break;
				}
				case "hash_597b27a5c8857d19":
				{
					player thread test_player_dialog(0);
					player thread test_taacom_dialog(spacing);
					break;
				}
				case "hash_74f798193af006b3":
				{
					player thread test_other_dialog(0);
					player thread test_taacom_dialog(spacing);
					break;
				}
				case "hash_5bd6a2c5d0ff3cb2":
				{
					player thread test_other_dialog(0);
					player thread test_player_dialog(spacing);
					break;
				}
				case "hash_4a5a66c89be92eb":
				{
					player thread play_conv_self_other();
					break;
				}
				case "hash_18683ef7652f40ed":
				{
					player thread play_conv_other_self();
					break;
				}
				case "hash_2b559b1a5e81715f":
				{
					player thread play_conv_other_other();
					break;
				}
			}
			setdvar(#"devgui_mpdialog", "");
		}
	#/
}

/*
	Name: test_other_dialog
	Namespace: battlechatter
	Checksum: 0xE310A9CD
	Offset: 0x4D0
	Size: 0xEA
	Parameters: 1
	Flags: None
*/
function test_other_dialog(delay)
{
	/#
		players = arraysort(level.players, self.origin);
		foreach(player in players)
		{
			if(player != self && isalive(player))
			{
				player thread test_player_dialog(delay);
				return;
			}
		}
	#/
}

/*
	Name: test_player_dialog
	Namespace: battlechatter
	Checksum: 0xE43D1D6A
	Offset: 0x5C8
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function test_player_dialog(delay)
{
	/#
		if(!isdefined(delay))
		{
			delay = 0;
		}
		wait(delay);
		self playsoundontag(getdvarstring(#"testalias_player", ""), "");
	#/
}

/*
	Name: test_taacom_dialog
	Namespace: battlechatter
	Checksum: 0x5866DAD3
	Offset: 0x638
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function test_taacom_dialog(delay)
{
	/#
		if(!isdefined(delay))
		{
			delay = 0;
		}
		wait(delay);
		self playlocalsound(getdvarstring(#"testalias_taacom", ""));
	#/
}

/*
	Name: test_commander_dialog
	Namespace: battlechatter
	Checksum: 0x312355D0
	Offset: 0x6A0
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function test_commander_dialog(delay)
{
	/#
		if(!isdefined(delay))
		{
			delay = 0;
		}
		wait(delay);
		self playlocalsound(getdvarstring(#"testalias_commander", ""));
	#/
}

/*
	Name: play_test_dialog
	Namespace: battlechatter
	Checksum: 0xACE447FA
	Offset: 0x708
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function play_test_dialog(dialogkey)
{
	/#
		dialogalias = self get_player_dialog_alias(dialogkey, undefined);
		self playsoundontag(dialogalias, "");
	#/
}

/*
	Name: response_key
	Namespace: battlechatter
	Checksum: 0xA464EAE9
	Offset: 0x768
	Size: 0x10A
	Parameters: 0
	Flags: None
*/
function response_key()
{
	/#
		switch(self getmpdialogname())
		{
			case "spectre":
			{
				return "";
			}
			case "battery":
			{
				return "";
			}
			case "outrider":
			{
				return "";
			}
			case "prophet":
			{
				return "";
			}
			case "firebreak":
			{
				return "";
			}
			case "reaper":
			{
				return "";
			}
			case "ruin":
			{
				return "";
			}
			case "seraph":
			{
				return "";
			}
			case "nomad":
			{
				return "";
			}
		}
		return "";
	#/
}

/*
	Name: play_conv_self_other
	Namespace: battlechatter
	Checksum: 0x673715F7
	Offset: 0x880
	Size: 0x144
	Parameters: 0
	Flags: None
*/
function play_conv_self_other()
{
	/#
		num = randomintrange(0, 4);
		self play_test_dialog("" + num);
		wait(4);
		players = arraysort(level.players, self.origin);
		foreach(player in players)
		{
			if(player != self && isalive(player))
			{
				player play_test_dialog(("" + self response_key()) + num);
				break;
			}
		}
	#/
}

/*
	Name: play_conv_other_self
	Namespace: battlechatter
	Checksum: 0xFA9B6987
	Offset: 0x9D0
	Size: 0x144
	Parameters: 0
	Flags: None
*/
function play_conv_other_self()
{
	/#
		num = randomintrange(0, 4);
		players = arraysort(level.players, self.origin);
		foreach(player in players)
		{
			if(player != self && isalive(player))
			{
				player play_test_dialog("" + num);
				break;
			}
		}
		wait(4);
		self play_test_dialog(("" + player response_key()) + num);
	#/
}

/*
	Name: play_conv_other_other
	Namespace: battlechatter
	Checksum: 0xB48E301D
	Offset: 0xB20
	Size: 0x1EC
	Parameters: 0
	Flags: None
*/
function play_conv_other_other()
{
	/#
		num = randomintrange(0, 4);
		players = arraysort(level.players, self.origin);
		foreach(player in players)
		{
			if(player != self && isalive(player))
			{
				player play_test_dialog("" + num);
				firstplayer = player;
				break;
			}
		}
		wait(4);
		foreach(player in players)
		{
			if(player != self && player !== firstplayer && isalive(player))
			{
				player play_test_dialog(("" + firstplayer response_key()) + num);
				break;
			}
		}
	#/
}

