
instance DIA_BDT_1013_BANDIT_FIRSTEXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition;
	information = DIA_BDT_1013_BANDIT_FIRSTEXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_FIRSTEXIT_Info()
{
	if((Bdt13_Friend == TRUE) && !Npc_IsDead(Ambusher_1014) && !Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other,"DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00");	//Bejt tebou, nahoru do jeskyn? nechod?m - m? k?mo?i tam z tebe st?hnou k??i. A v?? tomu, ?e bojovat um?.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_EXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_EXIT_Condition;
	information = DIA_BDT_1013_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_EXIT_Condition()
{
	if(Npc_KnowsInfo(other,dia_bdt_1013_bandit_firstexit))
	{
		return TRUE;
	};
};

func void DIA_BDT_1013_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_WHERE(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_BDT_1013_BANDIT_WHERE_Condition;
	information = DIA_BDT_1013_BANDIT_WHERE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_BDT_1013_BANDIT_WHERE_Condition()
{
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_WHERE_Info()
{
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_01_00");	//Hej, odkud to jde?, hm?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Z hor..",dia_bdt_1013_bandit_where_mountain);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Byl jsem u Xardase ...",dia_bdt_1013_bandit_where_xardas);
};

func void dia_bdt_1013_bandit_where_mountain()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00");	//Z hor.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01");	//P?esn?. P?i?el jsi z hor. A to je pro tebe zl?.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02");	//Velmi zl?.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03");	//Hledaj? t? - cel? banda zlejch chlap?.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04");	//Je tady n?kdo, s k?m by sis m?l za ka?dou cenu promluvit. Poj? za mnou!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo?n? pozd?ji ...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Kdo se po mn? sh?n??",dia_bdt_1013_bandit_where_who);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi prvn?!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_xardas()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00");	//Byl jsem u Xardase...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01");	//To je ten star? ?arod?j? ??kaj? mu Xardas... To bude Braga zaj?mat.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void dia_bdt_1013_bandit_where_yes()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_YES_15_00");	//Fajn! Jdi prvn?!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_YES_01_01");	//Tak poj? za mnou, Jeskyn? je hned tady naho?e.
	Npc_ExchangeRoutine(self,"AMBUSH");
	AI_StopProcessInfos(self);
};

func void dia_bdt_1013_bandit_where_who()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_WHO_15_00");	//Kdo se po mn? sh?n??
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_01");	//Jde po tob? p?lka Khorinisu a ty mi chce? tvrdit, ?e o tom nic nev???
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_02");	//?! U? v?m! Ty o tom prost? se mnou nechce? mluvit, hm? Jak chce? - je to tvoje v?c.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_03");	//Tak jde?, nebo ne?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo?n? pozd?ji ... ",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"S k?m bych to m?l mluvit?",dia_bdt_1013_bandit_where_talkpartner);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi prvn?!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_talkpartner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00");	//S k?m bych to m?l mluvit?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01");	//S m?m ??fem. Jmenuje se Brago. Vysv?tl? ti to l?p ne? j?.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02");	//Tak jak - jdeme?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo?n? pozd?ji ...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Jak m?m v?d?t, ?e to nen? past?",dia_bdt_1013_bandit_where_notrap);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi prvn?!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_notrap()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00");	//Jak m?m v?d?t, ?e to nen? past?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01");	//Hele, u? m? za??n?? unavovat. Kdy? o mou pomoc nestoj??, ta si jdi do m?sta a nech se str?it do basy!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02");	//Bu? se mnou p?jde? hned, nebo na to m??eme rovnou zapomenout, jasn??
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo?n? pozd?ji ...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Pomalu, k?mo! Podruh? se nap?lit nenech?m.",dia_bdt_1013_bandit_where_damals);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi prvn?!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_damals()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00");	//Pomalu, k?mo! Podruh? se nap?lit nenech?m.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01");	//Hm?
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02");	//Jeden chlap?k navrhnul, abysme spole?n? z?skali n?jakej amulet a pak se rozd?lili o to, co z toho k?pne.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03");	//Jakmile se n?m to poda?ilo, spole?n? s p??teli m? napadl.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04");	//Tak to tak vypad?, ?e ses zapletl se ?patn?mi lidmi - kde se to stalo?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Na tom a? tak nez?le??.",dia_bdt_1013_bandit_where_notimportant);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Byl jsem v?zn?m v trestaneck? kolonii.",dia_bdt_1013_bandit_where_prisoner);
};

func void dia_bdt_1013_bandit_where_prisoner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00");	//Byl jsem v?zn?m v t??a?sk? kolonii.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01");	//(ohromen?) Ty jsi p?i?el zpoza bari?ry? Chlape, tak to jsme tam byli spole?n?.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02");	//Nev?m...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03");	//Byl jsem kop??em ve Star?m t?bo?e. Nem?l jsem s t?m v??m moc co do ?in?n?.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04");	//(spiklenecky) Ale co je te? d?le?it?j?? - jsi v p?knym mal?ru!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05");	//N?kdo nab?dl za tvou hlavu slu?nou odm?nu. A vyv?sil n?kolik ozn?men? - s tv?m ksichtem!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06");	//Bejt tebou, tak jsem velmi, velmi opatrn?. Je mezi n?ma p?r lid?, co by pro prachy zabili i vlastn? m?mu.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07");	//Ale m?m dojem, ?e my chlapi z kolonie bysme m?li dr?et spolu!
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08");	//Tak to abych ti rad?ji pod?koval.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09");	//Za nic. Prost? koukej z?stat na?ivu.
	Bdt13_Friend = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_EnemyOverride] = FALSE;
	Info_ClearChoices(dia_bdt_1013_bandit_where);
};

func void dia_bdt_1013_bandit_where_notimportant()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00");	//Na tom a? tak nez?le??.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01");	//Jak je libo. Tak jdeme, nebo ne?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo?n? pozd?ji ...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn! Jdi prvn?!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_later()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_LATER_15_00");	//Mo?n? pozd?ji.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_LATER_01_01");	//??dn? pozd?ji neexistuje, k?mo!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_1013_BANDIT_AMBUSH(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_AMBUSH_Condition;
	information = DIA_1013_BANDIT_AMBUSH_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_1013_BANDIT_AMBUSH_Condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_RIGHT") <= 300) && (Bdt13_Friend == FALSE))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_AMBUSH_Info()
{
	if(Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_00");	//To od tebe byla p?kn? blbost, ?es ?el za mnou.
		B_Attack(self,other,AR_SuddenEnemyInferno,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_01");	//Hej lidi, koukejte, koho jsem v?m p?ivedl.
		AI_StopProcessInfos(self);
	};
};


instance DIA_1013_BANDIT_NAME(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_NAME_Condition;
	information = DIA_1013_BANDIT_NAME_Info;
	permanent = FALSE;
	description = "Kdo je ten chl?pek, co nab?dl odm?nu?";
};


func int DIA_1013_BANDIT_NAME_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_NAME_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_00");	//Kdo je ten chl?pek, co nab?dl odm?nu?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_01");	//To nev?m, u n?s to v? jen jeden jedin?.
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_02");	//A kdo to jako m? b?t?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_03");	//Hele, chlape, tak tohle ti fakt ??ct nem??u. V??, jak to chod?.
	Log_CreateTopic(Topic_Bandits,LOG_MISSION);
	Log_SetTopicStatus(Topic_Bandits,LOG_Running);
	B_LogEntry(Topic_Bandits,"Jdou po mn? n?jac? banditi, kte?? cht?j? z?skat odm?nu, vypsanou na mou hlavu. Zaj?malo by m?, co za t?m v??m v?z?.");
	MIS_Steckbriefe = LOG_Running;
};


instance DIA_1013_BANDIT_DEXTER(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_DEXTER_Condition;
	information = DIA_1013_BANDIT_DEXTER_Info;
	permanent = TRUE;
	description = "10 zlat?ch za jm?no toho, co vypsal tu odm?nu.";
};


func int DIA_1013_BANDIT_DEXTER_Condition()
{
	if((Bdt13_Friend == TRUE) && (Bdt13_Dexter_verraten == FALSE) && Npc_KnowsInfo(other,dia_1013_bandit_name))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_DEXTER_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_00");	//10 zlat?ch za jm?no toho, co vypsal tu odm?nu.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_01");	//Ach jo, chlape, tohle fakt nem??u ud?lat.
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_02");	//Tak u? to vyklop!
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_03");	//(s hlubok?m povzdechem) Ale, chlape! No dobr?. Jmenuje se Dexter. Pobl?? farmy velkostatk??e naraz?? na takovou strmou sk?lu.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_04");	//?pln? naho?e je str??n? v?? a n?kolik dol?. N?kde pobl?? m? sv?j ?kryt.
	B_LogEntry(Topic_Bandits,"Bandity vede Dexter. Skr?v? se v dolu pobl?? velkostatk??ova s?dla.");
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_05");	//Ani to nebolelo, co. Tady je zlato.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_06");	//N? - Te? jsem si vzpomn?l, ?e vlastn? nem?m 10 zlat?ch, co bych mohl postr?dat.
		AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_07");	//Co?! J?... Hm - zapome? na to - je to moje chyba. Nem?l jsem ti to jm?no ??kat d??v, ne? jsi mi uk?zal zlato.
	};
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_08");	//A hlavn? jim ne??kej, kdo ti vyklopil.
	Bdt13_Dexter_verraten = TRUE;
};


instance DIA_1013_BANDIT_PIC(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 2;
	condition = DIA_1013_BANDIT_PIC_Condition;
	information = DIA_1013_BANDIT_PIC_Info;
	permanent = FALSE;
	description = "M??u dostat ten obr?zek?";
};


func int DIA_1013_BANDIT_PIC_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PIC_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PIC_15_00");	//M??u dostat ten obr?zek?
	AI_Output(self,other,"DIA_1013_BANDIT_PIC_01_01");	//Jasn? (sm?je se) - konec konc?, je tam TV?J ksicht.
	B_GiveInvItems(self,other,ItWr_Poster_MIS,1);
};


instance DIA_1013_BANDIT_FromMaleth(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromMaleth_Condition;
	information = DIA_1013_BANDIT_FromMaleth_Info;
	permanent = FALSE;
	description = "Jeden z farm??? z venkova m? poslal.";
};


func int DIA_1013_BANDIT_FromMaleth_Condition()
{
	if((Bdt13_Friend == TRUE) && ((MIS_Maleth_Bandits == LOG_Running) || (MIS_Maleth_Bandits == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromMaleth_Info()
{
	var C_Npc b14;
	var C_Npc b15;
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_00");	//Jeden z farm??? z venkova m? poslal.
	AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_01");	//Co? Farm??i o tom ?krytu v?d??
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_02");	//V?imli si, ?e jim mizej? ovce.
	b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);
	if(Npc_IsDead(b14) && Npc_IsDead(b15))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_03");	//Sakra! Tak to bych sebou m?l hodit. Kdy? na?li ten ?kryt pr?zdn?, mo?n? po mn? je?t? p?traj?.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_04");	//Cht?j? t? vid?t mrtv?ho.
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_05");	//Po?kej - nehodl?? m? odd?lat, ?e ne - po tom, co jsem ti pomohl?
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_06");	//Jen do toho, pozab?jej v?echny ostatn?, kdy? tak ba??? po krvi - j? s t?m nechci nic m?t!
	};
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_1013_BANDIT_FromCavalorn(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromCavalorn_Condition;
	information = DIA_1013_BANDIT_FromCavalorn_Info;
	permanent = FALSE;
	description = "Brzo tu bude hodn? dusno!";
};


func int DIA_1013_BANDIT_FromCavalorn_Condition()
{
	if((Bdt13_Friend == TRUE) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromCavalorn_Info()
{
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_00");	//Brzo zde bude hodn? dusno!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_01");	//Co se d?je?
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_02");	//Zn?? Cavalorna? Chyst? se na tebe!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_03");	//K sakru! Je na ?ivu? J? miz?m.
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY2");
	AI_StopProcessInfos(self);
};


var int bdt13_Gossip_Wildnis;

instance DIA_1013_BANDIT_PERM(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 4;
	condition = DIA_1013_BANDIT_PERM_Condition;
	information = DIA_1013_BANDIT_PERM_Info;
	permanent = TRUE;
	description = "Je tu je?t? n?co dal??ho, co by m? m?lo zaj?mat?";
};


func int DIA_1013_BANDIT_PERM_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PERM_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PERM_15_00");	//Je tu je?t? n?co dal??ho, co by m? m?lo zaj?mat?
	if(bdt13_Gossip_Wildnis == FALSE)
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_01");	//Mysl?? tady v okol?? Jestli chce? z?stat na?ivu, nesch?zej z cesty.
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_02");	//??m d?l zajde? do divo?iny, t?m v?t?? na tebe bude ??hat nebezpe??.
		bdt13_Gossip_Wildnis = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_03");	//U? jsem ti ?ekl v?echno, co jsem v?d?l.
	};
};

