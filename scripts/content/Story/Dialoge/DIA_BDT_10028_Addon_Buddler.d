
instance DIA_Addon_BDT_10028_Buddler_EXIT(C_Info)
{
	npc = BDT_10028_Addon_Buddler;
	nr = 999;
	condition = DIA_Addon_10028_Buddler_EXIT_Condition;
	information = DIA_Addon_10028_Buddler_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10028_Buddler_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10028_Buddler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10028_Buddler_Hi(C_Info)
{
	npc = BDT_10028_Addon_Buddler;
	nr = 2;
	condition = DIA_Addon_10028_Buddler_Hi_Condition;
	information = DIA_Addon_10028_Buddler_Hi_Info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int DIA_Addon_10028_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10028_Buddler_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10028_Buddler_Hi_15_00");	//Jak to jde?
	if(Sklaven_Flucht == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10028_Buddler_Hi_12_01");	//Nejsem nad�en� z toho kop�n� tady. To je to jedin�, co pro n�s otroky maj�.
		AI_Output(self,other,"DIA_Addon_BDT_10028_Buddler_Hi_12_02");	//(sm�ch) Z�skat zlato nikdy nebylo tak snadn�.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10028_Buddler_Hi_12_03");	//Hrmph. Kterej idiot pustil otroky?
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_10028_Buddler_Hacken(C_Info)
{
	npc = BDT_10028_Addon_Buddler;
	nr = 3;
	condition = DIA_Addon_10028_Buddler_Hacken_Condition;
	information = DIA_Addon_10028_Buddler_Hacken_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int DIA_Addon_10028_Buddler_Hacken_Condition()
{
	return TRUE;
};

func void DIA_Addon_10028_Buddler_Hacken_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_10028_Buddler_Hacken_12_00");	//Mus� kopat z doln� ��sti a� k vrchn�mu d�lu.
	AI_Output(self,other,"DIA_Addon_10028_Buddler_Hacken_12_01");	//Je to trochu lstiv�, ale takto dostane� ze sk�ly v�ce nuget�.
	B_Upgrade_Hero_HackChance(5);
};

