
instance DIA_Addon_Lennar_EXIT(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 999;
	condition = DIA_Addon_Lennar_EXIT_Condition;
	information = DIA_Addon_Lennar_EXIT_Info;
	permanent = TRUE;
	description = "Mus?m j?t ...";
};


func int DIA_Addon_Lennar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lennar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lennar_PICKPOCKET(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 900;
	condition = DIA_Addon_Lennar_PICKPOCKET_Condition;
	information = DIA_Addon_Lennar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Lennar_PICKPOCKET_Condition()
{
	return C_Beklauen(65,100);
};

func void DIA_Addon_Lennar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Lennar_PICKPOCKET,Dialog_Back,DIA_Addon_Lennar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Lennar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Lennar_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lennar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
};

func void DIA_Addon_Lennar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
};


instance DIA_Addon_Lennar_Hi(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 1;
	condition = DIA_Addon_Lennar_Hi_Condition;
	information = DIA_Addon_Lennar_Hi_Info;
	permanent = FALSE;
	description = "?au.";
};


func int DIA_Addon_Lennar_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lennar_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_00");	//?au.
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_01");	//Ahoj, jmenuji se Lennar. V?tej v t?bo?e kop???.
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_02");	//Kop???? Myslel jsem, ?e toto je t?bor bandit? ...
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_03");	//Jasn?, v?ak bandit? tady kopou taky. (?kubne ramenem) Tak?e ...
};


instance DIA_Addon_Lennar_Attentat(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 2;
	condition = DIA_Addon_Lennar_Attentat_Condition;
	information = DIA_Addon_Lennar_Attentat_Info;
	permanent = FALSE;
	description = "O tom pokusu zavra?dit Estebana ...";
};


func int DIA_Addon_Lennar_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_00");	//(naivn?) Ano?
	AI_Output(other,self,"DIA_Addon_Lennar_ATTENTAT_15_01");	//M?? tu?en?, kdo za t?m je?
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_02");	//(nad?en?) Samoz?ejm?!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_03");	//(ho?e?n?) Tutov? je za t?m Emilio!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_04");	//(ho?e?n?) Ut?kal do dolu jako ??lenec a pak kopal jako krtek.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_05");	//(chyt?e) Ale od toho pokusu o vra?du jen sed? na lavi?ce a nepohne se ani o p??.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_06");	//(pochop?) To je ono! Aby mohl do dolu, musel m?t ?erven? k?men od Estebana.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_07");	//Jak se tak d?v?m do jeho o??, vsad?m se, ?e nebude vzdorovat dlouho.
	B_LogEntry(Topic_Addon_Esteban,"Lennar podez??v? Emilia, proto?e se Estebanovi vyh?b?.");
};


instance DIA_Addon_Lennar_Inspektor(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 3;
	condition = DIA_Addon_Lennar_Inspektor_Condition;
	information = DIA_Addon_Lennar_Inspektor_Info;
	permanent = FALSE;
	description = "Co by mohl Emilio m?t z Estebanovy smrti?";
};


func int DIA_Addon_Lennar_Inspektor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lennar_Attentat))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Inspektor_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Inspektor_15_00");	//Co by mohl Emilio m?t z Estebanovy smrti?
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_01");	//Co j? v?m? Mo?n? m? kamar?da, kter? by p?evzal po Estebanovi jeho m?sto.
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_02");	//(pro sebe) Ano, to by mohlo d?vat smysl ...
};


instance DIA_Addon_Lennar_Mine(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 4;
	condition = DIA_Addon_Lennar_Mine_Condition;
	information = DIA_Addon_Lennar_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Lennar_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_00");	//Opravdu pro m? m?? ?erven? k?men.
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_01");	//Perfektn?. Te? kone?n? rozbiju ty zatracen? ?utry na padr? - v?m p?esn?, kde za?nu!
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_02");	//Jedna v?c - kdy? p?jde? kopat, d?vej pozor, abys neuhodil p??li? tvrd?. Jinak se ti krump?? zakl?n? do zlata!
	B_Upgrade_Hero_HackChance(10);
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Lennar_Gold(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 5;
	condition = DIA_Addon_Lennar_Gold_Condition;
	information = DIA_Addon_Lennar_Gold_Info;
	permanent = FALSE;
	description = "M??e? m? nau?it jak nakopat zlato?";
};


func int DIA_Addon_Lennar_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lennar_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Gold_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_00");	//M??e? m? nau?it jak nakopat zlato?
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_01");	//Jasn?, ale pokud t? to nau??m, tak nakope? v?ce zlata.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_02");	//O to mi pr?v? jde.
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_03");	//Jo. Ale pokud nakope? v?c, tak je f?r, abych j? z toho n?co dostal.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_04");	//Tak?e ...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_05");	//Bude lep??, kdy? mi d?? ??st p?edem. Dej mi ...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_06");	//50 zla??k?.
};


var int Lennar_TeachGold;

instance DIA_Addon_Lennar_Train(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 6;
	condition = DIA_Addon_Lennar_Train_Condition;
	information = DIA_Addon_Lennar_Train_Info;
	permanent = TRUE;
	description = "Zasv?? m? do kop?n? zlata!";
};


func int DIA_Addon_Lennar_Train_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lennar_Gold) && (Lennar_TeachGold == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Train_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Train_15_00");	//Zasv?? m? do kop?n? zlata!
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_01");	//Tak?e. Mus?? b?t v prv? ?ad? trp?liv?. Nesp?chat - dokonce ani v p??pad?, ?e u? bude? us?nat.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_02");	//A taky nesm?? kopat ani do stejn?ho m?sta - sna? se to kolem nugetu p?kn? osekat.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_03");	//Dr? se m?ch rad a bude? na dobr? cest? st?t se kop?? - mistr.
		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_04");	//Nejprve chci vid?t sv?j d?l.
	};
};


instance DIA_Addon_Lennar_Hacker(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 9;
	condition = DIA_Addon_Lennar_Hacker_Condition;
	information = DIA_Addon_Lennar_Hacker_Info;
	permanent = TRUE;
	description = "V?echno v po??dku?";
};


func int DIA_Addon_Lennar_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Lennar_Hacker_15_00");	//V?echno v po??dku?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Lennar_Hacker_01_01");	//V?echno ?lape - tak?e jsem nakopal dal?? p?kn? nugety!
};

