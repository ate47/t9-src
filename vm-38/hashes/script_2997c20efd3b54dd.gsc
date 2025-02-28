#using script_1ff59bb2b15dfb4d;
#using scripts\core_common\class_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace threat_sight;

/*
	Name: function_ea76cc2d
	Namespace: threat_sight
	Checksum: 0x4C087042
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ea76cc2d()
{
	level notify(515253133);
}

/*
	Name: scalevolume
	Namespace: threat_sight
	Checksum: 0xAACC1647
	Offset: 0xF0
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function scalevolume(ent, vol)
{
}

#namespace namespace_6c0cd084;

/*
	Name: __init__system__
	Namespace: namespace_6c0cd084
	Checksum: 0x185DB421
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_299575137124db03", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_6c0cd084
	Checksum: 0x53FADD63
	Offset: 0x158
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	register_clientfields();
	level.var_6c0cd084 = new class_d0a0a887();
	[[ level.var_6c0cd084 ]]->init(8);
	/#
		function_5ac4dc99("", 0);
	#/
}

/*
	Name: register_clientfields
	Namespace: namespace_6c0cd084
	Checksum: 0xC6C00728
	Offset: 0x1C8
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private register_clientfields()
{
	clientfield::register("actor", "threat_sight", 1, 6, "int", &function_5010aab6, 0, 0);
	clientfield::register("actor", "threat_state", 1, 2, "int", &function_5010aab6, 0, 0);
}

/*
	Name: function_ac3d4bc
	Namespace: namespace_6c0cd084
	Checksum: 0x206ED0FE
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ac3d4bc()
{
	return float(self.threat_sight.var_97c4563c) + self.threat_sight.sight;
}

/*
	Name: function_8991ddb4
	Namespace: namespace_6c0cd084
	Checksum: 0xDECE4122
	Offset: 0x2A8
	Size: 0x3DA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8991ddb4(localclientnum)
{
	/#
		assert(!isdefined(self.threat_sight.elem));
	#/
	self.threat_sight.var_1911547e = [[ level.var_6c0cd084 ]]->function_65cdd2df(self);
	if(!isdefined(self.threat_sight.var_1911547e))
	{
		var_afda3384 = self function_ac3d4bc();
		lowest = undefined;
		var_5b9574e0 = undefined;
		foreach(guy in [[ level.var_6c0cd084 ]]->function_85a5add5())
		{
			/#
				assert(isdefined(guy.threat_sight));
			#/
			score = guy function_ac3d4bc();
			if(!isdefined(lowest) || score < lowest)
			{
				/#
					assert(guy !== self);
				#/
				lowest = score;
				var_5b9574e0 = guy;
			}
		}
		if(isdefined(lowest) && lowest < var_afda3384)
		{
			var_5b9574e0 function_a2d377b5(localclientnum);
			self.threat_sight.var_1911547e = [[ level.var_6c0cd084 ]]->function_65cdd2df(self);
		}
	}
	if(isdefined(self.threat_sight.var_1911547e))
	{
		self.threat_sight.elem = stealth_meter_display::register_clientside();
		if(!self.threat_sight.elem stealth_meter_display::is_open(localclientnum))
		{
			self.threat_sight.elem stealth_meter_display::open(localclientnum);
		}
		if(!isdefined(self.threat_sight.var_b4185011) && self hasdobj(localclientnum) && self haspart(localclientnum, "j_head"))
		{
			self.threat_sight.var_b4185011 = spawn(localclientnum, self gettagorigin("j_head"), "script_origin");
			self.threat_sight.var_b4185011 linkto(self, "j_head");
		}
		entnum = self getentitynumber();
		if(isdefined(self.threat_sight.var_b4185011))
		{
			entnum = self.threat_sight.var_b4185011 getentitynumber();
		}
		self.threat_sight.elem stealth_meter_display::set_entNum(localclientnum, entnum);
	}
	return self.threat_sight.elem;
}

/*
	Name: function_5010aab6
	Namespace: namespace_6c0cd084
	Checksum: 0x9CA6122E
	Offset: 0x690
	Size: 0x4BC
	Parameters: 7
	Flags: Linked, Private
*/
function private function_5010aab6(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	sight = float(self clientfield::get("threat_sight")) / (float((1 << 6) - 1));
	if(!isdefined(self.threat_sight))
	{
		self.threat_sight = spawnstruct();
	}
	now = self getclienttime();
	if((isdefined(self.threat_sight.time) ? self.threat_sight.time : -1) == now)
	{
		return;
	}
	self.threat_sight.time = now;
	self.threat_sight.sight = sight;
	self.threat_sight.var_97c4563c = self clientfield::get("threat_state");
	if(!isdefined(self.threat_sight.elem))
	{
		if(!getdvarint(#"hash_7bf40e4b6a830d11", 1))
		{
			return;
		}
		self.threat_sight.elem = self function_8991ddb4(wasdemojump);
		if(isdefined(self.threat_sight.elem))
		{
			self thread function_d4ae86f5(wasdemojump);
		}
	}
	if(isdefined(self.threat_sight.elem))
	{
		/#
			var_fdd79624 = "";
			if(!getdvarint(#"hash_7bf40e4b6a830d11", 1))
			{
				var_fdd79624 = "";
			}
			self thread function_ccfdbd44(wasdemojump, (((((("" + self.threat_sight.var_1911547e) + "") + self.threat_sight.var_97c4563c) + "") + self.threat_sight.sight) + "") + var_fdd79624);
		#/
		if(!self.threat_sight.elem stealth_meter_display::is_open(wasdemojump))
		{
			self.threat_sight.elem stealth_meter_display::open(wasdemojump);
			entnum = self getentitynumber();
			if(isdefined(self.threat_sight.var_b4185011))
			{
				entnum = self.threat_sight.var_b4185011 getentitynumber();
			}
			self.threat_sight.elem stealth_meter_display::set_entNum(wasdemojump, entnum);
		}
		if(getdvarint(#"hash_7bf40e4b6a830d11", 1))
		{
			self.threat_sight.elem stealth_meter_display::set_awarenessState(wasdemojump, self.threat_sight.var_97c4563c);
			self.threat_sight.elem stealth_meter_display::set_awarenessProgress(wasdemojump, self.threat_sight.sight);
			self.threat_sight.elem stealth_meter_display::set_clamped(wasdemojump, 1);
		}
		else
		{
			self.threat_sight.elem stealth_meter_display::set_awarenessState(wasdemojump, 0);
			self.threat_sight.elem stealth_meter_display::set_awarenessProgress(wasdemojump, 0);
			self.threat_sight.elem stealth_meter_display::set_clamped(wasdemojump, 0);
		}
	}
}

/*
	Name: function_ccfdbd44
	Namespace: namespace_6c0cd084
	Checksum: 0xB9052364
	Offset: 0xB58
	Size: 0xCE
	Parameters: 2
	Flags: Private
*/
function private function_ccfdbd44(localclientnum, msg)
{
	/#
		self notify("");
		self endon("");
		self endon(#"death");
		while(getdvarint(#"hash_40034352c4930dca") && isdefined(self.threat_sight))
		{
			print3d(self.origin + vectorscale((0, 0, 1), 40), msg, (1, 1, 1), 1, 0.75, 1, 0);
			waitframe(1);
		}
	#/
}

/*
	Name: function_d4ae86f5
	Namespace: namespace_6c0cd084
	Checksum: 0x31BE26F9
	Offset: 0xC30
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d4ae86f5(localclientnum)
{
	self notify(#"hash_433e3a44df358be9");
	self endon(#"hash_433e3a44df358be9");
	self waittill(#"death", #"entitydeleted");
	self thread function_a2d377b5(localclientnum);
}

/*
	Name: function_a2d377b5
	Namespace: namespace_6c0cd084
	Checksum: 0x4BF98232
	Offset: 0xCA8
	Size: 0xDE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a2d377b5(localclientnum)
{
	if(isdefined(self.threat_sight.var_1911547e))
	{
		[[ level.var_6c0cd084 ]]->function_271aec18(self.threat_sight.var_1911547e);
		if(self.threat_sight.elem stealth_meter_display::is_open(localclientnum))
		{
			self.threat_sight.elem stealth_meter_display::close(localclientnum);
		}
		if(isdefined(self.threat_sight.var_b4185011))
		{
			self.threat_sight.var_b4185011 delete();
		}
		self.threat_sight = undefined;
	}
	self notify(#"hash_433e3a44df358be9");
}

