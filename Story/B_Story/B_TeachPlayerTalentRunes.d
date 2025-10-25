
func int B_TeachPlayerTalentRunes(var C_Npc slf,var C_Npc oth,var int spell)
{
	var int kosten;
	var C_Npc ScrollTrader;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_RUNES,spell);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
	B_LogEntry(TOPIC_TalentRunes,"K vytvoření runy potřebuji svitek s daným kouzlem a potřebné ingredience. S jejich pomocí pak mohu podle runové tabulky na čistém runovém kameni zvolenou runu vytvořit.");
	if(Npc_IsDead(Gorax) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Gorax);
	}
	else if(Npc_IsDead(Isgaroth) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Isgaroth);
	}
	else if(Npc_IsDead(Engor) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Engor);
	}
	else if(Npc_IsDead(Orlan) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Orlan);
	}
	else if(Npc_IsDead(Cronos_ADW) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Cronos_ADW);
	};
	if(spell == SPL_PalLight)
	{
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
	};
	if(spell == SPL_PalLightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalLightHeal] = TRUE;
	};
	if(spell == SPL_PalHolyBolt)
	{
		PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = TRUE;
	};
	if(spell == SPL_PalMediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = TRUE;
	};
	if(spell == SPL_PalRepelEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = TRUE;
	};
	if(spell == SPL_PalFullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalFullHeal] = TRUE;
	};
	if(spell == SPL_PalDestroyEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] = TRUE;
	};
	if(spell == SPL_PalTeleportSecret)
	{
		PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = TRUE;
	};
	if(spell == SPL_TeleportSeaport)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportSeaport] = TRUE;
	};
	if(spell == SPL_TeleportMonastery)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportMonastery] = TRUE;
	};
	if(spell == SPL_TeleportFarm)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportFarm] = TRUE;
	};
	if(spell == SPL_TeleportXardas)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportXardas] = TRUE;
	};
	if(spell == SPL_TeleportPassNW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassNW] = TRUE;
	};
	if(spell == SPL_TeleportPassOW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassOW] = TRUE;
	};
	if(spell == SPL_TeleportOC)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportOC] = TRUE;
	};
	if(spell == SPL_Light)
	{
		PLAYER_TALENT_RUNES[SPL_Light] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Light,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy SVĚTLO: 1 zlatá mince.");
	};
	if(spell == SPL_Firebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Firebolt,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy OHNIVÝ ŠÍP: 1 síra.");
	};
	if(spell == SPL_Icebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Icebolt,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy LEDOVÝ ŠÍP: 1 ledový křemen.");
	};
	if(spell == SPL_LightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_LightHeal,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy LÉČBA LEHKÝCH ZRANĚNÍ: 1 léčivá rostlina.");
	};
	if(spell == SPL_SummonGoblinSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumGobSkel,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy VYVOLÁNÍ GOBLINÍHO KOSTLIVCE: 1 kost z goblina.");
	};
	if(spell == SPL_InstantFireball)
	{
		PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_InstantFireball,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy OHNIVÁ KOULE: 1 pryskyřice.");
	};
	if(spell == SPL_Zap)
	{
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Zap,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy MALÝ BLESK: 1 kamenný krystal.");
	};
	if(spell == SPL_SummonWolf)
	{
		PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumWolf,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy VYVOLÁNÍ VLKA: 1 vlčí kůže.");
	};
	if(spell == SPL_WindFist)
	{
		PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Windfist,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy VĚTRNÁ PĚST: 1 uhlík.");
	};
	if(spell == SPL_Sleep)
	{
		PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Sleep,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy SPÁNEK: 1 stéblo trávy. Lze použít i alchymistické náčiní.");
	};
	if(spell == SPL_MediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_MediumHeal,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy LÉČBA STŘEDNĚ TĚŽKÝCH ZRANĚNÍ: 1 léčivá bylina.");
	};
	if(spell == SPL_LightningFlash)
	{
		PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_LightningFlash,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy BLESK: 1 kamenný krystal a 1 ledový křemen.");
	};
	if(spell == SPL_ChargeFireball)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_ChargeFireBall,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy VELKÁ OHNIVÁ KOULE: 1 síra a 1 pryskyřice.");
	};
	if(spell == SPL_SummonSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumSkel,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy VYVOLÁNÍ KOSTLIVCE: 1 kost z kostlivce.");
	};
	if(spell == SPL_Fear)
	{
		PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Fear,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy STRACH: 1 černá perla.");
	};
	if(spell == SPL_IceCube)
	{
		PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_IceCube,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy LEDOVÝ BLOK: 1 ledový křemen a 1 akvamarín.");
	};
	if(spell == SPL_ChargeZap)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_ThunderBall,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy KULOVÝ BLESK: 1 síra a 1 kamenný krystal.");
	};
	if(spell == SPL_SummonGolem)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumGol,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy VYVOLÁNÍ KAMENNÉHO GOLEMA: 1 srdce kamenného golema.");
	};
	if(spell == SPL_DestroyUndead)
	{
		PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_HarmUndead,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy NIČENÍ NEMRTVÝCH: 1 svěcená voda.");
	};
	if(spell == SPL_Pyrokinesis)
	{
		PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Pyrokinesis,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy VELKÁ OHNIVÁ BOUŘE: 1 síra a 1 jazyk ohnivého ještěra.");
	};
	if(spell == SPL_Firestorm)
	{
		PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Firestorm,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy MALÁ OHNIVÁ BOUŘE: 1 síra a 1 pryskyřice.");
	};
	if(spell == SPL_IceWave)
	{
		PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_IceWave,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy LEDOVÁ VLNA: 1 ledový křemen a 1 akvamarín.");
	};
	if(spell == SPL_SummonDemon)
	{
		PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumDemon,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy VYVOLÁNÍ DÉMONA: 1 srdce démona.");
	};
	if(spell == SPL_FullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_FullHeal,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy LÉČBA TĚŽKÝCH ZRANĚNÍ: 1 léčivý kořen.");
	};
	if(spell == SPL_Firerain)
	{
		PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Firerain,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy OHNIVÝ DÉŠŤ: 1 pryskyřice a 1 jazyk ohnivého ještěra.");
	};
	if(spell == SPL_BreathOfDeath)
	{
		PLAYER_TALENT_RUNES[SPL_BreathOfDeath] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_BreathOfDeath,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy DECH SMRTI: 1 uhlík a 1 černá perla.");
	};
	if(spell == SPL_MassDeath)
	{
		PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_MassDeath,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy VLNA SMRTI: 1 kost z kostlivce a 1 černá perla.");
	};
	if(spell == SPL_ArmyOfDarkness)
	{
		PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_ArmyOfDarkness,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy ARMÁDA TEMNOT: 1 kost z kostlivce, 1 černá perla, 1 srdce kamenného golema a 1 srdce démona.");
	};
	if(spell == SPL_Shrink)
	{
		PLAYER_TALENT_RUNES[SPL_Shrink] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Shrink,1);
		B_LogEntry(TOPIC_TalentRunes,"Přísady pro vytvoření runy ZMENŠENÍ NESTVŮRY: 1 kost z goblina a 1 trolí tesák.");
	};
	if(spell == SPL_Whirlwind)
	{
		PLAYER_TALENT_RUNES[SPL_Whirlwind] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Whirlwind,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Whirlwind);
	};
	if(spell == SPL_WaterFist)
	{
		PLAYER_TALENT_RUNES[SPL_WaterFist] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Waterfist,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Waterfist);
	};
	if(spell == SPL_IceLance)
	{
		PLAYER_TALENT_RUNES[SPL_IceLance] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Icelance,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Icelance);
	};
	if(spell == SPL_Geyser)
	{
		PLAYER_TALENT_RUNES[SPL_Geyser] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Geyser,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Geyser);
	};
	if(spell == SPL_Thunderstorm)
	{
		PLAYER_TALENT_RUNES[SPL_Thunderstorm] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Thunderstorm,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Thunderstorm);
	};
	PrintScreen(PRINT_LearnRunes,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,1);
	return TRUE;
};

