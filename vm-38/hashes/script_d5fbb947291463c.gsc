#using scripts\core_common\lui_shared.csc;

class czm_dac_challenges_hud : cLUIelem
{

	/*
		Name: constructor
		Namespace: czm_dac_challenges_hud
		Checksum: 0x3AAA5013
		Offset: 0x650
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_dac_challenges_hud
		Checksum: 0x8614C338
		Offset: 0xD30
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_bInLocation
		Namespace: czm_dac_challenges_hud
		Checksum: 0x224122F1
		Offset: 0xAF8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_bInLocation(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "bInLocation", value);
	}

	/*
		Name: open
		Namespace: czm_dac_challenges_hud
		Checksum: 0xE6D63E83
		Offset: 0xA58
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cLUIelem::open(localclientnum);
	}

	/*
		Name: set_showChallenge
		Namespace: czm_dac_challenges_hud
		Checksum: 0xEEEE84F6
		Offset: 0xCF8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_showChallenge(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showChallenge", value);
	}

	/*
		Name: set_challengeText
		Namespace: czm_dac_challenges_hud
		Checksum: 0xEE0AAD98
		Offset: 0xA88
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_challengeText(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "challengeText", value);
	}

	/*
		Name: set_bottomText
		Namespace: czm_dac_challenges_hud
		Checksum: 0x4480CD71
		Offset: 0xAC0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_bottomText(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "bottomText", value);
	}

	/*
		Name: set_rewardHidden
		Namespace: czm_dac_challenges_hud
		Checksum: 0xC55702D6
		Offset: 0xBE0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_rewardHidden(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "rewardHidden", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: czm_dac_challenges_hud
		Checksum: 0x7F1B2EF
		Offset: 0x8A8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		cLUIelem::function_5c1bb138("zm_dac_challenges_hud");
	}

	/*
		Name: setup_clientfields
		Namespace: czm_dac_challenges_hud
		Checksum: 0xB936EF80
		Offset: 0x670
		Size: 0x22C
		Parameters: 11
		Flags: Linked
	*/
	function setup_clientfields(var_be2ad4d, var_a7896263, var_4866daed, var_afaddf7a, var_5d7491df, var_26df3d64, var_90359ec7, var_2404f6c6, var_74cf4193, var_e89bb89d, var_2c511278)
	{
		cLUIelem::setup_clientfields("zm_dac_challenges_hud");
		cLUIelem::function_dcb34c80("string", "challengeText", 1);
		cLUIelem::function_dcb34c80("string", "bottomText", 1);
		cLUIelem::function_da693cbe("bInLocation", 1, 1, "int", var_afaddf7a);
		cLUIelem::function_da693cbe("progress", 1, 1, "counter", var_5d7491df);
		cLUIelem::function_da693cbe("tributeAvailable", 1, 3, "int", var_26df3d64);
		cLUIelem::function_da693cbe("rewardHidden", 1, 1, "int", var_90359ec7);
		cLUIelem::function_da693cbe("challengeFailing", 1, 1, "int", var_2404f6c6);
		cLUIelem::function_dcb34c80("string", "rewardText", 1);
		cLUIelem::function_da693cbe("challengeTypeText", 1, 1, "int", var_74cf4193);
		cLUIelem::function_da693cbe("showIntelRewardText", 1, 1, "int", var_e89bb89d);
		cLUIelem::function_da693cbe("showChallenge", 8000, 1, "int", var_2c511278);
	}

	/*
		Name: function_96972b9c
		Namespace: czm_dac_challenges_hud
		Checksum: 0x6E342B61
		Offset: 0xB30
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_96972b9c(localclientnum)
	{
		current_val = [[ self ]]->get_data(localclientnum, "progress");
		new_val = (current_val + 1) % 2;
		[[ self ]]->set_data(localclientnum, "progress", new_val);
	}

	/*
		Name: set_tributeAvailable
		Namespace: czm_dac_challenges_hud
		Checksum: 0xF5B9AD06
		Offset: 0xBA8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_tributeAvailable(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "tributeAvailable", value);
	}

	/*
		Name: set_challengeTypeText
		Namespace: czm_dac_challenges_hud
		Checksum: 0x721F54EB
		Offset: 0xC88
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_challengeTypeText(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "challengeTypeText", value);
	}

	/*
		Name: set_showIntelRewardText
		Namespace: czm_dac_challenges_hud
		Checksum: 0x75119E12
		Offset: 0xCC0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_showIntelRewardText(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showIntelRewardText", value);
	}

	/*
		Name: set_challengeFailing
		Namespace: czm_dac_challenges_hud
		Checksum: 0x480B95ED
		Offset: 0xC18
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_challengeFailing(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "challengeFailing", value);
	}

	/*
		Name: set_rewardText
		Namespace: czm_dac_challenges_hud
		Checksum: 0x9CD84BDB
		Offset: 0xC50
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_rewardText(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "rewardText", value);
	}

	/*
		Name: function_fa582112
		Namespace: czm_dac_challenges_hud
		Checksum: 0xF50B0409
		Offset: 0x8D0
		Size: 0x180
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cLUIelem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "challengeText", #"");
		[[ self ]]->set_data(localclientnum, "bottomText", #"");
		[[ self ]]->set_data(localclientnum, "bInLocation", 0);
		[[ self ]]->set_data(localclientnum, "progress", 0);
		[[ self ]]->set_data(localclientnum, "tributeAvailable", 0);
		[[ self ]]->set_data(localclientnum, "rewardHidden", 0);
		[[ self ]]->set_data(localclientnum, "challengeFailing", 0);
		[[ self ]]->set_data(localclientnum, "rewardText", #"");
		[[ self ]]->set_data(localclientnum, "challengeTypeText", 0);
		[[ self ]]->set_data(localclientnum, "showIntelRewardText", 0);
		[[ self ]]->set_data(localclientnum, "showChallenge", 0);
	}

}

#namespace zm_dac_challenges_hud;

/*
	Name: function_34cfc716
	Namespace: zm_dac_challenges_hud
	Checksum: 0x57358833
	Offset: 0x188
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_34cfc716()
{
	level notify(1161059368);
}

/*
	Name: register
	Namespace: zm_dac_challenges_hud
	Checksum: 0x8BF26842
	Offset: 0x1A8
	Size: 0x1DE
	Parameters: 11
	Flags: Linked
*/
function register(var_be2ad4d, var_a7896263, var_4866daed, var_afaddf7a, var_5d7491df, var_26df3d64, var_90359ec7, var_2404f6c6, var_74cf4193, var_e89bb89d, var_2c511278)
{
	elem = new czm_dac_challenges_hud();
	[[ elem ]]->setup_clientfields(var_be2ad4d, var_a7896263, var_4866daed, var_afaddf7a, var_5d7491df, var_26df3d64, var_90359ec7, var_2404f6c6, var_74cf4193, var_e89bb89d, var_2c511278);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_dac_challenges_hud"]))
	{
		level.var_ae746e8f[#"zm_dac_challenges_hud"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_dac_challenges_hud"]))
	{
		level.var_ae746e8f[#"zm_dac_challenges_hud"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_dac_challenges_hud"]))
	{
		level.var_ae746e8f[#"zm_dac_challenges_hud"] = array(level.var_ae746e8f[#"zm_dac_challenges_hud"]);
	}
	level.var_ae746e8f[#"zm_dac_challenges_hud"][level.var_ae746e8f[#"zm_dac_challenges_hud"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: zm_dac_challenges_hud
	Checksum: 0x51B30347
	Offset: 0x390
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new czm_dac_challenges_hud();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: zm_dac_challenges_hud
	Checksum: 0x52B6703D
	Offset: 0x3D0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: zm_dac_challenges_hud
	Checksum: 0xBFEBFC34
	Offset: 0x3F8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: zm_dac_challenges_hud
	Checksum: 0xD50A8D5D
	Offset: 0x420
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_challengeText
	Namespace: zm_dac_challenges_hud
	Checksum: 0x759A3E22
	Offset: 0x448
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_challengeText(localclientnum, value)
{
	[[ self ]]->set_challengeText(localclientnum, value);
}

/*
	Name: set_bottomText
	Namespace: zm_dac_challenges_hud
	Checksum: 0xAA074C66
	Offset: 0x478
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bottomText(localclientnum, value)
{
	[[ self ]]->set_bottomText(localclientnum, value);
}

/*
	Name: set_bInLocation
	Namespace: zm_dac_challenges_hud
	Checksum: 0x7599EBB7
	Offset: 0x4A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bInLocation(localclientnum, value)
{
	[[ self ]]->set_bInLocation(localclientnum, value);
}

/*
	Name: function_96972b9c
	Namespace: zm_dac_challenges_hud
	Checksum: 0xBACAFB27
	Offset: 0x4D8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_96972b9c(localclientnum)
{
	[[ self ]]->function_96972b9c(localclientnum);
}

/*
	Name: set_tributeAvailable
	Namespace: zm_dac_challenges_hud
	Checksum: 0x54782583
	Offset: 0x500
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_tributeAvailable(localclientnum, value)
{
	[[ self ]]->set_tributeAvailable(localclientnum, value);
}

/*
	Name: set_rewardHidden
	Namespace: zm_dac_challenges_hud
	Checksum: 0x875C39A9
	Offset: 0x530
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_rewardHidden(localclientnum, value)
{
	[[ self ]]->set_rewardHidden(localclientnum, value);
}

/*
	Name: set_challengeFailing
	Namespace: zm_dac_challenges_hud
	Checksum: 0x9670181B
	Offset: 0x560
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_challengeFailing(localclientnum, value)
{
	[[ self ]]->set_challengeFailing(localclientnum, value);
}

/*
	Name: set_rewardText
	Namespace: zm_dac_challenges_hud
	Checksum: 0x6A6C0D69
	Offset: 0x590
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_rewardText(localclientnum, value)
{
	[[ self ]]->set_rewardText(localclientnum, value);
}

/*
	Name: set_challengeTypeText
	Namespace: zm_dac_challenges_hud
	Checksum: 0x3D26004A
	Offset: 0x5C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_challengeTypeText(localclientnum, value)
{
	[[ self ]]->set_challengeTypeText(localclientnum, value);
}

/*
	Name: set_showIntelRewardText
	Namespace: zm_dac_challenges_hud
	Checksum: 0xF11B2163
	Offset: 0x5F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showIntelRewardText(localclientnum, value)
{
	[[ self ]]->set_showIntelRewardText(localclientnum, value);
}

/*
	Name: set_showChallenge
	Namespace: zm_dac_challenges_hud
	Checksum: 0x22BBF5B3
	Offset: 0x620
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showChallenge(localclientnum, value)
{
	[[ self ]]->set_showChallenge(localclientnum, value);
}

