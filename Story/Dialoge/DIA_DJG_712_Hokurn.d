
instance DIA_Hokurn_EXIT(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 999;
	condition = DIA_Hokurn_EXIT_Condition;
	information = DIA_Hokurn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hokurn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hokurn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hokurn_Hello(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 4;
	condition = DIA_Hokurn_Hello_Condition;
	information = DIA_Hokurn_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hokurn_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Hello_Info()
{
	AI_Output(self,other,"DIA_Hokurn_Hello_01_00");	//Nemáš něco k pití?
	AI_Output(other,self,"DIA_Hokurn_Hello_15_01");	//A asi to nemá být voda, co?
	AI_Output(self,other,"DIA_Hokurn_Hello_01_02");	//To teda ne, ksakru!! Potřebuju nějakej alkohol, abych se konečně zbavil toho zatracenýho bolehlavu.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_03");	//Jestli se brzo něčeho nenapiju, nejspíš mi pukne hlava.
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,"Pokusím se něco obstarat.",DIA_Hokurn_Hello_No);
	if((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1))
	{
		Info_AddChoice(DIA_Hokurn_Hello,"Tady, vezmi si tohle.",DIA_Hokurn_Hello_Yes);
	};
};

func void DIA_Hokurn_Hello_No()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_No_15_00");	//Nemám nic, co bych ti mohl dát.
	AI_Output(self,other,"DIA_Hokurn_Hello_No_01_01");	//Tak zmizni!
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,Dialog_Ende,DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello,"Ještě jedna věc ...",DIA_Hokurn_Hello_ASK1);
};

func void DIA_Hokurn_Hello_ASK1()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK1_15_00");	//Ještě jedna věc...
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK1_01_01");	//(povzdech) Tys mi nerozuměl? VYPADNI!!!
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,Dialog_Ende,DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello,"Je to důležité.",DIA_Hokurn_Hello_ASK2);
};

func void DIA_Hokurn_Hello_ASK2()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK2_15_00");	//Je to důležité.
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK2_01_01");	//(povzdech) Řekl sis o to.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Hokurn_Hello_END()
{
	AI_StopProcessInfos(self);
};

func void B_Hokurn_Sauf()
{
	AI_Output(self,other,"B_Hokurn_Sauf_01_00");	//(říhnutí) Ha, tohle jsem potřeboval.
	AI_Output(self,other,"B_Hokurn_Sauf_01_01");	//Teď můžu znova myslet s čistou hlavou. Co pro tebe můžu udělat?
};

func void DIA_Hokurn_Hello_Yes()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_Yes_15_00");	//Tady, vezmi si tohle.
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
		B_UseItem(self,ItFo_Booze);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
		B_UseItem(self,ItFo_Wine);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
		B_UseItem(self,ItFo_Beer);
	};
	HokurnLastDrink = Wld_GetDay();
	HokurnGetsDrink = TRUE;
	B_Hokurn_Sauf();
	Info_ClearChoices(DIA_Hokurn_Hello);
};


instance DIA_Hokurn_Drink(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Drink_Condition;
	information = DIA_Hokurn_Drink_Info;
	permanent = TRUE;
	description = "Tady máš něco k pití.";
};


func int DIA_Hokurn_Drink_Condition()
{
	if((HokurnGetsDrink == FALSE) && ((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Drink_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Drink_15_00");	//Tady máš něco k pití.
	AI_Output(self,other,"DIA_Hokurn_Drink_01_01");	//(dychtivě) Dej to sem!!
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
		B_UseItem(self,ItFo_Booze);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
		B_UseItem(self,ItFo_Wine);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
		B_UseItem(self,ItFo_Beer);
	};
	HokurnLastDrink = Wld_GetDay();
	HokurnGetsDrink = TRUE;
	B_Hokurn_Sauf();
};


instance DIA_Hokurn_Question(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Question_Condition;
	information = DIA_Hokurn_Question_Info;
	permanent = TRUE;
	description = "Potřebuju nějaké informace.";
};


func int DIA_Hokurn_Question_Condition()
{
	if(HokurnGetsDrink == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Question_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Question_15_00");	//Potřebuju nějaké informace.
	AI_Output(self,other,"DIA_Hokurn_Question_01_01");	//(otráveně) Měl jsem dojem, že jsme si rozuměli. Mluvím jen s přáteli.
	AI_Output(self,other,"DIA_Hokurn_Question_01_02");	//A přátelé ti nabídnou něco k pití. Jasný? Teď odpal!
};


instance DIA_Hokurn_Learn(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 6;
	condition = DIA_Hokurn_Learn_Condition;
	information = DIA_Hokurn_Learn_Info;
	permanent = FALSE;
	description = "Hledám někoho, kdo by mě mohl něčemu naučit.";
};


func int DIA_Hokurn_Learn_Condition()
{
	if(HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Learn_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_15_00");	//Hledám někoho, kdo by mě mohl něčemu naučit.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_01");	//Můžu ti ukázat pár věcí. Jsem nejlepší bojovník na míle daleko.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_02");	//Jelikož jsme přátelé, udělám ti zvláštní cenu. 300 zlatých.
	Info_ClearChoices(DIA_Hokurn_Learn);
	Info_AddChoice(DIA_Hokurn_Learn,"To je pro mě moc drahé.",DIA_Hokurn_Learn_TooExpensive);
	if(Npc_HasItems(other,ItMi_Gold) >= 300)
	{
		Info_AddChoice(DIA_Hokurn_Learn,"Dobrá, tady jsou peníze.",DIA_Hokurn_Learn_OK);
	};
};

func void DIA_Hokurn_Learn_TooExpensive()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_TooExpensive_15_00");	//To je pro mě moc drahé.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_01");	//Moc drahé? To je nejmíň, co by si na mém místě řekl kdokoli jiný.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_02");	//Přemýšlej o tom.
	Info_ClearChoices(DIA_Hokurn_Learn);
};

func void DIA_Hokurn_Learn_OK()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_OK_15_00");	//Dobrá, tady jsou peníze.
	B_GiveInvItems(other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Hokurn_Learn);
};


instance DIA_Hokurn_PayTeacher(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 6;
	condition = DIA_Hokurn_PayTeacher_Condition;
	information = DIA_Hokurn_PayTeacher_Info;
	permanent = TRUE;
	description = "Tady jsou peníze. Chci, abys mě učil.";
};


func int DIA_Hokurn_PayTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hokurn_Learn) && (Npc_HasItems(other,ItMi_Gold) >= 300) && (Hokurn_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_PayTeacher_Info()
{
	AI_Output(other,self,"DIA_Hokurn_PayTeacher_15_00");	//Tady jsou peníze. Chci, abys mě učil.
	AI_Output(self,other,"DIA_Hokurn_PayTeacher_01_01");	//Nebudeš litovat!
	B_GiveInvItems(other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
};


instance DIA_Hokurn_DrinkAndLearn(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = DIA_Hokurn_DrinkAndLearn_Condition;
	information = DIA_Hokurn_DrinkAndLearn_Info;
	permanent = TRUE;
	description = "Tady je pro tebe něco k pití.";
};


func int DIA_Hokurn_DrinkAndLearn_Condition()
{
	if((HokurnGetsDrink == TRUE) && ((Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1) || (Npc_HasItems(other,ItFo_Beer) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_DrinkAndLearn_Info()
{
	AI_Output(other,self,"DIA_Hokurn_DrinkAndLearn_15_00");	//Tady je pro tebe něco k pití.
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
		B_UseItem(self,ItFo_Booze);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
		B_UseItem(self,ItFo_Wine);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
		B_UseItem(self,ItFo_Beer);
	};
	HokurnLastDrink = Wld_GetDay();
	AI_Output(self,other,"DIA_Hokurn_DrinkAndLearn_01_01");	//Cítím se o moc líp. Jsem připraven na vše.
};


instance DIA_Hokurn_Teach(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = DIA_Hokurn_Teach_Condition;
	information = DIA_Hokurn_Teach_Info;
	permanent = TRUE;
	description = "Začněme s tréninkem.";
};


func int DIA_Hokurn_Teach_Condition()
{
	if(Hokurn_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Teach_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Teach_15_00");	//Začněme s tréninkem.
	if(HokurnLastDrink < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//Nejdřív mi přines něco k pití!
	}
	else
	{
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_02");	//Pak se uvidí, co můžeme dostat z těch tvejch zatuhlejch paladinskejch kostí, jasný?
		}
		else if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_03");	//Co ty víš. Dokonce i mágové používají chladné zbraně.
		};
		Info_ClearChoices(DIA_Hokurn_Teach);
		Info_AddChoice(DIA_Hokurn_Teach,Dialog_Back,DIA_Hokurn_Teach_Back);
		Info_AddChoice(DIA_Hokurn_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hokurn_Teach_2H_1);
		Info_AddChoice(DIA_Hokurn_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hokurn_Teach_2H_5);
		Info_AddChoice(DIA_Hokurn_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Hokurn_Teach_1H_1);
		Info_AddChoice(DIA_Hokurn_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Hokurn_Teach_1H_5);
	};
};

func void DIA_Hokurn_Teach_Back()
{
	Info_ClearChoices(DIA_Hokurn_Teach);
};

func void B_Hokurn_TeachedEnough()
{
	AI_Output(self,other,"B_Hokurn_TeachedEnough_01_00");	//Na tuhle disciplínu už nepotřebuješ žádnýho učitele.
};

func void DIA_Hokurn_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hokurn_Teach_2H_1);
};

func void DIA_Hokurn_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hokurn_Teach_2H_5);
};

func void DIA_Hokurn_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	if(other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Hokurn_Teach_1H_1);
	if((hero.HitChance[NPC_TALENT_1H] >= 60) && (hero.HitChance[NPC_TALENT_1H] <= 79))
	{
		AI_UnequipWeapons(hero);
	};
};

func void DIA_Hokurn_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	if(other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Hokurn_Teach_1H_5);
	if((hero.HitChance[NPC_TALENT_1H] >= 60) && (hero.HitChance[NPC_TALENT_1H] <= 79))
	{
		AI_UnequipWeapons(hero);
	};
};


instance DIA_HOKURN_TEACH2(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = dia_hokurn_teach2_condition;
	information = dia_hokurn_teach2_info;
	permanent = TRUE;
	description = "(Boj ze štítem. Požadavek: 30% jednoručních zbraní, cena: 5 VB)";
};


func int dia_hokurn_teach2_condition()
{
	if((Hokurn_TeachPlayer == TRUE) && (SCATTY_TEACH_PERM1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_hokurn_teach2_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Teach_15_00");	//Začněme s tréninkem.
	if(HokurnLastDrink < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//Nejdřív mi přines něco k pití!
	}
	else if((other.lp >= 5) && (Npc_GetTalentSkill(other,NPC_TALENT_1H) >= 1))
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


instance DIA_HOKURN_TEACH3(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = dia_hokurn_teach3_condition;
	information = dia_hokurn_teach3_info;
	permanent = TRUE;
	description = "(Pokročilý boj ze štítem. Požadavek: 60% jednoručních zbraní, cena: 10 VB)";
};


func int dia_hokurn_teach3_condition()
{
	if((Hokurn_TeachPlayer == TRUE) && (SCATTY_TEACH_PERM1 == TRUE) && (SCATTY_TEACH_PERM2 == FALSE))
	{
		return TRUE;
	};
};

func void dia_hokurn_teach3_info()
{
	AI_Output(other,self,"DIA_Keroloth_Teacher_15_00");	//Chci se učit!
	if(HokurnLastDrink < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//Nejdřív mi přines něco k pití!
	}
	else if((other.lp >= 10) && (Npc_GetTalentSkill(other,NPC_TALENT_1H) >= 2))
	{
		other.lp = other.lp - 10;
		SCATTY_TEACH_PERM2 = TRUE;
		AI_UnequipWeapons(hero);
		PrintScreen("Naučil ses: Pokročilý boj se štítem",-1,-1,FONT_Screen,3);
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_HOKURN_TEACH4(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = dia_hokurn_teach4_condition;
	information = dia_hokurn_teach4_info;
	permanent = TRUE;
	description = "(Mistrovský boj ze štítem. Požadavek: 90% jednoručních zbraní, cena: 15 VB)";
};


func int dia_hokurn_teach4_condition()
{
	if((Hokurn_TeachPlayer == TRUE) && (SCATTY_TEACH_PERM1 == TRUE) && (SCATTY_TEACH_PERM2 == TRUE) && (SCATTY_TEACH_PERM3 == FALSE))
	{
		return TRUE;
	};
};

func void dia_hokurn_teach4_info()
{
	AI_Output(other,self,"DIA_Keroloth_Teacher_15_00");	//Chci se učit! 
	if(HokurnLastDrink < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//Nejdřív mi přines něco k pití!
	}
	else if((other.lp >= 15) && (Npc_GetTalentSkill(other,NPC_TALENT_1H) >= 2))  
	{
		other.lp = other.lp - 15;
		SCATTY_TEACH_PERM3 = TRUE;
		AI_UnequipWeapons(hero);
		PrintScreen("Naučil ses: Mistrovsky boj se štítem",-1,-1,FONT_Screen,3);
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Hokurn_StayHere(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_StayHere_Condition;
	information = DIA_Hokurn_StayHere_Info;
	permanent = FALSE;
	description = "A co tady vlastně děláš?";
};


func int DIA_Hokurn_StayHere_Condition()
{
	if(HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_StayHere_Info()
{
	AI_Output(other,self,"DIA_Hokurn_StayHere_15_00");	//A co tady vlastně děláš?
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_01");	//Nemám tušení, proč jsme sem přišli, nebo kdy to začne.
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_02");	//A dokud mám co pít, ani se o to nestarám.
};


instance DIA_Hokurn_WhereDragon(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_WhereDragon_Condition;
	information = DIA_Hokurn_WhereDragon_Info;
	permanent = TRUE;
	description = "Tak víš, kde ty draci jsou?";
};


func int DIA_Hokurn_WhereDragon_Condition()
{
	if((HokurnGetsDrink == TRUE) && (HokurnTellsDragon == FALSE) && Npc_KnowsInfo(other,DIA_Hokurn_StayHere))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_WhereDragon_Info()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_15_00");	//Tak víš, kde ty draci jsou?
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_01_01");	//Co z toho budu mít, když ti to řeknu?
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"Nic, vydám se za nima sám.",DIA_Hokurn_WhereDragon_FindMyself);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"Jsem ochoten ti za tu informaci zaplatit.",DIA_Hokurn_WhereDragon_Gold);
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon,"Ještě tu mám láhev ginu!",DIA_Hokurn_WhereDragon_Booze);
	};
};

func void DIA_Hokurn_WhereDragon_FindMyself()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_FindMyself_15_00");	//Nic, vydám se za nima sám.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_FindMyself_01_01");	//Měl by sis dávat pozor. Čeká tě spousta bojů.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_Gold()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Gold_15_00");	//Jsem ochoten ti za tu informaci zaplatit.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Gold_01_01");	//Zaplatit mi? Hmm. Za 200 zlatých ti to povím.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"To je moc!",DIA_Hokurn_WhereDragon_TooMuch);
	if(Npc_HasItems(other,ItMi_Gold) >= 200)
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon,"Tady jsou peníze!",DIA_Hokurn_WhereDragon_OK);
	};
};

func void DIA_Hokurn_WhereDragon_TooMuch()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_TooMuch_15_00");	//To je moc!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_TooMuch_01_01");	//Tak to na to zapomeň.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_OK()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_OK_15_00");	//Tady jsou peníze!
	B_GiveInvItems(other,self,ItMi_Gold,200);
	HokurnTellsDragon = TRUE;
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_Booze()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Booze_15_00");	//Ještě tu mám láhev ginu!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_01");	//Za pořádnou pitku bych zabil všechny draky světa.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_02");	//Souhlas. Dej sem tu láhev!
	B_GiveInvItems(other,self,ItFo_Booze,1);
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_03");	//Schovám si ji na horší časy.
	HokurnTellsDragon = TRUE;
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};


instance DIA_Hokurn_Dragon(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Dragon_Condition;
	information = DIA_Hokurn_Dragon_Info;
	permanent = TRUE;
	description = "Dobrá, tak kde jsou ti draci?";
};


func int DIA_Hokurn_Dragon_Condition()
{
	if(HokurnTellsDragon == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Dragon_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Dragon_15_00");	//Dobrá, tak kde jsou ti draci?
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_01");	//Přirozeně ti to neřeknu úplně přesně, ale slyšel jsem, že by tu měli být celkem čtyři.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_02");	//V noci jsme zahlédli nad nejvyšší horou rudou záři.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_03");	//Přísahám na hrob mé matky, pokud hledáš draka, tak když nikde jinde, tam ho určitě najdeš.
};


instance DIA_Hokurn_AllDragonsDead(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_AllDragonsDead_Condition;
	information = DIA_Hokurn_AllDragonsDead_Info;
	permanent = TRUE;
	description = "Zabil jsem všechny draky.";
};


func int DIA_Hokurn_AllDragonsDead_Condition()
{
	if(MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Hokurn_AllDragonsDead_15_00");	//Zabil jsem všechny draky.
	AI_Output(self,other,"DIA_Hokurn_AllDragonsDead_01_01");	//Udělej si výlet a vyprávěj své pohádky někomu jinému.
};


instance DIA_Hokurn_PICKPOCKET(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 900;
	condition = DIA_Hokurn_PICKPOCKET_Condition;
	information = DIA_Hokurn_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Hokurn_PICKPOCKET_Condition()
{
	return C_Beklauen(69,210);
};

func void DIA_Hokurn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
	Info_AddChoice(DIA_Hokurn_PICKPOCKET,Dialog_Back,DIA_Hokurn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hokurn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hokurn_PICKPOCKET_DoIt);
};

func void DIA_Hokurn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
};

func void DIA_Hokurn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
};

