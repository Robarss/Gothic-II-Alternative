
func void zs_buchschreiben()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_buchschreiben_loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BUCHSCHREIBEN"))
	{
		AI_UseMob(self,"BUCHSCHREIBEN",1);
	};
	return LOOP_CONTINUE;
};

func void zs_buchschreiben_end()
{
	AI_UseMob(self,"BUCHSCHREIBEN",-1);
};

