
func void zs_malen()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_malen_loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"MALEN"))
	{
		AI_UseMob(self,"MALEN",1);
	};
	return LOOP_CONTINUE;
};

func void zs_malen_end()
{
	AI_UseMob(self,"MALEN",-1);
};

