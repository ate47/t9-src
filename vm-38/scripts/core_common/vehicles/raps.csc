#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace raps;

/*
	Name: function_c6e9ca2b
	Namespace: raps
	Checksum: 0x6E3875A8
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c6e9ca2b()
{
	level notify(1073798644);
}

/*
	Name: __init__system__
	Namespace: raps
	Checksum: 0x483FA348
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"raps", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: raps
	Checksum: 0x1F174C2F
	Offset: 0x120
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("vehicle", "raps_side_deathfx", 1, 1, "int", &do_side_death_fx, 0, 0);
}

/*
	Name: adjust_side_death_dir_if_trace_fail
	Namespace: raps
	Checksum: 0x87548387
	Offset: 0x178
	Size: 0x106
	Parameters: 4
	Flags: None
*/
function adjust_side_death_dir_if_trace_fail(origin, side_dir, fxlength, up_dir)
{
	end = origin + (side_dir * fxlength);
	trace = bullettrace(origin, end, 0, self);
	if(trace[#"fraction"] < 1)
	{
		new_side_dir = vectornormalize(side_dir + up_dir);
		end = origin + (new_side_dir * fxlength);
		new_trace = bullettrace(origin, end, 0, self);
		if(new_trace[#"fraction"] > trace[#"fraction"])
		{
			side_dir = new_side_dir;
		}
	}
	return side_dir;
}

/*
	Name: do_side_death_fx
	Namespace: raps
	Checksum: 0x16945786
	Offset: 0x288
	Size: 0x33C
	Parameters: 7
	Flags: None
*/
function do_side_death_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	util::waittill_dobj(binitialsnap);
	radius = 1;
	fxlength = 40;
	fxtag = "tag_body";
	if(fieldname && !bwastimejump)
	{
		if(!isdefined(self.settings))
		{
			self.settings = getscriptbundle(self.scriptbundlesettings);
		}
		forward_direction = anglestoforward(self.angles);
		up_direction = anglestoup(self.angles);
		origin = self gettagorigin(fxtag);
		if(!isdefined(origin))
		{
			origin = self.origin + vectorscale((0, 0, 1), 15);
		}
		right_direction = vectorcross(forward_direction, up_direction);
		right_direction = vectornormalize(right_direction);
		right_start = origin + (right_direction * radius);
		right_direction = adjust_side_death_dir_if_trace_fail(right_start, right_direction, fxlength, up_direction);
		left_direction = right_direction * -1;
		left_start = origin + (left_direction * radius);
		left_direction = adjust_side_death_dir_if_trace_fail(left_start, left_direction, fxlength, up_direction);
		if(isdefined(self.settings.sideexplosionfx))
		{
			playfx(binitialsnap, self.settings.sideexplosionfx, right_start, right_direction);
			playfx(binitialsnap, self.settings.sideexplosionfx, left_start, left_direction);
		}
		if(isdefined(self.settings.killedexplosionfx))
		{
			playfx(binitialsnap, self.settings.killedexplosionfx, origin, (0, 0, 1));
		}
		self playsound(binitialsnap, self.deathfxsound);
		if(isdefined(self.deathquakescale) && self.deathquakescale > 0)
		{
			earthquake(binitialsnap, self.deathquakescale, self.deathquakeduration, origin, self.deathquakeradius);
		}
	}
}

