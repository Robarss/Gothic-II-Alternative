
instance DIA_Addon_Myxir_EXIT(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 999;
	condition = DIA_Addon_Myxir_EXIT_Condition;
	information = DIA_Addon_Myxir_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_Hallo(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_Hallo_Condition;
	information = DIA_Addon_Myxir_Hallo_Info;
	description = "Vše v pořádku?";
};


func int DIA_Addon_Myxir_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Hallo_15_00");	//Vše v pořádku?
	AI_Output(self,other,"DIA_Addon_Myxir_Hallo_12_01");	//Jsi odvážný znovu se ukázat.
};


instance DIA_Addon_Myxir_WasMachstDu(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_WasMachstDu_Condition;
	information = DIA_Addon_Myxir_WasMachstDu_Info;
	description = "Co tady děláš?";
};


func int DIA_Addon_Myxir_WasMachstDu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_WasMachstDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WasMachstDu_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_01");	//Studuji jazyk stavitelů.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_02");	//Jazyk je klíč k vědomostem těchto starých kultur.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_03");	//Každý z nás se ho musí naučit, jinak tahle expedice skončí dřív, než začala.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_04");	//Stavitelé používali kamenné desky, aby šířili své znalosti. Bohužel mnoho z nich bylo už dávno rozbito nebo ukradeno.
};


instance DIA_Addon_Myxir_Steintafeln(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_Steintafeln_Condition;
	information = DIA_Addon_Myxir_Steintafeln_Info;
	description = "Co je napsáno na těchto kamenných deskách?";
};


func int DIA_Addon_Myxir_Steintafeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_Steintafeln_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Steintafeln_15_00");	//Co je napsáno na těchto kamenných deskách?
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_01");	//Obsahují veškeré znalosti prastarého obyvatelstva.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_02");	//Některé z nich magicky zvyšují znalosti o boji a magii.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_03");	//Pro někoho, kdo je umí číst, představují opravdový poklad.
	Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	B_LogEntry(TOPIC_Addon_Stoneplates,"Kamenné desky obsahují moudrost starých lidí stavitelů. Některé z nich magicky zvýší znalosti boje a magie. Ale potřebuji je umět rozluštit.");
};


instance DIA_Addon_Myxir_WillYouTeachMe(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 10;
	condition = DIA_Addon_Myxir_WillYouTeachMe_Condition;
	information = DIA_Addon_Myxir_WillYouTeachMe_Info;
	description = "Můžeš mě naučit číst ten starý jazyk?";
};


func int DIA_Addon_Myxir_WillYouTeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_WillYouTeachMe_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WillYouTeachMe_15_00");	//Můžeš mě naučit číst ten starý jazyk?
	AI_Output(self,other,"DIA_Addon_Myxir_WillYouTeachMe_12_01");	//Proč ne? Předám ti své znalosti.
	Myxir_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	B_LogEntry(TOPIC_Addon_Stoneplates,LogText_Addon_MyxirTeach);
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
};


instance DIA_Addon_Myxir_Teach(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 90;
	condition = DIA_Addon_Myxir_Teach_Condition;
	information = DIA_Addon_Myxir_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě cizí jazyk.";
};


var int DIA_Addon_Myxir_Teach_NoPerm;

func int DIA_Addon_Myxir_Teach_Condition()
{
	if((Myxir_Addon_TeachPlayer == TRUE) && (DIA_Addon_Myxir_Teach_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_Teach_Info()
{
	B_DIA_Addon_Myxir_TeachRequest();
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_Teach);
		Info_AddChoice(DIA_Addon_Myxir_Teach,Dialog_Back,DIA_Addon_Myxir_Teach_BACK);
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1();
		Info_AddChoice(DIA_Addon_Myxir_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Myxir_Teach_LANGUAGE_1);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL2();
		Info_AddChoice(DIA_Addon_Myxir_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Myxir_Teach_LANGUAGE_2);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL3();
		Info_AddChoice(DIA_Addon_Myxir_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Myxir_Teach_LANGUAGE_3);
	}
	else
	{
		B_DIA_Addon_Myxir_TeachNoMore();
		DIA_Addon_Myxir_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_X()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X();
};

func void DIA_Addon_Myxir_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		DIA_Addon_Myxir_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		DIA_Addon_Myxir_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		DIA_Addon_Myxir_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

