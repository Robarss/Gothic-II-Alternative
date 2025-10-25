
func void zs_summon_raven()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
};

func int zs_summon_raven_loop()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
	Snd_Play("SFX_INNOSEYE");
	Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
	return LOOP_CONTINUE;
};

func void zs_summon_raven_end()
{
};

