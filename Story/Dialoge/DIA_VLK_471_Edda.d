
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
	AI_Output(other,self,"DIA_Edda_Hallo_15_00");	//Co to tady vaříš?
	AI_Output(self,other,"DIA_Edda_Hallo_17_01");	//Rybí polívku. Není to žádná delikatesa, ale alespoň je horká.
	AI_Output(self,other,"DIA_Edda_Hallo_17_02");	//Můžeš ochutnat jeden talíř, jestli máš zájem.
};


instance DIA_Edda_Stadt(C_Info)
{
	npc = VLK_471_Edda;
	nr = 5;
	condition = DIA_Edda_Stadt_Condition;
	information = DIA_Edda_Stadt_Info;
	permanent = FALSE;
	description = "Co mi můžeš říct o městě?";
};


func int DIA_Edda_Stadt_Condition()
{
	return TRUE;
};

func void DIA_Edda_Stadt_Info()
{
	AI_Output(other,self,"DIA_Edda_Stadt_15_00");	//Co mi můžeš říct o městě?
	AI_Output(self,other,"DIA_Edda_Stadt_17_01");	//Většina občanů tohodle města se bojí zlodějů. Proto není zrovna dobrej nápad chodit do cizích domů.
	AI_Output(self,other,"DIA_Edda_Stadt_17_02");	//Ale jestli hledáš místo, kde bys přečkal noc, můžeš se vyspat v mé chatrči. Je tam jedna postel navíc, která může bejt tvoje.
	AI_Output(other,self,"DIA_Edda_Stadt_15_03");	//Nemáš strach ze zlodějů?
	AI_Output(self,other,"DIA_Edda_Stadt_17_04");	//Jedinou cennou věc, kterou jsem kdy vlastnila, mi už stejně ukradli.
	AI_Output(self,other,"DIA_Edda_Stadt_17_05");	//Někdo mi ukradl Innosovu sošku.
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
	description = "Můžeš mi uvařit trochu polévky?";
};


func int DIA_Edda_Kochen_Condition()
{
	return TRUE;
};

func void DIA_Edda_Kochen_Info()
{
	AI_Output(other,self,"DIA_Edda_Kochen_15_00");	//Můžeš mi uvařit trochu polévky?
	AI_Output(self,other,"DIA_Edda_Kochen_17_01");	//Uvařím každému. Tobě taky, jestli chceš. Jediný, co musíš udělat, je přinýst mi rybu.
};


instance DIA_Edda_Suppe(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Suppe_Condition;
	information = DIA_Edda_Suppe_Info;
	permanent = TRUE;
	description = "Můžeš mi uvařit trochu polévky?";
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
	AI_Output(other,self,"DIA_Edda_Suppe_15_00");	//Můžeš mi uvařit trochu polévky?
	if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_02");	//Od zítřka můžeš kdykoli přijít a dostat svou polívku.
	}
	else if(Edda_Day != Wld_GetDay())
	{
		if(B_GiveInvItems(other,self,ItFo_Fish,1))
		{
			AI_Output(self,other,"DIA_Edda_Suppe_17_01");	//Nemůže být nic snazšího. Tady, vezmi si talíř.
			B_GiveInvItems(self,other,ItFo_FishSoup,1);
			Edda_Day = Wld_GetDay();
		}
		else
		{
			AI_Output(self,other,"DIA_Edda_Suppe_17_04");	//Přines mi nějakou rybu a já ti uvařím chutnou polívku.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_03");	//Ne, dneska ne. Vrať se zítra.
	};
};


instance DIA_EDDA_TEACH(C_Info)
{
	npc = VLK_471_Edda;
	nr = 5;
	condition = dia_edda_teach_condition;
	information = dia_edda_teach_info;
	permanent = 0;
	description = "Můžeš mě naučit něco o vaření?";
};


func int dia_edda_teach_condition()
{
	return TRUE;
};

func void dia_edda_teach_info()
{
	AI_Output(other,self,"DIA_Edda_teach_15_00");	//Můžeš mě naučit něco o vaření?
	AI_Output(self,other,"DIA_Edda_teach_01_01");	//Naučím tě svůj recept na přípravu rybí polévky.
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry(TOPIC_COOK,"Edda mě může v přístavní čtvrti naučit vařit.");
};


instance DIA_EDDA_LEARN(C_Info)
{
	npc = VLK_471_Edda;
	nr = 3;
	condition = dia_edda_learn_condition;
	information = dia_edda_learn_info;
	permanent = 1;
	description = "Rybí polévka (cena: 1 VB)";
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
	AI_Output(other,self,"DIA_Edda_Learn_15_00");	//Nauč mě vařit Rybí polévku.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Edda_Learn_12_01");	//Začni tím, že dáš vařit vodu a vložíš do hrnce 2 ryby a zeleninu.
		AI_Output(self,other,"DIA_Edda_Learn_12_02");	//Jakmile se začne vařit, je důležité aby jsi směs pořád míchal a dochutil.
		AI_Output(self,other,"DIA_Edda_Learn_12_04");	//Až bude polévka hotová poznáš to díky jehí vůni.
		Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
		B_LogEntry(TOPIC_COOK,"Umím uvařit: Rybí polévku.");
		B_LogEntry(TOPIC_COOK,"Ingredience jsou: 2 kusy Ryb.");
		KNOWS_FISHSOUP = TRUE;
		PrintScreen("Naučil ses uvařit: Rybí polévka",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
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
	description = "Hele, mám pro tebe Innosovu sošku.";
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
	AI_Output(other,self,"DIA_Edda_Statue_15_00");	//Hele, mám pro tebe Innosovu sošku.
	AI_Output(self,other,"DIA_Edda_Statue_17_01");	//Ó - díky moc mockrát. Ať nad tebou Innos drží své ochranné světlo.
	AI_Output(other,self,"DIA_Edda_Statue_15_02");	//Jo, klidně.
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
	description = "(Její sošku by dokázalo ukrást i malé děcko po obrně.)";
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

