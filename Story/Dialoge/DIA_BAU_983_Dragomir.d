
instance DIA_Dragomir_EXIT(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 999;
	condition = DIA_Dragomir_EXIT_Condition;
	information = DIA_Dragomir_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragomir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dragomir_Hello(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = DIA_Dragomir_Hello_Condition;
	information = DIA_Dragomir_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragomir_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragomir_Hello_12_00");	//Co tak daleko od domova?
	AI_Output(self,other,"DIA_Dragomir_Hello_12_01");	//Tady musíš být opatrný, zvlášť, když se můžeš spolehnout jen sám na sebe.
};


instance DIA_Dragomir_OutHere(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_OutHere_Condition;
	information = DIA_Dragomir_OutHere_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Dragomir_OutHere_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_OutHere_Info()
{
	AI_Output(other,self,"DIA_Dragomir_OutHere_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_01");	//No, hostinec je pro mě příliš drahý, tak jsem se utábořil tady.
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_02");	//Vypadá to, že dřívější obyvatelé už to tu nepotřebují.
};


instance DIA_Dragomir_Settlers(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Settlers_Condition;
	information = DIA_Dragomir_Settlers_Info;
	permanent = FALSE;
	description = "Kdo tenhle tábor dřív využíval?";
};


func int DIA_Dragomir_Settlers_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Settlers_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Settlers_15_00");	//Kdo tenhle tábor dřív využíval?
	AI_Output(self,other,"DIA_Dragomir_Settlers_12_01");	//Nemám tušení, asi nějací lovci. Předpokládám, že to tu pro ně začalo být příliš nebezpečné.
};


instance DIA_Dragomir_Dangerous(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Dangerous_Condition;
	information = DIA_Dragomir_Dangerous_Info;
	permanent = FALSE;
	description = "Není to tu příliš nebezpečné?";
};


func int DIA_Dragomir_Dangerous_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Dangerous_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_00");	//Není to tu příliš nebezpečné?
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_01");	//No, ne, když se dokážeš bránit. Moje kuše už mi mnohokrát prokázala neocenitelné služby.
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_02");	//Ta ale není moc velká.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_03");	//Ale stačí. Když víš, jak s ní zacházet. Míval jsem větší. Bohužel jsem ji však ztratil.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_04");	//Dostal jsem se do hor daleko na severu. Je tam kruh monolitů s obětním oltářem.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_05");	//Když jsem tam lovil mrchožrouty, začali z lesa vylézat ti odporní nemrtví a napadli mě.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_06");	//Jediné, co jsem mohl dělat, bylo vzít nohy na ramena.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_07");	//Jak jsem utíkal, vyklouzla mi ta kuše z rukou. Vsadím se, že se tam ještě pořád u toho podivného kamenného kruhu na severu někde povaluje.
	Log_CreateTopic(TOPIC_DragomirsArmbrust,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust,LOG_Running);
	B_LogEntry(TOPIC_DragomirsArmbrust,"V podivném kamenném kruhu vysoko v horách na severu ztratil Dragomir kuši.");
	MIS_DragomirsArmbrust = LOG_Running;
};


instance DIA_Dragomir_Armbrust(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Armbrust_Condition;
	information = DIA_Dragomir_Armbrust_Info;
	permanent = FALSE;
	description = "Tady. Našel jsem tvou kuši.";
};


func int DIA_Dragomir_Armbrust_Condition()
{
	if((MIS_DragomirsArmbrust == LOG_Running) && Npc_HasItems(other,ItRw_DragomirsArmbrust_MIS))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Armbrust_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_00");	//Tady. Našel jsem tvou kuši.
	B_GiveInvItems(other,self,ItRw_DragomirsArmbrust_MIS,1);
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_01");	//Opravdu, je to ta moje. Neříkej, žes byl tam nahoře u kamenného kruhu?!
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_02");	//To si piš!
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_03");	//To od tebe byla pěkná lehkovážnost. Ale jinak díky.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_04");	//Samozřejmě ti za ni zaplatím. Doufám, že tohle bude stačit.
	AI_Output(self,other,"DIA_Dragomir_Armbrust11_12_04");	//A pokud budeš chtít můžu tě naučit zakladní výrobu luků.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	MIS_DragomirsArmbrust = LOG_SUCCESS;
	Log_CreateTopic(TOPIC_BOWHUNT,LOG_NOTE);
	B_LogEntry(TOPIC_BOWHUNT,"Dragomir mě může naučit základní výrobu luků.");
	B_GivePlayerXP(XP_DragomirsArmbrust);
};


var int Dragomir_TeachPlayer;
const int Dragomir_TeachingCost = 150;

instance DIA_Dragomir_Learn(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Learn_Condition;
	information = DIA_Dragomir_Learn_Info;
	permanent = TRUE;
	description = "Můžeš mě něčemu naučit?";
};


func int DIA_Dragomir_Learn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragomir_Dangerous) && (Dragomir_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Learn_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_15_00");	//Můžeš mě něčemu naučit?
	if(other.attribute[ATR_DEXTERITY] < 30)
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_01");	//Než tě budu moct začít cokoli učit, musíš nejprve posílit svoji obratnost.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_02");	//Jestli na to máš. Jak už jsem řekl, právě se mi poněkud nedostává hotovosti.
		AI_Output(other,self,"DIA_Dragomir_Learn_15_03");	//Kolik chceš?
		B_Say_Gold(self,other,Dragomir_TeachingCost);
		Info_ClearChoices(DIA_Dragomir_Learn);
		Info_AddChoice(DIA_Dragomir_Learn,"Možná později.",DIA_Dragomir_Learn_Later);
		if(Npc_HasItems(other,ItMi_Gold) >= Dragomir_TeachingCost)
		{
			Info_AddChoice(DIA_Dragomir_Learn,"Tady je zlato.",DIA_Dragomir_Learn_Here);
		};
	};
};

func void DIA_Dragomir_Learn_Later()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Later_15_00");	//Možná později.
	Info_ClearChoices(DIA_Dragomir_Learn);
};

func void DIA_Dragomir_Learn_Here()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Here_15_00");	//Tady je zlato.
	B_GiveInvItems(other,self,ItMi_Gold,Dragomir_TeachingCost);
	AI_Output(self,other,"DIA_Dragomir_Learn_Here_12_01");	//Výborně, jestli se nemýlím, můžeme hned začít.
	Dragomir_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Dragomir_Learn);
};


var int DIA_Dragomir_Teach_permanent;

instance DIA_Dragomir_Teach(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Teach_Condition;
	information = DIA_Dragomir_Teach_Info;
	permanent = TRUE;
	description = "Můžeš mě něčemu naučit?";
};


func int DIA_Dragomir_Teach_Condition()
{
	if((Dragomir_TeachPlayer == TRUE) && (DIA_Dragomir_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Teach_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Teach_15_00");	//Můžeš mě něčemu naučit?
	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Dragomir_Teach_1H_1);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),DIA_Dragomir_Teach_1H_5);
};

func void DIA_Dragomir_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00");	//Už tě nemám čemu učit. Je načase, aby sis našel někoho zkušenějšího.
		DIA_Dragomir_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Dragomir_Teach);
};

func void DIA_Dragomir_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,75);
	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Dragomir_Teach_1H_1);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),DIA_Dragomir_Teach_1H_5);
};

func void DIA_Dragomir_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,75);
	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Dragomir_Teach_1H_1);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),DIA_Dragomir_Teach_1H_5);
};


instance DIA_DRAGOMIR_LEARNBOW1(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 3;
	condition = dia_dragomir_learnbow1_condition;
	information = dia_dragomir_learnbow1_info;
	permanent = TRUE;
	description = "Zakladní výroba  (cena: 5 VB, 500 zlatých)";
};


func int dia_dragomir_learnbow1_condition()
{
	if((MIS_DragomirsArmbrust == LOG_SUCCESS) && (KNOWS_BOWSCROLLSI == FALSE))
	{
		return TRUE;
	};
};

func void dia_dragomir_learnbow1_info()
{
	AI_Output(other,self,"DIA_Dragomir_Learnbow1_15_00");	//Nauč mě zakladní výrobu.
	if((hero.lp >= 5) && (Npc_HasItems(other,ItMi_Gold) > 500))
	{
		hero.lp = hero.lp - 5;
		Npc_RemoveInvItems(hero,ItMi_Gold,500);
		B_TeachThiefTalent(self,other,NPC_TALENT_BOW_MAKER);
		AI_Output(self,other,"DIA_Dragomir_Learnbow1_12_01");	//Začni tím, že si na dílně na luky připravíš věci na výrobu.
		AI_Output(self,other,"DIA_Dragomir_Learnbow1_12_02");	//Potom uděláš tohle a tam to, zbytek pochopíš z nákresu.
		AI_Output(self,other,"DIA_Dragomir_Learnbow1_12_04");	//Nákresy můžeš zakoupit u Bospra a lze ten samý postup použít i na kuše.
		Log_CreateTopic(TOPIC_BOWHUNT,LOG_NOTE);
		B_LogEntry(TOPIC_BOWHUNT,"Umím vyrobit Základní luky a kuše.");
		KNOWS_BOWSCROLLSI = TRUE;
		PrintScreen("Umím vyrobit luky a kuše",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_DRAGOMIR_BOWINFO(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 8;
	condition = dia_dragomir_bowinfo_condition;
	information = dia_dragomir_bowinfo_info;
	permanent = FALSE;
	description = "Nevíš kde bych se mohl naučit pokročilou a další výrobu luků?";
};


func int dia_dragomir_bowinfo_condition()
{
	if((KNOWS_BOWSCROLLSI == TRUE) || (KNOWS_BOWSCROLLSII == TRUE))
	{
		return TRUE;
	};
};

func void dia_dragomir_bowinfo_info()
{
	AI_Output(other,self,"DIA_Dragomir_Bowinfo_12_00");	//Nevíš kde bych se mohl naučit pokročilou a další výrobu luků?
	AI_Output(self,other,"DIA_Dragomir_Bowinfo_12_01");	//Já umím jen základní a tu mě naučil bosper ale ten učí jen lovce.
	AI_Output(self,other,"DIA_Dragomir_Bowinfo_12_02");	//Zkus se poptat ostatních lovců po ostrově, třeba ti vyhový.
};


instance DIA_Dragomir_PICKPOCKET(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 900;
	condition = DIA_Dragomir_PICKPOCKET_Condition;
	information = DIA_Dragomir_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Dragomir_PICKPOCKET_Condition()
{
	return C_Beklauen(47,70);
};

func void DIA_Dragomir_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET,Dialog_Back,DIA_Dragomir_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dragomir_PICKPOCKET_DoIt);
};

func void DIA_Dragomir_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};

func void DIA_Dragomir_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};

