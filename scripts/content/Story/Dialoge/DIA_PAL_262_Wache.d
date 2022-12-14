
instance DIA_PAL_262_EXIT(C_Info)
{
	npc = PAL_262_Wache;
	nr = 999;
	condition = DIA_PAL_262_EXIT_Condition;
	information = DIA_PAL_262_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_262_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_262_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_262_GREET(C_Info)
{
	npc = PAL_262_Wache;
	nr = 2;
	condition = DIA_PAL_262_GREET_Condition;
	information = DIA_PAL_262_GREET_Info;
	important = TRUE;
};


func int DIA_PAL_262_GREET_Condition()
{
	return TRUE;
};

func void DIA_PAL_262_GREET_Info()
{
	AI_Output(self,other,"DIA_PAL_262_GREET_10_00");	//St?t - kdo jsi?
	AI_Output(other,self,"DIA_PAL_262_GREET_15_01");	//Mnohem d?le?it?j?? je ot?zka, odkud jsem p?i?el. P?i?el jsem skrz pr?smyk.
	AI_Output(other,self,"DIA_PAL_262_GREET_15_02");	//Bude? mi tedy d?l st?t v cest?, nebo m? pust?? d?l?
	AI_Output(self,other,"DIA_PAL_262_GREET_10_03");	//No, to jsem p?ece nemohl v?d?t. Jasn?, ?e m??e? j?t d?l.
	AI_StopProcessInfos(self);
};


instance DIA_Wache_PERM(C_Info)
{
	npc = PAL_262_Wache;
	nr = 3;
	condition = DIA_Wache_PERM_Condition;
	information = DIA_Wache_PERM_Info;
	permanent = TRUE;
	description = "Kdo tady vel??";
};


func int DIA_Wache_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_262_greet))
	{
		return TRUE;
	};
};

func void DIA_Wache_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Wache_PERM_15_00");	//Kdo tady vel??
	AI_Output(self,other,"DIA_Addon_Wache_PERM_10_01");	//Velitel Garond a poradci, paldinov? Oric a Parcival.
	AI_Output(self,other,"DIA_Addon_Wache_PERM_10_02");	//Jen b?? dovnit?. B?hem dne je najde? v tr?nn?m s?le v p??zem?.
};

