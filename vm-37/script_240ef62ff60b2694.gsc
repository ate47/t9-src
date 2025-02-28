#namespace stats;

/*
	Name: function_d92cb558
	Namespace: stats
	Checksum: 0xEFA53735
	Offset: 0x60
	Size: 0x104
	Parameters: 2
	Flags: None
*/
function function_d92cb558(result, vararg)
{
	/#
		if(!isdefined(result))
		{
			var_2f3fa528 = (function_7a600918(vararg[0]) ? function_9e72a96(vararg[0]) : vararg[0]);
			if(!isdefined(var_2f3fa528))
			{
				return;
			}
			for(i = 1; i < vararg.size; i++)
			{
				var_2f3fa528 = (var_2f3fa528 + "") + (function_7a600918(vararg[i]) ? function_9e72a96(vararg[i]) : vararg[i]);
			}
			println("" + var_2f3fa528);
		}
	#/
}

/*
	Name: get_stat
	Namespace: stats
	Checksum: 0xE7433C04
	Offset: 0x170
	Size: 0x76
	Parameters: 2
	Flags: Linked, Variadic
*/
function get_stat(localclientnum, ...)
{
	result = function_d0fed49d(localclientnum, currentsessionmode(), vararg);
	/#
		function_d92cb558(result, vararg);
	#/
	if(!isdefined(result))
	{
		result = 0;
	}
	return result;
}

/*
	Name: function_842e069e
	Namespace: stats
	Checksum: 0x4EF2556C
	Offset: 0x1F0
	Size: 0x60
	Parameters: 3
	Flags: Variadic
*/
function function_842e069e(localclientnum, sessionmode, ...)
{
	result = function_d0fed49d(localclientnum, sessionmode, vararg);
	/#
		function_d92cb558(result, vararg);
	#/
	return result;
}

/*
	Name: function_441050ca
	Namespace: stats
	Checksum: 0xBC809F94
	Offset: 0x258
	Size: 0x42
	Parameters: 2
	Flags: Linked
*/
function function_441050ca(localclientnum, statname)
{
	return get_stat(localclientnum, #"playerstatslist", statname, #"statvalue");
}

/*
	Name: function_c9d32eb9
	Namespace: stats
	Checksum: 0x7F9AFB5F
	Offset: 0x2A8
	Size: 0x6E
	Parameters: 3
	Flags: Linked, Variadic
*/
function function_c9d32eb9(localclientnum, var_648fa3eb, ...)
{
	result = function_644a3b03(localclientnum, var_648fa3eb, vararg);
	/#
		function_d92cb558(result, vararg);
	#/
	if(!isdefined(result))
	{
		result = 0;
	}
	return result;
}

/*
	Name: function_7f413ae3
	Namespace: stats
	Checksum: 0xEE91FC34
	Offset: 0x320
	Size: 0x6E
	Parameters: 3
	Flags: Linked, Variadic
*/
function function_7f413ae3(localclientnum, sessionmode, ...)
{
	result = function_fd428712(localclientnum, sessionmode, vararg);
	/#
		function_d92cb558(result, vararg);
	#/
	if(!isdefined(result))
	{
		result = 0;
	}
	return result;
}

