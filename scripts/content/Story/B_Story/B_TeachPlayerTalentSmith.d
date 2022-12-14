
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
	B_LogEntry(TOPIC_TalentSmith,"K vykov?n? takov? zbran? pot?ebuji hlavn? kousek surov? oceli. Tu pak doruda roz?hav?m v kov??sk? v?hni a pak ji budu kout na kovadlin?. U ur?it?ch zbran? je tak? ?asto zapot?eb? pou??t jist? substance, kter? jim pak prop?j?? jedine?n? vlastnosti.");
	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"K vytvo?en? oby?ejn?ho me?e pot?ebuji 2x Roz?havenou ocel.");
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"P?id?m-li 5x hrudku rudy, mohu vykovat DLOUH? ME? Z RUDY.");
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"P?id?m-li 2x Roz?havenou ocel, 10 hrudky rudy, mohu vykovat OBOURU?N? ME? Z RUDY.");
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"P?id?m-li 4x Roz?havenou ocel 15 hrudky rudy, mohu vykovat ME? BASTARD Z RUDY.");
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"P?id?m-li 4x Roz?havenou ocel, 20 hrudky rudy, mohu vykovat T̎K? OBOURU?N? ME? Z RUDY.");
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"P?id?m-li 4x Roz?havenou ocel, 25 hrudky rudy, mohu vykovat V?LE?N? B?IT Z RUDY.");
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"P?id?m-li 5x Roz?havenou ocel, 30 hrudky rudy, mohu vykovat T̎K? V?LE?N? B?IT Z RUDY.");
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"P?id?m-li 5x Roz?havenou ocel, 35 hrudky rudy a 5 kapek dra?? krve, mohu vykovat DRAKOBIJCE Z RUDY.");
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"P?id?m-li 10x Roz?havenou ocel, 40 hrudky rudy a 5 kapek dra?? krve, mohu vykovat VELK?HO DRAKOBIJCE Z RUDY.");
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Nyn? m??u kovat kvalitn? me?, pot?ebuji 3x Roz?havenou ocel.");
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Nyn? m??u kovat kvalitn? dlouh? me?, pot?ebuji 3x Roz?havenou ocel.");
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Nyn? m??u kovat rub?novou ?epel, pot?ebuji 4x Roz?havenou ocel.");
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Harad m? nau?il kovat 'El Bastardo', pot?ebuji 4x Roz?havenou ocel.");
	};
	PrintScreen(PRINT_LearnSmith,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	return TRUE;
};

