
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
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_00");	//(vystrašeně) Černý mrak nad domem ... ON přichází ...
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_01");	//S krví ... přivolává ho ... ON mě sleduje ... on mě sleduje ... oh ne, ztrať se, vypadni ...
		AI_Output(other,self,"DIA_Addon_Fortuno_Hi_15_02");	//Jsi v pořádku?
		Fortuno_Einmal = TRUE;
		Log_CreateTopic(Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Fortuno,LOG_Running);
		B_LogEntry(Topic_Addon_Fortuno,"Fortuno je mimo. Potřebuje 'Zeleného Novice'.");
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_03");	//Zelený ... zelený novic ... nemůžu ho najít ...
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	Info_AddChoice(DIA_Addon_Fortuno_Hi,"Vrátím se později...(konec)",DIA_Addon_Fortuno_Hi_BACK);
	Info_AddChoice(DIA_Addon_Fortuno_Hi,"Můžu ti pomoci?",DIA_Addon_Fortuno_Hi_HILFE);
	if(Npc_HasItems(other,ItMi_Joint) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi,"Tady, vezmi si tohle stéblo.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if(Npc_HasItems(other,ItMi_Addon_Joint_01) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi,"Ok, zkus tohle - 'Zelený Novic'.",DIA_Addon_Fortuno_Hi_GREEN);
	};
};

func void DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_HILFE_15_00");	//Můžu ti pomoci?
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_HILFE_13_01");	//zelený ... zelený novic pomáhá novicům ...
};

func void DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_JOINT_15_00");	//Tady, vezmi si tohle stéblo.
	if(B_GiveInvItems(other,self,ItMi_Joint,1))
	{
		AI_UseItem(self,ItMi_Joint);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_JOINT_13_01");	//Není zelený, není silný, není zelený, není silný ...
};

func void DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_GREEN_15_00");	//Ok, zkus tohle - 'Zelený Novic'.
	if(B_GiveInvItems(other,self,ItMi_Addon_Joint_01,1))
	{
		AI_UseItem(self,ItMi_Addon_Joint_01);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_01");	//(vyléčený) AAAHHH ...
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_02");	//Moje myšlenky ... kdo ... jsem ... Fortuno ... co ... co se děje?
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	B_GivePlayerXP(XP_Addon_Fortuno_01);
	B_LogEntry(Topic_Addon_Fortuno,"'Zelený Novic' obnovil Fortunovy smysly.");
};


instance DIA_Addon_Fortuno_wer(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 2;
	condition = DIA_Addon_Fortuno_wer_Condition;
	information = DIA_Addon_Fortuno_wer_Info;
	permanent = FALSE;
	description = "Ok, teď mi řekni, co s tebou je.";
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
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_00");	//Ok, teď mi řekni, co s tebou je.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_01");	//Jednou jsem byl členem Bratrstva Spáče. Na cestě zpět bylo ještě vše v pořádku.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_02");	//Jistě, všichni jsme byli přesvědčení kriminálníci, ale život byl pro nás novice celkem dobrý ...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_03");	//Hej, já jsem byl také vězeň důlní kolonie. Řekni mi něco, co ještě nevím.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_04");	//Já ... nic si nepamatuju. Temnota zastřela moji mysl ...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_05");	//No tak. Zkus se soustředit. Co se stalo? Jak můžeš znovu získat vědomí?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_06");	//Raven ... pamatuju si jenom na Ravena a ... temné pokoje.
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_07");	//Co je s Ravenem? Co ti udělal?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_08");	//(vzdychá) Omlouvám se. Vypadá to, jako by byla moje mysl uvězněna ... Sám tomu nerozumím ...
};


instance DIA_Addon_Fortuno_FREE(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 5;
	condition = DIA_Addon_Fortuno_FREE_Condition;
	information = DIA_Addon_Fortuno_FREE_Info;
	permanent = FALSE;
	description = "Musí existovat cesta jak ti vrátit vzpomínky.";
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
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_00");	//Musí existovat cesta jak ti vrátit vzpomínky.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_01");	//Hmm ... jo, možná by to šlo.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_02");	//Guru znali všechno možné o manipulaci s myslí.
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_03");	//A TY o tom něco víš?
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_04");	//Ne, bojím se, že tyto znalosti už jsou pryč ...
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_05");	//Kruci. Jestli je tady cesta jak ti pomoci, najdu ji.
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_LOCH_01");
	B_LogEntry(Topic_Addon_Fortuno,"Fortuno už je duševně v pořádku, stále si ale nic nepamatuje.");
};


instance DIA_Addon_Fortuno_Herb(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 99;
	condition = DIA_Addon_Fortuno_Herb_Condition;
	information = DIA_Addon_Fortuno_Herb_Info;
	permanent = FALSE;
	description = "Potřebuješ další stébla?";
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
	AI_Output(other,self,"DIA_Addon_Fortuno_Herb_15_00");	//Potřebuješ další stébla?
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_01");	//No jooo. Vezmu si všechny, co máš.
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_02");	//Dokonce zaplatím více než Fisk.
};

func void B_Fortuno_InfoManager()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
	Info_AddChoice(DIA_Addon_Fortuno_Trade,Dialog_Back,DIA_Addon_Fortuno_Trade_BACK);
	if(Npc_HasItems(other,ItPl_SwampHerb) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Trade,"(Předat všechny stébla)",DIA_Addon_Fortuno_Trade_all);
		Info_AddChoice(DIA_Addon_Fortuno_Trade,"(Předat jedno stéblo)",DIA_Addon_Fortuno_Trade_1);
	};
};


instance DIA_Addon_Fortuno_Trade(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 100;
	condition = DIA_Addon_Fortuno_Trade_Condition;
	information = DIA_Addon_Fortuno_Trade_Info;
	permanent = TRUE;
	description = "Mám pro tebe nějaká stébla ...";
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
	AI_Output(other,self,"DIA_Addon_Fortuno_Trade_15_00");	//Mám pro tebe nějaká stébla ...
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
	description = "Mám pro tebe tenhle lektvar ...";
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
	AI_Output(other,self,"DIA_Addon_Fortuno_Trank_15_00");	//Mám pro tebe tenhle lektvar. Měl by ti vrátit vzpomínky.
	AI_Output(self,other,"DIA_Addon_Fortuno_Trank_13_01");	//Budu ti věřit ...
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
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_01");	//Aáá! Já ... já si pamatuju! Vidím ... Adanos mi pomohl ... co mám udělat!?
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_02");	//Jo, co máš udělat? A hlavně, co má Raven udělat?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_03");	//Pomohl jsem mu ... navázat kontakt. JEMU. Chtěl hodně lektvarů ... Vařil jsem mu je.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_04");	//Snažil se otevřít portál aby se dostal do chrámu.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_05");	//Proč? Co chtěl dělat v chrámu?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_06");	//Mocný artefakt ... lži zničí každého kdo by ho chtěl ovládat. Mocný válečník bude ten, kdo se mu podvolí ...
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_07");	//A ... ?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_08");	//Nepodařilo se nám otevřít portál ...
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_09");	//Nicméně, Raven byl přesvědčený, že ho otevře, POKUD odkryje hrobku knězů.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_10");	//A to je ten důvod, proč sem dotáhl všechny ty otroky. Loutky, které tu budou přinuceny kopat.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_11");	//Hrobka knězů?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_12");	//Hrobka Adanosova kněze. Je v dole.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_13");	//Také si pamatuju na nějaké kamenné tabulky. Raven věří, že mu ukážou cestu.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_14");	//Nakonec se mu povedlo rozluštit nápis a já se pro něho stal přebytečným.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_15");	//Začaroval mě abych všechno zapomněl. A ty jsi mě osvobodil.
	SC_KnowsFortunoInfos = TRUE;
	B_LogEntry(TOPIC_Addon_RavenKDW,"Raven plánuje získat nějaký mocný artefakt z chrámu.");
	Log_AddEntry(TOPIC_Addon_RavenKDW,"Z nějakého důvodu vykopal Raven ve zlatém dole hrob jednoho z knězů staré kultury.");
	Log_AddEntry(TOPIC_Addon_RavenKDW,"Raven věří, že některé kamenné tabulky mu pomůžou.");
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
	AI_Output(self,other,"DIA_Addon_Fortuno_Attentat_13_00");	//Pokus o vraždu? Promiň, nebyl jsem ... přítomen. Nevím o tom nic.
};

