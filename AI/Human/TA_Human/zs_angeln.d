
func void zs_angeln()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,itmi_angel) == 0)
	{
		CreateInvItem(self,itmi_angel);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_angeln_loop()
{
	AI_AlignToWP(self);
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
	{
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_UseItemToState(self,itmi_angel,1);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void zs_angeln_end()
{
	AI_UseItemToState(self,itmi_angel,-1);
};

