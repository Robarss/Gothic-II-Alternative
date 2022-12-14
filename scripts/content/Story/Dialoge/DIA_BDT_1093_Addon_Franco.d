
instance DIA_Addon_Franco_EXIT(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 999;
	condition = DIA_Addon_Franco_EXIT_Condition;
	information = DIA_Addon_Franco_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Franco_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_EXIT_Info()
{
	if((Franco_Exit == FALSE) && (MIS_HlpLogan == LOG_Running))
	{
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");	//Nez?st?vej pozadu nebo skon??? jako krmen? pro ?raloky.
		Franco_Exit = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Franco_PICKPOCKET(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 900;
	condition = DIA_Franco_PICKPOCKET_Condition;
	information = DIA_Franco_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Ukr?st tento amulet bude riskantn?.)";
};


func int DIA_Franco_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && ((other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff)) && (Npc_HasItems(self,ItAm_Addon_Franco) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Franco_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Franco_PICKPOCKET);
	Info_AddChoice(DIA_Franco_PICKPOCKET,Dialog_Back,DIA_Franco_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Franco_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Franco_PICKPOCKET_DoIt);
};

func void DIA_Franco_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems(self,other,ItAm_Addon_Franco,1);
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Franco_PICKPOCKET);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		self.attribute[ATR_HITPOINTS_MAX] = 196;
		self.attribute[ATR_HITPOINTS] = 196;
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Franco_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Franco_PICKPOCKET);
};


instance DIA_Addon_Franco_HI(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 1;
	condition = DIA_Addon_Franco_HI_Condition;
	information = DIA_Addon_Franco_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Franco_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_HI_Info()
{
	Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
	B_LogEntry(Topic_Addon_Franco,"Jestli budu d?lat dob?e pr?ci od Franca, pust? m? do t?bora.");
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_00");	//Hej, co hled??? Chce? snad do t?bora, nebo ne?
	AI_Output(other,self,"DIA_Addon_Franco_HI_15_01");	//Jo, to chci ...
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_02");	//Nezaj?m? m?, kdo jsi. J? jsem Franco, vedu to tady.
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_03");	//Kdy? se bude? venku sna?it, tak t? vezmu do t?bora.
	if(Ramon_News == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Franco_HI_08_04");	//Ramon, str??ce u br?ny, ti ?ekne, jestli pot?ebuje nov? lidi v t?bo?e. Promluv si s n?m.
		B_LogEntry(Topic_Addon_Franco,"M?m se zaptat Ramona, str??ce u br?ny, jestli nepot?ebuje nov? lidi.");
	};
};


instance DIA_Addon_Franco_Hai(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 2;
	condition = DIA_Addon_Franco_Hai_Condition;
	information = DIA_Addon_Franco_Hai_Info;
	permanent = FALSE;
	description = "Thorus pot?ebuje nov? lidi.";
};


func int DIA_Addon_Franco_Hai_Condition()
{
	if(Ramon_News == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Hai_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_00");	//Thorus pot?ebuje nov? lidi.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_01");	//Dob?e. Postar?m se o to.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_02");	//Moment, a co j??
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_03");	//Je?t? jsi ni?eho nedos?hl.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_04");	//Pot?ebuji hodn? dobr?ch lid? a ty o t? pr?ci nev?? nic ...
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_05");	//Ok, chce? ?anci? Dostane? ji. Hlas se u Logana. Ti mo??lov? ?raloci ho fakt ?tvou.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_06");	//Pomoz mu je vy??dit, potom bude? pro t?bor dobr?.
	B_LogEntry(Topic_Addon_Franco,"Franco chce, abych pomohl Loganovi. Pak m? pust? do t?bora");
};


instance DIA_Addon_Franco_Wo(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 3;
	condition = DIA_Addon_Franco_Wo_Condition;
	information = DIA_Addon_Franco_Wo_Info;
	permanent = FALSE;
	description = "Kde najdu Logana?";
};


func int DIA_Addon_Franco_Wo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_Hai) && !Npc_IsDead(Logan) && (MIS_HlpLogan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Wo_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Wo_15_00");	//Kde najdu Logana?
	AI_Output(self,other,"DIA_Addon_Franco_Wo_08_01");	//Kdy? stoj?? p?ed vstupem do t?bora, jdi doleva pod?l sk?ly. Tam na n?ho naraz??.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_tot(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 5;
	condition = DIA_Addon_Franco_tot_Condition;
	information = DIA_Addon_Franco_tot_Info;
	permanent = FALSE;
	description = "Logan je mrtv?.";
};


func int DIA_Addon_Franco_tot_Condition()
{
	if((MIS_HlpLogan != LOG_SUCCESS) && Npc_IsDead(Logan) && Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_tot_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_tot_15_00");	//Logan je mrtv?.
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_01");	//Kruci. Byl to ten nejlep?? lovec, kter?ho jsme venku m?li. K sakru s t?m!
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_02");	//Ok, bojoval jsi s mo??lov?mi ?raloky - m??e? b?t u?ite?n? - dokonce v?c ne? v?t?ina lid? tady.
	if(MIS_HlpLogan == LOG_Running)
	{
		MIS_HlpLogan = LOG_OBSOLETE;
		B_CheckLog();
	};
};


instance DIA_Addon_Franco_HaiSuccess(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 6;
	condition = DIA_Addon_Franco_HaiSuccess_Condition;
	information = DIA_Addon_Franco_HaiSuccess_Info;
	permanent = FALSE;
	description = "Pomohl jsem Loganovi ...";
};


func int DIA_Addon_Franco_HaiSuccess_Condition()
{
	if((MIS_HlpLogan == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_HaiSuccess_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_00");	//Pomohl jsem Loganovi ...
	if(Npc_IsDead(Logan))
	{
		AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_01");	//... ,ale on to nep?e?il.
	};
	AI_Output(self,other,"DIA_Addon_Franco_HaiSuccess_08_02");	//DOBR?, bojoval jsi proti ba?inn?m ?ralok?m - mohl bys b?t u?ite?n? - p?inejmen??m v?c, ne? v?t?ina zdej??ch chlap?.
	B_GivePlayerXP(XP_Addon_HlpLogan);
	B_LogEntry(Topic_Addon_Franco,"Pomoc Loganovi Francovi nesta?ila k tomu, aby m? pustil do t?bora.");
};


instance DIA_Addon_Franco_Mis2(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 7;
	condition = DIA_Addon_Franco_Mis2_Condition;
	information = DIA_Addon_Franco_Mis2_Info;
	permanent = FALSE;
	description = "M??u te? do t?bora?";
};


func int DIA_Addon_Franco_Mis2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess) || Npc_KnowsInfo(other,DIA_Addon_Franco_tot))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Mis2_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_MIS2_15_00");	//M??u te? do t?bora?
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_01");	//Poslouchej - je tu je?t? jedna v?c, jestli chce?.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_02");	//P?ed n?kolika dny jsem poslal Edgora do mo??lu.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_03");	//M?l pro m? z?skat starou kamennou desku - ale od t? doby ho nikdo nevid?l.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_04");	//Tak?e mi tu kamenou desku p?inese? ty.
	MIS_HlpEdgor = LOG_Running;
	Log_CreateTopic(Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Stoneplate,LOG_Running);
	B_LogEntry(Topic_Addon_Stoneplate,"Franco chce kamennou tabulku, kterou mu m?l don?st Edgor. Te? je to na m?.");
	B_LogEntry(Topic_Addon_Franco,"Franco chce, abych nejprve pomohl Edgorovi, ne? m? pust? do t?bora.");
};


instance DIA_Addon_Franco_While(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 8;
	condition = DIA_Addon_Franco_While_Condition;
	information = DIA_Addon_Franco_While_Info;
	permanent = FALSE;
	description = "Jak to vypad? se zlatem?";
};


func int DIA_Addon_Franco_While_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_While_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_While_15_00");	//Jak to vypad? se zlatem?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_01");	//Co?
	AI_Output(other,self,"DIA_Addon_Franco_While_15_02");	//Dostanu za svoji pr?ci v mo??lu zaplaceno?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_03");	//(extr?m? p??telsky) Tak ty chce? zlato? Jasn?, ?ekni si, kolik? Pades?t nuget?? Sto? D?m ti kolik jen unese? ...
	AI_Output(self,other,"DIA_Addon_Franco_While_08_04");	//(?ve) Kdo si sakra mysl??, ?e jsi? D?l?? si ze m? srandu?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_05");	//Te? pohni t?m sv?m zadkem a za?ni n?co d?lat! Jinak nedostane? ani malou st?epinu zlata!!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_WOEDGOR(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 9;
	condition = DIA_Addon_Franco_WOEDGOR_Condition;
	information = DIA_Addon_Franco_WOEDGOR_Info;
	permanent = TRUE;
	description = "No, tak kde najdu Edgora?";
};


func int DIA_Addon_Franco_WOEDGOR_Condition()
{
	if((MIS_HlpEdgor == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Stone_04) < 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_WOEDGOR_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_15_00");	//(vzdychne) No, tak kde najdu Edgora?
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_08_01");	//Chce? lehkou nebo rychlou cestu?
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice(DIA_Addon_Franco_WOEDGOR,"Tu rychlou.",DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice(DIA_Addon_Franco_WOEDGOR,"?ekni jen tu cestu.",DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output(self,other,"DIA_Addon_Franco_There_08_00");	//V?ude okolo jsou ruiny. N?kde tam bude.
	AI_Output(self,other,"DIA_Addon_Franco_There_08_01");	//Mysl?m, ?e bude dost chytr? na to, aby si ud?lal ohe?. To by ti mohlo pomoct.
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00");	//?ekni jen tu cestu.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01");	//Jdi po t? l?vce a? k p?edn? br?n?. Tam bude Sancho.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02");	//Tam jdi doleva a zase po l?vce.
	B_Addon_Franco_There();
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00");	//Tu rychlou.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01");	//Ok. Jdi tedy odtud ?hlop???n? doleva a p?ejdi l?vku do mo??lu.
	B_Addon_Franco_There();
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
};


instance DIA_Addon_Franco_tafel(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 10;
	condition = DIA_Addon_Franco_tafel_Condition;
	information = DIA_Addon_Franco_tafel_Info;
	permanent = FALSE;
	description = "Tady je ta deska.";
};


func int DIA_Addon_Franco_tafel_Condition()
{
	if((Npc_HasItems(other,ItMi_Addon_Stone_04) >= 1) && (MIS_HlpEdgor == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_tafel_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_tafel_15_00");	//Tady je ta deska.
	B_GiveInvItems(other,self,ItMi_Addon_Stone_04,1);
	AI_Output(self,other,"DIA_Addon_Franco_tafel_08_01");	//Ok, velmi dob?e. Ravena to ur?it? pot???.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_HlpEdgor);
	B_LogEntry(Topic_Addon_Franco,"Donesl jsem Francovi tu tabulku, co cht?l.");
};


instance DIA_Addon_Franco_JemandAnderen(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 11;
	condition = DIA_Addon_Franco_JemandAnderen_Condition;
	information = DIA_Addon_Franco_JemandAnderen_Info;
	permanent = FALSE;
	description = "A co s t?borem? M??u u? kone?n? vstoupit?";
};


func int DIA_Addon_Franco_JemandAnderen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_tafel))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_JemandAnderen_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_JemandAnderen_15_00");	//A co s t?borem? M??u u? kone?n? vstoupit?
	if(!Npc_IsDead(Logan))
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_01");	//Ne, poslal jsem Logana. Byl na m?m seznamu v??e.
		Logan_Inside = TRUE;
		AI_Teleport(Logan,"BL_INN_CORNER_02");
		B_StartOtherRoutine(Logan,"LAGER");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_02");	//Ne, u? jsem poslal n?koho jin?ho.
	};
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_03");	//A za dal??, oni v t?bo?e nikoho nepot?ebuj?.
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_04");	//Ale j? t? tady vyu?iju dob?e, (?kleb? se) Te?, kdy? u? tu Logan nen?.
	B_LogEntry(Topic_Addon_Franco,"Franco m? nepust? do t?bora. Mysl?m, ?e se s t?mhle probl?mem vypo??d?m jinak ...");
};


instance DIA_Addon_Franco_Fight(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 12;
	condition = DIA_Addon_Franco_Fight_Condition;
	information = DIA_Addon_Franco_Fight_Info;
	permanent = TRUE;
	description = "OKAM?IT? m? pus? dovnit?!";
};


func int DIA_Addon_Franco_Fight_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_Fight_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_15_00");	//OKAM?IT? m? pus? dovnit?!
	AI_Output(self,other,"DIA_Addon_Franco_Fight_08_01");	//(v?hru?n?) A co kdy? ne?
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	Info_AddChoice(DIA_Addon_Franco_Fight,"Potom budu ?ekat o chv?li d?le ...",DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice(DIA_Addon_Franco_Fight,"Pak toho bude? litovat.",DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Duel_15_00");	//Pak toho bude? litovat.
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Duel_08_01");	//Chce? mi vyhro?ovat? TY? Chce? vyhro?ovat M?? - m?l bys dostat lekci ...
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Nothing_15_00");	//Potom budu ?ekat o chv?li d?le ...
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Nothing_08_01");	//(posm?v? se) Jasn?.
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_Pig(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 13;
	condition = DIA_Addon_Franco_Pig_Condition;
	information = DIA_Addon_Franco_Pig_Info;
	permanent = TRUE;
	description = "Ty svin?! Te? si to s tebou vy??d?m!";
};


func int DIA_Addon_Franco_Pig_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_JemandAnderen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Pig_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Pig_15_00");	//Ty svin?! Te? si to s tebou vy??d?m!
	AI_Output(self,other,"DIA_Addon_Franco_Pig_08_01");	//(zaho?kle) Takov? mal? trpasl?k se se mnou chce m??it? Jak chce?!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

