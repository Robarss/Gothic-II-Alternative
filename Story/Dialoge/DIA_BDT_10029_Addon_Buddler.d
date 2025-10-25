
instance DIA_Addon_BDT_10029_Buddler_EXIT(C_Info)
{
	npc = BDT_10029_Addon_Buddler;
	nr = 999;
	condition = DIA_Addon_10029_Buddler_EXIT_Condition;
	information = DIA_Addon_10029_Buddler_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10029_Buddler_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10029_Buddler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10029_Buddler_Hi(C_Info)
{
	npc = BDT_10029_Addon_Buddler;
	nr = 2;
	condition = DIA_Addon_10029_Buddler_Hi_Condition;
	information = DIA_Addon_10029_Buddler_Hi_Info;
	permanent = TRUE;
	description = "Jak se daří?";
};


func int DIA_Addon_10029_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10029_Buddler_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10029_Buddler_Hi_15_00");	//Jak se daří?
	if(Sklaven_Flucht == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10029_Buddler_Hi_06_01");	//Nic nedělám, když makaj otroci.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10029_Buddler_Hi_06_02");	//Budu muset zas kopat, abych si na to znova zvykl.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_10029_Buddler_Hacken(C_Info)
{
	npc = BDT_10029_Addon_Buddler;
	nr = 3;
	condition = DIA_Addon_10029_Buddler_Hacken_Condition;
	information = DIA_Addon_10029_Buddler_Hacken_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int DIA_Addon_10029_Buddler_Hacken_Condition()
{
	return TRUE;
};

func void DIA_Addon_10029_Buddler_Hacken_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_10029_Buddler_Hacken_06_00");	//Všechno to souvisí s nohama.
	AI_Output(self,other,"DIA_Addon_10029_Buddler_Hacken_06_01");	//Síla a švih pochází z nohou.
	B_Upgrade_Hero_HackChance(5);
};

