#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace explode;

/*
	Name: function_89f2df9
	Namespace: explode
	Checksum: 0x64CB104
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"explode", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: explode
	Checksum: 0x31040F48
	Offset: 0xF0
	Size: 0xCC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.dirt_enable_explosion = getdvarint(#"scr_dirt_enable_explosion", 1);
	level.dirt_enable_slide = getdvarint(#"scr_dirt_enable_slide", 1);
	level.dirt_enable_fall_damage = getdvarint(#"scr_dirt_enable_fall_damage", 1);
	callback::on_localplayer_spawned(&localplayer_spawned);
	/#
		level thread updatedvars();
	#/
}

/*
	Name: updatedvars
	Namespace: explode
	Checksum: 0x7D535A7C
	Offset: 0x1C8
	Size: 0xB0
	Parameters: 0
	Flags: None
*/
function updatedvars()
{
	/#
		while(true)
		{
			level.dirt_enable_explosion = getdvarint(#"scr_dirt_enable_explosion", level.dirt_enable_explosion);
			level.dirt_enable_slide = getdvarint(#"scr_dirt_enable_slide", level.dirt_enable_slide);
			level.dirt_enable_fall_damage = getdvarint(#"scr_dirt_enable_fall_damage", level.dirt_enable_fall_damage);
			wait(1);
		}
	#/
}

/*
	Name: localplayer_spawned
	Namespace: explode
	Checksum: 0xD1592A00
	Offset: 0x280
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function localplayer_spawned(localclientnum)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	if(level.dirt_enable_explosion || level.dirt_enable_slide || level.dirt_enable_fall_damage)
	{
		if(level.dirt_enable_explosion)
		{
			self thread watchforexplosion(localclientnum);
		}
		if(level.dirt_enable_slide)
		{
			self thread watchforplayerslide(localclientnum);
		}
		if(level.dirt_enable_fall_damage)
		{
			self thread watchforplayerfalldamage(localclientnum);
		}
	}
}

/*
	Name: watchforplayerfalldamage
	Namespace: explode
	Checksum: 0x3D262C5A
	Offset: 0x358
	Size: 0xA0
	Parameters: 1
	Flags: None
*/
function watchforplayerfalldamage(localclientnum)
{
	self endon(#"death");
	seed = 0;
	xdir = 0;
	ydir = 270;
	while(true)
	{
		self waittill(#"fall_damage");
		self thread dothedirty(localclientnum, xdir, ydir, 1, 1000, 500);
	}
}

/*
	Name: watchforplayerslide
	Namespace: explode
	Checksum: 0x1CB01D9E
	Offset: 0x400
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function watchforplayerslide(localclientnum)
{
	self endon(#"death");
	seed = 0;
	self.wasplayersliding = 0;
	xdir = 0;
	ydir = 6000;
	while(true)
	{
		self.isplayersliding = self isplayersliding();
		if(self.isplayersliding)
		{
			if(!self.wasplayersliding)
			{
				self notify(#"endthedirty");
				seed = randomfloatrange(0, 1);
			}
		}
		else if(self.wasplayersliding)
		{
			self thread dothedirty(localclientnum, xdir, ydir, 1, 300, 300);
		}
		self.wasplayersliding = self.isplayersliding;
		waitframe(1);
	}
}

/*
	Name: dothedirty
	Namespace: explode
	Checksum: 0xF009181A
	Offset: 0x530
	Size: 0xAC
	Parameters: 6
	Flags: None
*/
function dothedirty(localclientnum, right, up, distance, dirtduration, dirtfadetime)
{
	self endon(#"death");
	self notify(#"dothedirty");
	self endon(#"dothedirty");
	self endon(#"endthedirty");
	util::lerp_generic(localclientnum, dirtduration, &do_the_dirty_lerp_helper, right, up, distance, dirtfadetime);
}

/*
	Name: do_the_dirty_lerp_helper
	Namespace: explode
	Checksum: 0x69975DA6
	Offset: 0x5E8
	Size: 0x44
	Parameters: 8
	Flags: None
*/
function do_the_dirty_lerp_helper(currenttime, elapsedtime, localclientnum, dirtduration, right, up, distance, dirtfadetime)
{
}

/*
	Name: watchforexplosion
	Namespace: explode
	Checksum: 0xB92506F
	Offset: 0x638
	Size: 0x388
	Parameters: 1
	Flags: None
*/
function watchforexplosion(localclientnum)
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"explode");
		mod = waitresult.mod;
		position = waitresult.position;
		localclientnum = waitresult.localclientnum;
		explosiondistance = distance(self.origin, position);
		if(mod == "MOD_GRENADE_SPLASH" || mod == "MOD_PROJECTILE_SPLASH" && explosiondistance < 600 && !function_1cbf351b(localclientnum) && !isthirdperson(localclientnum))
		{
			cameraangles = self getcamangles();
			if(!isdefined(cameraangles))
			{
				continue;
			}
			forwardvec = vectornormalize(anglestoforward(cameraangles));
			upvec = vectornormalize(anglestoup(cameraangles));
			rightvec = vectornormalize(anglestoright(cameraangles));
			explosionvec = vectornormalize(position - self getcampos());
			if(vectordot(forwardvec, explosionvec) > 0)
			{
				trace = bullettrace(getlocalclienteyepos(localclientnum), position, 0, self);
				if(trace[#"fraction"] >= 0.9)
				{
					udot = -1 * vectordot(explosionvec, upvec);
					rdot = vectordot(explosionvec, rightvec);
					udotabs = abs(udot);
					rdotabs = abs(rdot);
					if(udotabs > rdotabs)
					{
						if(udot > 0)
						{
							udot = 1;
						}
						else
						{
							udot = -1;
						}
					}
					else
					{
						if(rdot > 0)
						{
							rdot = 1;
						}
						else
						{
							rdot = -1;
						}
					}
					self thread dothedirty(localclientnum, rdot, udot, 1 - (explosiondistance / 600), 2000, 500);
				}
			}
		}
	}
}

