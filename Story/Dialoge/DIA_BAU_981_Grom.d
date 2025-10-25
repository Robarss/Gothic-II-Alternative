
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
	description = "Je všechno v pořádku?";
};


func int DIA_Grom_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Grom_HALLO_Info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_15_00");	//Je všechno v pořádku?
	AI_Output(self,other,"DIA_Grom_HALLO_08_01");	//Á, nějaký neznámý poutník. Mám moc práce, tak co chceš?
	Info_ClearChoices(DIA_Grom_HALLO);
	Info_AddChoice(DIA_Grom_HALLO,"Co je tu zajímavého k vidění?",DIA_Grom_HALLO_waszusehen);
	Info_AddChoice(DIA_Grom_HALLO,"Co tady děláš?",DIA_Grom_HALLO_was);
};

func void DIA_Grom_HALLO_waszusehen()
{
	AI_Output(other,self,"DIA_Grom_HALLO_waszusehen_15_00");	//Co je tu zajímavého k vidění?
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_01");	//Zajímavé je slabé slovo. Když se vydáš hloubějš do lesa, narazíš na pořádně odporný chlapíky.
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_02");	//Jsou okolo deseti stop vysoký, chlupatý a maj fakt špatnou náladu. Jestli na ně nejsi dost silný, tak tam raději ani nechoď.
};

func void DIA_Grom_HALLO_was()
{
	AI_Output(other,self,"DIA_Grom_HALLO_was_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Grom_HALLO_was_08_01");	//To, co dřevorubci a lovci obvykle dělávají.
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
	description = "Můžeš mě naučit něco o lovu?";
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
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00");	//Můžeš mě naučit něco o lovu?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01");	//Jasně. Ale nejdřív mi dej něco pořádnýho na zub. Umírám tady hlady.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02");	//Dal bych si láhev mlíka, bochník chleba a tlustou šunku. Pak tě naučím, čemu budeš chtít.
	Log_CreateTopic(TOPIC_GromAskTeacher,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GromAskTeacher,LOG_Running);
	B_LogEntry(TOPIC_GromAskTeacher,"Lovec Grom se se mnou podělí o své poznatky, pokud mu přinesu láhev mléka, krajíc chleba a šunku.");
};


instance DIA_Grom_PayTeacher(C_Info)
{
	npc = BAU_981_Grom;
	nr = 11;
	condition = DIA_Grom_PayTeacher_Condition;
	information = DIA_Grom_PayTeacher_Info;
	description = "Tady máš jídlo, cos chtěl.";
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
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00");	//Tady máš jídlo, cos chtěl.
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01");	//Výborně. A teď?
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
	description = "Rád bych se naučil nějakým loveckým technikám.";
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
	AI_Output(other,self,"DIA_Grom_TEACHHUNTING_15_00");	//Rád bych se naučil nějakým loveckým technikám.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_01");	//Co chceš vědět?
		Info_AddChoice(DIA_Grom_TEACHHUNTING,Dialog_Back,DIA_Grom_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Stahování z kůže",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Grom_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Vyjmutí zubů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Grom_TEACHHUNTING_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Vyjmutí srdce",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),DIA_Grom_TEACHHUNTING_Heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Vyjmutí kusadel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Grom_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Roh stínové šelmy ",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Grom_TEACHHUNTING_ShadowHorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_02");	//Nemůžu tě naučit nic, co bys ještě neznal.
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
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Fur_08_00");	//Veď řez kolem končetin tak, abys mohl stáhnout kůži. Dělej to od hlavy k ocasu, ne naopak.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Teeth_08_00");	//Když chceš oddělit zuby, musíš dávat dobrý pozor, aby se při odlamování od lebky nezlomily.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Heart_08_00");	//Srdce získáš tak, že šikovně řízneš do hrudi zvířete. Ale obvykle to stoji za to jen v případě, že se jedná zvíře magického původu.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Mandibles_08_00");	//Kusadla důlních červů a polních škůdců lze získat jen za pomoci velmi silné kovové páky, protože jsou zaklíněny hluboko v pevných tkáních hlavy.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_ShadowHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_ShadowHorn_08_00");	//Abys získal roh stínové šelmy, opři se vší silou o lebku a zároveň tahej za roh. Pak tu věc tvrdou čepelí uřízni.
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
	description = "Můžeš mě naučit vyrobit zbroj?";
};


func int dia_grom_teach_condition()
{
	return TRUE;
};

func void dia_grom_teach_info()
{
	AI_Output(other,self,"DIA_Grom_teach_15_00");	//Můžeš mě naučit vyrobit zbroj?
	AI_Output(self,other,"DIA_Grom_teach_01_01");	//Můžu tě naučit jak udělat zbroj z kůže skřetího psa.
	Log_CreateTopic(TOPIC_SKINHUN,LOG_NOTE);
	B_LogEntry(TOPIC_SKINHUN,"Grom mě může nauči jak vyrobit zbroj z kůže skřetího psa.");
};


instance DIA_GROM_LEARN(C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = dia_grom_learn_condition;
	information = dia_grom_learn_info;
	permanent = 4;
	description = "Zbroj z kůže skřetího psa (cena: 4 VB)";
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
	AI_Output(other,self,"DIA_Grom_Learn_15_00");	//Nauč mě vyrobit zbroj z kůže skřetího psa.
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Grom_Learn_12_01");	//Začni tím, že si na dílně na kůže připravíš věci na výrobu.
		AI_Output(self,other,"DIA_Grom_Learn_12_02");	//Potom si připrav kůže ze kterých budeš vyrábět zbroj a očisti ji.
		AI_Output(self,other,"DIA_Grom_Learn_12_04");	//Natáhni je a sešívej přesně aby byla pevná tak jak ti to ukazuji.
		Log_CreateTopic(TOPIC_SKINHUN,LOG_NOTE);
		B_LogEntry(TOPIC_SKINHUN,"Umim vyrobit: Zbroj z kůže skřetího psa.");
		B_LogEntry(TOPIC_SKINHUN,"Material na výrobu: 10x kůže skřetího psa, 10x drápy.");
		KNOWS_WOLFARM = TRUE;
		PrintScreen("Umím vyrobit: Zbroj z kůže skřetího psa.",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
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

