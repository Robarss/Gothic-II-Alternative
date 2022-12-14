
instance DIA_Girion_DI_XIT(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 999;
	condition = DIA_Girion_DI_EXIT_Condition;
	information = DIA_Girion_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Girion_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Girion_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Girion_DI_Hallo(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 2;
	condition = DIA_Girion_DI_Hallo_Condition;
	information = DIA_Girion_DI_Hallo_Info;
	permanent = TRUE;
	description = "Je v?echno v po??dku?";
};


func int DIA_Girion_DI_Hallo_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Girion_DI_Hallo_15_00");	//Je v?echno v po??dku?
	if(ORkSturmDI == TRUE)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_01");	//Sk?eti jsou opravdu state?n?, ?e se vydali proti mn?.
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_02");	//Jeden by ?ekl, ?e maj? dost rozumu na to, aby se postavili paladinovi z kr?lovsk? str??e.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_03");	//Tak? bych ?ekl. Zabere ti tv?j ?kol tady na ?tesu hodn? ?asu?
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_04");	//Nechovej se ke mn? jako k idiotovi. Ud?lej co mus?? a p?edej mi velen? lodi.
	};
};


instance DIA_Girion_DI_Teach(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 5;
	condition = DIA_Girion_DI_Teach_Condition;
	information = DIA_Girion_DI_Teach_Info;
	permanent = TRUE;
	description = "U? m?, pak se odsud dostaneme rychleji.";
};


func int DIA_Girion_DI_Teach_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_DI_Teach_Info()
{
	AI_Output(other,self,"DIA_Girion_DI_Teach_15_00");	//U? m?, pak se odsud dostaneme rychleji.
	AI_Output(self,other,"DIA_Girion_DI_Teach_08_01");	//Zd? se, ?e nem?m na v?b?r.
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_CROSSBOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_1_08_00");	//Nikdy moc nezvedej lokty. Bude? pak m?t tuhou mu?ku a z?konit? zkrout?? zbra?.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_CROSSBOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_5_08_00");	//P?ed v?st?elem si v?dycky uvolni levou ruku. Bude se ti pak l?pe m??it.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_1_08_00");	//Ost?? mus? let?t v?trem jako r?kos pov?t??m.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_5_08_00");	//Svou s?lu pou??vej s rozmyslem. Kdy? se bezhlav? rozb?hne? proti nep??teli, moc ?sp?chu nesklid??.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90))
	{
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00");	//Nem?j p??li? pevn? sev?en?, abys mohl p?esn? trefit.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00");	//Nezapome? se br?nit. Nejlep?? obranou je vyh?bat se protivn?kov?m ran?m.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Girion_DI_Teach);
};


instance DIA_Girion_DI_OrcEliteRing(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 99;
	condition = DIA_Girion_DI_OrcEliteRing_Condition;
	information = DIA_Girion_DI_OrcEliteRing_Info;
	permanent = TRUE;
	description = "M?m prsten sk?et?ho v?dce.";
};


func int DIA_Girion_DI_OrcEliteRing_Condition()
{
	if(Npc_HasItems(other,ItRi_OrcEliteRing))
	{
		return TRUE;
	};
};


var int DIA_Girion_DI_OrcEliteRing_OneTime;

func void DIA_Girion_DI_OrcEliteRing_Info()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_15_00");	//M?m prsten sk?et?ho v?dce.
	if(DIA_Girion_DI_OrcEliteRing_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_01");	//Mysl?m, ?e by s t?m mohl lord Hagen n?co ud?lat.
		DIA_Girion_DI_OrcEliteRing_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_02");	//Dej mi ho. Donesu ho lordu Hagenovi.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
	Info_AddChoice(DIA_Girion_DI_OrcEliteRing,"Rad?i si ho nech?m.",DIA_Girion_DI_OrcEliteRing_behalten);
	Info_AddChoice(DIA_Girion_DI_OrcEliteRing,"Na, vem si tenhle.",DIA_Girion_DI_OrcEliteRing_geben);
};

func void DIA_Girion_DI_OrcEliteRing_geben()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_geben_15_00");	//Na, vem si tenhle.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_geben_08_01");	//D?ky. Stejn? si nemysl?m, ?e by ti mohl k n??emu b?t.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Girion_DI_OrcEliteRing_behalten()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_behalten_15_00");	//Rad?i si ho nech?m.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_behalten_08_01");	//Jak mysl??. Stejn? ti k ni?emu nebude.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
};


instance DIA_GIRION_DI_TEACH2(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 2;
	condition = dia_girion_di_teach2_condition;
	information = dia_girion_di_teach2_info;
	permanent = TRUE;
	description = "(Boj ze ?t?tem. Po?adavek: 35% jednoru?n?ch zbran?, cena: 5 VB)";
};


func int dia_girion_di_teach2_condition()
{
	if(22992 && (SCATTY_TEACH_PERM1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_girion_di_teach2_info()
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


instance DIA_GIRION_DI_TEACH3(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 2;
	condition = dia_girion_di_teach3_condition;
	information = dia_girion_di_teach3_info;
	permanent = TRUE;
	description = "(Boj ze ?t?tem. Po?adavek: 65% jednoru?n?ch zbran?, cena: 10 VB)";
};


func int dia_girion_di_teach3_condition()
{
	if(22992 && (SCATTY_TEACH_PERM1 == TRUE) && (SCATTY_TEACH_PERM2 == FALSE))
	{
		return TRUE;
	};
};

func void dia_girion_di_teach3_info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nau? m? bojovat!
	if((other.lp >= 10) && (hero.aivar[REAL_TALENT_1H] >= 65))
	{
		other.lp = other.lp - 10;
		SCATTY_TEACH_PERM2 = TRUE;
		PrintScreen("Nau?il ses: Pokro?il? boj se ?t?tem",-1,-1,FONT_Screen,3);
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_GIRION_DI_TEACH4(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 2;
	condition = dia_girion_di_teach4_condition;
	information = dia_girion_di_teach4_info;
	permanent = TRUE;
	description = "(Boj ze ?t?tem. Po?adavek: 90% jednoru?n?ch zbran?, cena: 15 VB)";
};


func int dia_girion_di_teach4_condition()
{
	if(22992 && (SCATTY_TEACH_PERM1 == TRUE) && (SCATTY_TEACH_PERM2 == TRUE) && (SCATTY_TEACH_PERM3 == FALSE))
	{
		return TRUE;
	};
};

func void dia_girion_di_teach4_info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nau? m? bojovat!
	if((other.lp >= 15) && (hero.aivar[REAL_TALENT_1H] >= 90))
	{
		other.lp = other.lp - 15;
		SCATTY_TEACH_PERM3 = TRUE;
		PrintScreen("Nau?il ses: Mistrovsky boj se ?t?tem",-1,-1,FONT_Screen,3);
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Girion_DI_UndeadDragonDead(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 2;
	condition = DIA_Girion_DI_UndeadDragonDead_Condition;
	information = DIA_Girion_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Te? m??eme kone?n? vyrazit.";
};


func int DIA_Girion_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_Girion_DI_UndeadDragonDead_OneTime;

func void DIA_Girion_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_00");	//Te? m??eme kone?n? vyrazit.
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_01");	//Bylo na ?ase. U? jsem si myslel, ?e tady na tomhle ?tesu zplesniv?m.
	if(DIA_Girion_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_02");	//Te? mi okam?it? tu lo? p?edej.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_03");	//Je?t? nejsme v Khorinisu. A up??mn? ?e?eno, zp?tky do Khorinisu se mi moc nechce.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_04");	//U? jsem tam byl dost dlouho.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_05");	//Myslel jsem si to. Ale te? nen? ani spr?vn? ?as, ani spr?vn? m?sto, abychom si n?co takov?ho vyjas?ovali. Probereme to, a? budeme zp?tky na lodi.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_06");	//No a co. Stejn? jsem r?d, ?e t? m?m zp?tky na palub? v jednom kuse.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_07");	//Jsi skute?n? Innos?v v?le?n?k. U? o tom nem?m ??dn?ch pochyb. Jsem r?d, ?e t? m?me na sv? stran?.
		}
		else
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_08");	//I kdy? jsi lump, zachoval ses nakonec spr?vn?.
		};
		DIA_Girion_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_09");	//Dobr?. Te? jdi za kapit?nem, a? n?s odsud vyvede.
	AI_StopProcessInfos(self);
};


instance DIA_Girion_DI_PICKPOCKET(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 900;
	condition = DIA_Girion_DI_PICKPOCKET_Condition;
	information = DIA_Girion_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Girion_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(71,260);
};

func void DIA_Girion_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Girion_DI_PICKPOCKET);
	Info_AddChoice(DIA_Girion_DI_PICKPOCKET,Dialog_Back,DIA_Girion_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Girion_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Girion_DI_PICKPOCKET_DoIt);
};

func void DIA_Girion_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Girion_DI_PICKPOCKET);
};

func void DIA_Girion_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Girion_DI_PICKPOCKET);
};

