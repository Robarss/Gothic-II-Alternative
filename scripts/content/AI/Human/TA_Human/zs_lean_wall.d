
func void zs_lean_wall()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_lean_wall_loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"LEAN"))
	{
		AI_UseMob(self,"LEAN",1);
	};
	return LOOP_CONTINUE;
};

func void zs_lean_wall_end()
{
	AI_UseMob(self,"LEAN",-1);
};

