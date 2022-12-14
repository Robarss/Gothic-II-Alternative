
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
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_00");	//Sakra, dal?? nov??ek. (sm?ch) Taky sis p???el pro zlato?
	AI_Output(other,self,"DIA_Addon_Sancho_HI_15_01");	//Zlato?
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_02");	//(sm?ch) Ned?lej si starosti.
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_03");	//V?ichni nov??ci, kte?? sem p??jdou, se cht?j? dostat do dolu.
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_04");	//Ale ne?ekej, ?e to bude tak jednoduch?!
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
	description = "Jak se dostanu do t?bora?";
};


func int DIA_Addon_Sancho_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Lager_15_00");	//Jak se dostanu do t?bora?
	AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_01");	//Jednodu?e p?ejdi most.
	if(!Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_02");	//Av?ak, jestli se chce? dostat do dolu, mus?? proj?t okolo Franca.
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_03");	//Ten ale od ka?d?ho o?ek?v?, ?e nejd??v bude chv?li pracovat mimo t?bor.
	};
	Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
	B_LogEntry(Topic_Addon_Franco,"V?ichni nov??ci mus? nejd??v pracovat v ba?in?ch, a? potom jim dovol? vstoupit do dolu.");
};


instance DIA_Addon_Sancho_Mine(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 3;
	condition = DIA_Addon_Sancho_Mine_Condition;
	information = DIA_Addon_Sancho_Mine_Info;
	permanent = FALSE;
	description = "Pov?z mi v?c o dole ...";
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
	AI_Output(other,self,"DIA_Addon_Sancho_Mine_15_00");	//Pov?z mi v?c o dole ...
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_01");	//Mohu ti d?t radu? Pokus se sp??telit s Francem. Tady venku je ??fem on.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_02");	//On jedin? rozhoduje, kdo vstoup? do t?bora.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_03");	//Ale ?ance, ?e se tam dostane? jsou nulov?, jestli nebude? d?lat nic jin?ho ne? vysed?vat na sv?m leniv?m zadku.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_04");	//Tak?e si s n?m promluv a z?skej pr?ci.
	B_LogEntry(Topic_Addon_Franco,"Franco rozhoduje o tom, kdo m??e vstoupit do t?bora. Takt?? rozd?v? i pr?ci.");
};


instance DIA_Addon_Sancho_Franco(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 4;
	condition = DIA_Addon_Sancho_Franco_Condition;
	information = DIA_Addon_Sancho_Franco_Info;
	permanent = FALSE;
	description = "Kde m??u naj?t toho Franca?";
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
	AI_Output(other,self,"DIA_Addon_Sancho_Franco_15_00");	//Kde m??u naj?t toho Franca?
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_01");	//Obvykle post?v? u vchodu do t?bora.
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_02");	//Ale bu? p??telsk?, nebo dostane? tak zasranou pr?ci jako j?.
	B_LogEntry(Topic_Addon_Franco,"Franco se mot? okolo vstupu do t?bora.");
};


instance DIA_Addon_Sancho_Spitzel(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 5;
	condition = DIA_Addon_Sancho_Spitzel_Condition;
	information = DIA_Addon_Sancho_Spitzel_Info;
	permanent = FALSE;
	description = "Mus?? tady st?le takhle st?t?";
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
	AI_Output(other,self,"DIA_Addon_Sancho_Spitzel_15_00");	//Mus?? tady st?le takhle st?t?
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_01");	//Je moji ?lohou kontrolvat nov? p??choz?, aby se mezi n?s nedostal ??dnej ?peh.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_02");	//Jakoby se n?kdo zaj?mal o tohle zapomenut? m?sto. P??mo veprost?ed ba?iny.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_03");	//Nikdo n?s nena?el, nikdo n?s ani nenajde. Pro? by sem vlastn? n?kdo m?l pos?lat ?peha?
};


instance DIA_Addon_Sancho_Perm(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 99;
	condition = DIA_Addon_Sancho_Perm_Condition;
	information = DIA_Addon_Sancho_Perm_Info;
	permanent = TRUE;
	description = "N?co nov?ho?";
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
	AI_Output(other,self,"DIA_Addon_Sancho_Perm_15_00");	//N?co nov?ho?
	if(Npc_IsDead(Franco) && (Comment_Franco == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_01");	//Sly?el jsem, ?e jsi poslal Franca do v??n?ch lovi??. Dobr? pr?ce ...
		if(!Npc_IsDead(Carlos))
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_02");	//... ale ten Carlos n?m v?em u? leze p?kn? na nervy. S nik?m se nehodl? bavit ...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_03");	//U? jsi Carlosovi taky uk?zal cestu do pekel? K?mo, se? skute?n? stroj na zab?jen?. Rad?ji se ke mn? ani nep?ibli?uj.
		};
		Comment_Franco = TRUE;
	}
	else if(Npc_IsDead(Esteban) && (Comment_Esteban == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_04");	//Sly?el jsem, ?e jsi zabil Estebana. ?lov??e, ty si fakt o n?co koleduje?, ?e?
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_05");	//Ne, zat?m nic nov?ho.
	};
};

