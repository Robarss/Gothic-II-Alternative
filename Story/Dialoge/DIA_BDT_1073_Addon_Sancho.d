
instance DIA_Addon_Sancho_EXIT(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 999;
	condition = DIA_Addon_Sancho_EXIT_Condition;
	information = DIA_Addon_Sancho_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Sancho_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Sancho_PICKPOCKET(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 900;
	condition = DIA_Addon_Sancho_PICKPOCKET_Condition;
	information = DIA_Addon_Sancho_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Sancho_PICKPOCKET_Condition()
{
	return C_Beklauen(50,40);
};

func void DIA_Addon_Sancho_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Sancho_PICKPOCKET,Dialog_Back,DIA_Addon_Sancho_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Sancho_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Sancho_PICKPOCKET_DoIt);
};

func void DIA_Addon_Sancho_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
};

func void DIA_Addon_Sancho_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
};


instance DIA_Addon_Sancho_HI(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 2;
	condition = DIA_Addon_Sancho_HI_Condition;
	information = DIA_Addon_Sancho_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Sancho_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_HI_Info()
{
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_00");	//Sakra, další nováček. (smích) Taky sis příšel pro zlato?
	AI_Output(other,self,"DIA_Addon_Sancho_HI_15_01");	//Zlato?
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_02");	//(smích) Nedělej si starosti.
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_03");	//Všichni nováčci, kteří sem příjdou, se chtějí dostat do dolu.
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_04");	//Ale nečekej, že to bude tak jednoduchý!
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_Sancho_Lager(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 2;
	condition = DIA_Addon_Sancho_Lager_Condition;
	information = DIA_Addon_Sancho_Lager_Info;
	permanent = FALSE;
	description = "Jak se dostanu do tábora?";
};


func int DIA_Addon_Sancho_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Lager_15_00");	//Jak se dostanu do tábora?
	AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_01");	//Jednoduše přejdi most.
	if(!Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_02");	//Avšak, jestli se chceš dostat do dolu, musíš projít okolo Franca.
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_03");	//Ten ale od každého očekává, že nejdřív bude chvíli pracovat mimo tábor.
	};
	Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
	B_LogEntry(Topic_Addon_Franco,"Všichni nováčci musí nejdřív pracovat v bažinách, až potom jim dovolí vstoupit do dolu.");
};


instance DIA_Addon_Sancho_Mine(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 3;
	condition = DIA_Addon_Sancho_Mine_Condition;
	information = DIA_Addon_Sancho_Mine_Info;
	permanent = FALSE;
	description = "Pověz mi víc o dole ...";
};


func int DIA_Addon_Sancho_Mine_Condition()
{
	if(!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Sancho_Mine_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Mine_15_00");	//Pověz mi víc o dole ...
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_01");	//Mohu ti dát radu? Pokus se spřátelit s Francem. Tady venku je šéfem on.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_02");	//On jediný rozhoduje, kdo vstoupí do tábora.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_03");	//Ale šance, že se tam dostaneš jsou nulové, jestli nebudeš dělat nic jinýho než vysedávat na svým lenivým zadku.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_04");	//Takže si s ním promluv a získej práci.
	B_LogEntry(Topic_Addon_Franco,"Franco rozhoduje o tom, kdo může vstoupit do tábora. Taktéž rozdává i práci.");
};


instance DIA_Addon_Sancho_Franco(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 4;
	condition = DIA_Addon_Sancho_Franco_Condition;
	information = DIA_Addon_Sancho_Franco_Info;
	permanent = FALSE;
	description = "Kde můžu najít toho Franca?";
};


func int DIA_Addon_Sancho_Franco_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Sancho_Mine) && !Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Sancho_Franco_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Franco_15_00");	//Kde můžu najít toho Franca?
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_01");	//Obvykle postává u vchodu do tábora.
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_02");	//Ale buď přátelský, nebo dostaneš tak zasranou práci jako já.
	B_LogEntry(Topic_Addon_Franco,"Franco se motá okolo vstupu do tábora.");
};


instance DIA_Addon_Sancho_Spitzel(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 5;
	condition = DIA_Addon_Sancho_Spitzel_Condition;
	information = DIA_Addon_Sancho_Spitzel_Info;
	permanent = FALSE;
	description = "Musíš tady stále takhle stát?";
};


func int DIA_Addon_Sancho_Spitzel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Sancho_Franco) || Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Sancho_Spitzel_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Spitzel_15_00");	//Musíš tady stále takhle stát?
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_01");	//Je moji úlohou kontrolvat nově příchozí, aby se mezi nás nedostal žádnej špeh.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_02");	//Jakoby se někdo zajímal o tohle zapomenuté místo. Přímo veprostřed bažiny.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_03");	//Nikdo nás nenašel, nikdo nás ani nenajde. Proč by sem vlastně někdo měl posílat špeha?
};


instance DIA_Addon_Sancho_Perm(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 99;
	condition = DIA_Addon_Sancho_Perm_Condition;
	information = DIA_Addon_Sancho_Perm_Info;
	permanent = TRUE;
	description = "Něco nového?";
};


func int DIA_Addon_Sancho_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Sancho_Spitzel))
	{
		return TRUE;
	};
};


var int Comment_Franco;
var int Comment_Esteban;

func void DIA_Addon_Sancho_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Perm_15_00");	//Něco nového?
	if(Npc_IsDead(Franco) && (Comment_Franco == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_01");	//Slyšel jsem, že jsi poslal Franca do věčných lovišť. Dobrá práce ...
		if(!Npc_IsDead(Carlos))
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_02");	//... ale ten Carlos nám všem už leze pěkně na nervy. S nikým se nehodlá bavit ...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_03");	//Už jsi Carlosovi taky ukázal cestu do pekel? Kámo, seš skutečně stroj na zabíjení. Raději se ke mně ani nepřibližuj.
		};
		Comment_Franco = TRUE;
	}
	else if(Npc_IsDead(Esteban) && (Comment_Esteban == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_04");	//Slyšel jsem, že jsi zabil Estebana. Člověče, ty si fakt o něco koleduješ, že?
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_05");	//Ne, zatím nic nového.
	};
};

