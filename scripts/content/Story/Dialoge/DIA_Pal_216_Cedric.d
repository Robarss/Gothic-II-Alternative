
instance DIA_Cedric_EXIT(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 999;
	condition = DIA_Cedric_EXIT_Condition;
	information = DIA_Cedric_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cedric_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cedric_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cedric_Hallo(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 2;
	condition = DIA_Cedric_Hallo_Condition;
	information = DIA_Cedric_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cedric_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Cedric_Hallo_Info()
{
	AI_Output(self,other,"DIA_Cedric_Hallo_12_00");	//Jsem Cedric, mistr me?e, kr?lovsk? paladin.
};


instance DIA_Cedric_CanTeach(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 5;
	condition = DIA_Cedric_CanTeach_Condition;
	information = DIA_Cedric_CanTeach_Info;
	permanent = TRUE;
	description = "M??e? m? u?it?";
};


func int DIA_Cedric_CanTeach_Condition()
{
	if(Cedric_Teach1H == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Cedric_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Cedric_CanTeach_15_00");	//M??e? m? u?it?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Cedric_CanTeach_12_01");	//M??u t? tr?novat v boji s jednoru?n?mi zbran?mi.
		Cedric_Teach1H = TRUE;
		B_LogEntry(TOPIC_CityTeacher,"Paladin Cedric m? nau?? zach?zet s jednoru?n?mi zbran?mi.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cedric_CanTeach_12_02");	//U??m pouze paladiny.
	};
};


instance DIA_Cedric_Teach(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 100;
	condition = DIA_Cedric_Teach_Condition;
	information = DIA_Cedric_Teach_Info;
	permanent = TRUE;
	description = "Chci, abys m? u?il.";
};


var int DIA_Cedric_Teach_permanent;

func int DIA_Cedric_Teach_Condition()
{
	if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cedric_Teach_Info()
{
	AI_Output(other,self,"DIA_Cedric_Teach_15_00");	//Za?n?me s v?cvikem.
	if(other.HitChance[NPC_TALENT_1H] >= 90)
	{
		AI_Output(self,other,"DIA_DIA_Cedric_Teach_12_01");	//O boji s me?em u? v?? ?pln? v?echno. Nen? nic, co bych t? je?t? mohl nau?it.
	}
	else
	{
		Info_ClearChoices(DIA_Cedric_Teach);
		Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);
		Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
		Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
	};
};

func void DIA_Cedric_Teach_Back()
{
	Info_ClearChoices(DIA_Cedric_Teach);
};

func void DIA_Cedric_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,90);
	Info_ClearChoices(DIA_Cedric_Teach);
	Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);
	Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
	Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
	if((hero.HitChance[NPC_TALENT_1H] >= 60) && (hero.HitChance[NPC_TALENT_1H] <= 79))
	{
		AI_UnequipWeapons(hero);
	};
};

func void DIA_Cedric_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,90);
	Info_ClearChoices(DIA_Cedric_Teach);
	Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);
	Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
	Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
	if((hero.HitChance[NPC_TALENT_1H] >= 60) && (hero.HitChance[NPC_TALENT_1H] <= 79))
	{
		AI_UnequipWeapons(hero);
	};
};


instance DIA_CEDRIC_TEACH2(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 100;
	condition = dia_cedric_teach2_condition;
	information = dia_cedric_teach2_info;
	permanent = TRUE;
	description = "(Boj ze ?t?tem. Po?adavek: 35% jednoru?n?ch zbran?, cena: 5 VB)";
};


func int dia_cedric_teach2_condition()
{
	if((Cedric_Teach1H == TRUE) && (SCATTY_TEACH_PERM1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_cedric_teach2_info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nau? m? bojovat!
	if((other.lp >= 5) && (hero.aivar[REAL_TALENT_1H] >= 35))
	{
		other.lp = other.lp - 5;
		B_TeachThiefTalent(self,other,NPC_TALENT_SHIELDD);
		SCATTY_TEACH_PERM1 = TRUE;
		PrintScreen("Nau?il ses: Boj se ?t?tem",-1,-1,FONT_Screen,3);
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_CEDRIC_TEACH3(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 100;
	condition = dia_cedric_teach3_condition;
	information = dia_cedric_teach3_info;
	permanent = TRUE;
	description = "(Pokro?il? boj ze ?t?tem. Po?adavek: 65% jednoru?n?ch zbran?, cena: 10 VB)";
};


func int dia_cedric_teach3_condition()
{
	if((Cedric_Teach1H == TRUE) && (SCATTY_TEACH_PERM1 == TRUE) && (SCATTY_TEACH_PERM2 == FALSE))
	{
		return TRUE;
	};
};

func void dia_cedric_teach3_info()
{
	AI_Output(other,self,"DIA_Babo_Teach_15_00");	//Za?n?me s tr?ninkem.
	if((other.lp >= 10) && (hero.aivar[REAL_TALENT_1H] >= 65))
	{
		other.lp = other.lp - 10;
		SCATTY_TEACH_PERM2 = TRUE;
		AI_UnequipWeapons(hero);
		PrintScreen("Nau?il ses: Pokro?il? boj se ?t?tem",-1,-1,FONT_Screen,3);
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_CEDRIC_TEACH4(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 100;
	condition = dia_cedric_teach4_condition;
	information = dia_cedric_teach4_info;
	permanent = TRUE;
	description = "(Mistrovsk? boj ze ?t?tem. Po?adavek: 90% jednoru?n?ch zbran?, cena: 15 VB)";
};


func int dia_cedric_teach4_condition()
{
	if((Cedric_Teach1H == TRUE) && (SCATTY_TEACH_PERM1 == TRUE) && (SCATTY_TEACH_PERM2 == TRUE) && (SCATTY_TEACH_PERM3 == FALSE))
	{
		return TRUE;
	};
};

func void dia_cedric_teach4_info()
{
	AI_Output(other,self,"DIA_Babo_Teach_15_00");	//Za?n?me s tr?ninkem.
	if((other.lp >= 15) && (hero.aivar[REAL_TALENT_1H] >= 90))
	{
		other.lp = other.lp - 15;
		SCATTY_TEACH_PERM3 = TRUE;
		AI_UnequipWeapons(hero);
		PrintScreen("Nau?il ses: Mistrovsk? boj se ?t?tem",-1,-1,FONT_Screen,3);
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Cedric_PICKPOCKET(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 900;
	condition = DIA_Cedric_PICKPOCKET_Condition;
	information = DIA_Cedric_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Cedric_PICKPOCKET_Condition()
{
	return C_Beklauen(37,55);
};

func void DIA_Cedric_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cedric_PICKPOCKET);
	Info_AddChoice(DIA_Cedric_PICKPOCKET,Dialog_Back,DIA_Cedric_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cedric_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cedric_PICKPOCKET_DoIt);
};

func void DIA_Cedric_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cedric_PICKPOCKET);
};

func void DIA_Cedric_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cedric_PICKPOCKET);
};

