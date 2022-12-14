
instance DIA_Grom_EXIT(C_Info)
{
	npc = BAU_981_Grom;
	nr = 999;
	condition = DIA_Grom_EXIT_Condition;
	information = DIA_Grom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Grom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grom_HALLO(C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = DIA_Grom_HALLO_Condition;
	information = DIA_Grom_HALLO_Info;
	description = "Je v?echno v po??dku?";
};


func int DIA_Grom_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Grom_HALLO_Info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_15_00");	//Je v?echno v po??dku?
	AI_Output(self,other,"DIA_Grom_HALLO_08_01");	//?, n?jak? nezn?m? poutn?k. M?m moc pr?ce, tak co chce??
	Info_ClearChoices(DIA_Grom_HALLO);
	Info_AddChoice(DIA_Grom_HALLO,"Co je tu zaj?mav?ho k vid?n??",DIA_Grom_HALLO_waszusehen);
	Info_AddChoice(DIA_Grom_HALLO,"Co tady d?l???",DIA_Grom_HALLO_was);
};

func void DIA_Grom_HALLO_waszusehen()
{
	AI_Output(other,self,"DIA_Grom_HALLO_waszusehen_15_00");	//Co je tu zaj?mav?ho k vid?n??
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_01");	//Zaj?mav? je slab? slovo. Kdy? se vyd?? hloub?j? do lesa, naraz?? na po??dn? odporn? chlap?ky.
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_02");	//Jsou okolo deseti stop vysok?, chlupat? a maj fakt ?patnou n?ladu. Jestli na n? nejsi dost siln?, tak tam rad?ji ani necho?.
};

func void DIA_Grom_HALLO_was()
{
	AI_Output(other,self,"DIA_Grom_HALLO_was_15_00");	//Co tady d?l???
	AI_Output(self,other,"DIA_Grom_HALLO_was_08_01");	//To, co d?evorubci a lovci obvykle d?l?vaj?.
	Info_AddChoice(DIA_Grom_HALLO,Dialog_Back,DIA_Grom_HALLO_BACK);
};

func void DIA_Grom_HALLO_BACK()
{
	Info_ClearChoices(DIA_Grom_HALLO);
};


instance DIA_Grom_AskTeacher(C_Info)
{
	npc = BAU_981_Grom;
	nr = 10;
	condition = DIA_Grom_AskTeacher_Condition;
	information = DIA_Grom_AskTeacher_Info;
	description = "M??e? m? nau?it n?co o lovu?";
};


func int DIA_Grom_AskTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Grom_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00");	//M??e? m? nau?it n?co o lovu?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01");	//Jasn?. Ale nejd??v mi dej n?co po??dn?ho na zub. Um?r?m tady hlady.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02");	//Dal bych si l?hev ml?ka, bochn?k chleba a tlustou ?unku. Pak t? nau??m, ?emu bude? cht?t.
	Log_CreateTopic(TOPIC_GromAskTeacher,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GromAskTeacher,LOG_Running);
	B_LogEntry(TOPIC_GromAskTeacher,"Lovec Grom se se mnou pod?l? o sv? poznatky, pokud mu p?inesu l?hev ml?ka, kraj?c chleba a ?unku.");
};


instance DIA_Grom_PayTeacher(C_Info)
{
	npc = BAU_981_Grom;
	nr = 11;
	condition = DIA_Grom_PayTeacher_Condition;
	information = DIA_Grom_PayTeacher_Info;
	description = "Tady m?? j?dlo, cos cht?l.";
};


func int DIA_Grom_PayTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_AskTeacher) && Npc_HasItems(other,ItFo_Milk) && Npc_HasItems(other,ItFo_Bread) && Npc_HasItems(other,ItFo_Bacon))
	{
		return TRUE;
	};
};

func void DIA_Grom_PayTeacher_Info()
{
	B_GiveInvItems(other,self,ItFo_Milk,1);
	B_GiveInvItems(other,self,ItFo_Bread,1);
	B_GiveInvItems(other,self,ItFo_Bacon,1);
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00");	//Tady m?? j?dlo, cos cht?l.
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01");	//V?born?. A te??
	Grom_TeachAnimalTrophy = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Grom_TEACHHUNTING(C_Info)
{
	npc = BAU_981_Grom;
	nr = 12;
	condition = DIA_Grom_TEACHHUNTING_Condition;
	information = DIA_Grom_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "R?d bych se nau?il n?jak?m loveck?m technik?m.";
};


func int DIA_Grom_TEACHHUNTING_Condition()
{
	if(Grom_TeachAnimalTrophy == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Grom_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Grom_TEACHHUNTING_15_00");	//R?d bych se nau?il n?jak?m loveck?m technik?m.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_01");	//Co chce? v?d?t?
		Info_AddChoice(DIA_Grom_TEACHHUNTING,Dialog_Back,DIA_Grom_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Stahov?n? z k??e",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Grom_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Vyjmut? zub?",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Grom_TEACHHUNTING_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Vyjmut? srdce",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),DIA_Grom_TEACHHUNTING_Heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Vyjmut? kusadel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Grom_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Roh st?nov? ?elmy ",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Grom_TEACHHUNTING_ShadowHorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_02");	//Nem??u t? nau?it nic, co bys je?t? neznal.
	};
};

func void DIA_Grom_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Fur_08_00");	//Ve? ?ez kolem kon?etin tak, abys mohl st?hnout k??i. D?lej to od hlavy k ocasu, ne naopak.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Teeth_08_00");	//Kdy? chce? odd?lit zuby, mus?? d?vat dobr? pozor, aby se p?i odlamov?n? od lebky nezlomily.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Heart_08_00");	//Srdce z?sk?? tak, ?e ?ikovn? ??zne? do hrudi zv??ete. Ale obvykle to stoji za to jen v p??pad?, ?e se jedn? zv??e magick?ho p?vodu.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Mandibles_08_00");	//Kusadla d?ln?ch ?erv? a poln?ch ?k?dc? lze z?skat jen za pomoci velmi siln? kovov? p?ky, proto?e jsou zakl?n?ny hluboko v pevn?ch tk?n?ch hlavy.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_ShadowHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_ShadowHorn_08_00");	//Abys z?skal roh st?nov? ?elmy, op?i se v?? silou o lebku a z?rove? tahej za roh. Pak tu v?c tvrdou ?epel? u??zni.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};


instance DIA_GROM_TEACH(C_Info)
{
	npc = BAU_981_Grom;
	nr = 5;
	condition = dia_grom_teach_condition;
	information = dia_grom_teach_info;
	permanent = 0;
	description = "M??e? m? nau?it vyrobit zbroj?";
};


func int dia_grom_teach_condition()
{
	return TRUE;
};

func void dia_grom_teach_info()
{
	AI_Output(other,self,"DIA_Grom_teach_15_00");	//M??e? m? nau?it vyrobit zbroj?
	AI_Output(self,other,"DIA_Grom_teach_01_01");	//M??u t? nau?it jak ud?lat zbroj z k??e sk?et?ho psa.
	Log_CreateTopic(TOPIC_SKINHUN,LOG_NOTE);
	B_LogEntry(TOPIC_SKINHUN,"Grom m? m??e nau?i jak vyrobit zbroj z k??e sk?et?ho psa.");
};


instance DIA_GROM_LEARN(C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = dia_grom_learn_condition;
	information = dia_grom_learn_info;
	permanent = 4;
	description = "Zbroj z k??e sk?et?ho psa (cena: 4 VB)";
};


func int dia_grom_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_grom_teach) && (KNOWS_WOLFARM == FALSE))
	{
		return TRUE;
	};
};

func void dia_grom_learn_info()
{
	AI_Output(other,self,"DIA_Grom_Learn_15_00");	//Nau? m? vyrobit zbroj z k??e sk?et?ho psa.
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Grom_Learn_12_01");	//Za?ni t?m, ?e si na d?ln? na k??e p?iprav?? v?ci na v?robu.
		AI_Output(self,other,"DIA_Grom_Learn_12_02");	//Potom si p?iprav k??e ze kter?ch bude? vyr?b?t zbroj a o?isti ji.
		AI_Output(self,other,"DIA_Grom_Learn_12_04");	//Nat?hni je a se??vej p?esn? aby byla pevn? tak jak ti to ukazuji.
		Log_CreateTopic(TOPIC_SKINHUN,LOG_NOTE);
		B_LogEntry(TOPIC_SKINHUN,"Umim vyrobit: Zbroj z k??e sk?et?ho psa.");
		B_LogEntry(TOPIC_SKINHUN,"Material na v?robu: 10x k??e sk?et?ho psa, 10x dr?py.");
		KNOWS_WOLFARM = TRUE;
		PrintScreen("Um?m vyrobit: Zbroj z k??e sk?et?ho psa.",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek v?domostn?ch bod?!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Grom_PICKPOCKET(C_Info)
{
	npc = BAU_981_Grom;
	nr = 900;
	condition = DIA_Grom_PICKPOCKET_Condition;
	information = DIA_Grom_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Grom_PICKPOCKET_Condition()
{
	return C_Beklauen(75,40);
};

func void DIA_Grom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
	Info_AddChoice(DIA_Grom_PICKPOCKET,Dialog_Back,DIA_Grom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grom_PICKPOCKET_DoIt);
};

func void DIA_Grom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
};

func void DIA_Grom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
};

