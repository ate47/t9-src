#using script_2255a7ad3edc838f;

#namespace namespace_1d70329f;

/*
	Name: function_70a657d8
	Namespace: namespace_1d70329f
	Checksum: 0x334D16F6
	Offset: 0xC0
	Size: 0x304
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.var_774ed7e9 = [];
	foreach(team in level.teams)
	{
		level.var_774ed7e9[team] = [];
	}
	level.var_d3b9615b = function_b6e6a59b();
	level.var_4b98dc10 = [];
	level function_dad6ba0e(#"assault", &assault_ready, &assault_start, &function_6a672c6d);
	level function_dad6ba0e(#"capture", &function_bcd00fa7, &capture_start, &function_423ecbc1);
	level function_dad6ba0e(#"defend", &defend_ready, &defend_start, &function_72084729);
	level function_dad6ba0e(#"chase_enemy", &function_7c479af0, &function_6790cfd3, &function_63b3aa81);
	level function_dad6ba0e(#"hash_2fc0534d4a96a7ea", &function_199c516, &function_36d63786, &function_91d9d948);
	level function_dad6ba0e(#"camp", &function_c5686e54, &function_c35b807e, &function_17d77980);
	level function_dad6ba0e(#"patrol", &function_82c1a3e9, &patrol_start, &patrol_think);
	/#
		level thread function_7a7ab1a2();
	#/
}

/*
	Name: shutdown
	Namespace: namespace_1d70329f
	Checksum: 0xCD838B56
	Offset: 0x3D0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function shutdown()
{
	self clear();
}

/*
	Name: think
	Namespace: namespace_1d70329f
	Checksum: 0xE761A2CB
	Offset: 0x3F8
	Size: 0x20E
	Parameters: 0
	Flags: Linked
*/
function think()
{
	pixbeginevent();
	info = self function_4794d6a3();
	if(info.goalforced || self.ignoreall)
	{
		self clear();
		pixendevent();
		return;
	}
	bot = self.bot;
	if(isdefined(bot.objective) && !bot.objective.active)
	{
		self clear();
	}
	if(!isdefined(bot.objective))
	{
		objective = self function_79241feb();
		if(isdefined(objective))
		{
			self function_b35e00d9(objective);
		}
	}
	if(isdefined(bot.order))
	{
		state = level.var_4b98dc10[bot.order];
		if(bot.order != bot.objective.var_a1980fcb && self function_4b2723cf(bot.objective.var_a1980fcb, bot.objective))
		{
			state = level.var_4b98dc10[bot.order];
		}
		self [[state.think]](bot.objective);
	}
	/#
		if(self bot::should_record(#"hash_bb5c278818b000b"))
		{
			self function_26b3a2f();
			self function_d966fb1c();
		}
	#/
	pixendevent();
}

/*
	Name: function_79241feb
	Namespace: namespace_1d70329f
	Checksum: 0xE17C850C
	Offset: 0x610
	Size: 0x1A2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_79241feb()
{
	var_271aef88 = level.var_774ed7e9[self.team];
	if(var_271aef88.size <= 0)
	{
		return 0;
	}
	totalweight = 0;
	weights = [];
	foreach(objective in var_271aef88)
	{
		weight = 1;
		if(isdefined(objective.weight))
		{
			weight = self [[objective.weight]](objective);
		}
		totalweight = totalweight + weight;
		weights[weights.size] = totalweight;
	}
	var_e8351662 = randomfloat(totalweight);
	objective = undefined;
	foreach(weight in weights)
	{
		if(var_e8351662 < weight)
		{
			return var_271aef88[i];
		}
	}
	return undefined;
}

/*
	Name: function_b35e00d9
	Namespace: namespace_1d70329f
	Checksum: 0x7380A431
	Offset: 0x7C0
	Size: 0x80
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b35e00d9(objective)
{
	if(!self function_4b2723cf(objective.var_a1980fcb, objective) && !self function_4b2723cf(objective.var_5e99151a, objective))
	{
		return false;
	}
	self.bot.objective = objective;
	objective.count++;
	return true;
}

/*
	Name: function_4b2723cf
	Namespace: namespace_1d70329f
	Checksum: 0x1FF566A9
	Offset: 0x848
	Size: 0x96
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4b2723cf(order, objective)
{
	if(!isdefined(order))
	{
		return false;
	}
	state = level.var_4b98dc10[order];
	if(!isdefined(state))
	{
		return false;
	}
	if(!self [[state.ready]](objective) || !self [[state.start]](objective))
	{
		return false;
	}
	self.bot.order = order;
	return true;
}

/*
	Name: function_dad6ba0e
	Namespace: namespace_1d70329f
	Checksum: 0xCDB1C01D
	Offset: 0x8E8
	Size: 0x88
	Parameters: 4
	Flags: Linked, Private
*/
function private function_dad6ba0e(order, var_47dfc5f2, var_20ef4046, var_7b441679)
{
	state = {#think:var_7b441679, #start:var_20ef4046, #ready:var_47dfc5f2, #order:order};
	level.var_4b98dc10[order] = state;
}

/*
	Name: clear
	Namespace: namespace_1d70329f
	Checksum: 0xEA9D54AC
	Offset: 0x978
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private clear()
{
	if(isdefined(self.bot.objective))
	{
		self.bot.objective.count--;
	}
	self.bot.objective = undefined;
	self.bot.order = undefined;
	self.bot.var_775b48ce = undefined;
	self.bot.var_f0015c1 = undefined;
	self.bot.var_6b695775 = undefined;
	self.bot.var_3d1abfb9 = undefined;
	self.bot.var_941ba251 = undefined;
	self function_9392d2c9();
}

/*
	Name: function_82c1a3e9
	Namespace: namespace_1d70329f
	Checksum: 0x5BDE518
	Offset: 0xA38
	Size: 0x38
	Parameters: 1
	Flags: Linked, Private
*/
function private function_82c1a3e9(objective)
{
	players = function_f6f34851(self.team);
	return players.size > 0;
}

/*
	Name: patrol_start
	Namespace: namespace_1d70329f
	Checksum: 0x39137BA4
	Offset: 0xA78
	Size: 0x88
	Parameters: 1
	Flags: Linked, Private
*/
function private patrol_start(objective)
{
	id = self function_e559e4d5();
	if(!isdefined(id))
	{
		return false;
	}
	route = self function_89751246(id);
	if(route.size <= 0)
	{
		return false;
	}
	self function_fd78dbc(route);
	return true;
}

/*
	Name: patrol_think
	Namespace: namespace_1d70329f
	Checksum: 0xAED3CA87
	Offset: 0xB08
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private patrol_think(objective)
{
	self function_db3a19e8();
	if(!self function_28557cd1())
	{
		self clear();
	}
}

/*
	Name: function_e559e4d5
	Namespace: namespace_1d70329f
	Checksum: 0x477D531C
	Offset: 0xB68
	Size: 0x1BE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e559e4d5()
{
	players = function_f6f34851(self.team);
	if(players.size <= 0)
	{
		return undefined;
	}
	player = players[randomint(players.size)];
	tpoint = function_ad6356f5(player.origin);
	if(!isdefined(tpoint))
	{
		return undefined;
	}
	ids = [];
	info = function_b507a336(tpoint.region);
	if(info.tacpoints.size >= 10)
	{
		ids[ids.size] = info.id;
	}
	foreach(id in info.neighbors)
	{
		info = function_b507a336(id);
		if(info.tacpoints.size < 10)
		{
			continue;
		}
		ids[ids.size] = id;
	}
	if(ids.size <= 0)
	{
		return undefined;
	}
	return ids[randomint(ids.size)];
}

/*
	Name: function_7c479af0
	Namespace: namespace_1d70329f
	Checksum: 0x79166923
	Offset: 0xD30
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7c479af0(objective)
{
	return self.bot.var_e8c84f98;
}

/*
	Name: function_6790cfd3
	Namespace: namespace_1d70329f
	Checksum: 0x6B816009
	Offset: 0xD58
	Size: 0x88
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6790cfd3(objective)
{
	bot = self.bot;
	if(!isdefined(bot.var_494658cd))
	{
		return false;
	}
	route = self function_89751246(bot.var_494658cd.region);
	if(route.size <= 0)
	{
		return false;
	}
	self function_fd78dbc(route);
	return true;
}

/*
	Name: function_63b3aa81
	Namespace: namespace_1d70329f
	Checksum: 0x2969A60D
	Offset: 0xDE8
	Size: 0x1B4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_63b3aa81(objective)
{
	self function_db3a19e8();
	if(!self.bot.var_e8c84f98 && !self function_28557cd1())
	{
		info = self function_4794d6a3();
		if(is_true(info.var_9e404264))
		{
			self clear();
			return;
		}
	}
	bot = self.bot;
	if(self.bot.var_2cf887f8 && isdefined(bot.var_494658cd) && isdefined(bot.tpoint) && bot.var_494658cd.region != bot.tpoint.region)
	{
		if(!self function_28557cd1() || bot.var_494658cd.region != self function_f25530e3())
		{
			route = self function_89751246(bot.var_494658cd.region);
			if(route.size > 0)
			{
				self function_fd78dbc(route);
			}
		}
	}
}

/*
	Name: function_199c516
	Namespace: namespace_1d70329f
	Checksum: 0x6CA3FBCF
	Offset: 0xFA8
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_199c516(objective)
{
	return self.bot.var_e8c84f98;
}

/*
	Name: function_36d63786
	Namespace: namespace_1d70329f
	Checksum: 0x79BA6CE8
	Offset: 0xFD0
	Size: 0x90
	Parameters: 1
	Flags: Linked, Private
*/
function private function_36d63786(objective)
{
	info = self function_4794d6a3();
	if(isdefined(info.var_151c9dda))
	{
		return true;
	}
	if(!isdefined(self.bot.tpoint))
	{
		return false;
	}
	self setgoal(self.bot.tpoint.region);
	return true;
}

/*
	Name: function_91d9d948
	Namespace: namespace_1d70329f
	Checksum: 0x5AC248B6
	Offset: 0x1068
	Size: 0x244
	Parameters: 1
	Flags: Linked, Private
*/
function private function_91d9d948(objective)
{
	var_1f2328d0 = self function_4794d6a3();
	if(!self.bot.var_e8c84f98 || !isdefined(var_1f2328d0.var_151c9dda))
	{
		self clear();
		return;
	}
	var_494658cd = self.bot.var_494658cd;
	if(!isdefined(var_494658cd))
	{
		return;
	}
	if(var_494658cd.region != var_1f2328d0.var_151c9dda)
	{
		return;
	}
	enemyfwd = vectornormalize(self.enemy.origin - self.origin);
	var_6dc3b94d = [];
	var_8cc7a4e = function_b507a336(var_1f2328d0.var_151c9dda);
	foreach(var_3d52752a in var_8cc7a4e.neighbors)
	{
		var_a110f1ae = function_b507a336(var_3d52752a);
		if(vectordot(enemyfwd, var_a110f1ae.origin) <= 0.866)
		{
			var_6dc3b94d[var_6dc3b94d.size] = var_3d52752a;
		}
	}
	if(var_6dc3b94d.size <= 0)
	{
		self clear();
		return;
	}
	var_41cf0e63 = var_6dc3b94d[randomint(var_6dc3b94d.size)];
	self setgoal(var_41cf0e63);
}

/*
	Name: function_bcd00fa7
	Namespace: namespace_1d70329f
	Checksum: 0xAD1BB549
	Offset: 0x12B8
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bcd00fa7(objective)
{
	return self function_8b26cb41(objective);
}

/*
	Name: capture_start
	Namespace: namespace_1d70329f
	Checksum: 0x627652EC
	Offset: 0x12E8
	Size: 0x68
	Parameters: 1
	Flags: Linked, Private
*/
function private capture_start(objective)
{
	self function_9392d2c9();
	trigger = objective.info.target.trigger;
	self setgoal(trigger);
	return true;
}

/*
	Name: function_423ecbc1
	Namespace: namespace_1d70329f
	Checksum: 0x1DDA04C5
	Offset: 0x1358
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_423ecbc1(objective)
{
	self update_threat(objective);
}

/*
	Name: defend_ready
	Namespace: namespace_1d70329f
	Checksum: 0x53E3173A
	Offset: 0x1388
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private defend_ready(objective)
{
	return self function_8b26cb41(objective);
}

/*
	Name: defend_start
	Namespace: namespace_1d70329f
	Checksum: 0x42320C07
	Offset: 0x13B8
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function defend_start(objective)
{
	self function_9392d2c9();
	return true;
}

/*
	Name: function_72084729
	Namespace: namespace_1d70329f
	Checksum: 0x6AB66C4
	Offset: 0x13E8
	Size: 0x444
	Parameters: 1
	Flags: Linked, Private
*/
function private function_72084729(objective)
{
	if(!isdefined(self.bot.var_775b48ce))
	{
		self.bot.var_775b48ce = gettime() + (int(randomintrange(20, 60) * 1000));
	}
	else if(!isdefined(self.bot.var_775b48ce) || self.bot.var_775b48ce <= gettime())
	{
		if(self.bot.var_e8c84f98 || !is_true(objective.secure))
		{
			self.bot.var_775b48ce = gettime() + (int(randomintrange(20, 60) * 1000));
		}
		else
		{
			self clear();
			return;
		}
	}
	info = self function_4794d6a3();
	trigger = objective.info.target.trigger;
	if(isdefined(trigger) && !is_true(objective.secure))
	{
		if(!isdefined(info.goalvolume) || info.goalvolume != trigger)
		{
			self setgoal(trigger);
			self.bot.var_6b695775 = undefined;
		}
	}
	else
	{
		if(!isdefined(self.bot.var_6b695775) && isdefined(info.var_151c9dda) && isdefined(self.bot.tpoint) && info.var_151c9dda == self.bot.tpoint.region)
		{
			self.bot.var_6b695775 = gettime() + (int(randomfloatrange(5, 10) * 1000));
		}
		else
		{
			if(!isdefined(self.bot.var_6b695775) || self.bot.var_6b695775 <= gettime() && is_true(info.var_9e404264) && !self.bot.var_e8c84f98)
			{
				id = objective.info.var_dd2331cb[randomint(objective.info.var_dd2331cb.size)];
				if(isdefined(id))
				{
					self setgoal(id);
					self.bot.var_6b695775 = undefined;
				}
			}
			else if(!isinarray(objective.info.var_dd2331cb, info.var_151c9dda))
			{
				id = objective.info.var_dd2331cb[randomint(objective.info.var_dd2331cb.size)];
				if(isdefined(id))
				{
					self setgoal(id);
					self.bot.var_6b695775 = undefined;
				}
			}
		}
	}
	self update_threat(objective);
}

/*
	Name: assault_ready
	Namespace: namespace_1d70329f
	Checksum: 0x1AF681E
	Offset: 0x1838
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private assault_ready(objective)
{
	return objective.info.var_dd2331cb.size > 0;
}

/*
	Name: assault_start
	Namespace: namespace_1d70329f
	Checksum: 0xED5A5942
	Offset: 0x1868
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private assault_start(objective)
{
	return self function_c3253ef(objective);
}

/*
	Name: function_6a672c6d
	Namespace: namespace_1d70329f
	Checksum: 0xB1848051
	Offset: 0x1898
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6a672c6d(objective)
{
	self function_db3a19e8();
	if(!self function_99dcd0bd(objective))
	{
		self function_c3253ef(objective);
	}
}

/*
	Name: function_c5686e54
	Namespace: namespace_1d70329f
	Checksum: 0x3B5A3682
	Offset: 0x18F8
	Size: 0x1C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c5686e54(objective)
{
	return !self.bot.var_2cf887f8;
}

/*
	Name: function_c35b807e
	Namespace: namespace_1d70329f
	Checksum: 0xE20CE654
	Offset: 0x1920
	Size: 0x100
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c35b807e(objective)
{
	var_20f0b8e = function_548ca110();
	if(var_20f0b8e <= 0)
	{
		return false;
	}
	var_de0b3c66 = randomintrange(1, var_20f0b8e);
	var_f1120f81 = function_b507a336(var_de0b3c66);
	if(var_f1120f81.tacpoints.size < 15 || var_f1120f81.neighbors.size < 2)
	{
		return false;
	}
	route = self function_89751246(var_de0b3c66);
	if(route.size <= 0)
	{
		return false;
	}
	self function_fd78dbc(route);
	return true;
}

/*
	Name: function_17d77980
	Namespace: namespace_1d70329f
	Checksum: 0x24699C57
	Offset: 0x1A28
	Size: 0x104
	Parameters: 1
	Flags: Linked, Private
*/
function private function_17d77980(objective)
{
	self function_db3a19e8();
	if(self function_28557cd1())
	{
		return;
	}
	self update_threat(objective);
	if(!isdefined(self.bot.var_f0015c1))
	{
		self.bot.var_f0015c1 = gettime() + (int(randomintrange(20, 60) * 1000));
	}
	else if(!isdefined(self.bot.var_f0015c1) || self.bot.var_f0015c1 <= gettime())
	{
		self clear();
	}
}

/*
	Name: function_8b26cb41
	Namespace: namespace_1d70329f
	Checksum: 0x3000F452
	Offset: 0x1B38
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8b26cb41(objective)
{
	tpoint = self.bot.tpoint;
	if(!isdefined(tpoint))
	{
		return false;
	}
	foreach(id in objective.info.var_dd2331cb)
	{
		if(tpoint.region == id)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_c3253ef
	Namespace: namespace_1d70329f
	Checksum: 0xB1085676
	Offset: 0x1C08
	Size: 0xD0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c3253ef(objective)
{
	if(!isdefined(objective.info.var_dd2331cb) || objective.info.var_dd2331cb.size <= 0)
	{
		return false;
	}
	id = objective.info.var_dd2331cb[randomint(objective.info.var_dd2331cb.size)];
	route = self function_89751246(id);
	if(route.size <= 0)
	{
		return false;
	}
	self function_fd78dbc(route);
	return true;
}

/*
	Name: function_99dcd0bd
	Namespace: namespace_1d70329f
	Checksum: 0x100A87A3
	Offset: 0x1CE0
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_99dcd0bd(objective)
{
	if(!self function_28557cd1())
	{
		return 0;
	}
	endindex = self.bot.route.size - 1;
	var_69c6b167 = self.bot.route[endindex];
	return isinarray(objective.info.var_dd2331cb, var_69c6b167);
}

/*
	Name: function_89751246
	Namespace: namespace_1d70329f
	Checksum: 0x373391DD
	Offset: 0x1D80
	Size: 0x104
	Parameters: 1
	Flags: Linked, Private
*/
function private function_89751246(var_151c9dda)
{
	pixbeginevent();
	var_66e7b0ba = self.bot.tpoint;
	if(!isdefined(var_66e7b0ba) || var_66e7b0ba.region == var_151c9dda)
	{
		pixendevent();
		return array(var_151c9dda);
	}
	var_d3547bb1 = function_b507a336(var_151c9dda);
	var_cdea01dc = randomfloatrange(-1, 1);
	self function_ca06456b(self.origin, var_d3547bb1.origin, level.var_d3b9615b, var_cdea01dc);
	pixendevent();
	return function_afd64b51(var_66e7b0ba.region, var_151c9dda);
}

/*
	Name: function_ca06456b
	Namespace: namespace_1d70329f
	Checksum: 0x18E2247F
	Offset: 0x1E90
	Size: 0x3FE
	Parameters: 4
	Flags: Linked, Private
*/
function private function_ca06456b(start, end, bounds, var_cdea01dc)
{
	pixbeginevent();
	var_f6035988 = end - start;
	var_8c171e74 = length(var_f6035988);
	var_43bc5205 = vectortoangles(var_f6035988);
	var_d62fe1dc = anglestoforward(var_43bc5205);
	var_cb764353 = anglestoright(var_43bc5205);
	if(var_cdea01dc < 0)
	{
		var_cb764353 = (0, 0, 0) - var_cb764353;
		var_cdea01dc = abs(var_cdea01dc);
	}
	var_c7a2a5bd = var_cb764353 * (var_8c171e74 * 0.75);
	var_16c02318 = function_24531a26(start, start + var_c7a2a5bd, bounds.absmins, bounds.absmaxs);
	var_6d229307 = vectorlerp(start, var_16c02318.end, var_cdea01dc);
	var_c7a484a2 = distance(start, var_6d229307);
	var_e06b6158 = function_24531a26(end, end + var_c7a2a5bd, bounds.absmins, bounds.absmaxs);
	var_57a5b0 = vectorlerp(end, var_e06b6158.end, var_cdea01dc);
	var_315d734c = distance(end, var_57a5b0);
	var_acfd9e68 = var_c7a484a2 > 500;
	var_16eedbee = var_315d734c > 500;
	var_22405e9b = var_57a5b0 - var_6d229307;
	var_ccb07583 = length(var_22405e9b);
	var_f8c9ffb2 = vectortoangles(var_22405e9b);
	var_beaef07d = anglestoforward(var_f8c9ffb2);
	var_75128d22 = anglestoright(var_f8c9ffb2);
	/#
		var_83163700 = self bot::should_record(#"hash_bb5c278818b000b");
		if(var_83163700)
		{
			recordline(start, var_6d229307, (1, 0, 1), "", self);
			recordline(var_6d229307, var_57a5b0, (1, 0, 1), "", self);
			recordline(var_57a5b0, end, (1, 0, 1), "", self);
		}
	#/
	points = array(start, var_6d229307, var_57a5b0, end);
	function_c36796ff(10, 0.2, 500, points, 10, 20);
	pixendevent();
}

/*
	Name: function_fd78dbc
	Namespace: namespace_1d70329f
	Checksum: 0xA74DBF17
	Offset: 0x2298
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fd78dbc(route)
{
	self.bot.route = route;
	self.bot.var_e923c16d = 0;
}

/*
	Name: function_9392d2c9
	Namespace: namespace_1d70329f
	Checksum: 0x8F814963
	Offset: 0x22D0
	Size: 0x22
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9392d2c9()
{
	self.bot.route = undefined;
	self.bot.var_e923c16d = undefined;
}

/*
	Name: function_28557cd1
	Namespace: namespace_1d70329f
	Checksum: 0x68B5EA65
	Offset: 0x2300
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_28557cd1()
{
	return isdefined(self.bot.route);
}

/*
	Name: function_f25530e3
	Namespace: namespace_1d70329f
	Checksum: 0x9F90ED5D
	Offset: 0x2320
	Size: 0x3A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f25530e3()
{
	route = self.bot.route;
	if(!isdefined(route))
	{
		return undefined;
	}
	return route[route.size - 1];
}

/*
	Name: function_db3a19e8
	Namespace: namespace_1d70329f
	Checksum: 0xEF49A283
	Offset: 0x2368
	Size: 0x25E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_db3a19e8()
{
	pixbeginevent();
	if(self isplayinganimscripted() || self arecontrolsfrozen() || self function_5972c3cf() || self isinvehicle())
	{
		pixendevent();
		return;
	}
	bot = self.bot;
	if(!isarray(bot.route) || bot.route.size <= 0)
	{
		pixendevent();
		return;
	}
	id = bot.route[bot.var_e923c16d];
	if(bot.route.size == 1)
	{
		self setgoal(id);
		self forceupdategoalpos();
		self function_9392d2c9();
	}
	else
	{
		if(isdefined(bot.tpoint) && bot.tpoint.region == id)
		{
			bot.var_e923c16d++;
			if(bot.var_e923c16d < bot.route.size)
			{
				self setgoal(bot.route[bot.var_e923c16d]);
				self forceupdategoalpos();
			}
			else
			{
				self function_9392d2c9();
			}
		}
		else
		{
			info = self function_4794d6a3();
			if(!isdefined(info.var_151c9dda) || info.var_151c9dda != id)
			{
				self setgoal(id);
				self forceupdategoalpos();
			}
		}
	}
	pixendevent();
}

/*
	Name: function_b6e6a59b
	Namespace: namespace_1d70329f
	Checksum: 0x4612BF27
	Offset: 0x25D0
	Size: 0x5E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b6e6a59b()
{
	bounds = function_5ac49687();
	if(isdefined(bounds))
	{
		bounds.var_f521d351 = (bounds.maxs[0], bounds.maxs[1], bounds.mins[2]);
	}
	return bounds;
}

/*
	Name: update_threat
	Namespace: namespace_1d70329f
	Checksum: 0x17DAB219
	Offset: 0x2638
	Size: 0x29C
	Parameters: 1
	Flags: Linked, Private
*/
function private update_threat(objective)
{
	if(self.bot.var_e8c84f98)
	{
		self.bot.var_3d1abfb9 = undefined;
		return;
	}
	if(!(!isdefined(self.bot.var_3d1abfb9) || self.bot.var_3d1abfb9 <= gettime()) && self.bot.var_9931c7dc)
	{
		return;
	}
	pixbeginevent("update_threat");
	trigger = objective.info.target.trigger;
	if(isdefined(trigger) && !is_true(objective.secure))
	{
		point = self function_f217ace2(trigger);
		if(isdefined(point))
		{
			self.bot.var_941ba251 = point;
			self.bot.var_3d1abfb9 = gettime() + (int(randomfloatrange(1.5, 3) * 1000));
		}
	}
	else
	{
		var_23f1621e = objective.info.var_23f1621e;
		if(!isdefined(var_23f1621e) && isdefined(self.bot.tpoint))
		{
			info = function_b507a336(self.bot.tpoint.region);
			var_23f1621e = info.neighbors;
		}
		point = self function_146c03bd(var_23f1621e);
		if(isdefined(point))
		{
			self.bot.var_941ba251 = point;
			self.bot.var_3d1abfb9 = gettime() + (int(randomfloatrange(2, 5) * 1000));
		}
	}
	pixendevent();
}

/*
	Name: function_146c03bd
	Namespace: namespace_1d70329f
	Checksum: 0x7A7FB6A
	Offset: 0x28E0
	Size: 0xD2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_146c03bd(var_dd2331cb)
{
	if(!isdefined(var_dd2331cb) || var_dd2331cb.size <= 0)
	{
		return undefined;
	}
	id = var_dd2331cb[randomint(var_dd2331cb.size)];
	points = tacticalquery(#"hash_74b4463994f96eae", id, self);
	if(points.size <= 0)
	{
		return undefined;
	}
	return points[randomint(points.size)].origin + (0, 0, 50);
}

/*
	Name: function_f217ace2
	Namespace: namespace_1d70329f
	Checksum: 0xE05A8373
	Offset: 0x29C0
	Size: 0x8A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f217ace2(volume)
{
	points = tacticalquery(#"hash_eea3b34d24d4bdd", volume, self);
	if(points.size <= 0)
	{
		return undefined;
	}
	return points[randomint(points.size)].origin + (0, 0, 50);
}

/*
	Name: function_7a7ab1a2
	Namespace: namespace_1d70329f
	Checksum: 0xCDB53D3A
	Offset: 0x2A58
	Size: 0x64C
	Parameters: 0
	Flags: Private
*/
function private function_7a7ab1a2()
{
	/#
		level endon(#"game_ended");
		while(true)
		{
			waitframe(1);
			if(getdvarint(#"hash_bb5c278818b000b", 0) <= 0)
			{
				continue;
			}
			function_af72dbc5(level.var_d3b9615b.origin, level.var_d3b9615b.mins, level.var_d3b9615b.var_f521d351, 0, (1, 0, 0), "");
			zoffset = 0;
			var_dd2331cb = [];
			var_23f1621e = [];
			foreach(team, var_271aef88 in level.var_774ed7e9)
			{
				foreach(objective in var_271aef88)
				{
					if(!isdefined(objective.info) || !isdefined(objective.info.target))
					{
						continue;
					}
					record3dtext(((((level.teams[team] + "") + objective.count) + "") + function_9e72a96(objective.var_a1980fcb) + "") + function_9e72a96(objective.var_5e99151a), objective.info.target.origin + (0, 0, zoffset), (0, 1, 1), "");
					if(isdefined(objective.info.var_dd2331cb))
					{
						foreach(id in objective.info.var_dd2331cb)
						{
							var_dd2331cb[id] = id;
						}
					}
					if(isdefined(objective.info.var_23f1621e))
					{
						foreach(id in objective.info.var_23f1621e)
						{
							var_23f1621e[id] = id;
						}
					}
				}
				zoffset = zoffset + -10;
			}
			foreach(id in var_dd2331cb)
			{
				info = function_b507a336(id);
				foreach(point in info.tacpoints)
				{
					recordstar(point.origin, (0, 1, 1), "");
				}
				record3dtext(id, info.origin, (0, 1, 1), "");
			}
			foreach(id in var_23f1621e)
			{
				info = function_b507a336(id);
				foreach(point in info.tacpoints)
				{
					recordstar(point.origin, (0, 0, 1), "");
				}
				record3dtext(id, info.origin, (0, 0, 1), "");
			}
		}
	#/
}

/*
	Name: function_26b3a2f
	Namespace: namespace_1d70329f
	Checksum: 0x6760B16F
	Offset: 0x30B0
	Size: 0x174
	Parameters: 0
	Flags: Private
*/
function private function_26b3a2f()
{
	/#
		order = self.bot.order;
		if(!isdefined(order))
		{
			record3dtext(function_9e72a96(#"hash_266967e49741306c"), self.origin, (0, 1, 1), "", self, 0.5);
		}
		else
		{
			record3dtext(function_9e72a96(#"hash_15017f84fb1a2e46") + function_9e72a96(order), self.origin, (0, 1, 1), "", self, 0.5);
		}
		objective = self.bot.objective;
		if(isdefined(objective) && isdefined(objective.info) && isdefined(objective.info.target))
		{
			recordline(self.origin, objective.info.target.origin, (0, 1, 1), "", self);
		}
	#/
}

/*
	Name: function_d966fb1c
	Namespace: namespace_1d70329f
	Checksum: 0xD2485805
	Offset: 0x3230
	Size: 0x1BE
	Parameters: 0
	Flags: Private
*/
function private function_d966fb1c()
{
	/#
		route = self.bot.route;
		if(!isdefined(route))
		{
			return;
		}
		var_e923c16d = self.bot.var_e923c16d;
		lastorigin = undefined;
		foreach(i, id in route)
		{
			info = function_b507a336(id);
			color = (0, 1, 0);
			if(i > var_e923c16d)
			{
				color = (0, 1, 1);
			}
			else if(i < var_e923c16d)
			{
				color = (0, 0, 1);
			}
			text = (((id + "") + i) + "") + info.tacpoints.size;
			record3dtext(text, info.origin, color, "", self);
			if(isdefined(lastorigin))
			{
				recordline(lastorigin, info.origin, color, "", self);
			}
			lastorigin = info.origin;
		}
	#/
}

