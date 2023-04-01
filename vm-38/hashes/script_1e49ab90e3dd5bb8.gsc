#using scripts\core_common\lui_shared.csc;

class cblackseajetskideployprompt : cLUIelem
{

	/*
		Name: constructor
		Namespace: cblackseajetskideployprompt
		Checksum: 0x50E48056
		Offset: 0x358
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cblackseajetskideployprompt
		Checksum: 0x339DE60F
		Offset: 0x4B0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cblackseajetskideployprompt
		Checksum: 0x417F4CCE
		Offset: 0x448
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cLUIelem::open(localclientnum);
	}

	/*
		Name: set_deployProgress
		Namespace: cblackseajetskideployprompt
		Checksum: 0x34A132E7
		Offset: 0x478
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_deployProgress(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "deployProgress", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: cblackseajetskideployprompt
		Checksum: 0x452D64DB
		Offset: 0x3D0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		cLUIelem::function_5c1bb138("BlackSeaJetskiDeployPrompt");
	}

	/*
		Name: setup_clientfields
		Namespace: cblackseajetskideployprompt
		Checksum: 0x2F7EB72C
		Offset: 0x378
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_8c9ddf96)
	{
		cLUIelem::setup_clientfields("BlackSeaJetskiDeployPrompt");
		cLUIelem::function_da693cbe("deployProgress", 1, 5, "float", var_8c9ddf96);
	}

	/*
		Name: function_fa582112
		Namespace: cblackseajetskideployprompt
		Checksum: 0xA579396D
		Offset: 0x3F8
		Size: 0x48
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cLUIelem::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "deployProgress", 0);
	}

}

#namespace blackseajetskideployprompt;

/*
	Name: function_bb459e0c
	Namespace: blackseajetskideployprompt
	Checksum: 0x24E8E667
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bb459e0c()
{
	level notify(672822232);
}

/*
	Name: register
	Namespace: blackseajetskideployprompt
	Checksum: 0x4597D42
	Offset: 0xF0
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_8c9ddf96)
{
	elem = new cblackseajetskideployprompt();
	[[ elem ]]->setup_clientfields(var_8c9ddf96);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"blackseajetskideployprompt"]))
	{
		level.var_ae746e8f[#"blackseajetskideployprompt"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"blackseajetskideployprompt"]))
	{
		level.var_ae746e8f[#"blackseajetskideployprompt"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"blackseajetskideployprompt"]))
	{
		level.var_ae746e8f[#"blackseajetskideployprompt"] = array(level.var_ae746e8f[#"blackseajetskideployprompt"]);
	}
	level.var_ae746e8f[#"blackseajetskideployprompt"][level.var_ae746e8f[#"blackseajetskideployprompt"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: blackseajetskideployprompt
	Checksum: 0xE786992D
	Offset: 0x270
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new cblackseajetskideployprompt();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: blackseajetskideployprompt
	Checksum: 0x57DB6BC0
	Offset: 0x2B0
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
	Namespace: blackseajetskideployprompt
	Checksum: 0x8141E466
	Offset: 0x2D8
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
	Namespace: blackseajetskideployprompt
	Checksum: 0x583CFA11
	Offset: 0x300
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_deployProgress
	Namespace: blackseajetskideployprompt
	Checksum: 0x374C34E7
	Offset: 0x328
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_deployProgress(localclientnum, value)
{
	[[ self ]]->set_deployProgress(localclientnum, value);
}

