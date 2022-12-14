
instance DIA_Edda_EXIT(C_Info)
{
	npc = VLK_471_Edda;
	nr = 999;
	condition = DIA_Edda_EXIT_Condition;
	information = DIA_Edda_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Edda_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Edda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Edda_Hallo(C_Info)
{
	npc = VLK_471_Edda;
	nr = 2;
	condition = DIA_Edda_Hallo_Condition;
	information = DIA_Edda_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Edda_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Edda_Hallo_Info()
{
	AI_Output(other,self,"DIA_Edda_Hallo_15_00");	//Co to tady va????
	AI_Output(self,other,"DIA_Edda_Hallo_17_01");	//Ryb? pol?vku. Nen? to ??dn? delikatesa, ale alespo? je hork?.
	AI_Output(self,other,"DIA_Edda_Hallo_17_02");	//M??e? ochutnat jeden tal??, jestli m?? z?jem.
};


instance DIA_Edda_Stadt(C_Info)
{
	npc = VLK_471_Edda;
	nr = 5;
	condition = DIA_Edda_Stadt_Condition;
	information = DIA_Edda_Stadt_Info;
	permanent = FALSE;
	description = "Co mi m??e? ??ct o m?st??";
};


func int DIA_Edda_Stadt_Condition()
{
	return TRUE;
};

func void DIA_Edda_Stadt_Info()
{
	AI_Output(other,self,"DIA_Edda_Stadt_15_00");	//Co mi m??e? ??ct o m?st??
	AI_Output(self,other,"DIA_Edda_Stadt_17_01");	//V?t?ina ob?an? tohodle m?sta se boj? zlod?j?. Proto nen? zrovna dobrej n?pad chodit do ciz?ch dom?.
	AI_Output(self,other,"DIA_Edda_Stadt_17_02");	//Ale jestli hled?? m?sto, kde bys p?e?kal noc, m??e? se vyspat v m? chatr?i. Je tam jedna postel nav?c, kter? m??e bejt tvoje.
	AI_Output(other,self,"DIA_Edda_Stadt_15_03");	//Nem?? strach ze zlod?j??
	AI_Output(self,other,"DIA_Edda_Stadt_17_04");	//Jedinou cennou v?c, kterou jsem kdy vlastnila, mi u? stejn? ukradli.
	AI_Output(self,other,"DIA_Edda_Stadt_17_05");	//N?kdo mi ukradl Innosovu so?ku.
	Edda_Schlafplatz = TRUE;
	Wld_AssignRoomToGuild("hafen08",GIL_NONE);
};


instance DIA_Edda_Kochen(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Kochen_Condition;
	information = DIA_Edda_Kochen_Info;
	permanent = FALSE;
	description = "M??e? mi uva?it trochu pol?vky?";
};


func int DIA_Edda_Kochen_Condition()
{
	return TRUE;
};

func void DIA_Edda_Kochen_Info()
{
	AI_Output(other,self,"DIA_Edda_Kochen_15_00");	//M??e? mi uva?it trochu pol?vky?
	AI_Output(self,other,"DIA_Edda_Kochen_17_01");	//Uva??m ka?d?mu. Tob? taky, jestli chce?. Jedin?, co mus?? ud?lat, je p?in?st mi rybu.
};


instance DIA_Edda_Suppe(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Suppe_Condition;
	information = DIA_Edda_Suppe_Info;
	permanent = TRUE;
	description = "M??e? mi uva?it trochu pol?vky?";
};


func int DIA_Edda_Suppe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Kochen))
	{
		return TRUE;
	};
};

func void DIA_Edda_Suppe_Info()
{
	AI_Output(other,self,"DIA_Edda_Suppe_15_00");	//M??e? mi uva?it trochu pol?vky?
	if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_02");	//Od z?t?ka m??e? kdykoli p?ij?t a dostat svou pol?vku.
	}
	else if(Edda_Day != Wld_GetDay())
	{
		if(B_GiveInvItems(other,self,ItFo_Fish,1))
		{
			AI_Output(self,other,"DIA_Edda_Suppe_17_01");	//Nem??e b?t nic snaz??ho. Tady, vezmi si tal??.
			B_GiveInvItems(self,other,ItFo_FishSoup,1);
			Edda_Day = Wld_GetDay();
		}
		else
		{
			AI_Output(self,other,"DIA_Edda_Suppe_17_04");	//P?ines mi n?jakou rybu a j? ti uva??m chutnou pol?vku.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_03");	//Ne, dneska ne. Vra? se z?tra.
	};
};


instance DIA_EDDA_TEACH(C_Info)
{
	npc = VLK_471_Edda;
	nr = 5;
	condition = dia_edda_teach_condition;
	information = dia_edda_teach_info;
	permanent = 0;
	description = "M??e? m? nau?it n?co o va?en??";
};


func int dia_edda_teach_condition()
{
	return TRUE;
};

func void dia_edda_teach_info()
{
	AI_Output(other,self,"DIA_Edda_teach_15_00");	//M??e? m? nau?it n?co o va?en??
	AI_Output(self,other,"DIA_Edda_teach_01_01");	//Nau??m t? sv?j recept na p??pravu ryb? pol?vky.
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry(TOPIC_COOK,"Edda m? m??e v p??stavn? ?tvrti nau?it va?it.");
};


instance DIA_EDDA_LEARN(C_Info)
{
	npc = VLK_471_Edda;
	nr = 3;
	condition = dia_edda_learn_condition;
	information = dia_edda_learn_info;
	permanent = 1;
	description = "Ryb? pol?vka (cena: 1 VB)";
};


func int dia_edda_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_edda_teach) && (KNOWS_FISHSOUP == FALSE))
	{
		return TRUE;
	};
};

func void dia_edda_learn_info()
{
	AI_Output(other,self,"DIA_Edda_Learn_15_00");	//Nau? m? va?it Ryb? pol?vku.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Edda_Learn_12_01");	//Za?ni t?m, ?e d?? va?it vodu a vlo??? do hrnce 2 ryby a zeleninu.
		AI_Output(self,other,"DIA_Edda_Learn_12_02");	//Jakmile se za?ne va?it, je d?le?it? aby jsi sm?s po??d m?chal a dochutil.
		AI_Output(self,other,"DIA_Edda_Learn_12_04");	//A? bude pol?vka hotov? pozn?? to d?ky jeh? v?ni.
		Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
		B_LogEntry(TOPIC_COOK,"Um?m uva?it: Ryb? pol?vku.");
		B_LogEntry(TOPIC_COOK,"Ingredience jsou: 2 kusy Ryb.");
		KNOWS_FISHSOUP = TRUE;
		PrintScreen("Nau?il ses uva?it: Ryb? pol?vka",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek v?domostn?ch bod?!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Edda_Statue(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Statue_Condition;
	information = DIA_Edda_Statue_Info;
	permanent = FALSE;
	description = "Hele, m?m pro tebe Innosovu so?ku.";
};


func int DIA_Edda_Statue_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Stadt) && (Npc_HasItems(other,ItMi_InnosStatue) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Edda_Statue_Info()
{
	AI_Output(other,self,"DIA_Edda_Statue_15_00");	//Hele, m?m pro tebe Innosovu so?ku.
	AI_Output(self,other,"DIA_Edda_Statue_17_01");	//? - d?ky moc mockr?t. A? nad tebou Innos dr?? sv? ochrann? sv?tlo.
	AI_Output(other,self,"DIA_Edda_Statue_15_02");	//Jo, klidn?.
	B_GiveInvItems(other,self,ItMi_InnosStatue,1);
	B_GivePlayerXP(XP_Edda_Statue);
};


instance DIA_Edda_PICKPOCKET(C_Info)
{
	npc = VLK_471_Edda;
	nr = 900;
	condition = DIA_Edda_PICKPOCKET_Condition;
	information = DIA_Edda_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Jej? so?ku by dok?zalo ukr?st i mal? d?cko po obrn?.)";
};


func int DIA_Edda_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItMi_EddasStatue) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Edda_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Edda_PICKPOCKET);
	Info_AddChoice(DIA_Edda_PICKPOCKET,Dialog_Back,DIA_Edda_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Edda_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Edda_PICKPOCKET_DoIt);
};

func void DIA_Edda_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems(self,other,ItMi_EddasStatue,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Edda_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Edda_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Edda_PICKPOCKET);
};

