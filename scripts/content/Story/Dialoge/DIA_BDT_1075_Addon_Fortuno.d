
instance DIA_Addon_Fortuno_EXIT(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 999;
	condition = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Fortuno_PICKPOCKET(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 900;
	condition = DIA_Addon_Fortuno_PICKPOCKET_Condition;
	information = DIA_Addon_Fortuno_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Fortuno_PICKPOCKET_Condition()
{
	return C_Beklauen(10,25);
};

func void DIA_Addon_Fortuno_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Fortuno_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Fortuno_PICKPOCKET,Dialog_Back,DIA_Addon_Fortuno_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Fortuno_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Fortuno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fortuno_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Fortuno_PICKPOCKET);
};

func void DIA_Addon_Fortuno_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_PICKPOCKET);
};


instance DIA_Addon_Fortuno_Hi(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 2;
	condition = DIA_Addon_Fortuno_Hi_Condition;
	information = DIA_Addon_Fortuno_Hi_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Fortuno_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Fortuno_Geheilt_01 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Hi_Info()
{
	if(Fortuno_Einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_00");	//(vystra?en?) ?ern? mrak nad domem ... ON p?ich?z? ...
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_01");	//S krv? ... p?ivol?v? ho ... ON m? sleduje ... on m? sleduje ... oh ne, ztra? se, vypadni ...
		AI_Output(other,self,"DIA_Addon_Fortuno_Hi_15_02");	//Jsi v po??dku?
		Fortuno_Einmal = TRUE;
		Log_CreateTopic(Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Fortuno,LOG_Running);
		B_LogEntry(Topic_Addon_Fortuno,"Fortuno je mimo. Pot?ebuje 'Zelen?ho Novice'.");
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_03");	//Zelen? ... zelen? novic ... nem??u ho naj?t ...
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	Info_AddChoice(DIA_Addon_Fortuno_Hi,"Vr?t?m se pozd?ji...(konec)",DIA_Addon_Fortuno_Hi_BACK);
	Info_AddChoice(DIA_Addon_Fortuno_Hi,"M??u ti pomoci?",DIA_Addon_Fortuno_Hi_HILFE);
	if(Npc_HasItems(other,ItMi_Joint) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi,"Tady, vezmi si tohle st?blo.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if(Npc_HasItems(other,ItMi_Addon_Joint_01) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi,"Ok, zkus tohle - 'Zelen? Novic'.",DIA_Addon_Fortuno_Hi_GREEN);
	};
};

func void DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_HILFE_15_00");	//M??u ti pomoci?
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_HILFE_13_01");	//zelen? ... zelen? novic pom?h? novic?m ...
};

func void DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_JOINT_15_00");	//Tady, vezmi si tohle st?blo.
	if(B_GiveInvItems(other,self,ItMi_Joint,1))
	{
		AI_UseItem(self,ItMi_Joint);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_JOINT_13_01");	//Nen? zelen?, nen? siln?, nen? zelen?, nen? siln? ...
};

func void DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_GREEN_15_00");	//Ok, zkus tohle - 'Zelen? Novic'.
	if(B_GiveInvItems(other,self,ItMi_Addon_Joint_01,1))
	{
		AI_UseItem(self,ItMi_Addon_Joint_01);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_01");	//(vyl??en?) AAAHHH ...
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_02");	//Moje my?lenky ... kdo ... jsem ... Fortuno ... co ... co se d?je?
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	B_GivePlayerXP(XP_Addon_Fortuno_01);
	B_LogEntry(Topic_Addon_Fortuno,"'Zelen? Novic' obnovil Fortunovy smysly.");
};


instance DIA_Addon_Fortuno_wer(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 2;
	condition = DIA_Addon_Fortuno_wer_Condition;
	information = DIA_Addon_Fortuno_wer_Info;
	permanent = FALSE;
	description = "Ok, te? mi ?ekni, co s tebou je.";
};


func int DIA_Addon_Fortuno_wer_Condition()
{
	if(Fortuno_Geheilt_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_wer_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_00");	//Ok, te? mi ?ekni, co s tebou je.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_01");	//Jednou jsem byl ?lenem Bratrstva Sp??e. Na cest? zp?t bylo je?t? v?e v po??dku.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_02");	//Jist?, v?ichni jsme byli p?esv?d?en? krimin?ln?ci, ale ?ivot byl pro n?s novice celkem dobr? ...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_03");	//Hej, j? jsem byl tak? v?ze? d?ln? kolonie. ?ekni mi n?co, co je?t? nev?m.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_04");	//J? ... nic si nepamatuju. Temnota zast?ela moji mysl ...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_05");	//No tak. Zkus se soust?edit. Co se stalo? Jak m??e? znovu z?skat v?dom??
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_06");	//Raven ... pamatuju si jenom na Ravena a ... temn? pokoje.
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_07");	//Co je s Ravenem? Co ti ud?lal?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_08");	//(vzdych?) Omlouv?m se. Vypad? to, jako by byla moje mysl uv?zn?na ... S?m tomu nerozum?m ...
};


instance DIA_Addon_Fortuno_FREE(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 5;
	condition = DIA_Addon_Fortuno_FREE_Condition;
	information = DIA_Addon_Fortuno_FREE_Info;
	permanent = FALSE;
	description = "Mus? existovat cesta jak ti vr?tit vzpom?nky.";
};


func int DIA_Addon_Fortuno_FREE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fortuno_wer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_FREE_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_00");	//Mus? existovat cesta jak ti vr?tit vzpom?nky.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_01");	//Hmm ... jo, mo?n? by to ?lo.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_02");	//Guru znali v?echno mo?n? o manipulaci s mysl?.
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_03");	//A TY o tom n?co v???
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_04");	//Ne, boj?m se, ?e tyto znalosti u? jsou pry? ...
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_05");	//Kruci. Jestli je tady cesta jak ti pomoci, najdu ji.
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_LOCH_01");
	B_LogEntry(Topic_Addon_Fortuno,"Fortuno u? je du?evn? v po??dku, st?le si ale nic nepamatuje.");
};


instance DIA_Addon_Fortuno_Herb(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 99;
	condition = DIA_Addon_Fortuno_Herb_Condition;
	information = DIA_Addon_Fortuno_Herb_Info;
	permanent = FALSE;
	description = "Pot?ebuje? dal?? st?bla?";
};


func int DIA_Addon_Fortuno_Herb_Condition()
{
	if(Fortuno_Geheilt_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Herb_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Herb_15_00");	//Pot?ebuje? dal?? st?bla?
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_01");	//No jooo. Vezmu si v?echny, co m??.
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_02");	//Dokonce zaplat?m v?ce ne? Fisk.
};

func void B_Fortuno_InfoManager()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
	Info_AddChoice(DIA_Addon_Fortuno_Trade,Dialog_Back,DIA_Addon_Fortuno_Trade_BACK);
	if(Npc_HasItems(other,ItPl_SwampHerb) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Trade,"(P?edat v?echny st?bla)",DIA_Addon_Fortuno_Trade_all);
		Info_AddChoice(DIA_Addon_Fortuno_Trade,"(P?edat jedno st?blo)",DIA_Addon_Fortuno_Trade_1);
	};
};


instance DIA_Addon_Fortuno_Trade(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 100;
	condition = DIA_Addon_Fortuno_Trade_Condition;
	information = DIA_Addon_Fortuno_Trade_Info;
	permanent = TRUE;
	description = "M?m pro tebe n?jak? st?bla ...";
};


func int DIA_Addon_Fortuno_Trade_Condition()
{
	if((Npc_HasItems(other,ItPl_SwampHerb) >= 1) && Npc_KnowsInfo(other,DIA_Addon_Fortuno_Herb))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Trade_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trade_15_00");	//M?m pro tebe n?jak? st?bla ...
	B_Fortuno_InfoManager();
};

func void DIA_Addon_Fortuno_Trade_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
};

func void DIA_Addon_Fortuno_Trade_all()
{
	var int amount;
	amount = Npc_HasItems(other,ItPl_SwampHerb);
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,amount))
	{
		Npc_RemoveInvItems(self,ItPl_SwampHerb,Npc_HasItems(self,ItPl_SwampHerb));
	};
	B_GiveInvItems(self,other,ItMi_Gold,amount * Value_SwampHerb);
	B_GivePlayerXP(amount * 10);
	B_Fortuno_InfoManager();
};

func void DIA_Addon_Fortuno_Trade_1()
{
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,1))
	{
		Npc_RemoveInvItems(self,ItPl_SwampHerb,Npc_HasItems(self,ItPl_SwampHerb));
	};
	B_GiveInvItems(self,other,ItMi_Gold,Value_SwampHerb);
	B_GivePlayerXP(10);
	B_Fortuno_InfoManager();
};


instance DIA_Addon_Fortuno_Trank(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 3;
	condition = DIA_Addon_Fortuno_Trank_Condition;
	information = DIA_Addon_Fortuno_Trank_Info;
	permanent = FALSE;
	description = "M?m pro tebe tenhle lektvar ...";
};


func int DIA_Addon_Fortuno_Trank_Condition()
{
	if((Fortuno_Geheilt_01 == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE) && ((Npc_HasItems(other,ItPo_Addon_Geist_01) >= 1) || (Npc_HasItems(other,ItPo_Addon_Geist_02) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Trank_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trank_15_00");	//M?m pro tebe tenhle lektvar. M?l by ti vr?tit vzpom?nky.
	AI_Output(self,other,"DIA_Addon_Fortuno_Trank_13_01");	//Budu ti v??it ...
	if(Npc_HasItems(other,ItPo_Addon_Geist_02) >= 1)
	{
		if(B_GiveInvItems(other,self,ItPo_Addon_Geist_02,1))
		{
			AI_UseItem(self,ItPo_Addon_Geist_02);
		};
		B_GivePlayerXP(XP_Addon_Fortuno_02);
	}
	else if(B_GiveInvItems(other,self,ItPo_Addon_Geist_01,1))
	{
		Log_SetTopicStatus(Topic_Addon_Fortuno,LOG_OBSOLETE);
		AI_StopProcessInfos(self);
		AI_UseItem(self,ItPo_Addon_Geist_01);
	};
};


instance DIA_Addon_Fortuno_more(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 2;
	condition = DIA_Addon_Fortuno_more_Condition;
	information = DIA_Addon_Fortuno_more_Info;
	permanent = FALSE;
	description = "No ...?";
};


func int DIA_Addon_Fortuno_more_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fortuno_Trank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_more_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_00");	//No ...?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_01");	//A??! J? ... j? si pamatuju! Vid?m ... Adanos mi pomohl ... co m?m ud?lat!?
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_02");	//Jo, co m?? ud?lat? A hlavn?, co m? Raven ud?lat?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_03");	//Pomohl jsem mu ... nav?zat kontakt. JEMU. Cht?l hodn? lektvar? ... Va?il jsem mu je.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_04");	//Sna?il se otev??t port?l aby se dostal do chr?mu.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_05");	//Pro?? Co cht?l d?lat v chr?mu?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_06");	//Mocn? artefakt ... l?i zni?? ka?d?ho kdo by ho cht?l ovl?dat. Mocn? v?le?n?k bude ten, kdo se mu podvol? ...
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_07");	//A ... ?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_08");	//Nepoda?ilo se n?m otev??t port?l ...
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_09");	//Nicm?n?, Raven byl p?esv?d?en?, ?e ho otev?e, POKUD odkryje hrobku kn?z?.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_10");	//A to je ten d?vod, pro? sem dot?hl v?echny ty otroky. Loutky, kter? tu budou p?inuceny kopat.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_11");	//Hrobka kn?z??
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_12");	//Hrobka Adanosova kn?ze. Je v dole.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_13");	//Tak? si pamatuju na n?jak? kamenn? tabulky. Raven v???, ?e mu uk??ou cestu.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_14");	//Nakonec se mu povedlo rozlu?tit n?pis a j? se pro n?ho stal p?ebyte?n?m.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_15");	//Za?aroval m? abych v?echno zapomn?l. A ty jsi m? osvobodil.
	SC_KnowsFortunoInfos = TRUE;
	B_LogEntry(TOPIC_Addon_RavenKDW,"Raven pl?nuje z?skat n?jak? mocn? artefakt z chr?mu.");
	Log_AddEntry(TOPIC_Addon_RavenKDW,"Z n?jak?ho d?vodu vykopal Raven ve zlat?m dole hrob jednoho z kn?z? star? kultury.");
	Log_AddEntry(TOPIC_Addon_RavenKDW,"Raven v???, ?e n?kter? kamenn? tabulky mu pom??ou.");
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Addon_Fortuno_03);
};


instance DIA_Addon_Fortuno_Attentat(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 9;
	condition = DIA_Addon_Fortuno_Attentat_Condition;
	information = DIA_Addon_Fortuno_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Fortuno_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Fortuno_Trank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fortuno_Attentat_13_00");	//Pokus o vra?du? Promi?, nebyl jsem ... p??tomen. Nev?m o tom nic.
};

