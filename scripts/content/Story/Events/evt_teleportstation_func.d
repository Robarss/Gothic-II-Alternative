
func void evt_teleportstation_func()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	SCUsed_TELEPORTER = TRUE;
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_CITY") < 3000)
		{
			AI_Teleport(hero,"NW_TELEPORTSTATION_TAVERNE");
			if(SCUsed_NW_TELEPORTSTATION_CITY == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsNW,"Teleporta�n� k�men v jeskyni v�chodn� od m�sta vede k 'Mrtv� harpyji'.");
			};
			SCUsed_NW_TELEPORTSTATION_CITY = TRUE;
		}
		else if(Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_TAVERNE") < 3000)
		{
			AI_Teleport(hero,"NW_TELEPORTSTATION_MAYA");
			if(SCUsed_NW_TELEPORTSTATION_TAVERNE == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsNW,"Teleporta�n� k�men u 'Mrtv� harpyje' vede k port�lu v s�ni stavitel�.");
			};
			SCUsed_NW_TELEPORTSTATION_TAVERNE = TRUE;
		}
		else if(Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_MAYA") < 3000)
		{
			AI_Teleport(hero,"NW_TELEPORTSTATION_CITY");
			if(SCUsed_NW_TELEPORTSTATION_MAYA == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsNW,"Teleporta�n� k�men v s�ni stavitel� vede do jeskyn� v�chodn� do m�sta.");
			};
			SCUsed_NW_TELEPORTSTATION_MAYA = TRUE;
		}
		else
		{
			AI_Teleport(hero,"MARKT");
		};
		if((SCUsed_NW_TELEPORTSTATION_MAYA == TRUE) && (SCUsed_NW_TELEPORTSTATION_TAVERNE == TRUE) && (SCUsed_NW_TELEPORTSTATION_CITY == TRUE) && (SCUsed_AllNWTeleporststones == FALSE))
		{
			SCUsed_AllNWTeleporststones = TRUE;
			B_GivePlayerXP(XP_Addon_AllNWTeleporststones);
		};
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_NORTH_WP"))
		{
			AI_Teleport(hero,"ADW_PORTALTEMPEL_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_PORTALTEMPEL == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"Aktivoval jsem teleporta�n� k�men bl�zko port�lu, co vede k Khorinisu.");
				B_GivePlayerXP(XP_Ambient);
			};
			SCUsed_ADW_TELEPORTSTATION_PORTALTEMPEL = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_EAST_WP"))
		{
			AI_Teleport(hero,"ADW_ADANOSTEMPEL_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_ADANOSTEMPEL == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"Dok�zal jsem aktivovat teleporta�n� k�men v t�bo�e bandit�.");
				B_GivePlayerXP(XP_Ambient);
			};
			SCUsed_ADW_TELEPORTSTATION_ADANOSTEMPEL = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_SOUTHEAST_WP"))
		{
			AI_Teleport(hero,"ADW_SOUTHEAST_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_SOUTHEAST == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"Aktivoval jsem teleporta�n� k�men jihov�chodn� od t�bora bandit� v ba�in�ch.");
				B_GivePlayerXP(XP_Ambient);
			};
			SCUsed_ADW_TELEPORTSTATION_SOUTHEAST = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_SOUTHWEST_WP"))
		{
			AI_Teleport(hero,"ADW_SOUTHWEST_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_SOUTHWEST == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"Na�el jsem teleporta�n� k�men jihoz�padn� odtud.");
				B_GivePlayerXP(XP_Ambient);
			};
			SCUsed_ADW_TELEPORTSTATION_SOUTHWEST = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_WEST_WP"))
		{
			AI_Teleport(hero,"ADW_PIRATES_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_PIRATES == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"Aktivoval jsem teleporta�n� k�men v ka�onu.");
				B_GivePlayerXP(XP_Ambient);
			};
			if((MIS_KrokoJagd == LOG_SUCCESS) && (SCUsed_ADW_TELEPORTSTATION_PIRATES_JACKSMONSTER == FALSE))
			{
				Wld_InsertNpc(Gobbo_Black,"ADW_PIRATECAMP_WATERHOLE_GOBBO");
				Wld_InsertNpc(Gobbo_Black,"ADW_PIRATECAMP_WATERHOLE_GOBBO");
				Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_PATH_TO_MINE1_05");
				Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_PATH_TO_MINE1_05");
				Wld_InsertNpc(Blattcrawler,"ADW_CANYON_TELEPORT_PATH_07");
				Wld_InsertNpc(Blattcrawler,"ADW_CANYON_TELEPORT_PATH_07");
				SCUsed_ADW_TELEPORTSTATION_PIRATES_JACKSMONSTER = TRUE;
			};
			SCUsed_ADW_TELEPORTSTATION_PIRATES = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ADANOSTEMPEL_RAVENTELEPORT_OUT"))
		{
			AI_Teleport(hero,"ADW_ADANOSTEMPEL_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_RAVENTELEPORT_OUT == FALSE)
			{
			};
			SCUsed_ADW_TELEPORTSTATION_RAVENTELEPORT_OUT = TRUE;
		}
		else
		{
			AI_Teleport(hero,"ADW_ENTRANCE");
		};
	};
};


var int TriggeredTeleporterADW;
var int ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime;

func void adw_portaltempel_focus_func()
{
	Npc_RemoveInvItems(hero,ItMi_Focus,1);
	TriggeredTeleporterADW = TriggeredTeleporterADW + 1;
	Snd_Play("MFX_TELEKINESIS_STARTINVEST");
	if(TriggeredTeleporterADW >= 5)
	{
		SC_ADW_ActivatedAllTelePortStones = TRUE;
	};
	if((ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime == FALSE) && (Npc_GetDistToWP(hero,"ADW_PORTALTEMPEL_TELEPORTSTATION") < 3000))
	{
		if((Npc_IsDead(Stoneguardian_NailedPortalADW1) == FALSE) && (Stoneguardian_NailedPortalADW1.aivar[AIV_EnemyOverride] == TRUE))
		{
			Snd_Play("THRILLJINGLE_02");
		};
		b_awake_stoneguardian(Stoneguardian_NailedPortalADW1);
		ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime = TRUE;
	};
};

