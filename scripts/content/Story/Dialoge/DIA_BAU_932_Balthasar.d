
instance DIA_Balthasar_EXIT(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 999;
	condition = DIA_Balthasar_EXIT_Condition;
	information = DIA_Balthasar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Balthasar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Balthasar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Balthasar_HALLO(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 3;
	condition = DIA_Balthasar_HALLO_Condition;
	information = DIA_Balthasar_HALLO_Info;
	description = "Jak se vede?";
};


func int DIA_Balthasar_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Balthasar_HALLO_Info()
{
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_01");	//Ach, nov? tv?? na farm?. ?e by mi nakonec ta star? dr?gre?le p?ece jen sehnala u?edn?ka?
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_02");	//Nejsem ??dn? u?edn?k.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_03");	//?, to vid?m. Nejsem u? tak mlad? jako d??v, v?ak v??. A u? l?ta ?ek?m na n?koho, kdo by to po mn? p?evzal.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_04");	//Ty tu asi nejse? kv?li tomu, ?e jsou na?i sousedi na?tvan?, co?
};


instance DIA_Balthasar_WASMACHSTDU(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 4;
	condition = DIA_Balthasar_WASMACHSTDU_Condition;
	information = DIA_Balthasar_WASMACHSTDU_Info;
	description = "Co je tvoje pr?ce?";
};


func int DIA_Balthasar_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Balthasar_WASMACHSTDU_15_00");	//Co je tvoje pr?ce?
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_01");	//?, hl?d?m ovce a d?l?m to tak dlouho, co si jen pamatuju.
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_02");	//Ta zv??ata jsou velmi oddan? a chytr?, v?ak v??. Kdy? se o n? dob?e star??, budou t? poslouchat a? do konce ?ivota.
};


instance DIA_Addon_Balthasar_Rangerbandits(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 5;
	condition = DIA_Addon_Balthasar_Rangerbandits_Condition;
	information = DIA_Addon_Balthasar_Rangerbandits_Info;
	description = "Nevid?ls kolem proj??d?t n?jak? bandity?";
};


func int DIA_Addon_Balthasar_Rangerbandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_HALLO) && ((MIS_Vatras_FindTheBanditTrader == LOG_Running) || (SC_KnowsLuciaCaughtByBandits == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Balthasar_Rangerbandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Balthasar_Rangerbandits_15_00");	//Nevid?ls kolem proj??d?t n?jak? bandity?
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_01");	//Najisto. Jeli kolem Sekobovy farmy n?kam na sever do les?.
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_02");	//Vezli mnoho a mnoho zbran?. Vypadali jako by cht?li vyhr?t sk?et? v?lku sami!
	};
	if(SC_KnowsLuciaCaughtByBandits == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_03");	//A jestli m? o?i nezklamaly, ti bastardi s sebou vlekli je?t? n?jakou mladou ?enu.
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_04");	//Douf?m, ?e j? neubl??ili.
	};
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_05");	//Jsem r?d, ?e na?i farmu nechali napokoji.
};


instance DIA_Balthasar_AERGERMITNACHBARN(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 5;
	condition = DIA_Balthasar_AERGERMITNACHBARN_Condition;
	information = DIA_Balthasar_AERGERMITNACHBARN_Info;
	description = "Co m?? za probl?my se sousedy?";
};


func int DIA_Balthasar_AERGERMITNACHBARN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_WASMACHSTDU) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_MIL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(BalthasarSheep1) == FALSE) || (Npc_IsDead(BalthasarSheep2) == FALSE) || (Npc_IsDead(BalthasarSheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_AERGERMITNACHBARN_Info()
{
	AI_Output(other,self,"DIA_Balthasar_AERGERMITNACHBARN_15_00");	//Co m?? za probl?my se sousedy?
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_01");	//Tr?va na t?hle stran? l?nu je v?dycky zakrsl? a such?. Tak v?t?inou chod?m na pastviny jin?ch farm???.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_02");	//Velkostatk??i to nevad?, ale Bengar, farm?? z n?horn?ch pastvin, d?l? hroznej virv?l, kdy? tam vezmu na?e zv??ata.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_03");	//??k?, ?e by mu m?l Sekob platit za to, ?e beru ovce na Bengarovy pastviny.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_04");	//Ale Sekob na to nechce d?t ani zl?manou gre?li, tak?e u? d?l nem??u nahoru chodit.
};


instance DIA_Balthasar_WOBENGAR(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 10;
	condition = DIA_Balthasar_WOBENGAR_Condition;
	information = DIA_Balthasar_WOBENGAR_Info;
	description = "Kde bych na?el horn? pastviny a Bengarovu farmu?";
};


func int DIA_Balthasar_WOBENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_AERGERMITNACHBARN) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_MIL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_WOBENGAR_Info()
{
	AI_Output(other,self,"DIA_Balthasar_WOBENGAR_15_00");	//Kde bych na?el horn? pastviny a Bengarovu farmu?
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_01");	//Jdi po t?hle cest?, a? naraz?? na k?i?ovatku.
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_02");	//Kdy? se d?? napravo, uvid?? hromadu balvan?. Napravo za nimi jsou n?horn? pastviny a pr?smyk.
};


instance DIA_Balthasar_TALKTOBENGAR(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 6;
	condition = DIA_Balthasar_TALKTOBENGAR_Condition;
	information = DIA_Balthasar_TALKTOBENGAR_Info;
	description = "Mo?n? bych si m?l promluvit s Bengarem.";
};


func int DIA_Balthasar_TALKTOBENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_AERGERMITNACHBARN) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_MIL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(BalthasarSheep1) == FALSE) || (Npc_IsDead(BalthasarSheep2) == FALSE) || (Npc_IsDead(BalthasarSheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_TALKTOBENGAR_Info()
{
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_00");	//Mo?n? bych si m?l promluvit s Bengarem.
	AI_Output(self,other,"DIA_Balthasar_TALKTOBENGAR_05_01");	//Ty bys to pro m? ud?lal? Co mu ?ekne?? Toti?, necht?l bych ??dn? probl?my, rozum???
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_02");	//Uvid?me.
	Log_CreateTopic(TOPIC_BalthasarsSchafe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BalthasarsSchafe,LOG_Running);
	B_LogEntry(TOPIC_BalthasarsSchafe,"Sedl?k Bengar zak?zal ov??ku Balthazarovi, aby sv? ovce vedl nahoru na pastviny.");
	MIS_Balthasar_BengarsWeide = LOG_Running;
};


instance DIA_Balthasar_BENGARUEBERREDET(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 8;
	condition = DIA_Balthasar_BENGARUEBERREDET_Condition;
	information = DIA_Balthasar_BENGARUEBERREDET_Info;
	description = "U? zase m??e? svoje ovce br?t na Bengarovy pastviny.";
};


func int DIA_Balthasar_BENGARUEBERREDET_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_TALKTOBENGAR) && (MIS_Balthasar_BengarsWeide == LOG_SUCCESS) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_MIL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(BalthasarSheep1) == FALSE) || (Npc_IsDead(BalthasarSheep2) == FALSE) || (Npc_IsDead(BalthasarSheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_BENGARUEBERREDET_Info()
{
	AI_Output(other,self,"DIA_Balthasar_BENGARUEBERREDET_15_00");	//U? zase m??e? svoje ovce br?t na Bengarovy pastviny. Pr?v? jsem s n?m mluvil.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_01");	//D?ky. Hned vyraz?m na cestu.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_02");	//Tady, vezmi si na d?kaz m? vd??nosti tuhle ov?? k??i.
	B_GiveInvItems(self,other,ItAt_SheepFur,10);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BengarsWeide");
	B_GivePlayerXP(XP_Balthasar_BengarsWeide);
	Wld_InsertNpc(Sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(Sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(Hammel,"NW_BIGMILL_FARM3_BALTHASAR");
	BalthasarSheep1 = Hlp_GetNpc(Balthasar_Sheep1);
	if(Hlp_IsValidNpc(BalthasarSheep1) && !Npc_IsDead(BalthasarSheep1))
	{
		AI_StartState(BalthasarSheep1,ZS_MM_Rtn_Follow_Sheep_Balthasar,1,"");
	};
	BalthasarSheep2 = Hlp_GetNpc(Balthasar_Sheep2);
	if(Hlp_IsValidNpc(BalthasarSheep2) && !Npc_IsDead(BalthasarSheep2))
	{
		AI_StartState(BalthasarSheep2,ZS_MM_Rtn_Follow_Sheep_Balthasar,1,"");
	};
	BalthasarSheep3 = Hlp_GetNpc(Balthasar_Sheep3);
	if(Hlp_IsValidNpc(BalthasarSheep3) && !Npc_IsDead(BalthasarSheep3))
	{
		AI_StartState(BalthasarSheep3,ZS_MM_Rtn_Follow_Sheep_Balthasar,1,"");
	};
};


instance DIA_Balthasar_PERMKAP1(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 70;
	condition = DIA_Balthasar_PERMKAP1_Condition;
	information = DIA_Balthasar_PERMKAP1_Info;
	permanent = TRUE;
	description = "A co jinak. V?echno v po??dku?";
};


func int DIA_Balthasar_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Balthasar_PERMKAP1_15_00");	//A co jinak. V?echno v po??dku?
	Npc_PerceiveAll(self);
	if((Wld_DetectNpc(self,Balthasar_Sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,Balthasar_Sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,Balthasar_Sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,Hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)))
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_01");	//Nem??u si st??ovat. D?ky za opt?n?.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_02");	//Jsou to te? t??k? ?asy. Nem??u naj?t sv? ovce!
		if(Npc_IsDead(Sekob) == FALSE)
		{
			AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_03");	//H?d?m, ?e bych o tom m?l ??ct Sekobovi.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_Balthasar_PICKPOCKET(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 900;
	condition = DIA_Balthasar_PICKPOCKET_Condition;
	information = DIA_Balthasar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Balthasar_PICKPOCKET_Condition()
{
	return C_Beklauen(10,10);
};

func void DIA_Balthasar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
	Info_AddChoice(DIA_Balthasar_PICKPOCKET,Dialog_Back,DIA_Balthasar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Balthasar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Balthasar_PICKPOCKET_DoIt);
};

func void DIA_Balthasar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
};

func void DIA_Balthasar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
};

