
func void B_MM_AssessSurprise()
{
	Npc_SetTarget(self,other);
};

func void ZS_MM_Attack()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,B_MM_AssessSurprise);
	B_ValidateOther();
	if(self.guild == GIL_SHEEP)
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_MM_Flee,0,"");
		return;
	};
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
	self.aivar[AIV_PursuitEnd] = FALSE;
	self.aivar[AIV_StateTime] = 0;
	self.aivar[AIV_HitByOtherNpc] = 0;
	self.aivar[AIV_SelectSpell] = 0;
	self.aivar[AIV_TAPOSITION] = 0;
};

func int ZS_MM_Attack_Loop()
{
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mil_310_Stadtwache)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mil_333_Stadtwache) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(MIL_3333_STADTWACHE)))
    {
        
        return LOOP_END;
    };
	var int drg_lh;
	Npc_GetTarget(self);
	if(self.guild == GIL_DRAGON)
	{
		if(self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP)
		{
			if((Npc_GetDistToNpc(self,hero) < 800) && (Npc_GetDistToNpc(self,hero) > 450))
			{
				DRG_RD = Hlp_Random(17);
				if((DRG_RD == 5) || (DRG_RD == 11))
				{
					AI_TurnToNPC(self,hero);
					AI_PlayAni(self,"T_WARN");
					if((DRG_RD == 5) && (DRG_TIMER == 0))
					{
						Snd_Play("DRG_WARN_01");
						Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
						AI_PlayAni(hero,"T_FALLB_2_FALLENB");
						DRG_TIMER = 3;
						AI_Wait(hero,1);
					};
				};
			};
			if((DRG_80 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 80) / 100)))
			{
				DRG_REGEN = 3;
				AI_PlayAni(self,"T_WARN");
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_GREEN",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(Swamprat,"OW_SWAMPDRAGON_01");
				Wld_InsertNpc(Swamprat,"OW_SWAMPDRAGON_01");
				Wld_InsertNpc(Swamprat,"OW_SWAMPDRAGON_01");
				Wld_InsertNpc(SwampDrone,"OW_SWAMPDRAGON_01");
				Wld_InsertNpc(SwampDrone,"OW_SWAMPDRAGON_01");
				Wld_InsertNpc(Swampshark,"OW_SWAMPDRAGON_01");
				Wld_InsertNpc(Swampshark,"OW_SWAMPDRAGON_01");
				DRG_80 = TRUE;
			};
			if((DRG_60 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 60) / 100)))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
				Snd_Play("DRG_HURT_02");
				Snd_Play("DRG_TAUNT_01");
				AI_PlayAni(self,"T_WARN");
				Wld_PlayEffect("SPELLFX_INCOVATION_GREEN",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_GREEN",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_GREEN",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(SwampGolem,"OW_SWAMPDRAGON_01");
				Wld_InsertNpc(SwampGolem,"OW_SWAMPDRAGON_01");
				DRG_60 = TRUE;
			};
			if((DRG_40 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 40) / 100)))
			{
				DRG_REGEN = 4;
				Snd_Play("DRG_FIRERAIN");
				AI_PlayAni(self,"T_WARN");
				Snd_Play("DRG_WARN_01");
				Wld_PlayEffect("SPELLFX_INCOVATION_GREEN",self,hero,1,50,DAM_MAGIC,TRUE);
				Wld_PlayEffect("SPELLFX_INCOVATION_GREEN",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_GREEN",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(SwampGolem,"OW_SWAMPDRAGON_01");
				Wld_InsertNpc(SwampGolem,"OW_SWAMPDRAGON_01");
				DRG_40 = TRUE;
				DRG_TIMER_3 = 20;
				DRG_25 = TRUE;
			};
			if((DRG_25 == TRUE) && (DRG_TIMER_3 == 0) && (DRG_20 == FALSE))
			{
				SwampDragon.flags = 0;
			};
			if((DRG_20 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 15) / 100)))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
				Snd_Play("DRG_TAUNT_02");
				DRG_REGEN = 1;
				Wld_PlayEffect("SPELLFX_THUNDERSTORM",self,hero,1,150,DAM_MAGIC,TRUE);
				Wld_PlayEffect("SPELLFX_INCOVATION_GREEN",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				AI_PlayAni(hero,"T_FALLB_2_FALLENB");
				AI_Wait(hero,1);
				DRG_20 = TRUE;
			};
		};
		if(self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK)
		{
			if((Npc_GetDistToNpc(self,hero) < 800) && (Npc_GetDistToNpc(self,hero) > 450))
			{
				DRG_RD = Hlp_Random(17);
				if((DRG_RD == 5) || (DRG_RD == 11))
				{
					AI_TurnToNPC(self,hero);
					AI_PlayAni(self,"T_WARN");
					if((DRG_RD == 5) && (DRG_TIMER == 0))
					{
						Snd_Play("DRG_WARN_01");
						AI_Wait(self,1);
						Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
						AI_PlayAni(hero,"T_FALLB_2_FALLENB");
						DRG_TIMER = 3;
						AI_Wait(hero,1);
					};
				};
			};
			if((DRG_80 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 80) / 100)))
			{
				DRG_REGEN = 3;
				AI_PlayAni(self,"T_WARN");
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_11");
				Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_11");
				DRG_80 = TRUE;
			};
			if((DRG_60 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 60) / 100)))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
				Snd_Play("DRG_HURT_02");
				Snd_Play("DRG_TAUNT_01");
				AI_PlayAni(self,"T_WARN");
				B_MagicHurtNpc(self,hero,100);
				Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_11");
				Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_11");
				DRG_60 = TRUE;
			};
			if((DRG_40 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 40) / 100)))
			{
				AI_PlayAni(self,"T_WARN");
				DRG_REGEN = 4;
				Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_11");
				Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_11");
				DRG_40 = TRUE;
			};
			if((DRG_20 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 15) / 100)))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
				Snd_Play("DRG_TAUNT_02");
				DRG_REGEN = 1;
				Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",self,hero,1,150,DAM_MAGIC,TRUE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				DRG_20 = TRUE;
			};
		};
		if(self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)
		{
			if((Npc_GetDistToNpc(self,hero) < 800) && (Npc_GetDistToNpc(self,hero) > 450))
			{
				DRG_RD = Hlp_Random(17);
				if((DRG_RD == 5) || (DRG_RD == 11))
				{
					AI_TurnToNPC(self,hero);
					AI_PlayAni(self,"T_WARN");
					if((DRG_RD == 5) && (DRG_TIMER == 0))
					{
						Snd_Play("DRG_WARN_01");
						AI_Wait(self,1);
						Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
						AI_PlayAni(hero,"T_FALLB_2_FALLENB");
						DRG_TIMER = 3;
						AI_Wait(hero,1);
					};
				};
			};
			if((DRG_80 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 80) / 100)))
			{
				DRG_REGEN = 3;
				AI_PlayAni(self,"T_WARN");
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(FireWaran,"CASTLE_36");
				Wld_InsertNpc(FireWaran,"CASTLE_36");
				DRG_80 = TRUE;
			};
			if((DRG_60 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 60) / 100)))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
				Snd_Play("DRG_HURT_02");
				Snd_Play("DRG_TAUNT_01");
				AI_PlayAni(self,"T_WARN");
				Wld_PlayEffect("SPELLFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(FireGolem,"CASTLE_36");
				Wld_InsertNpc(FireGolem,"CASTLE_36");
				DRG_60 = TRUE;
			};
			if((DRG_40 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 40) / 100)))
			{
				AI_PlayAni(self,"T_WARN");
				DRG_REGEN = 4;
				Wld_PlayEffect("SPELLFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(FireGolem,"CASTLE_36");
				DRG_40 = TRUE;
				DRG_TIMER_3 = 20;
				DRG_25 = TRUE;
			};
			if((DRG_25 == TRUE) && (DRG_TIMER_3 == 0) && (DRG_20 == FALSE))
			{
				FireDragon.flags = 0;
			};
			if((DRG_20 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 15) / 100)))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
				Snd_Play("DRG_FIRERAIN");
				Snd_Play("DRG_TAUNT_02");
				DRG_REGEN = 1;
				Wld_PlayEffect("SPELLFX_FIRERAIN",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FIRERAIN",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FIRERAIN",self,hero,1,150,DAM_MAGIC,TRUE);
				Wld_PlayEffect("SPELLFX_INCOVATION_RED",self,hero,1,20,DAM_FIRE,TRUE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				DRG_20 = TRUE;
			};
		};
		if(self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
		{
			if((Npc_GetDistToNpc(self,hero) < 800) && (Npc_GetDistToNpc(self,hero) > 450))
			{
				DRG_RD = Hlp_Random(17);
				if((DRG_RD == 5) || (DRG_RD == 11))
				{
					AI_TurnToNPC(self,hero);
					AI_PlayAni(self,"T_WARN");
					if((DRG_RD == 5) && (DRG_TIMER == 0))
					{
						Snd_Play("DRG_WARN_01");
						AI_Wait(self,1);
						Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
						AI_PlayAni(hero,"T_FALLB_2_FALLENB");
						DRG_TIMER = 3;
						AI_Wait(hero,1);
					};
				};
			};
			if((DRG_80 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 80) / 100)))
			{
				DRG_REGEN = 5;
				AI_PlayAni(self,"T_WARN");
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(draconian2,"OW_ICEDRAGON_01");
				Wld_InsertNpc(draconian2,"OW_ICEDRAGON_01");
				self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 8000;
				DRG_80 = TRUE;
			};
			if((DRG_60 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 60) / 100)))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
				Snd_Play("DRG_HURT_02");
				Snd_Play("DRG_TAUNT_01");
				AI_PlayAni(self,"T_WARN");
				Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
				B_MagicHurtNpc(self,hero,100);
				Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(IceGolem,"OW_ICEDRAGON_01");
				Wld_InsertNpc(IceGolem,"OW_ICEDRAGON_01");
				DRG_60 = TRUE;
			};
			if((DRG_40 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 40) / 100)))
			{
				Snd_Play("DRG_FIRERAIN");
				AI_PlayAni(self,"T_WARN");
				DRG_REGEN = 5;
				Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(IceGolem,"OW_ICEDRAGON_01");
				DRG_40 = TRUE;
				DRG_TIMER_3 = 20;
				DRG_25 = TRUE;
			};
			if((DRG_25 == TRUE) && (DRG_TIMER_3 == 0) && (DRG_20 == FALSE))
			{
				IceDragon.flags = 0;
			};
			if((DRG_20 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 15) / 100)))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
				Snd_Play("DRG_TAUNT_02");
				DRG_REGEN = 1;
				Wld_PlayEffect("SPELLFX_THUNDERSTORM",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_THUNDERSTORM",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_THUNDERSTORM",self,hero,1,150,DAM_MAGIC,TRUE);
				Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",self,hero,1,20,DAM_MAGIC,TRUE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(draconian2,"OW_ICEDRAGON_01");
				Wld_InsertNpc(draconian2,"OW_ICEDRAGON_01");
				DRG_20 = TRUE;
			};
		};
		if(self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
		{
			if((Npc_GetDistToNpc(self,hero) < 800) && (Npc_GetDistToNpc(self,hero) > 450))
			{
				DRG_RD = Hlp_Random(17);
				if((DRG_RD == 5) || (DRG_RD == 11))
				{
					AI_TurnToNPC(self,hero);
					AI_PlayAni(self,"T_WARN");
					if((DRG_RD == 5) && (DRG_TIMER == 0))
					{
						Snd_Play("DRG_WARN_01");
						AI_Wait(self,1);
						Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
						AI_PlayAni(hero,"T_FALLB_2_FALLENB");
						DRG_TIMER = 3;
						AI_Wait(hero,1);
					};
				};
			};
			if((DRG_80 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 80) / 100)))
			{
				DRG_REGEN = 5;
				AI_PlayAni(self,"T_WARN");
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_VIOLET",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(Skeleton,"DI_UNDEADDRAGON");
				Wld_InsertNpc(Skeleton,"DI_UNDEADDRAGON");
				Wld_InsertNpc(lesser_skeleton2,"DI_UNDEADDRAGON");
				DRG_80 = TRUE;
			};
			if((DRG_60 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 60) / 100)))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
				Snd_Play("DRG_HURT_02");
				Snd_Play("DRG_TAUNT_01");
				AI_PlayAni(self,"T_WARN");
				Wld_PlayEffect("SPELLFX_INCOVATION_VIOLET",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(skeleton_lord2,"DI_UNDEADDRAGON");
				Wld_InsertNpc(skeleton_lord2,"DI_UNDEADDRAGON");
				DRG_60 = TRUE;
			};
			if((DRG_40 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 40) / 100)))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
				Snd_Play("DRG_FIRERAIN");
				AI_PlayAni(self,"T_WARN");
				DRG_REGEN = 5;
				Wld_PlayEffect("SPELLFX_INCOVATION_VIOLET",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_InsertNpc(Demon,"DI_UNDEADDRAGON");
				Wld_InsertNpc(Demon,"DI_UNDEADDRAGON");
				Wld_InsertNpc(skeleton_lord2,"DI_UNDEADDRAGON");
				DRG_40 = TRUE;
				DRG_TIMER_3 = 20;
				DRG_25 = TRUE;
			};
			if((DRG_25 == TRUE) && (DRG_TIMER_3 == 0) && (DRG_20 == FALSE))
			{
				IceDragon.flags = 0;
			};
			if((DRG_20 == FALSE) && (self.attribute[ATR_HITPOINTS] <= ((self.attribute[ATR_HITPOINTS_MAX] * 15) / 100)))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
				Snd_Play("DRG_TAUNT_02");
				DRG_REGEN = 1;
				Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",self,hero,1,150,DAM_MAGIC,TRUE);
				Wld_PlayEffect("SPELLFX_INCOVATION_VIOLET",self,hero,1,20,DAM_MAGIC,TRUE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				AI_PlayAni(hero,"T_FALLB_2_FALLENB");
				AI_Wait(hero,1);
				Wld_InsertNpc(DemonLord,"DI_UNDEADDRAGON");
				Wld_InsertNpc(DemonLord,"DI_UNDEADDRAGON");
				DRG_20 = TRUE;
			};
		};
		self.aivar[AIV_TAPOSITION] += 1;
		if((self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]) && (self.aivar[AIV_TAPOSITION] >= 2))
		{
			self.attribute[ATR_HITPOINTS] += 1;
			self.aivar[AIV_TAPOSITION] = 0;
		};
	};
	if((RavenIsDead == TRUE) && (self.guild == GIL_Stoneguardian))
	{
		B_KillNpc(self);
	};
	if(CurrentLevel == OldWorld_Zen)
	{
		if(Npc_GetDistToWP(self,"OC_RAMP_07") <= 500)
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_PlayAni(self,"T_WARN");
			self.aivar[AIV_PursuitEnd] = TRUE;
			return LOOP_END;
		};
	};
	if(Npc_GetDistToNpc(self,other) > FIGHT_DIST_CANCEL)
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_END;
	};
	if((Npc_GetStateTime(self) > self.aivar[AIV_MM_FollowTime]) && (self.aivar[AIV_PursuitEnd] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
		self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		AI_PlayAni(self,"T_WARN");
	};
	if(self.aivar[AIV_PursuitEnd] == TRUE)
	{
		if(Npc_GetDistToNpc(self,other) > self.senses_range)
		{
			return LOOP_END;
		};
		if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
		{
			if((Npc_GetDistToNpc(self,other) < self.aivar[AIV_Dist]) || (!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP)))
			{
				self.aivar[AIV_PursuitEnd] = FALSE;
				Npc_SetStateTime(self,0);
				self.aivar[AIV_StateTime] = 0;
			}
			else
			{
				AI_TurnToNPC(self,other);
				self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
				self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
			};
		};
		return LOOP_CONTINUE;
	};
	if((C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE)) && (self.aivar[AIV_MM_FollowInWater] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	if(self.aivar[AIV_WaitBeforeAttack] == 1)
	{
		AI_Wait(self,0.8);
		self.aivar[AIV_WaitBeforeAttack] = 0;
	};
	if(self.level == 0)
	{
		if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
		{
			self.aivar[AIV_SummonTime] = self.aivar[AIV_SummonTime] + 1;
			self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		};
		if(self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME)
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP) && (Npc_GetStateTime(self) > 0))
	{
		Npc_SetStateTime(self,0);
		self.aivar[AIV_StateTime] = 0;
	};
	if(self.aivar[AIV_MaxDistToWp] > 0)
	{
		if((Npc_GetDistToWP(self,self.wp) > self.aivar[AIV_MaxDistToWp]) && (Npc_GetDistToWP(other,self.wp) > self.aivar[AIV_MaxDistToWp]))
		{
			self.fight_tactic = FAI_NAILED;
		}
		else
		{
			self.fight_tactic = self.aivar[AIV_OriginalFightTactic];
		};
	};
	if(C_NpcIsMonsterMage(self) || (self.guild == GIL_SKELETON) || (self.guild == GIL_SUMMONED_SKELETON) || (self.guild > GIL_SEPERATOR_ORC))
	{
		B_CreateAmmo(self);
		Npc_ChangeAttribute(self,ATR_MANA,ATR_MANA_MAX);
		B_SelectWeapon(self,other);
	};
	if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
	{
		if(other.aivar[AIV_INVINCIBLE] == FALSE)
		{
			AI_Attack(self);
		}
		else
		{
			Npc_ClearAIQueue(self);
		};
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
		return LOOP_CONTINUE;
	}
	else
	{
		if((self.aivar[AIV_MM_PRIORITY] == PRIO_EAT) && C_WantToEat(self,other))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other) && ((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) || Npc_IsPlayer(other)) && (other.aivar[AIV_INVINCIBLE] == FALSE))
		{
			self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
			return LOOP_CONTINUE;
		}
		else
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
	};
	return FALSE;
};

func void ZS_MM_Attack_End()
{
	other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	if(C_NpcIsMonsterMage(self) || (self.guild == GIL_SKELETON) || (self.guild == GIL_SUMMONED_SKELETON) || (self.guild > GIL_SEPERATOR_ORC))
	{
		AI_RemoveWeapon(self);
	};
	if(Npc_IsDead(other) && C_WantToEat(self,other))
	{
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_EatBody,0,"");
		return;
	};
};

