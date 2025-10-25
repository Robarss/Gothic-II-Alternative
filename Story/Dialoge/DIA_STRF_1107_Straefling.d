
instance DIA_STRF_1107_EXIT(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 999;
	condition = DIA_STRF_1107_EXIT_Condition;
	information = DIA_STRF_1107_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_1107_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_1107_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_1107_FINGER(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_FINGER_Condition;
	information = DIA_STRF_1107_FINGER_Info;
	important = TRUE;
};


func int DIA_STRF_1107_FINGER_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_FINGER_Info()
{
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_00");	//Od mých hrnců ruce pryč! Nikdo se mých hrnců nesmí ani dotknout, jasný?!
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_01");	//Jsem zodpovědný za jídlo, a to znamená, že nikdo jiný tady nemá co dělat! Doufám, že jsem se vyjádřil jasně!
};


instance DIA_STRF_1107_COOK(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOK_Condition;
	information = DIA_STRF_1107_COOK_Info;
	description = "Kdo z tebe udělal kuchaře?";
};


func int DIA_STRF_1107_COOK_Condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOK_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_00");	//Kdo z tebe udělal kuchaře?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_01");	//Byl to velitel Garond. Než jsem stal trestancem, býval jsem kuchařem U divočáka.
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_02");	//A za co tě zavřeli?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_03");	//Bylo to takový menší nedorozumění mezi hostem, sekáčkem na maso a mnou.
};


instance DIA_STRF_1107_TEACH(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 7;
	condition = dia_strf_1107_teach_condition;
	information = dia_strf_1107_teach_info;
	permanent = 0;
	description = "Můžeš mě naučit něco o vaření?";
};


func int dia_strf_1107_teach_condition()
{
	return TRUE;
};

func void dia_strf_1107_teach_info()
{
	AI_Output(other,self,"DIA_STRF_1107_teach_15_00");	//Můžeš mě naučit něco o vaření?
	AI_Output(self,other,"DIA_STRF_1107_teach_01_01");	//Naučím tě svůj recept na polévku z ústřic.
	Log_CreateTopic(TOPIC_COOKHU,LOG_NOTE);
	B_LogEntry(TOPIC_COOKHU,"Chef mě může naučit vařit polévku z ústřic.");
};


instance DIA_STRF_1107_LEARN(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 8;
	condition = dia_strf_1107_learn_condition;
	information = dia_strf_1107_learn_info;
	permanent = 5;
	description = "Specialní polévka z ústřic (cena: 5 VB)";
};


func int dia_strf_1107_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_teach) && (KNOWS_COOKDEX == FALSE))
	{
		return TRUE;
	};
};

func void dia_strf_1107_learn_info()
{
	AI_Output(other,self,"DIA_STRF_1107_Learn_15_00");	//Nauč mě vařit Specialní polévku z ústřic.
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_Addon_Snaf_Learn_12_01");	//Tak a tet ti ukážu jak to uvaříš, sleduj pozorně.
		Log_CreateTopic(TOPIC_COOKHU,LOG_NOTE);
		B_LogEntry(TOPIC_COOKHU,"Umím uvařit: Specialní polévka z ústřic.");
		B_LogEntry(TOPIC_COOKHU,"Ingredience jsou: 2x Maso ze škeble, 10x Chňapavčí býlí, 1x Gobliní bobule.");
		KNOWS_COOKDEX = TRUE;
		PrintScreen("Naučil ses uvařit: Specialní polévka z ústřic",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_STRF_1107_PERM(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 900;
	condition = DIA_STRF_1107_PERM_Condition;
	information = DIA_STRF_1107_PERM_Info;
	permanent = TRUE;
	description = "Něco nového?";
};


func int DIA_STRF_1107_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_PERM_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_00");	//Něco nového?
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_01");	//Jestli se chceš dozvědět nějaký novinky, promluv si s rytíři. Já tady jen vařím.
};

