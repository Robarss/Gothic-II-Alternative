
instance DIA_Addon_BDT_10019_Wache_EXIT(C_Info)
{
	npc = BDT_10019_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10019_Wache_EXIT_Condition;
	information = DIA_Addon_10019_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10019_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10019_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10019_Wache_Hi(C_Info)
{
	npc = BDT_10019_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10019_Wache_Hi_Condition;
	information = DIA_Addon_10019_Wache_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_10019_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10019_Wache_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_Hi_06_00");	//Dobře, jsi na cestě do dolu?
	Info_ClearChoices(DIA_Addon_BDT_10019_Wache_Hi);
	Info_AddChoice(DIA_Addon_BDT_10019_Wache_Hi,"Vlastně chci vidět Ravena.",DIA_Addon_BDT_10019_Wache_Hi_Raven);
	Info_AddChoice(DIA_Addon_BDT_10019_Wache_Hi,"Ano.",DIA_Addon_BDT_10019_Wache_Hi_Ja);
};

func void B_Say_Wache_kaputt()
{
	AI_Output(other,self,"DIA_Addon_BDT_10019_Wache_kaputt_15_00");	//Proč jsou mrtví?
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_kaputt_06_01");	//Udřeli se k smrti.
	Info_ClearChoices(DIA_Addon_BDT_10019_Wache_Hi);
};

func void DIA_Addon_BDT_10019_Wache_Hi_Raven()
{
	AI_Output(other,self,"DIA_Addon_BDT_10019_Wache_Hi_Raven_15_00");	//Vlastně chci vidět Ravena.
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_Hi_Raven_06_01");	//(křik) Hej - zkus tam vkročit a budeš mrtev jako tito vězni.
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_Hi_Raven_06_02");	//Raději jdi do dolu.
	B_Say_Wache_kaputt();
	Info_ClearChoices(DIA_Addon_BDT_10019_Wache_Hi);
};

func void DIA_Addon_BDT_10019_Wache_Hi_Ja()
{
	AI_Output(other,self,"DIA_Addon_BDT_10019_Wache_Hi_Ja_15_00");	//Ano.
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_Hi_Ja_06_01");	//Opatruj se. Buď pečlivější, než tito prolhaní chlapi kolem.
	B_Say_Wache_kaputt();
	Info_ClearChoices(DIA_Addon_BDT_10019_Wache_Hi);
};

