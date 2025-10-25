
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
	description = "Co tady děláš?";
};


func int DIA_Addon_10027_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10027_Buddler_Hi_15_00");	//Co tady děláš?
	if(Sklaven_Flucht == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_01");	//Nic. Pracoval jsem pro rudobarony dost dlouho. Je dobře, že teď pracují jiní.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_02");	//Zatraceně, zdá se, že musíme stále kopat, co?
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
	AI_Output(self,other,"DIA_Addon_10027_Buddler_Hacken_11_00");	//Myšlenková práce. Chlapče, kopání je čistě myšlenková práce. Nezkoušej prorazit skálu - je tvrdší než ty.
	AI_Output(self,other,"DIA_Addon_10027_Buddler_Hacken_11_01");	//Uvolni svou mysl - a zkus se spojit v jedno se zlatem. Kopáč se pak bude rád modlit, rád meditovat.
	B_Upgrade_Hero_HackChance(10);
};

