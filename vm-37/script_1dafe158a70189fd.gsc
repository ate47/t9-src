#using script_4ee0ccb42a9d88f5;
#using script_59f07c660e6710a5;

#namespace namespace_1f694fcd;

/*
	Name: registerbrutusinterfaceattributes
	Namespace: namespace_1f694fcd
	Checksum: 0x72D813E1
	Offset: 0x70
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function registerbrutusinterfaceattributes()
{
	ai::registermatchedinterface(#"brutus", #"can_ground_slam", 0, array(1, 0));
	ai::registermatchedinterface(#"brutus", #"scripted_mode", 0, array(1, 0), &namespace_363fe686::function_f8aa76ea);
	ai::registermatchedinterface(#"brutus", #"patrol", 0, array(1, 0));
}

