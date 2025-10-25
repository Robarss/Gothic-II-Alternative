
func int B_SelectSpell(var C_Npc slf,var C_Npc oth)
{
	var int dK_rnd;
	var int dK_Mega;
	var int amortenrage_onetime;
	var int amortdwave_onetime;
	var int amortbolt_onetime;
	if((slf.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(oth) && (oth.guild < GIL_SEPERATOR_HUM))
	{
		if((slf.guild == GIL_KDF) || (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
		{
			if(Npc_HasItems(slf,ItRu_Sleep) == 0)
			{
				CreateInvItems(slf,ItRu_Sleep,1);
			};
			B_ReadySpell(slf,SPL_Sleep,SPL_Cost_Sleep);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if((slf.guild == GIL_DMT) && (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
	{
		if(Npc_HasItems(slf,ItRu_BeliarsRage) == 0)
		{
			CreateInvItems(slf,ItRu_BeliarsRage,1);
		};
		if(Npc_HasItems(slf,ItRu_BreathOfDeath) == 0)
		{
			CreateInvItems(slf,ItRu_BreathOfDeath,1);
		};
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(Npc_HasItems(slf,ItRu_Firerain) == 0)
		{
			CreateInvItems(slf,ItRu_Firerain,1);
		};
		if(Npc_HasItems(slf,ItRu_Thunderstorm) == 0)
		{
			CreateInvItems(slf,ItRu_Thunderstorm,1);
		};
		if(Npc_HasItems(slf,ItRu_LightningFlash) == 0)
		{
			CreateInvItems(slf,ItRu_LightningFlash,1);
		};
		if(Npc_HasItems(slf,ItRu_Firestorm) == 0)
		{
			CreateInvItems(slf,ItRu_Firestorm,1);
		};
		if(Npc_HasItems(slf,ItRu_Skull) == 0)
		{
			CreateInvItems(slf,ItRu_Skull,1);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_1299_OberDementor_DI))
		{
			B_ReadySpell(slf,SPL_Skull,SPL_Cost_Skull);
			return TRUE;
		}
		else
		{
			if(Npc_IsDrawingWeapon(slf))
			{
				return TRUE;
			};
			if(slf.aivar[AIV_SelectSpell] <= 0)
			{
				dK_rnd = Hlp_Random(10);
				slf.aivar[AIV_SelectSpell] += dK_rnd;
			};
			if(slf.aivar[AIV_SelectSpell] < 10)
			{
				if(Kapitel <= 3)
				{
					B_ReadySpell(slf,SPL_Energyball,SPL_COST_Energyball);
					return TRUE;
				}
				else if(Kapitel <= 4)
				{
					B_ReadySpell(slf,SPL_BreathOfDeath,SPL_COST_BreathOfDeath);
					return TRUE;
				}
				else //5/6. kap.
				{
					B_ReadySpell(slf,SPL_BreathOfDeath,SPL_COST_BreathOfDeath);
					return TRUE;
				};
			}
			else if(slf.aivar[AIV_SelectSpell] == 10)
			{
				slf.aivar[AIV_SelectSpell] = 11;
				dK_Mega = Hlp_Random(100);
				if(dK_Mega <= 2)
				{
					B_ReadySpell(slf,SPL_Firerain,SPL_Cost_Firerain);
					return TRUE;
				}
				else if(dK_Mega <= 5)
				{
					B_ReadySpell(slf,SPL_Thunderstorm,SPL_Cost_Thunderstorm);
					return TRUE;
				}
				else if(dK_Mega <= 10)
				{
					B_ReadySpell(slf,SPL_LightningFlash,SPL_Cost_LightningFlash);
					return TRUE;
				}
				else
				{
					B_ReadySpell(slf,SPL_Firestorm,SPL_COST_Firestorm);
					return TRUE;
				};
			}
			else if(slf.aivar[AIV_SelectSpell] == 12)
			{
				slf.aivar[AIV_SelectSpell] = 0;
			};
		};
		return TRUE;
	};
	if((slf.guild == GIL_KDF) || (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
	{
		if(Npc_HasItems(slf,ItRu_Concussionbolt) == 0)
		{
			CreateInvItems(slf,ItRu_Concussionbolt,1);
		};
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(Npc_HasItems(slf,ItRu_FullHeal) == 0)
		{
			CreateInvItems(slf,ItRu_FullHeal,1);
		};
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			B_ReadySpell(slf,SPL_FullHeal,SPL_Cost_FullHeal);
			return TRUE;
		}
		else if(C_NpcHasAttackReasonToKill(self))
		{
			if((self.flags == NPC_FLAG_IMMORTAL) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Raven)))
			{
				B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
			}
			else
			{
				B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			};
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_ConcussionBolt,SPL_COST_Concussionbolt);
			return TRUE;
		};
	};
	if(slf.guild == GIL_PAL)
	{
		if(slf.fight_tactic == FAI_NAILED)
		{
			return FALSE;
		};
		if(Npc_HasItems(slf,ItRu_PalHolyBolt) == 0)
		{
			CreateInvItems(slf,ItRu_PalHolyBolt,1);
		};
		if((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE) && C_NpcIsEvil(oth))
		{
			B_ReadySpell(slf,SPL_PalHolyBolt,SPL_Cost_PalHolyBolt);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.guild == GIL_SKELETON_MAGE)
	{
		if(Npc_HasItems(slf,ItRu_SumSkel) == 0)
		{
			CreateInvItems(slf,ItRu_SumSkel,1);
		};
		if(Npc_HasItems(slf,ItRu_IceCube) == 0)
		{
			CreateInvItems(slf,ItRu_IceCube,1);
		};
		if(Npc_HasItems(slf,ItRu_Icebolt) == 0)
		{
			CreateInvItems(slf,ItRu_Icebolt,1);
		};
		if(slf.aivar[AIV_SelectSpell] >= 6)
		{
			slf.aivar[AIV_SelectSpell] = 1;
		};
		if(!Npc_IsInState(oth,ZS_MagicFreeze) && (slf.aivar[AIV_SelectSpell] == 0))
		{
			B_ReadySpell(slf,SPL_IceCube,SPL_Cost_IceCube);
			return TRUE;
		}
		else if(slf.aivar[AIV_SelectSpell] == 1)
		{
			B_ReadySpell(slf,SPL_SummonSkeleton,SPL_Cost_SummonSkeleton);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_Icebolt,SPL_COST_Icebolt);
			return TRUE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_RAVEN)
	{
		if((Npc_GetDistToNpc(slf,hero) > 150) && (RVN_BOLT == 0))
		{
			AI_PlayAni(slf,"T_GETLOST2");
			Wld_PlayEffect("SPELLFX_LIGHTNINGFLASH",slf,hero,1,150,DAM_MAGIC,TRUE);
			RVN_BOLT = 10;
		};
		if((RVN_START == FALSE) && (slf.attribute[ATR_HITPOINTS] <= ((slf.attribute[ATR_HITPOINTS_MAX] * 95) / 100)))
		{
			RVN_REGEN = 1;
			Wld_PlayEffect("SPELLFX_FEAR_GROUND",slf,slf,0,0,0,FALSE);
			Snd_Play("SFX_INNOSEYE");
			Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_FullHeal);
			Wld_SpawnNpcRange(slf,raven_demon,2,400);
			RVN_START = TRUE;
		};
		if((RVN_75 == FALSE) && (slf.attribute[ATR_HITPOINTS] <= ((slf.attribute[ATR_HITPOINTS_MAX] * 75) / 100)))
		{
			RVN_REGEN = 2;
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",slf,slf,0,0,0,FALSE);
			Snd_Play("SFX_INNOSEYE");
			Wld_PlayEffect("SPELLFX_RAVEN_WINGS",slf,slf,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_RAVEN_WINGS2",slf,slf,0,0,0,FALSE);
			AI_PlayAni(slf,"T_MAGRUN_2_HEASHOOT");
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_FullHeal);
			slf.flags = NPC_FLAG_IMMORTAL;
			slf.bodyStateInterruptableOverride = TRUE;
			Wld_SpawnNpcRange(slf,raven_demonlord_2,1,400);
			RVN_75 = TRUE;
		};
		if((RVN_75 == TRUE) && (RVN_TIMER == 0) && (RVN_55 == FALSE))
		{
			Wld_StopEffect("SPELLFX_FEAR_GROUND");
			Wld_StopEffect("SPELLFX_RAVEN_WINGS");
			Wld_StopEffect("SPELLFX_RAVEN_WINGS2");
			slf.flags = 0;
			slf.bodyStateInterruptableOverride = FALSE;
		};
		if((RVN_55 == FALSE) && (slf.attribute[ATR_HITPOINTS] <= ((slf.attribute[ATR_HITPOINTS_MAX] * 55) / 100)))
		{
			RVN_REGEN = 3;
			Wld_PlayEffect("SPELLFX_RAVEN_WINGS",slf,slf,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_RAVEN_WINGS2",slf,slf,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",slf,slf,0,0,0,FALSE);
			AI_PlayAni(slf,"T_MAGRUN_2_HEASHOOT");
			Wld_PlayEffect("FX_EarthQuake",oth,oth,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_FullHeal);
			slf.flags = NPC_FLAG_IMMORTAL;
			slf.bodyStateInterruptableOverride = TRUE;
			Wld_SpawnNpcRange(slf,raven_guard,2,400);
			RVN_55 = TRUE;
		};
		if((RVN_55 == TRUE) && (RVN_TIMER == 0) && (RVN_40 == FALSE))
		{
			Wld_StopEffect("SPELLFX_FEAR_GROUND");
			Wld_StopEffect("SPELLFX_RAVEN_WINGS");
			Wld_StopEffect("SPELLFX_RAVEN_WINGS2");
			slf.flags = 0;
			slf.bodyStateInterruptableOverride = FALSE;
		};
		if((RVN_40 == FALSE) && (slf.attribute[ATR_HITPOINTS] <= ((slf.attribute[ATR_HITPOINTS_MAX] * 40) / 100)))
		{
			RVN_REGEN = 2;
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",slf,slf,0,0,0,FALSE);
			Snd_Play("SFX_INNOSEYE");
			Wld_PlayEffect("SPELLFX_RAVEN_WINGS",slf,slf,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_RAVEN_WINGS2",slf,slf,0,0,0,FALSE);
			AI_PlayAni(slf,"T_MAGRUN_2_HEASHOOT");
			Wld_PlayEffect("FX_EarthQuake",oth,oth,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_FullHeal);
			slf.flags = NPC_FLAG_IMMORTAL;
			slf.bodyStateInterruptableOverride = TRUE;
			Wld_SpawnNpcRange(slf,raven_demonlord_1,1,400);
			RVN_40 = TRUE;
		};
		if((RVN_40 == TRUE) && (RVN_TIMER == 0) && (RVN_20 == FALSE))
		{
			Wld_StopEffect("SPELLFX_LIGHTSTAR_RED");
			Wld_StopEffect("SPELLFX_RAVEN_WINGS");
			Wld_StopEffect("SPELLFX_RAVEN_WINGS2");
			slf.flags = 0;
			slf.bodyStateInterruptableOverride = FALSE;
		};
		if((RVN_20 == FALSE) && (slf.attribute[ATR_HITPOINTS] <= ((slf.attribute[ATR_HITPOINTS_MAX] * 10) / 100)))
		{
			RVN_REGEN = 1;
			slf.attribute[ATR_STRENGTH] = 300;
			Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",slf,slf,0,0,0,FALSE);
			AI_PlayAni(slf,"T_2HSFINISH");
			Snd_Play("MFX_BARRIERE_SHOOT");
			Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_FullHeal);
			slf.bodyStateInterruptableOverride = TRUE;
			RVN_20 = TRUE;
			RVN_TIMER = 1;
		};
		if((RVN_20 == TRUE) && (RVN_TIMER == 0) && (RVN_END == FALSE))
		{
			Wld_StopEffect("SPELLFX_DRAGON_EXPLOSION_THUNDER");
			Wld_PlayEffect("SPELLFX_EXPLOSION_RAVEN",slf,slf,0,0,0,FALSE);
			Snd_Play("SFX_THUNDER_00");
			Snd_Play("MFX_BARRIERE_SHOOT");
			Wld_PlayEffect("SPELLFX_THUNDERGROUND",oth,oth,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",oth,oth,0,0,0,FALSE);
			if(Npc_GetDistToNpc(slf,hero) < 500)
			{
				B_MagicHurtNpc(slf,hero,500);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_FullHeal);
			};
			slf.bodyStateInterruptableOverride = FALSE;
			RVN_END = TRUE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_UNDEAD_SEEKER)
	{
		B_ClearPerceptions(slf);
		AI_Wait(slf,0.5);
		if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(undead_seeker_heal_1)) && (DRG_SUMMDIED_01 == FALSE))
		{
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_RED_RAVEN",slf,slf,0,0,0,FALSE);
			Snd_Play("SFX_INNOSEYE");
			AI_PlayAni(slf,"T_MAGRUN_2_HEASHOOT");
			AI_Wait(slf,1000);
			DRG_SUMMDIED_01 = TRUE;
		};
		if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(undead_seeker_heal_2)) && (DRG_SUMMDIED_02 == FALSE))
		{
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_RED_RAVEN",slf,slf,0,0,0,FALSE);
			Snd_Play("SFX_INNOSEYE");
			AI_PlayAni(slf,"T_MAGRUN_2_HEASHOOT");
			AI_Wait(slf,1000);
			DRG_SUMMDIED_02 = TRUE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_AMORT)
	{
		if((AMORTBATTLE == FALSE) && (hero.attribute[ATR_HITPOINTS] > 1) && (AMORTBATTLE_ONETIME == FALSE))
		{
			AI_PlayAni(slf,"T_GETLOST2");
			Wld_PlayEffect("SPELLFX_LIGHTNINGFLASH",slf,oth,1,1500,DAM_MAGIC,TRUE);
			AMORTBATTLE_ONETIME = TRUE;
		};
		if((slf.attribute[ATR_HITPOINTS] < 1100) && (amortbolt_onetime == FALSE))
		{
			AI_PlayAni(slf,"T_GETLOST2");
			Wld_PlayEffect("SPELLFX_INSTANTFIREBALL",slf,oth,1,200,DAM_MAGIC,TRUE);
			amortbolt_onetime = TRUE;
			AMORTBATTLE_ONETIME = FALSE;
		};
		if((slf.attribute[ATR_HITPOINTS] < 700) && (amortenrage_onetime == FALSE))
		{
			AI_PlayAni(slf,"T_PRACTICEMAGIC5");
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",slf,slf,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",slf,slf,0,0,0,FALSE);
			Npc_ChangeAttribute(slf,ATR_HITPOINTS,700);
			Wld_SpawnNpcRange(slf,Demon,1,220);
			amortenrage_onetime = TRUE;
			AMORTBATTLE_ONETIME = FALSE;
		};
		if((slf.attribute[ATR_HITPOINTS] < 500) && (amortdwave_onetime == FALSE))
		{
			AI_PlayAni(slf,"T_PRACTICEMAGIC5");
			AI_PlayAni(oth,"T_DEAD");
			AI_Wait(oth,2);
			Npc_ChangeAttribute(slf,ATR_HITPOINTS,200);
			hero.attribute[ATR_HITPOINTS] = 50;
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",slf,slf,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_Fear",oth,oth,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_INCOVATION_RED",slf,slf,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",slf,slf,0,0,0,FALSE);
			amortdwave_onetime = TRUE;
			AMORTBATTLE_ONETIME = FALSE;
		};
	};
	if((slf.guild == GIL_ICEGOLEM) || (slf.aivar[AIV_MM_REAL_ID] == ID_WOODGOLEM))
	{
		if(Npc_HasItems(slf,ItRu_IceCube) == 0)
		{
			CreateInvItems(slf,ItRu_IceCube,1);
		};
		if((slf.aivar[AIV_MM_REAL_ID] == ID_WOODGOLEM) && (Npc_HasItems(slf, ItRu_GreenTentacle) == 0))
        {
        CreateInvItems(slf, ItRu_GreenTentacle, 1);
        };
		if((Npc_GetDistToNpc(slf,oth) < FIGHT_DIST_MELEE) || Npc_IsInState(oth,ZS_MagicFreeze))   
		{
			return FALSE;
		}
		else
		{
        if(slf.aivar[AIV_MM_REAL_ID] == ID_WOODGOLEM)
        {
            B_ReadySpell(slf, SPL_GreenTentacle, SPL_Cost_Greententacle);
        }
        else
        {
            B_ReadySpell(slf, SPL_IceCube, SPL_Cost_IceCube);
        };
		return TRUE;
		};				
	};
	if(slf.guild == GIL_FIREGOLEM)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP)
	{
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK)
	{
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)
	{
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	{
		if(Npc_HasItems(slf,ItRu_Icelance) == 0)
		{
			CreateInvItems(slf,ItRu_Icelance,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell(slf,SPL_Icelance,SPL_COST_Icelance);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		Npc_ClearAIQueue(self);
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	return FALSE;
};

