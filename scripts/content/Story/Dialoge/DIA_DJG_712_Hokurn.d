
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
	AI_Output(self,other,"DIA_Hokurn_Hello_01_00");	//Nem?? n?co k pit??
	AI_Output(other,self,"DIA_Hokurn_Hello_15_01");	//A asi to nem? b?t voda, co?
	AI_Output(self,other,"DIA_Hokurn_Hello_01_02");	//To teda ne, ksakru!! Pot?ebuju n?jakej alkohol, abych se kone?n? zbavil toho zatracen?ho bolehlavu.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_03");	//Jestli se brzo n??eho nenapiju, nejsp?? mi pukne hlava.
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,"Pokus?m se n?co obstarat.",DIA_Hokurn_Hello_No);
	if((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1))
	{
		Info_AddChoice(DIA_Hokurn_Hello,"Tady, vezmi si tohle.",DIA_Hokurn_Hello_Yes);
	};
};

func void DIA_Hokurn_Hello_No()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_No_15_00");	//Nem?m nic, co bych ti mohl d?t.
	AI_Output(self,other,"DIA_Hokurn_Hello_No_01_01");	//Tak zmizni!
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,Dialog_Ende,DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello,"Je?t? jedna v?c ...",DIA_Hokurn_Hello_ASK1);
};

func void DIA_Hokurn_Hello_ASK1()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK1_15_00");	//Je?t? jedna v?c...
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK1_01_01");	//(povzdech) Tys mi nerozum?l? VYPADNI!!!
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,Dialog_Ende,DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello,"Je to d?le?it?.",DIA_Hokurn_Hello_ASK2);
};

func void DIA_Hokurn_Hello_ASK2()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK2_15_00");	//Je to d?le?it?.
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK2_01_01");	//(povzdech) ?ekl sis o to.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Hokurn_Hello_END()
{
	AI_StopProcessInfos(self);
};

func void B_Hokurn_Sauf()
{
	AI_Output(self,other,"B_Hokurn_Sauf_01_00");	//(??hnut?) Ha, tohle jsem pot?eboval.
	AI_Output(self,other,"B_Hokurn_Sauf_01_01");	//Te? m??u znova myslet s ?istou hlavou. Co pro tebe m??u ud?lat?
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
	description = "Tady m?? n?co k pit?.";
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
	AI_Output(other,self,"DIA_Hokurn_Drink_15_00");	//Tady m?? n?co k pit?.
	AI_Output(self,other,"DIA_Hokurn_Drink_01_01");	//(dychtiv?) Dej to sem!!
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
	description = "Pot?ebuju n?jak? informace.";
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
	AI_Output(other,self,"DIA_Hokurn_Question_15_00");	//Pot?ebuju n?jak? informace.
	AI_Output(self,other,"DIA_Hokurn_Question_01_01");	//(otr?ven?) M?l jsem dojem, ?e jsme si rozum?li. Mluv?m jen s p??teli.
	AI_Output(self,other,"DIA_Hokurn_Question_01_02");	//A p??tel? ti nab?dnou n?co k pit?. Jasn?? Te? odpal!
};


instance DIA_Hokurn_Learn(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 6;
	condition = DIA_Hokurn_Learn_Condition;
	information = DIA_Hokurn_Learn_Info;
	permanent = FALSE;
	description = "Hled?m n?koho, kdo by m? mohl n??emu nau?it.";
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
	AI_Output(other,self,"DIA_Hokurn_Learn_15_00");	//Hled?m n?koho, kdo by m? mohl n??emu nau?it.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_01");	//M??u ti uk?zat p?r v?c?. Jsem nejlep?? bojovn?k na m?le daleko.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_02");	//Jeliko? jsme p??tel?, ud?l?m ti zvl??tn? cenu. 300 zlat?ch.
	Info_ClearChoices(DIA_Hokurn_Learn);
	Info_AddChoice(DIA_Hokurn_Learn,"To je pro m? moc drah?.",DIA_Hokurn_Learn_TooExpensive);
	if(Npc_HasItems(other,ItMi_Gold) >= 300)
	{
		Info_AddChoice(DIA_Hokurn_Learn,"Dobr?, tady jsou pen?ze.",DIA_Hokurn_Learn_OK);
	};
};

func void DIA_Hokurn_Learn_TooExpensive()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_TooExpensive_15_00");	//To je pro m? moc drah?.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_01");	//Moc drah?? To je nejm??, co by si na m?m m?st? ?ekl kdokoli jin?.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_02");	//P?em??lej o tom.
	Info_ClearChoices(DIA_Hokurn_Learn);
};

func void DIA_Hokurn_Learn_OK()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_OK_15_00");	//Dobr?, tady jsou pen?ze.
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
	description = "Tady jsou pen?ze. Chci, abys m? u?il.";
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
	AI_Output(other,self,"DIA_Hokurn_PayTeacher_15_00");	//Tady jsou pen?ze. Chci, abys m? u?il.
	AI_Output(self,other,"DIA_Hokurn_PayTeacher_01_01");	//Nebude? litovat!
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
	description = "Tady je pro tebe n?co k pit?.";
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
	AI_Output(other,self,"DIA_Hokurn_DrinkAndLearn_15_00");	//Tady je pro tebe n?co k pit?.
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
	AI_Output(self,other,"DIA_Hokurn_DrinkAndLearn_01_01");	//C?t?m se o moc l?p. Jsem p?ipraven na v?e.
};


instance DIA_Hokurn_Teach(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = DIA_Hokurn_Teach_Condition;
	information = DIA_Hokurn_Teach_Info;
	permanent = TRUE;
	description = "Za?n?me s tr?ninkem.";
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
	AI_Output(other,self,"DIA_Hokurn_Teach_15_00");	//Za?n?me s tr?ninkem.
	if(HokurnLastDrink < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//Nejd??v mi p?ines n?co k pit?!
	}
	else
	{
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_02");	//Pak se uvid?, co m??eme dostat z t?ch tvejch zatuhlejch paladinskejch kost?, jasn??
		}
		else if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_03");	//Co ty v??. Dokonce i m?gov? pou??vaj? chladn? zbran?.
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
	AI_Output(self,other,"B_Hokurn_TeachedEnough_01_00");	//Na tuhle discipl?nu u? nepot?ebuje? ??dn?ho u?itele.
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
	description = "(Boj ze ?t?tem. Po?adavek: 35% jednoru?n?ch zbran?, cena: 5 VB)";
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
	AI_Output(other,self,"DIA_Wulfgar_Teach_15_00");	//Za?n?me s tr?ninkem.
	if(HokurnLastDrink < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//Nejd??v mi p?ines n?co k pit?!
	}
	else if((other.lp >= 5) && (hero.aivar[REAL_TALENT_1H] >= 35))
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


instance DIA_HOKURN_TEACH3(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = dia_hokurn_teach3_condition;
	information = dia_hokurn_teach3_info;
	permanent = TRUE;
	description = "(Pokro?il? boj ze ?t?tem. Po?adavek: 65% jednoru?n?ch zbran?, cena: 10 VB)";
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
	AI_Output(other,self,"DIA_Keroloth_Teacher_15_00");	//Chci se u?it!
	if(HokurnLastDrink < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//Nejd??v mi p?ines n?co k pit?!
	}
	else if((other.lp >= 10) && (hero.aivar[REAL_TALENT_1H] >= 65))
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


instance DIA_HOKURN_TEACH4(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = dia_hokurn_teach4_condition;
	information = dia_hokurn_teach4_info;
	permanent = TRUE;
	description = "(Mistrovsk? boj ze ?t?tem. Po?adavek: 90% jednoru?n?ch zbran?, cena: 15 VB)";
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
	AI_Output(other,self,"DIA_Keroloth_Teacher_15_00");	//Chci se u?it!
	if(HokurnLastDrink < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//Nejd??v mi p?ines n?co k pit?!
	}
	else if((other.lp >= 15) && (hero.aivar[REAL_TALENT_1H] >= 90))
	{
		other.lp = other.lp - 15;
		SCATTY_TEACH_PERM3 = TRUE;
		AI_UnequipWeapons(hero);
		PrintScreen("Nau?il ses: Mistrovsky boj se ?t?tem",-1,-1,FONT_Screen,3);
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
	description = "A co tady vlastn? d?l???";
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
	AI_Output(other,self,"DIA_Hokurn_StayHere_15_00");	//A co tady vlastn? d?l???
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_01");	//Nem?m tu?en?, pro? jsme sem p?i?li, nebo kdy to za?ne.
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_02");	//A dokud m?m co p?t, ani se o to nestar?m.
};


instance DIA_Hokurn_WhereDragon(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_WhereDragon_Condition;
	information = DIA_Hokurn_WhereDragon_Info;
	permanent = TRUE;
	description = "Tak v??, kde ty draci jsou?";
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
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_15_00");	//Tak v??, kde ty draci jsou?
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_01_01");	//Co z toho budu m?t, kdy? ti to ?eknu?
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"Nic, vyd?m se za nima s?m.",DIA_Hokurn_WhereDragon_FindMyself);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"Jsem ochoten ti za tu informaci zaplatit.",DIA_Hokurn_WhereDragon_Gold);
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon,"Je?t? tu m?m l?hev ginu!",DIA_Hokurn_WhereDragon_Booze);
	};
};

func void DIA_Hokurn_WhereDragon_FindMyself()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_FindMyself_15_00");	//Nic, vyd?m se za nima s?m.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_FindMyself_01_01");	//M?l by sis d?vat pozor. ?ek? t? spousta boj?.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_Gold()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Gold_15_00");	//Jsem ochoten ti za tu informaci zaplatit.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Gold_01_01");	//Zaplatit mi? Hmm. Za 200 zlat?ch ti to pov?m.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"To je moc!",DIA_Hokurn_WhereDragon_TooMuch);
	if(Npc_HasItems(other,ItMi_Gold) >= 200)
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon,"Tady jsou pen?ze!",DIA_Hokurn_WhereDragon_OK);
	};
};

func void DIA_Hokurn_WhereDragon_TooMuch()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_TooMuch_15_00");	//To je moc!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_TooMuch_01_01");	//Tak to na to zapome?.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_OK()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_OK_15_00");	//Tady jsou pen?ze!
	B_GiveInvItems(other,self,ItMi_Gold,200);
	HokurnTellsDragon = TRUE;
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_Booze()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Booze_15_00");	//Je?t? tu m?m l?hev ginu!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_01");	//Za po??dnou pitku bych zabil v?echny draky sv?ta.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_02");	//Souhlas. Dej sem tu l?hev!
	B_GiveInvItems(other,self,ItFo_Booze,1);
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_03");	//Schov?m si ji na hor?? ?asy.
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
	description = "Dobr?, tak kde jsou ti draci?";
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
	AI_Output(other,self,"DIA_Hokurn_Dragon_15_00");	//Dobr?, tak kde jsou ti draci?
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_01");	//P?irozen? ti to ne?eknu ?pln? p?esn?, ale sly?el jsem, ?e by tu m?li b?t celkem ?ty?i.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_02");	//V noci jsme zahl?dli nad nejvy??? horou rudou z??i.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_03");	//P??sah?m na hrob m? matky, pokud hled?? draka, tak kdy? nikde jinde, tam ho ur?it? najde?.
};


instance DIA_Hokurn_AllDragonsDead(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_AllDragonsDead_Condition;
	information = DIA_Hokurn_AllDragonsDead_Info;
	permanent = TRUE;
	description = "Zabil jsem v?echny draky.";
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
	AI_Output(other,self,"DIA_Hokurn_AllDragonsDead_15_00");	//Zabil jsem v?echny draky.
	AI_Output(self,other,"DIA_Hokurn_AllDragonsDead_01_01");	//Ud?lej si v?let a vypr?v?j sv? poh?dky n?komu jin?mu.
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

