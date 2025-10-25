
func void B_ResetAll(var C_Npc slf)
{
	B_StopLookAt(slf);
	if(!Npc_IsInState(self,zs_stand_halberd))
	{
		AI_RemoveWeapon(self);
	};
};

