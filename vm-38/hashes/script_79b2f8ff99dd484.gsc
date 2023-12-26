#using scripts\core_common\lui_shared.csc;

class class_ba33e0c1 : cLUIelem
{

	/*
		Name: constructor
		Namespace: namespace_ba33e0c1
		Checksum: 0xAE7533B
		Offset: 0x3D8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_ba33e0c1
		Checksum: 0xD284EB80
		Offset: 0x6B8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_ba33e0c1
		Checksum: 0xBFDE55EC
		Offset: 0x560
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cLUIelem::open(localclientnum);
	}

	/*
		Name: set_activatorCount
		Namespace: namespace_ba33e0c1
		Checksum: 0xB65BE9F1
		Offset: 0x680
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_activatorCount(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "activatorCount", value);
	}

	/*
		Name: register_clientside
		Namespace: namespace_ba33e0c1
		Checksum: 0xF04F683E
		Offset: 0x4A8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cLUIelem::register_clientside("EncodedRadio_UseBar");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_ba33e0c1
		Checksum: 0x9A86972
		Offset: 0x3F8
		Size: 0xA4
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_ec85b709, var_193163f7)
	{
		cLUIelem::setup_clientfields("EncodedRadio_UseBar");
		cLUIelem::add_clientfield("_state", 1, 1, "int");
		cLUIelem::add_clientfield("progressFrac", 1, 10, "float", var_ec85b709);
		cLUIelem::add_clientfield("activatorCount", 1, 3, "int", var_193163f7);
	}

	/*
		Name: set_state
		Namespace: namespace_ba33e0c1
		Checksum: 0xF62E4D2B
		Offset: 0x590
		Size: 0xAC
		Parameters: 2
		Flags: None
	*/
	function set_state(localclientnum, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			[[ self ]]->set_data(localclientnum, "_state", 0);
		}
		else
		{
			if(#"hash_5fba3d476e0b33f8" == state_name)
			{
				[[ self ]]->set_data(localclientnum, "_state", 1);
			}
			else
			{
				/#
					assertmsg("");
				#/
				/#
				#/
			}
		}
	}

	/*
		Name: set_progressFrac
		Namespace: namespace_ba33e0c1
		Checksum: 0x74921D4F
		Offset: 0x648
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_progressFrac(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "progressFrac", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_ba33e0c1
		Checksum: 0x41A1F363
		Offset: 0x4D0
		Size: 0x84
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cLUIelem::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->set_data(localclientnum, "progressFrac", 0);
		[[ self ]]->set_data(localclientnum, "activatorCount", 0);
	}

}

#namespace EncodedRadio_UseBar;

/*
	Name: function_73aa7ff5
	Namespace: EncodedRadio_UseBar
	Checksum: 0x8351EA6
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_73aa7ff5()
{
	level notify(217624107);
}

/*
	Name: register
	Namespace: EncodedRadio_UseBar
	Checksum: 0xB2AAE15B
	Offset: 0x108
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_ec85b709, var_193163f7)
{
	elem = new class_ba33e0c1();
	[[ elem ]]->setup_clientfields(var_ec85b709, var_193163f7);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"hash_76125f00bacdbe99"]))
	{
		level.var_ae746e8f[#"hash_76125f00bacdbe99"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_76125f00bacdbe99"]))
	{
		level.var_ae746e8f[#"hash_76125f00bacdbe99"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_76125f00bacdbe99"]))
	{
		level.var_ae746e8f[#"hash_76125f00bacdbe99"] = array(level.var_ae746e8f[#"hash_76125f00bacdbe99"]);
	}
	level.var_ae746e8f[#"hash_76125f00bacdbe99"][level.var_ae746e8f[#"hash_76125f00bacdbe99"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: EncodedRadio_UseBar
	Checksum: 0xF3BD5896
	Offset: 0x290
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_ba33e0c1();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: EncodedRadio_UseBar
	Checksum: 0x6B8F324B
	Offset: 0x2D0
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
	Namespace: EncodedRadio_UseBar
	Checksum: 0xB381FE23
	Offset: 0x2F8
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
	Namespace: EncodedRadio_UseBar
	Checksum: 0xA3FFB018
	Offset: 0x320
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_state
	Namespace: EncodedRadio_UseBar
	Checksum: 0xA1F35BE2
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: set_progressFrac
	Namespace: EncodedRadio_UseBar
	Checksum: 0x49B4A999
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progressFrac(localclientnum, value)
{
	[[ self ]]->set_progressFrac(localclientnum, value);
}

/*
	Name: set_activatorCount
	Namespace: EncodedRadio_UseBar
	Checksum: 0x2C4FBCC9
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_activatorCount(localclientnum, value)
{
	[[ self ]]->set_activatorCount(localclientnum, value);
}

