#using script_1cc417743d7c262d;
#using script_396f7d71538c9677;
#using script_4721de209091b1a6;
#using script_4a81c26d2ddde9c;
#using script_6c8abe14025b47c4;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\util.gsc;

#namespace planemortar;

/*
	Name: function_89f2df9
	Namespace: planemortar
	Checksum: 0xA20B96A4
	Offset: 0x190
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"planemortar", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: planemortar
	Checksum: 0xE10C9CC9
	Offset: 0x1E0
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	bundlename = "killstreak_planemortar";
	if(function_f99d2668())
	{
		bundlename = bundlename + "_wz";
	}
	killstreaks::function_e4ef8390(bundlename, &usekillstreakplanemortar);
	level.plane_mortar_bda_dialog = &plane_mortar_bda_dialog;
	level.planeawardscoreevent = &planeawardscoreevent;
	level.var_269fec2 = &function_269fec2;
}

/*
	Name: function_269fec2
	Namespace: planemortar
	Checksum: 0xF209D605
	Offset: 0x2A8
	Size: 0xA6
	Parameters: 0
	Flags: Linked
*/
function function_269fec2()
{
	if(isdefined(level.var_30264985))
	{
		self notify(#"mortarradarused");
	}
	if((isdefined(self.var_17b726b7) ? self.var_17b726b7 : 0) < gettime())
	{
		globallogic_audio::leader_dialog_for_other_teams("enemyPlaneMortarUsed", self.team);
		self.var_17b726b7 = gettime() + (int(battlechatter::mpdialog_value("planeMortarCooldown", 7) * 1000));
	}
}

/*
	Name: plane_mortar_bda_dialog
	Namespace: planemortar
	Checksum: 0x465C2E17
	Offset: 0x358
	Size: 0x1DE
	Parameters: 0
	Flags: Linked
*/
function plane_mortar_bda_dialog()
{
	if(isdefined(self.planemortarbda))
	{
		if(self.planemortarbda === 1)
		{
			bdadialog = "kill1";
		}
		else
		{
			if(self.planemortarbda === 2)
			{
				bdadialog = "kill2";
			}
			else
			{
				if(self.planemortarbda === 3)
				{
					bdadialog = "kill3";
				}
				else if(self.planemortarbda > 3)
				{
					bdadialog = "killMultiple";
				}
			}
		}
		self namespace_f9b02f80::play_pilot_dialog(bdadialog, "planemortar", undefined, self.planemortarpilotindex);
		self namespace_f9b02f80::play_taacom_dialog("confirmHit");
	}
	else
	{
		if(is_true(self.("planemortar" + "_hitconfirmed")))
		{
			self namespace_f9b02f80::play_pilot_dialog("hitConfirmed_p0", "planemortar", undefined, self.planemortarpilotindex);
			self namespace_f9b02f80::play_taacom_dialog("confirmHit");
		}
		else
		{
			self namespace_f9b02f80::play_pilot_dialog("killNone", "planemortar", undefined, self.planemortarpilotindex);
			self namespace_f9b02f80::play_taacom_dialog("confirmMiss");
		}
	}
	self.planemortarbda = undefined;
	self.("planemortar" + "_hitconfirmed") = undefined;
	self.var_6e5974d2 = undefined;
	self.planemortarpilotindex = undefined;
}

/*
	Name: planeawardscoreevent
	Namespace: planemortar
	Checksum: 0xD44F4182
	Offset: 0x540
	Size: 0x14C
	Parameters: 2
	Flags: Linked
*/
function planeawardscoreevent(attacker, plane)
{
	attacker endon(#"disconnect");
	attacker notify(#"planeawardscoreevent_singleton");
	attacker endon(#"planeawardscoreevent_singleton");
	waittillframeend();
	if(isdefined(attacker) && (!isdefined(plane.owner) || plane.owner util::isenemyplayer(attacker)))
	{
		challenges::destroyedaircraft(attacker, getweapon(#"emp"), 0, plane);
		scoreevents::processscoreevent(#"destroyed_plane_mortar", attacker, plane.owner, getweapon(#"emp"));
		attacker challenges::addflyswatterstat(getweapon(#"emp"), plane);
	}
}

