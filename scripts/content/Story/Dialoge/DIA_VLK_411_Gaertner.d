
instance DIA_Gaertner_EXIT(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 999;
	condition = DIA_Gaertner_EXIT_Condition;
	information = DIA_Gaertner_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gaertner_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gaertner_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gaertner_PICKPOCKET(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 900;
	condition = DIA_Gaertner_PICKPOCKET_Condition;
	information = DIA_Gaertner_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Gaertner_PICKPOCKET_Condition()
{
	return C_Beklauen(40,50);
};

func void DIA_Gaertner_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
	Info_AddChoice(DIA_Gaertner_PICKPOCKET,Dialog_Back,DIA_Gaertner_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gaertner_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gaertner_PICKPOCKET_DoIt);
};

func void DIA_Gaertner_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
};

func void DIA_Gaertner_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
};


instance DIA_Gaertner_Job(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Job_Condition;
	information = DIA_Gaertner_Job_Info;
	permanent = FALSE;
	description = "Co tady d?l???";
};


func int DIA_Gaertner_Job_Condition()
{
	return TRUE;
};

func void DIA_Gaertner_Job_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Job_15_00");	//Co tady d?l???
	AI_Output(self,other,"DIA_Gaertner_Job_09_01");	//Co mysl??? J? jsem zahradn?k, star?m se o zahradu.
	AI_Output(other,self,"DIA_Gaertner_Job_15_02");	//D? se ??ci, ?e jsi tady s?m, ?e ano?
	AI_Output(self,other,"DIA_Gaertner_Job_09_03");	//Ano, a m?lo by to tak z?stat. Jsem r?d, ?e tady m?m klid.
	AI_Output(self,other,"DIA_Gaertner_Job_09_04");	//Jednou m? cht?li poslat do trestaneck? kolonie, proto?e jsem odd?lal jednoho chl?pka.
	AI_Output(self,other,"DIA_Gaertner_Job_09_05");	//Ale spr?vce Larius pot?eboval dal??ho zahradn?ka a tak jsem tady mohl z?stat.
	AI_Output(self,other,"DIA_Gaertner_Job_09_06");	//Nakonec se tahle zahrada stala m?m domovem. A j? jsem spokojen?.
};


instance DIA_Gaertner_Plants(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Plants_Condition;
	information = DIA_Gaertner_Plants_Info;
	permanent = FALSE;
	description = "P?stuje? tak? bylinky?";
};


func int DIA_Gaertner_Plants_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Job))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Plants_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Plants_15_00");	//P?stuje? tak? bylinky?
	AI_Output(self,other,"DIA_Gaertner_Plants_09_01");	//P?r. P?stuji vrbky ?zkolist? a ohniv? kop?ivy. Tak? jsem zkou?el tr?vu z ba?in, ale v?bec se j? tady neda?ilo.
	AI_Output(self,other,"DIA_Gaertner_Plants_09_02");	//Nu?e, pr?v? jsem sklidil. Tak?e pokud chce? n?co koupit...
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Zahradn?k m?stodr??c?ho mi m??e prodat n?jak? rostliny.");
};


instance DIA_Gaertner_Trade(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Trade_Condition;
	information = DIA_Gaertner_Trade_Info;
	permanent = TRUE;
	description = "Uka? mi sv? zbo??.";
	trade = TRUE;
};


func int DIA_Gaertner_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Plants))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Gaertner_Trade_15_00");	//Uka? mi sv? zbo??.
};


instance DIA_Gaertner_Krautabak(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Krautabak_Condition;
	information = DIA_Gaertner_Krautabak_Info;
	permanent = FALSE;
	description = "M?m tady tab?kov? listy.";
};


func int DIA_Gaertner_Krautabak_Condition()
{
	if((Npc_HasItems(other,ItMi_SumpfTabak) >= 1) && Wld_IsTime(6,45,21,45))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Krautabak_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Krautabak_15_00");	//M?m tady tab?kov? listy. Zakou??te si?
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_01");	//To nezn?m  - ale jist?, dej to sem. Zkus?m to.
	B_GiveInvItems(other,self,ItMi_SumpfTabak,1);
	Npc_RemoveInvItems(self,ItMi_SumpfTabak,1);
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_02");	//Ack...ackack....
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_03");	//Silnej matro?. Mysl?m, ?e u? to nikdy kou?it nebudu.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Gaertner_Sign(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = DIA_Gaertner_Sign_Condition;
	information = DIA_Gaertner_Sign_Info;
	permanent = FALSE;
	description = "(P?edv?st zlod?jsk? sign?l.)";
};


func int DIA_Gaertner_Sign_Condition()
{
	if(Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Gaertner_Sign_09_00");	//Tak ty jsi jedn?m z n?s. M?m pro tebe n?kolik u?ite?n?ch informac?.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_01");	//N?kolik dom? tady naho?e m? tajn? skr??e, kter? je mo?n? otev??t jen pomoc? n?jak?ho ukryt?ho sp?na?e.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_02");	//Lid? za nimi str??? sv? cennosti.
};

