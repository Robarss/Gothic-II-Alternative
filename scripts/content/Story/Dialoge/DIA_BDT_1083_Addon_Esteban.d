
instance DIA_Addon_Esteban_EXIT(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 999;
	condition = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Esteban_EXIT_Condition()
{
	if(Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Esteban_PICKPOCKET(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 900;
	condition = DIA_Addon_Esteban_PICKPOCKET_Condition;
	information = DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	return C_Beklauen(105,500);
};

func void DIA_Addon_Esteban_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Esteban_PICKPOCKET,Dialog_Back,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Esteban_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
};

func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
};


instance DIA_Addon_Esteban_Hi(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 2;
	condition = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Esteban_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_00");	//Tak?e, ty jsi ten chl?pek co si vybojoval p??stup do t?bora.
	AI_Output(other,self,"DIA_Addon_Esteban_Hi_15_01");	//No, tady se novinky ???? rychle ...
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_02");	//Franco byl tuh? chl?pek. Nikdo se mu neodv??il odporovat. Nikdo krom? tebe.
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_03");	//Ale ch?pej, zabil bych t?, kdyby jsi zkusil stejnou v?c se mnou.
};


instance DIA_Addon_Esteban_Mine(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 3;
	condition = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent = FALSE;
	description = "Chci se dostat do dolu!";
};


func int DIA_Addon_Esteban_Mine_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Mine_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Mine_15_00");	//Chci se dostat do dolu!
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_01");	//(?kleb? se) Jak jinak. A mluv?? se spr?vnou osobou.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_02");	//Ka?d?, kdo kope v dole, si m??e ponechat slu?nou porci zlata.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_03");	//A j? m?m na starosti ?erven? kameny, kter? pot?ebuje?, aby t? Thorus pustil.
};


instance DIA_Addon_Esteban_Rot(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 3;
	condition = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent = FALSE;
	description = "Dej mi jeden z t?ch ?erven?ch kamen?.";
};


func int DIA_Addon_Esteban_Rot_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Mine))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Rot_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Rot_15_00");	//Dej mi jeden z t?ch ?erven?ch kamen?.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_01");	//Jist?, ale nebude to zadarmo.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_02");	//Obvykle sice beru slu?nou sumu zlata abych se nechal p?esv?d?it.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_03");	//A co tvoje kop??sk? schopnosti?
	if(Hero_HackChance > 25)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_04");	//U? zn?? p?r trik?, ?e?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_05");	//Je?t? po??d nejsi expert ...
	};
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_06");	//(arogantn?) Ned?m ti ?erven? k?men, jen proto?e jsi celkem zku?en? kop??.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_07");	//Ne, m?m pro tebe jin? ?kol ...
};


instance DIA_Addon_Esteban_MIS(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 4;
	condition = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent = FALSE;
	description = "A jak? ?kol by to m?l b?t?";
};


func int DIA_Addon_Esteban_MIS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Rot))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_MIS_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_00");	//A jak? ?kol by to m?l b?t?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_01");	//Jeden ze zdej??ch bandit? se m? pokusil zab?t. Nicm?n?, ON byl zabit m?mi str??emi.
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_02");	//Asi cht?l na tv? m?sto, co?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_03");	//Byl to idiot! Vygumovan? krimin?ln?k. Pochybuju, ?e to byl jeho n?pad m? zavra?dit.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_04");	//Ne, d?lal pro n?koho jin?ho ...
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_05");	//A te? je na m?, abych na?el lidi, co jsou za to odpov?dn?.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_06");	//A? to byl kdokoliv, zaplat? za to. Najdi ho a j? t? pust?m do dolu.
	if(!Npc_IsDead(Senyan) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Senyan_Hi))
	{
		AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_07");	//Senyan m? za tebou kv?li tomu poslal.
		AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_08");	//Senyan? Ten pro m? d?l? taky. ?ekl jsem mu, aby m?l o?i otev?en?.
	};
	MIS_Judas = LOG_Running;
	Log_CreateTopic(Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Esteban,LOG_Running);
	B_LogEntry(Topic_Addon_Esteban,"Byl tady pokus o zavra?d?n? Estebana. M?m zjistit, kdo za t?m stoj?.");
};


instance DIA_Addon_Esteban_Kerl(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent = FALSE;
	description = "Kde m?m za??t s p?tr?n?m?";
};


func int DIA_Addon_Esteban_Kerl_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Kerl_15_00");	//Kde m?m za??t s p?tr?n?m?
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_01");	//Ka?d? v t?bo?e o tom v?. Nen? to ??dn? tajemstv?.
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_02");	//Zkus zjistit, kdo je na m? stran? a kdo ne. A nenech ty chl?pky, aby t? dostali.
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_03");	//Promluv si se Snafem. Ten tlust? kucha? toho v? hodn?.
	B_LogEntry(Topic_Addon_Esteban,"Abych tomu p?i?el na kloub, m?l bych si promluvit s lidmi v t?bo?e a zjistit, na ?? stran? jsou. Snaf je dobr? pro za??tek. Zaslechne hodn? klep?.");
};


instance DIA_Addon_Esteban_Armor(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 9;
	condition = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent = FALSE;
	description = "Pot?ebuju lep?? brn?n?.";
};


func int DIA_Addon_Esteban_Armor_Condition()
{
	if(Huno_ArmorCheap == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Armor_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Armor_15_00");	//Pot?ebuju lep?? brn?n?.
	AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_01");	//Na co? V?dy? u? jedno m??. To ti mus? sta?it.
	if(MIS_Judas == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_02");	//Zeptej se m? znovu a? spln?? sv?j ?kol.
	};
};


instance DIA_Addon_Esteban_Auftrag(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 99;
	condition = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent = TRUE;
	description = "O tom ?kolu ...";
};


func int DIA_Addon_Esteban_Auftrag_Condition()
{
	if(((MIS_Judas == LOG_Running) || (MIS_Judas == LOG_SUCCESS)) && (Bodyguard_Killer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_00");	//O tom ?kolu ...
	AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_01");	//Poslouchej, je tady je?t? hodn? v?c? o kter? se mus?m starat.
	if(MIS_Judas == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_02");	//No jo, ale myslel jsem si, ?e t? bude zaj?mat, kdo stoj? za t?m pokusem o vra?du ...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_03");	//Kdo? ?ekni mi jeho jm?no a moje str??e ho okam?it? pod?e?ou ...
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_04");	//Fisk, ten obchodn?k, je za to zodpov?dn?. Te? je zrovna v hospod? a nas?v?. Nem? o ni?em ani tu?en? ...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_05");	//HA! Dobr? pr?ce, k?mo. Str??e se o n?ho postaraj? ...
		AI_TurnToNPC(self,Wache_01);
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_06");	//Ho?i, sly?eli jste. Jd?te a dosta?te Fiska.
		AI_TurnToNPC(self,other);
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_07");	//Vra? se a? zase n?co zjist?? o tom pachateli.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Esteban_Away(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent = FALSE;
	description = "A te??";
};


func int DIA_Addon_Esteban_Away_Condition()
{
	if(Bodyguard_Killer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Away_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Away_15_00");	//A te??
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_01");	//Te?? J? ti ?eknu, co bude te?.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_02");	//Fisk zem?e bolestivou smrt? a ka?d? v t?bo?e se o tom dozv?.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_03");	//To bude varov?n?.
	B_StartOtherRoutine(Wache_01,"AMBUSH");
	B_StartOtherRoutine(Wache_02,"AMBUSH");
};


instance DIA_Addon_Esteban_Stone(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent = FALSE;
	description = "Ok, d?? mi te? ten ?erven? k?men?";
};


func int DIA_Addon_Esteban_Stone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Away) && (Bodyguard_Killer == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Stone_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Stone_15_00");	//Ok, d?? mi te? ten ?erven? k?men?
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_01");	//Pracovals dob?e. N?kdo jako ty nem? v dole co napr?ci.
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_02");	//Bude? u?ite?n?j?? tady v t?bo?e. Z?stane? tady a bude? d?le pracovat pro m?.
};


instance DIA_Addon_Esteban_not(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent = FALSE;
	description = "Budu o tom p?em??let.";
};


func int DIA_Addon_Esteban_not_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Stone))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_not_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_not_15_00");	//Budu o tom p?em??let.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_01");	//Asi jsi zapomn?l, s k?m mluv??. Jsem jeden z p?edn?ch lid? tohoto t?bora a bude? d?lat, co ti ?eknu.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_02");	//A j? ??k?m, ?e bude? d?lat pro m? a pro nikoho jin?ho. Rozum???
};


instance DIA_Addon_Esteban_fight(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 6;
	condition = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent = FALSE;
	description = "To si d?l?? srandu!";
};


func int DIA_Addon_Esteban_fight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Stone))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_fight_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_00");	//To si d?l?? srandu! O tomhle na?e dohoda nebyla.
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_01");	//Vid??, je tady p?r lid?, co mohou d?lat takov? nab?dky jako tahle. Samoz?ejm?, pokud se ti nel?b?, m??e? kdykoliv odej?t z t?bora ...
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_02");	//A co takhle dodr?et sv?j slib a d?t mi, co mi pat???
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_03");	//Hej - je?t? jedno slovo a moje str??e se o tebe postaraj?.
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_04");	//(?kleb? se) Jak? str??e ... ?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_05");	//Co ... ? Aha, ch?pu ... sna??? se m? zradit. ?patn? n?pad ...
	Bodyguard_Killer = FALSE;
	B_KillNpc(Wache_01);
	B_KillNpc(Wache_02);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Esteban_Duell(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 99;
	condition = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent = FALSE;
	description = "Okam?it? mi dej ten ?utr nebo si ho vezmu s?m!";
};


func int DIA_Addon_Esteban_Duell_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Rot) && (Bodyguard_Killer != TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Duell_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Duell_15_00");	//Okam?it? mi dej ten ?utr nebo si ho vezmu s?m!
	AI_Output(self,other,"DIA_Addon_Esteban_Duell_07_01");	//?ivot t? u? mus? nudit. Tak jo, n?co s t?m ud?l?me...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

