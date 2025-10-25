
func void zs_woodchoppin()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_woodchoppin_loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"WOODCHOPPIN"))
	{
		AI_UseMob(self,"WOODCHOPPIN",1);
	};
	return LOOP_CONTINUE;
};

func void zs_woodchoppin_end()
{
	AI_UseMob(self,"WOODCHOPPIN",-1);
};

