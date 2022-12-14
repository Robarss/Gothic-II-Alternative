
instance DIA_Addon_BDT_10027_Buddler_EXIT(C_Info)
{
	npc = BDT_10027_Addon_Buddler;
	nr = 999;
	condition = DIA_Addon_10027_Buddler_EXIT_Condition;
	information = DIA_Addon_10027_Buddler_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10027_Buddler_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10027_Buddler_Hi(C_Info)
{
	npc = BDT_10027_Addon_Buddler;
	nr = 2;
	condition = DIA_Addon_10027_Buddler_Hi_Condition;
	information = DIA_Addon_10027_Buddler_Hi_Info;
	permanent = TRUE;
	description = "Co tady d?l???";
};


func int DIA_Addon_10027_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10027_Buddler_Hi_15_00");	//Co tady d?l???
	if(Sklaven_Flucht == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_01");	//Nic. Pracoval jsem pro rudobarony dost dlouho. Je dob?e, ?e te? pracuj? jin?.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_02");	//Zatracen?, zd? se, ?e mus?me st?le kopat, co?
	};
};


instance DIA_Addon_10027_Buddler_Hacken(C_Info)
{
	npc = BDT_10027_Addon_Buddler;
	nr = 3;
	condition = DIA_Addon_10027_Buddler_Hacken_Condition;
	information = DIA_Addon_10027_Buddler_Hacken_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int DIA_Addon_10027_Buddler_Hacken_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_Hacken_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_10027_Buddler_Hacken_11_00");	//My?lenkov? pr?ce. Chlap?e, kop?n? je ?ist? my?lenkov? pr?ce. Nezkou?ej prorazit sk?lu - je tvrd?? ne? ty.
	AI_Output(self,other,"DIA_Addon_10027_Buddler_Hacken_11_01");	//Uvolni svou mysl - a zkus se spojit v jedno se zlatem. Kop?? se pak bude r?d modlit, r?d meditovat.
	B_Upgrade_Hero_HackChance(10);
};

