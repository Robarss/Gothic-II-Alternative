
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
	AI_Output(self,other,"DIA_Dragomir_Hello_12_01");	//Tady mus?? b?t opatrn?, zvl᚝, kdy? se m??e? spolehnout jen s?m na sebe.
};


instance DIA_Dragomir_OutHere(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_OutHere_Condition;
	information = DIA_Dragomir_OutHere_Info;
	permanent = FALSE;
	description = "Co tady d?l???";
};


func int DIA_Dragomir_OutHere_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_OutHere_Info()
{
	AI_Output(other,self,"DIA_Dragomir_OutHere_15_00");	//Co tady d?l???
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_01");	//No, hostinec je pro m? p??li? drah?, tak jsem se ut?bo?il tady.
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_02");	//Vypad? to, ?e d??v?j?? obyvatel? u? to tu nepot?ebuj?.
};


instance DIA_Dragomir_Settlers(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Settlers_Condition;
	information = DIA_Dragomir_Settlers_Info;
	permanent = FALSE;
	description = "Kdo tenhle t?bor d??v vyu??val?";
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
	AI_Output(other,self,"DIA_Dragomir_Settlers_15_00");	//Kdo tenhle t?bor d??v vyu??val?
	AI_Output(self,other,"DIA_Dragomir_Settlers_12_01");	//Nem?m tu?en?, asi n?jac? lovci. P?edpokl?d?m, ?e to tu pro n? za?alo b?t p??li? nebezpe?n?.
};


instance DIA_Dragomir_Dangerous(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Dangerous_Condition;
	information = DIA_Dragomir_Dangerous_Info;
	permanent = FALSE;
	description = "Nen? to tu p??li? nebezpe?n??";
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
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_00");	//Nen? to tu p??li? nebezpe?n??
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_01");	//No, ne, kdy? se dok??e? br?nit. Moje ku?e u? mi mnohokr?t prok?zala neoceniteln? slu?by.
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_02");	//Ta ale nen? moc velk?.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_03");	//Ale sta??. Kdy? v??, jak s n? zach?zet. M?val jsem v?t??. Bohu?el jsem ji v?ak ztratil.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_04");	//Dostal jsem se do hor daleko na severu. Je tam kruh monolit? s ob?tn?m olt??em.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_05");	//Kdy? jsem tam lovil mrcho?routy, za?ali z lesa vyl?zat ti odporn? nemrtv? a napadli m?.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_06");	//Jedin?, co jsem mohl d?lat, bylo vz?t nohy na ramena.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_07");	//Jak jsem ut?kal, vyklouzla mi ta ku?e z rukou. Vsad?m se, ?e se tam je?t? po??d u toho podivn?ho kamenn?ho kruhu na severu n?kde povaluje.
	Log_CreateTopic(TOPIC_DragomirsArmbrust,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust,LOG_Running);
	B_LogEntry(TOPIC_DragomirsArmbrust,"V podivn?m kamenn?m kruhu vysoko v hor?ch na severu ztratil Dragomir ku?i.");
	MIS_DragomirsArmbrust = LOG_Running;
};


instance DIA_Dragomir_Armbrust(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Armbrust_Condition;
	information = DIA_Dragomir_Armbrust_Info;
	permanent = FALSE;
	description = "Tady. Na?el jsem tvou ku?i.";
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
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_00");	//Tady. Na?el jsem tvou ku?i.
	B_GiveInvItems(other,self,ItRw_DragomirsArmbrust_MIS,1);
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_01");	//Opravdu, je to ta moje. Ne??kej, ?es byl tam naho?e u kamenn?ho kruhu?!
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_02");	//To si pi?!
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_03");	//To od tebe byla p?kn? lehkov??nost. Ale jinak d?ky.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_04");	//Samoz?ejm? ti za ni zaplat?m. Douf?m, ?e tohle bude sta?it.
	AI_Output(self,other,"DIA_Dragomir_Armbrust11_12_04");	//A pokud bude? cht?t m??u t? nau?it zakladn? v?robu luk?.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	MIS_DragomirsArmbrust = LOG_SUCCESS;
	Log_CreateTopic(TOPIC_BOWHUNT,LOG_NOTE);
	B_LogEntry(TOPIC_BOWHUNT,"Dragomir m? m??e nau?it z?kladn? v?robu luk?.");
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
	description = "M??e? m? n??emu nau?it?";
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
	AI_Output(other,self,"DIA_Dragomir_Learn_15_00");	//M??e? m? n??emu nau?it?
	if(other.attribute[ATR_DEXTERITY] < 30)
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_01");	//Ne? t? budu moct za??t cokoli u?it, mus?? nejprve pos?lit svoji obratnost.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_02");	//Jestli na to m??. Jak u? jsem ?ekl, pr?v? se mi pon?kud nedost?v? hotovosti.
		AI_Output(other,self,"DIA_Dragomir_Learn_15_03");	//Kolik chce??
		B_Say_Gold(self,other,Dragomir_TeachingCost);
		Info_ClearChoices(DIA_Dragomir_Learn);
		Info_AddChoice(DIA_Dragomir_Learn,"Mo?n? pozd?ji.",DIA_Dragomir_Learn_Later);
		if(Npc_HasItems(other,ItMi_Gold) >= Dragomir_TeachingCost)
		{
			Info_AddChoice(DIA_Dragomir_Learn,"Tady je zlato.",DIA_Dragomir_Learn_Here);
		};
	};
};

func void DIA_Dragomir_Learn_Later()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Later_15_00");	//Mo?n? pozd?ji.
	Info_ClearChoices(DIA_Dragomir_Learn);
};

func void DIA_Dragomir_Learn_Here()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Here_15_00");	//Tady je zlato.
	B_GiveInvItems(other,self,ItMi_Gold,Dragomir_TeachingCost);
	AI_Output(self,other,"DIA_Dragomir_Learn_Here_12_01");	//V?born?, jestli se nem?l?m, m??eme hned za??t.
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
	description = "M??e? m? n??emu nau?it?";
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
	AI_Output(other,self,"DIA_Dragomir_Teach_15_00");	//M??e? m? n??emu nau?it?
	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Dragomir_Teach_1H_1);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),DIA_Dragomir_Teach_1H_5);
};

func void DIA_Dragomir_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00");	//U? t? nem?m ?emu u?it. Je na?ase, aby sis na?el n?koho zku?en?j??ho.
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
	description = "Zakladn? v?roba  (cena: 5 VB, 500 zlat?ch)";
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
	AI_Output(other,self,"DIA_Dragomir_Learnbow1_15_00");	//Nau? m? zakladn? v?robu.
	if((hero.lp >= 5) && (Npc_HasItems(other,ItMi_Gold) > 500))
	{
		hero.lp = hero.lp - 5;
		Npc_RemoveInvItems(hero,ItMi_Gold,500);
		B_TeachThiefTalent(self,other,NPC_TALENT_BOW_MAKER);
		AI_Output(self,other,"DIA_Dragomir_Learnbow1_12_01");	//Za?ni t?m, ?e si na d?ln? na luky p?iprav?? v?ci na v?robu.
		AI_Output(self,other,"DIA_Dragomir_Learnbow1_12_02");	//Potom ud?l?? tohle a tam to, zbytek pochop?? z n?kresu.
		AI_Output(self,other,"DIA_Dragomir_Learnbow1_12_04");	//N?kresy m??e? zakoupit u Bospra a lze ten sam? postup pou??t i na ku?e.
		Log_CreateTopic(TOPIC_BOWHUNT,LOG_NOTE);
		B_LogEntry(TOPIC_BOWHUNT,"Um?m vyrobit Z?kladn? luky a ku?e.");
		KNOWS_BOWSCROLLSI = TRUE;
		PrintScreen("Um?m vyrobit luky a ku?e",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek v?domostn?ch bod?!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
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
	description = "Nev?? kde bych se mohl nau?it pokro?ilou a dal?? v?robu luk??";
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
	AI_Output(other,self,"DIA_Dragomir_Bowinfo_12_00");	//Nev?? kde bych se mohl nau?it pokro?ilou a dal?? v?robu luk??
	AI_Output(self,other,"DIA_Dragomir_Bowinfo_12_01");	//J? um?m jen z?kladn? a tu m? nau?il bosper ale ten u?? jen lovce.
	AI_Output(self,other,"DIA_Dragomir_Bowinfo_12_02");	//Zkus se poptat ostatn?ch lovc? po ostrov?, t?eba ti vyhov?.
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

