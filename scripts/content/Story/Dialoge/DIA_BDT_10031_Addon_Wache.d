
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
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_00");	//Hej, snad nechce? j?t dolovat? Nezapome? si vz?t n?jak? vybaven? od Scattyho.
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Scatty_15_01");	//Co pot?ebuji?
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_02");	//Aspo? krump??. A n?jak? j?dlo ti taky nebude na ?kodu.
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_03");	//A taky p?r l??iv?ch lektvar?? Jsou tam d?ln? ?ervi.
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
	description = "V?e ok?";
};


func int DIA_Addon_10031_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10031_Wache_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Hi_15_00");	//V?e ok?
	if((Sklaven_Flucht == TRUE) && (Wache_Joker == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_01");	//Chlape, otroci maj? nasp?ch.
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_02");	//Kdy? se doslechli, ?e jsou voln?, ut?kali pry? jako kr?lici!
		Wache_Joker = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_03");	//Ano. Ned?lej bordel a bude v?e v po??dku.
};

