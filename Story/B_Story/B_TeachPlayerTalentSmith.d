
func int B_TeachPlayerTalentSmith(var C_Npc slf,var C_Npc oth,var int waffe)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_SMITH,waffe);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry(TOPIC_TalentSmith,"K vykování takové zbraně potřebuji hlavně kousek surové oceli. Tu pak doruda rozžhavím v kovářské výhni a pak ji budu kout na kovadlině. U určitých zbraní je také často zapotřebí použít jisté substance, které jim pak propůjčí jedinečné vlastnosti.");
	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"K vytvoření obyčejného meče potřebuji 2x Rozžhavenou ocel.");
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Přidám-li 5x hrudku rudy, mohu vykovat DLOUHÝ MEČ Z RUDY.");
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Přidám-li 2x Rozžhavenou ocel, 10 hrudky rudy, mohu vykovat OBOURUČNÍ MEČ Z RUDY.");
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Přidám-li 4x Rozžhavenou ocel 15 hrudky rudy, mohu vykovat MEČ BASTARD Z RUDY.");
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Přidám-li 4x Rozžhavenou ocel, 20 hrudky rudy, mohu vykovat TĚŽKÝ OBOURUČNÍ MEČ Z RUDY.");
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Přidám-li 4x Rozžhavenou ocel, 25 hrudky rudy, mohu vykovat VÁLEČNÝ BŘIT Z RUDY.");
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Přidám-li 5x Rozžhavenou ocel, 30 hrudky rudy, mohu vykovat TĚŽKÝ VÁLEČNÝ BŘIT Z RUDY.");
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Přidám-li 5x Rozžhavenou ocel, 35 hrudky rudy a 5 kapek dračí krve, mohu vykovat DRAKOBIJCE Z RUDY.");
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Přidám-li 10x Rozžhavenou ocel, 40 hrudky rudy a 5 kapek dračí krve, mohu vykovat VELKÉHO DRAKOBIJCE Z RUDY.");
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Nyní můžu kovat kvalitní meč, potřebuji 3x Rozžhavenou ocel.");
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Nyní můžu kovat kvalitní dlouhý meč, potřebuji 3x Rozžhavenou ocel.");
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Nyní můžu kovat rubínovou čepel, potřebuji 4x Rozžhavenou ocel.");
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Harad mě naučil kovat 'El Bastardo', potřebuji 4x Rozžhavenou ocel.");
	};
	PrintScreen(PRINT_LearnSmith,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	return TRUE;
};

