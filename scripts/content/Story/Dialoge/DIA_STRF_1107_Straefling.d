
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
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_00");	//Od m?ch hrnc? ruce pry?! Nikdo se m?ch hrnc? nesm? ani dotknout, jasn??!
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_01");	//Jsem zodpov?dn? za j?dlo, a to znamen?, ?e nikdo jin? tady nem? co d?lat! Douf?m, ?e jsem se vyj?d?il jasn?!
};


instance DIA_STRF_1107_COOK(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOK_Condition;
	information = DIA_STRF_1107_COOK_Info;
	description = "Kdo z tebe ud?lal kucha?e?";
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
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_00");	//Kdo z tebe ud?lal kucha?e?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_01");	//Byl to velitel Garond. Ne? jsem stal trestancem, b?val jsem kucha?em U divo??ka.
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_02");	//A za co t? zav?eli?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_03");	//Bylo to takov? men?? nedorozum?n? mezi hostem, sek??kem na maso a mnou.
};


instance DIA_STRF_1107_TEACH(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 7;
	condition = dia_strf_1107_teach_condition;
	information = dia_strf_1107_teach_info;
	permanent = 0;
	description = "M??e? m? nau?it n?co o va?en??";
};


func int dia_strf_1107_teach_condition()
{
	return TRUE;
};

func void dia_strf_1107_teach_info()
{
	AI_Output(other,self,"DIA_STRF_1107_teach_15_00");	//M??e? m? nau?it n?co o va?en??
	AI_Output(self,other,"DIA_STRF_1107_teach_01_01");	//Nau??m t? sv?j recept na pol?vku z ?st?ic.
	Log_CreateTopic(TOPIC_COOKHU,LOG_NOTE);
	B_LogEntry(TOPIC_COOKHU,"Chef m? m??e nau?it va?it pol?vku z ?st?ic.");
};


instance DIA_STRF_1107_LEARN(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 8;
	condition = dia_strf_1107_learn_condition;
	information = dia_strf_1107_learn_info;
	permanent = 5;
	description = "Specialn? pol?vka z ?st?ic (cena: 5 VB)";
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
	AI_Output(other,self,"DIA_STRF_1107_Learn_15_00");	//Nau? m? va?it Specialn? pol?vku z ?st?ic.
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_Addon_Snaf_Learn_12_01");	//Tak a tet ti uk??u jak to uva???, sleduj pozorn?.
		Log_CreateTopic(TOPIC_COOKHU,LOG_NOTE);
		B_LogEntry(TOPIC_COOKHU,"Um?m uva?it: Specialn? pol?vka z ?st?ic.");
		B_LogEntry(TOPIC_COOKHU,"Ingredience jsou: 2x Maso ze ?keble, 10x Ch?apav?? b?l?, 1x Goblin? bobule.");
		KNOWS_COOKDEX = TRUE;
		PrintScreen("Nau?il ses uva?it: Specialn? pol?vka z ?st?ic",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek v?domostn?ch bod?!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
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
	description = "N?co nov?ho?";
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
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_00");	//N?co nov?ho?
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_01");	//Jestli se chce? dozv?d?t n?jak? novinky, promluv si s ryt??i. J? tady jen va??m.
};

