
instance DIA_Addon_BDT_10031_Wache_EXIT(C_Info)
{
	npc = BDT_10031_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10031_Wache_EXIT_Condition;
	information = DIA_Addon_10031_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10031_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10031_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10031_Wache_Scatty(C_Info)
{
	npc = BDT_10031_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10031_Wache_Scatty_Condition;
	information = DIA_Addon_10031_Wache_Scatty_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_10031_Wache_Scatty_Condition()
{
	return TRUE;
};

func void DIA_Addon_10031_Wache_Scatty_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_00");	//Hej, snad nechceš jít dolovat? Nezapomeň si vzít nějaké vybavení od Scattyho.
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Scatty_15_01");	//Co potřebuji?
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_02");	//Aspoň krumpáč. A nějaké jídlo ti taky nebude na škodu.
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_03");	//A taky pár léčivých lektvarů? Jsou tam důlní červi.
	AI_StopProcessInfos(self);
};


var int Wache_Joker;

instance DIA_Addon_BDT_10031_Wache_Hi(C_Info)
{
	npc = BDT_10031_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10031_Wache_Hi_Condition;
	information = DIA_Addon_10031_Wache_Hi_Info;
	permanent = TRUE;
	description = "Vše ok?";
};


func int DIA_Addon_10031_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10031_Wache_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Hi_15_00");	//Vše ok?
	if((Sklaven_Flucht == TRUE) && (Wache_Joker == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_01");	//Chlape, otroci mají naspěch.
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_02");	//Když se doslechli, že jsou volní, utíkali pryč jako králici!
		Wache_Joker = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_03");	//Ano. Nedělej bordel a bude vše v pořádku.
};

