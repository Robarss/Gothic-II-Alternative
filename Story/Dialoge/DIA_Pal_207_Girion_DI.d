
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
	description = "Je všechno v pořádku?";
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
	AI_Output(other,self,"DIA_Girion_DI_Hallo_15_00");	//Je všechno v pořádku?
	if(ORkSturmDI == TRUE)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_01");	//Skřeti jsou opravdu stateční, že se vydali proti mně.
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_02");	//Jeden by řekl, že mají dost rozumu na to, aby se postavili paladinovi z královské stráže.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_03");	//Také bych řekl. Zabere ti tvůj úkol tady na útesu hodně času?
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_04");	//Nechovej se ke mně jako k idiotovi. Udělej co musíš a předej mi velení lodi.
	};
};


instance DIA_Girion_DI_Teach(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 5;
	condition = DIA_Girion_DI_Teach_Condition;
	information = DIA_Girion_DI_Teach_Info;
	permanent = TRUE;
	description = "Uč mě, pak se odsud dostaneme rychleji.";
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
	AI_Output(other,self,"DIA_Girion_DI_Teach_15_00");	//Uč mě, pak se odsud dostaneme rychleji.
	AI_Output(self,other,"DIA_Girion_DI_Teach_08_01");	//Zdá se, že nemám na výběr.
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
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_1_08_00");	//Nikdy moc nezvedej lokty. Budeš pak mít tuhou mušku a zákonitě zkroutíš zbraň.
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
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_5_08_00");	//Před výstřelem si vždycky uvolni levou ruku. Bude se ti pak lépe mířit.
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
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_1_08_00");	//Ostří musí letět větrem jako rákos povětřím.
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
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_5_08_00");	//Svou sílu používej s rozmyslem. Když se bezhlavě rozběhneš proti nepříteli, moc úspěchu nesklidíš.
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
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00");	//Neměj příliš pevné sevření, abys mohl přesně trefit.
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
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00");	//Nezapomeň se bránit. Nejlepší obranou je vyhýbat se protivníkovým ranám.
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
	description = "Mám prsten skřetího vůdce.";
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
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_15_00");	//Mám prsten skřetího vůdce.
	if(DIA_Girion_DI_OrcEliteRing_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_01");	//Myslím, že by s tím mohl lord Hagen něco udělat.
		DIA_Girion_DI_OrcEliteRing_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_02");	//Dej mi ho. Donesu ho lordu Hagenovi.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
	Info_AddChoice(DIA_Girion_DI_OrcEliteRing,"Radši si ho nechám.",DIA_Girion_DI_OrcEliteRing_behalten);
	Info_AddChoice(DIA_Girion_DI_OrcEliteRing,"Na, vem si tenhle.",DIA_Girion_DI_OrcEliteRing_geben);
};

func void DIA_Girion_DI_OrcEliteRing_geben()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_geben_15_00");	//Na, vem si tenhle.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_geben_08_01");	//Díky. Stejně si nemyslím, že by ti mohl k něčemu být.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Girion_DI_OrcEliteRing_behalten()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_behalten_15_00");	//Radši si ho nechám.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_behalten_08_01");	//Jak myslíš. Stejně ti k ničemu nebude.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
};


instance DIA_GIRION_DI_TEACH2(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 2;
	condition = dia_girion_di_teach2_condition;
	information = dia_girion_di_teach2_info;
	permanent = TRUE;
	description = "(Boj ze štítem. Požadavek: 35% jednoručních zbraní, cena: 5 VB)";
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
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nauč mě bojovat!
	if((other.lp >= 5) && (hero.aivar[REAL_TALENT_1H] >= 35))
	{
		other.lp = other.lp - 5;
		B_TeachThiefTalent(self,other,NPC_TALENT_SHIELDD);
		SCATTY_TEACH_PERM1 = TRUE;
		PrintScreen("Naučil ses: Boj se štítem",-1,-1,FONT_Screen,3);
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
	description = "(Boj ze štítem. Požadavek: 65% jednoručních zbraní, cena: 10 VB)";
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
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nauč mě bojovat!
	if((other.lp >= 10) && (hero.aivar[REAL_TALENT_1H] >= 65))
	{
		other.lp = other.lp - 10;
		SCATTY_TEACH_PERM2 = TRUE;
		PrintScreen("Naučil ses: Pokročilý boj se štítem",-1,-1,FONT_Screen,3);
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
	description = "(Boj ze štítem. Požadavek: 90% jednoručních zbraní, cena: 15 VB)";
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
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nauč mě bojovat!
	if((other.lp >= 15) && (hero.aivar[REAL_TALENT_1H] >= 90))
	{
		other.lp = other.lp - 15;
		SCATTY_TEACH_PERM3 = TRUE;
		PrintScreen("Naučil ses: Mistrovsky boj se štítem",-1,-1,FONT_Screen,3);
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
	description = "Teď můžeme konečně vyrazit.";
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
	AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_00");	//Teď můžeme konečně vyrazit.
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_01");	//Bylo na čase. Už jsem si myslel, že tady na tomhle útesu zplesnivím.
	if(DIA_Girion_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_02");	//Teď mi okamžitě tu loď předej.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_03");	//Ještě nejsme v Khorinisu. A upřímně řečeno, zpátky do Khorinisu se mi moc nechce.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_04");	//Už jsem tam byl dost dlouho.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_05");	//Myslel jsem si to. Ale teď není ani správný čas, ani správné místo, abychom si něco takového vyjasňovali. Probereme to, až budeme zpátky na lodi.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_06");	//No a co. Stejně jsem rád, že tě mám zpátky na palubě v jednom kuse.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_07");	//Jsi skutečný Innosův válečník. Už o tom nemám žádných pochyb. Jsem rád, že tě máme na své straně.
		}
		else
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_08");	//I když jsi lump, zachoval ses nakonec správně.
		};
		DIA_Girion_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_09");	//Dobrá. Teď jdi za kapitánem, ať nás odsud vyvede.
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

