
instance DIA_Bennet_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_EXIT_Condition;
	information = DIA_Bennet_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bennet_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_HALLO(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_HALLO_Condition;
	information = DIA_Bennet_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bennet_HALLO_Condition()
{
	if((Kapitel < 3) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bennet_HALLO_Info()
{
	AI_Output(self,other,"DIA_Bennet_HALLO_06_00");	//Neprod?v?m ??dn? zbran?. Khaled je prod?v?. Je v dom? s Onarem.
	Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader,"Khaled prod?v? zbran?.");
};


instance DIA_Bennet_TRADE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 700;
	condition = DIA_Bennet_TRADE_Condition;
	information = DIA_Bennet_TRADE_Info;
	permanent = TRUE;
	description = "M??e? mi prodat n?jak? v?ci na kov?n??";
	trade = TRUE;
};


func int DIA_Bennet_TRADE_Condition()
{
	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TRADE_Info()
{
	var int McBolzenAmount;
	var int McArrowAmount;
	AI_Output(other,self,"DIA_Bennet_TRADE_15_00");	//M??e? mi prodat n?jak? v?ci na kov?n??
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItMiSwordrawhot,100);
	Npc_RemoveInvItems(self,ItRw_Bolt,Npc_HasItems(self,ItRw_Bolt));
	McBolzenAmount = Kapitel * 10;
	CreateInvItems(self,ItRw_Bolt,McBolzenAmount);
	Npc_RemoveInvItems(self,ItRw_Arrow,Npc_HasItems(self,ItRw_Arrow));
	McArrowAmount = Kapitel * 10;
	CreateInvItems(self,ItRw_Arrow,McArrowAmount);
	AI_Output(self,other,"DIA_Bennet_TRADE_06_01");	//Co pot?ebuje??
	if(BennetLOG == FALSE)
	{
		Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry(Topic_SoldierTrader,"Bennet prod?v? kov??sk? n??in?.");
		BennetLOG = TRUE;
	};
};


instance DIA_Bennet_WhichWeapons(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 2;
	condition = DIA_Bennet_WhichWeapons_Condition;
	information = DIA_Bennet_WhichWeapons_Info;
	permanent = FALSE;
	description = "Jak? zbran? vyr?b???";
};


func int DIA_Bennet_WhichWeapons_Condition()
{
	if(((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)) && (MIS_Bennet_BringOre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhichWeapons_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_00");	//Jak? zbran? vyr?b???
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_01");	//V tuhle chv?li oby?ejn? me?e, nic jin?ho.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_02");	//Ale kdybych m?l trochu magick? rudy, mohl bych ukovat zbran?, kter? jsou mnohem lep?? ne? v?echny srovnateln? zbran? vyroben? z norm?ln? star? oceli.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_03");	//Nev?? n?hodou, kde bych tady v okol? n?jakou na?el? (sm?je se) M?m na mysli krom? Hornick?ho ?dol? samoz?ejm?.
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_04");	//Ne.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_05");	//Samoz?ejm? ne.
};


instance DIA_Bennet_BauOrSld(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 3;
	condition = DIA_Bennet_BauOrSld_Condition;
	information = DIA_Bennet_BauOrSld_Info;
	permanent = FALSE;
	description = "Jsi s farm??ema, nebo ?old?kama?";
};


func int DIA_Bennet_BauOrSld_Condition()
{
	return TRUE;
};

func void DIA_Bennet_BauOrSld_Info()
{
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_00");	//Jsi s farm??ema, nebo ?old?kama?
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_01");	//Ty si ze m? utahuje?, ?e jo?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_02");	//Byl jsem jenom zv?dav?.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_03");	//U? jsi n?kdy vid?l farm??e kovat zbran??
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_04");	//Ne.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_05");	//Tak pro? mi d?v?? tak hloup? ot?zky?
};


instance DIA_Bennet_WannaJoin(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 4;
	condition = DIA_Bennet_WannaJoin_Condition;
	information = DIA_Bennet_WannaJoin_Info;
	permanent = TRUE;
	description = "Chci se p?idat k ?oldn???m!";
};


func int DIA_Bennet_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_BauOrSld) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaJoin_15_00");	//Chci se p?idat k ?oldn???m!
	AI_Output(self,other,"DIA_Bennet_WannaJoin_06_01");	//P?esta? ?vanit, b?? za Torlofem a nech ho, a? ti d? test.
	if((MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS) || (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Bennet_WannaJoin_15_02");	//Pro?el jsem zkou?kou.
		AI_Output(self,other,"DIA_Bennet_WannaJoin_06_03");	//Dob?e, tak to pro tebe budu hlasovat.
	};
};


instance DIA_Bennet_WannaSmith(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_WannaSmith_Condition;
	information = DIA_Bennet_WannaSmith_Info;
	permanent = TRUE;
	description = "M??e? m? nau?it, jak ukovat me??";
};


func int DIA_Bennet_WannaSmith_Condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (Bennet_TeachCommon == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmith_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_15_00");	//M??e? m? nau?it, jak ukovat me??
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_01");	//Jasn?.
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_02");	//To t? bude n?co st?t. ?ekn?me 300 zlat?ch.
	Info_ClearChoices(DIA_Bennet_WannaSmith);
	Info_AddChoice(DIA_Bennet_WannaSmith,"Mo?n? pozd?ji.",DIA_Bennet_WannaSmith_Later);
	Info_AddChoice(DIA_Bennet_WannaSmith,"Dob?e. Tady m?? 300 zlatek.",DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Pay_15_00");	//Dob?e. Tady m?? 300 zlatek.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_01");	//A to byla taky zatracen? dobr? cena! M??eme za??t jakmile bude? p?ipraven.
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher,"Bennet nau?? kov??sk?mu um?n?.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_02");	//P?esta? se chovat jako naivka. ??k?m 300 a ani o minci m??.
	};
	Info_ClearChoices(DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Later_15_00");	//Mo?n? pozd?ji.
	Info_ClearChoices(DIA_Bennet_WannaSmith);
};


instance DIA_Bennet_TeachCOMMON(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 6;
	condition = DIA_Bennet_TeachCOMMON_Condition;
	information = DIA_Bennet_TeachCOMMON_Info;
	permanent = TRUE;
	description = B_BuildLearnString("Nau?it se kov??stv?",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common));
};


func int DIA_Bennet_TeachCOMMON_Condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (Bennet_TeachCommon == TRUE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachCOMMON_Info()
{
	AI_Output(other,self,"DIA_Bennet_TeachCOMMON_15_00");	//Nau? mne ukovat me?!
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_01");	//Je to celkem jednoduch?: Vezmi kus surov?ho ?eleza a dr? ho v ohni do doby, ne? se neroz?hav?.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_02");	//Pak ho polo? na kovadlinu a roztepej ?epel do pot?ebn?ho tvaru.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_03");	//Hlavn? mus?? d?vat pozor, aby ?epel p??li? nevychladla. Na opracov?n? zbran? m?? v?dycky jenom p?r minut ?asu.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_04");	//Na zbytek p?ijde? s?m - je to jenom ot?zka praxe.
	};
};


instance DIA_Bennet_WannaSmithORE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 7;
	condition = DIA_Bennet_WannaSmithORE_Condition;
	information = DIA_Bennet_WannaSmithORE_Info;
	permanent = TRUE;
	description = "Nau? mne kovat zbran? z magick? rudy!";
};


func int DIA_Bennet_WannaSmithORE_Condition()
{
	if((Bennet_TeachSmith == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmithORE_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_00");	//Nau? mne kovat zbran? z magick? rudy!
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_01");	//Ale ty nezn?? v?bec ani z?klady.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_02");	//Nejd??ve se mus?? nau?it ukovat oby?ejn? me?. Pak uvid?me.
	}
	else if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03");	//Proto?e nejsi jedn?m z n?s, tak bych byl v h?ji, kdybych ti vyzradil tajemstv? zbran? z magick? rudy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_04");	//Pouze velmi m?lo kov?ren tohle v?echno um?, a j? v???m, ?e to nedok??? dokonce ani kov??i ve m?st?.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_05");	//A to je taky dob?e. Jinak by v?ichni ty m?stsk? ochlastov? ve str??i nosili magick? me?e.
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_06");	//Nic proti tob?. (k?en? se) Vypad?? b?t v pohod?.
		};
	}
	else if(MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_07");	//Kdybych m?l magickou rudu, dokonce i j? bych to tak ud?lal.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_08");	//Ale, no t??k - jsem s ?old?kama, a um?m kovat - co jin?ho chce??
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_09");	//M??e? mi tedy potom ??ct, jak m?m ukovat zbra? z magick? rudy bez pou?it? magick? rudy?
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_10");	//Noooo...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_11");	//To jsem si myslel. Pot?ebuju nejm?n? 5 hroudek t?to rudy - nebo na to rovnou zapome?.
		if(MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_Running;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_12");	//Skv?le, p?inesl jsi mi rudu a tak? v??, jak ukovat norm?ln? me?.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_13");	//No, tak tedy pov?dej.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//Nejd?le?it?j?? v?c je: Nez?le?? na tom, zdali je tv? cel? zbra? vyroben? z magick? rudy, nebo jestli m?? pokrytou jen oby?ejnou ocelovou ?epel vrstvou rudy. Povrch je to, na ?em z?le??.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_15");	//A proto?e je ten mizernej materi?l tak drahej, popadni ocelovej prut a pou?ij p?r hrud rudy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//P?irozen? z toho nevznikne nic jin?ho, ne? ?e to jenom pokryje hotov? me? magickou rudou. Bude? muset ukovat ten me? od za??tku.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_17");	//V?echno ostatn? z?vis? na zbrani, kterou chce? vyrobit.
		Bennet_TeachSmith = TRUE;
	};
};


instance DIA_Bennet_WhereOre(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhereOre_Condition;
	information = DIA_Bennet_WhereOre_Info;
	permanent = FALSE;
	description = "Kde m??u naj?t magickou rudu?";
};


func int DIA_Bennet_WhereOre_Condition()
{
	if((MIS_Bennet_BringOre == LOG_Running) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhereOre_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhereOre_15_00");	//Kde m??u naj?t magickou rudu?
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_01");	//No, kdybych tohle jenom v?d?l. N?jak? ur?it? bude v t??a?sk? kolonii.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_02");	//Ale mo?n? bude? m?t ?t?st? a najde? tady v okol? p?r zbytk?.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_03");	//Mysl?m, ?e v hor?ch ji?n? odsud jsou n?jak? doly. Mo?n?, ?e bys tam m?l v?t?? ?t?st?.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_04");	//Ale d?vej bacha, sly?el jsem, ?e se to tam hem?? banditama.
};


instance DIA_Bennet_BringOre(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 9;
	condition = DIA_Bennet_BringOre_Condition;
	information = DIA_Bennet_BringOre_Info;
	permanent = FALSE;
	description = "Tady m?? t?ch p?t kousk? rudy.";
};


func int DIA_Bennet_BringOre_Condition()
{
	if((MIS_Bennet_BringOre == LOG_Running) && (Npc_HasItems(other,ItMi_Nugget) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BringOre_Info()
{
	AI_Output(other,self,"DIA_Bennet_BringOre_15_00");	//Tady m?? t?ch p?t kousk? rudy.
	AI_Output(self,other,"DIA_Bennet_BringOre_06_01");	//(sm?je se) Uka?!
	B_GiveInvItems(other,self,ItMi_Nugget,5);
	AI_Output(self,other,"DIA_Bennet_BringOre_06_02");	//Skute?n?! Tohle m? fakt srazilo k zemi!
	AI_Output(self,other,"DIA_Bennet_BringOre_06_03");	//Dv? si nech. Bude? je pot?ebovat, abys mohl ukovat svoj? vlastn? zbra?.
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	MIS_Bennet_BringOre = LOG_SUCCESS;
};


var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;

func void B_SayBennetLATER()
{
	AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_04");	//Ne, je?t? ne. Vra? se pozd?ji.
};


instance DIA_Bennet_TeachSmith(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 30;
	condition = DIA_Bennet_TeachSmith_Condition;
	information = DIA_Bennet_TeachSmith_Info;
	permanent = TRUE;
	description = "Chci v?d?t v?c o kut? zbran? z magick? rudy.";
};


func int DIA_Bennet_TeachSmith_Condition()
{
	if((Bennet_TeachSmith == TRUE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSmith_Info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSmith_15_00");	//Chci v?d?t v?c o kut? zbran? z magick? rudy.
	if(Kapitel == 1)
	{
		B_SayBennetLATER();
	}
	else if((Kapitel == 2) && (Bennet_Kap2Smith == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_01");	//Mohu t? nau?it, jak kovat me?e z magick? rudy nebo dokonce obouru?n? zbran?.
		Bennet_Kap2Smith = TRUE;
	}
	else if((Kapitel == 3) && (MIS_ReadyforChapter4 == FALSE) && (Bennet_Kap3Smith == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_02");	//Zdokonalil jsem svoj? techniku. Nyn? t? mohu nau?it, jak vytvo?it s pomoc? rudy t??k? me?e nebo t??k? obouru?n? me?e.
		Bennet_Kap3Smith = TRUE;
	}
	else if((MIS_ReadyforChapter4 == TRUE) && (Kapitel < 5) && (Bennet_Kap4Smith == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_03");	//Mysl?m, ?e jsem se tentokr?t p?ekonal. Vytvo?il jsem dv? bojov? ?epele. To je ta nejlep?? v?c, jakou jsem dote? vid?l.
		Bennet_Kap4Smith = TRUE;
	}
	else if((Kapitel >= 5) && (Bennet_Kap5Smith == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_04");	//Posly?. Mysl?m, ?e jsem pr?v? dostal dokonal? n?pad. Zbran? z magick? rudy, pot??sn?n? dra?? krv?. A j? p?esn? v?m, jak na to p?jdu!
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_05");	//(zub? se) Chce? to v?d?t?
		Bennet_Kap5Smith = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//Jak? druh zbran? bys cht?l vyrobit?
	};
	Info_ClearChoices(DIA_Bennet_TeachSmith);
	Info_AddChoice(DIA_Bennet_TeachSmith,Dialog_Back,DIA_Bennet_TeachSmith_BACK);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE) && (Kapitel >= 2))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),DIA_Bennet_TeachSmith_1hSpecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE) && (Kapitel >= 2))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),DIA_Bennet_TeachSmith_2hSpecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE) && (Kapitel >= 3))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),DIA_Bennet_TeachSmith_1hSpecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE) && (Kapitel >= 3))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),DIA_Bennet_TeachSmith_2hSpecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE) && (Kapitel >= 4))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),DIA_Bennet_TeachSmith_1hSpecial3);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE) && (Kapitel >= 4))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),DIA_Bennet_TeachSmith_2hSpecial3);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE) && (Kapitel >= 5))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),DIA_Bennet_TeachSmith_1hSpecial4);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE) && (Kapitel >= 5))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),DIA_Bennet_TeachSmith_2hSpecial4);
	};
};

func void DIA_Bennet_TeachSmith_BACK()
{
	Info_ClearChoices(DIA_Bennet_TeachSmith);
};

func void DIA_Bennet_TeachSmith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void DIA_Bennet_TeachSmith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void DIA_Bennet_TeachSmith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void DIA_Bennet_TeachSmith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};

func void DIA_Bennet_TeachSmith_1hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_03);
};

func void DIA_Bennet_TeachSmith_2hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_03);
};

func void DIA_Bennet_TeachSmith_1hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_04);
};

func void DIA_Bennet_TeachSmith_2hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_04);
};


instance DIA_Bennet_KAP3_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_KAP3_EXIT_Condition;
	information = DIA_Bennet_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_WhyPrison(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhyPrison_Condition;
	information = DIA_Bennet_WhyPrison_Info;
	permanent = FALSE;
	description = "Za co ses dostal do lochu?";
};


func int DIA_Bennet_WhyPrison_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhyPrison_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_00");	//Za co ses dostal do lochu?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_01");	//Ty svin? m? hodily do t?hle d?ry. Pr? jsem zavra?dil paladina.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_02");	//Ale j? jsem to neud?lal, oni se to jenom pokou?? na m? hodit.
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_03");	//Pro? by to d?lali?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_04");	//Jak to m?m v?d?t? M?l bys mne odtud dostat.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_05");	//Promluv s lordem Hagenem, probourej ze?, je to jedno - prost? n?co ud?lej!
	MIS_RescueBennet = LOG_Running;
	Log_CreateTopic(TOPIC_RescueBennet,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RescueBennet,LOG_Running);
	B_LogEntry(TOPIC_RescueBennet,"Bennet je v p?kn? brynd? a te? by ud?lal cokoliv, jen aby se dostal z basy.");
};


instance DIA_Bennet_WhatHappened(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhatHappened_Condition;
	information = DIA_Bennet_WhatHappened_Info;
	permanent = FALSE;
	description = "Co se stalo?";
};


func int DIA_Bennet_WhatHappened_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhatHappened_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_01");	//?el jsem do centra s Hodgesem nakoupit n?jak? z?soby pro na?e chlapce.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_02");	//Najednou jsme usly?eli hlasit? v?k?ik a zvuk, jako by n?kdo b??el.
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_03");	//Jdi p??mo k v?ci.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_04");	//V?d?li jsme najednou, ?e se n?co stalo a ?e n?s chyt?, kdy? n?s tam n?kdo uvid?.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_05");	//B??eli jsme jak o ?ivot. Potom, t?sn? p?edt?m, ne? jsme dob?hli k m?stsk? br?n?, jsem zakopnul a vyvrknul jsem si kotn?k.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_06");	//Zbytek je u? jednoduchej. Najednou u mne byla domobrana a ta m? uvrhla rovnou do t?hle d?ry.
};


instance DIA_Bennet_Victim(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Victim_Condition;
	information = DIA_Bennet_Victim_Info;
	permanent = FALSE;
	description = "Kdo byl zavra?d?n?";
};


func int DIA_Bennet_Victim_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Victim_Info()
{
	AI_Output(other,self,"DIA_Bennet_Victim_15_00");	//Kdo byl zavra?d?n?
	AI_Output(self,other,"DIA_Bennet_Victim_06_01");	//Nem?m pon?t? - jeden z paladin?, v?bec je nezn?m.
	AI_Output(other,self,"DIA_Bennet_Victim_15_02");	//Jak se jmenoval?
	AI_Output(self,other,"DIA_Bennet_Victim_06_03");	//N?jak? Lothar, mysl?m. No, nev?m, opravdu si nejsem jistej.
	AI_Output(self,other,"DIA_Bennet_Victim_06_04");	//Rad?i by ses m?l zeptat lorda Hagena, on zn? v?echny detaily.
	B_LogEntry(TOPIC_RescueBennet,"Lothar, jeden z paladin?, byl zavra?d?n. Bli??? informaci by mi mohl podat Lord Hagen, kter? vede cel? vy?et?ov?n?.");
};


instance DIA_Bennet_Evidence(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Evidence_Condition;
	information = DIA_Bennet_Evidence_Info;
	permanent = FALSE;
	description = "Maj? proti tob? n?jak? d?kaz?";
};


func int DIA_Bennet_Evidence_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Evidence_Info()
{
	AI_Output(other,self,"DIA_Bennet_Evidence_15_00");	//Maj? proti tob? n?jak? d?kaz?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_01");	//??kaj?, ?e maj? n?jak?ho sv?dka, kter? mne poznal.
	AI_Output(other,self,"DIA_Bennet_Evidence_15_02");	//Nev?? n?hodou, kdo je ten sv?dek?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_03");	//Ne. V?echno, co v?m, je, ?e je to lh??.
	B_LogEntry(TOPIC_RescueBennet,"Jeden sv?dek tvrd?, ?e Benneta vid?l. Mus?m ho naj?t a zjistit, jak to bylo doopravdy.");
	RescueBennet_KnowsWitness = TRUE;
};


instance DIA_Bennet_Investigation(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Investigation_Condition;
	information = DIA_Bennet_Investigation_Info;
	permanent = FALSE;
	description = "Kdo vede vy?et?ov?n??";
};


func int DIA_Bennet_Investigation_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_Evidence))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Investigation_Info()
{
	AI_Output(other,self,"DIA_Bennet_Investigation_15_00");	//Kdo vede vy?et?ov?n??
	AI_Output(self,other,"DIA_Bennet_Investigation_06_01");	//S?m lord Hagen. A proto?e ob?t? byl jeden z paladin?, spad? tenhle p??pad pod v?le?n? soud.
	AI_Output(other,self,"DIA_Bennet_Investigation_15_02");	//Co to znamen??
	AI_Output(self,other,"DIA_Bennet_Investigation_06_03");	//To je jednoduch? uhodnout. Pokud se odtud nedostanu, bez okolk? m? pov?s?.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_04");	//Mus?? mi pomoct, nebo tady bude v?lka. Lee to nenech? b?t jen tak.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_05");	//M??e? si d?t dohromady s?m, co to znamen?.
};


instance DIA_Bennet_ThankYou(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_ThankYou_Condition;
	information = DIA_Bennet_ThankYou_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bennet_ThankYou_Condition()
{
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Bennet_ThankYou_Info()
{
	if(hero.guild == GIL_SLD)
	{
		other.guild = GIL_DJG;
		Npc_SetTrueGuild(other,GIL_DJG);
	};
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_00");	//Chlape, u? jsem si myslel, ?e m? v??n? pov?s?!
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_01");	//No, nakonec to dob?e dopadlo.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_02");	//To mi pov?dej. M?l jsi vid?t ksicht toho voj?ka, kdy? m? musel pustit ven!
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_03");	//(sm?je se) Byl tak vystra?enej, ?e si skoro nad?lal do kalhot.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_04");	//Co? mi p?ipom?n?, ?e pro tebe n?co m?m.
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_05");	//Co mysl???
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_06");	//(k?en? se) D?re?ek.
};


instance DIA_Bennet_Present(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Present_Condition;
	information = DIA_Bennet_Present_Info;
	permanent = FALSE;
	description = "Jak? d?re?ek?";
};


func int DIA_Bennet_Present_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Present_Info()
{
	AI_Output(other,self,"DIA_Bennet_Present_15_00");	//Jak? d?re?ek?
	AI_Output(self,other,"DIA_Bennet_Present_06_01");	//Sly?eli jsme o drac?ch, kte?? by m?li pr? bejt v ?dol?.
	AI_Output(other,self,"DIA_Bennet_Present_15_02");	//Oni tam skute?n? jsou!
	AI_Output(self,other,"DIA_Bennet_Present_06_03");	//Dob?e, j? ti v???m.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_04");	//V ka?d?m p??pad? se p?r chlapc? rozhodlo j?t do ?dol?.
		AI_Output(self,other,"DIA_Bennet_Present_06_05");	//(zub? se) Maj? v pl?nu to tam trochu uklidit.
		AI_Output(other,self,"DIA_Bennet_Present_15_06");	//A co to m? co d?lat se mnou?
		AI_Output(self,other,"DIA_Bennet_Present_06_07");	//(py?n?) Vytvo?il jsem nov? typ brn?n?. Brn?n? drakobijc?!
		AI_Output(self,other,"DIA_Bennet_Present_06_08");	//Je robustn?j?? a leh?? ne? norm?ln? brn?n?.
		AI_Output(self,other,"DIA_Bennet_Present_06_09");	//A proto?e jsi m? zachr?nil, chci, abys dostal prvn? kus. Je to dar!
		CreateInvItems(self,itar_djg_l,1);
		B_GiveInvItems(self,other,itar_djg_l,1);
		AI_Output(self,other,"DIA_Bennet_Present_06_10");	//Myslel jsem, ?e by se ti to mohlo hodit. Bude? pot?ebovat to spr?vn? vybaven?, ne? p?jde? tam dol? do ?dol?.
		AI_Output(self,other,"DIA_Bennet_Present_06_11");	//Tak? m? zaj?maj? dra?? ?upiny. Opravdov? dra?? ?upiny. Slu?n? ti za n? zaplat?m.
		AI_Output(other,self,"DIA_Bennet_Present_15_12");	//Kolik dostanu za jednu ?upinu?
		B_Say_Gold(self,other,Value_DragonScale);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_13");	//Krom? toho jsem si myslel, ?e by sis asi necht?l nechat ten dra?? hon uj?t.
		AI_Output(other,self,"DIA_Bennet_Present_15_14");	//A?
		AI_Output(self,other,"DIA_Bennet_Present_06_15");	//Tady, vezmi si tenhle amulet. Mysl?m, ?e ho bude? pot?ebovat v?c ne? j?.
		CreateInvItems(self,ItAm_Hp_01,1);
		B_GiveInvItems(self,other,ItAm_Hp_01,1);
	};
};


var int Bennet_DragonScale_Counter;
var int Show_DJG_Armor_M;

instance DIA_Bennet_DragonScale(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DragonScale_Condition;
	information = DIA_Bennet_DragonScale_Info;
	permanent = TRUE;
	description = "M?m pro tebe p?r dra??ch ?upin.";
};


func int DIA_Bennet_DragonScale_Condition()
{
	if((Npc_HasItems(other,ItAt_DragonScale) > 0) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DragonScale_Info()
{
	AI_Output(other,self,"DIA_Bennet_DragonScale_15_00");	//M?m pro tebe p?r dra??ch ?upin.
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_01");	//Opravdov? dra?? ?upiny!
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_02");	//Tady je tv? zlato!
	Bennet_DragonScale_Counter = Bennet_DragonScale_Counter + Npc_HasItems(other,ItAt_DragonScale);
	B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_DragonScale) * Value_DragonScale);
	B_GiveInvItems(other,self,ItAt_DragonScale,Npc_HasItems(other,ItAt_DragonScale));
	if((Bennet_DragonScale_Counter >= 20) && (Show_DJG_Armor_M == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_DragonScale_06_03");	//Dob?e, to by sta?ilo. Mohl bych ti prodat nov?, vylep?en? brn?n?, pokud bys m?l z?jem.
		Show_DJG_Armor_M = TRUE;
	};
};


var int Bennet_DIA_Bennet_DJG_ARMOR_M_permanent;

instance DIA_Bennet_DJG_ARMOR_M(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DJG_ARMOR_M_Condition;
	information = DIA_Bennet_DJG_ARMOR_M_Info;
	permanent = TRUE;
	description = "St?edn? t??k? drakobijeck? zbroj. Ochrana: zbran? 120, ??py 120. (6000 zla??k?).";
};


func int DIA_Bennet_DJG_ARMOR_M_Condition()
{
	if((Bennet_DIA_Bennet_DJG_ARMOR_M_permanent == FALSE) && (hero.guild == GIL_DJG) && (Show_DJG_Armor_M == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_M_Info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_00");	//Chci si koupit nov? brn?n?.
	if(Npc_HasItems(other,ItMi_Gold) >= 6000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_01");	//Velmi dob?e. Bude se ti to l?bit.
		AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_02");	//Za tu cenu by opravdu m?lo.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_03");	//Zjist??, ?e to brn?n? stoj? za ka?dej ten zla??k.
		B_GiveInvItems(other,self,ItMi_Gold,6000);
		CreateInvItems(self,itar_djg_m,1);
		B_GiveInvItems(self,other,itar_djg_m,1);
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_04");	//Nem?? dost zlata.
	};
};


instance DIA_Bennet_BetterArmor(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_BetterArmor_Condition;
	information = DIA_Bennet_BetterArmor_Info;
	permanent = FALSE;
	description = "V?m, jak brn?n? je?t? v?c vylep?it.";
};


func int DIA_Bennet_BetterArmor_Condition()
{
	if((PlayergetsFinalDJGArmor == TRUE) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BetterArmor_Info()
{
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_00");	//V?m, jak brn?n? je?t? v?c vylep?it.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_01");	//(usm?v? se) Tak mi to ?ekni.
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_02");	//Mohl bys pokr?t dra?? ?upiny magickou rudou.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_03");	//(sm?je se) Tohle m? u? taky napadlo. A m?? pravdu.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_04");	//M? nejnov?j?? brn?n? p?ed?? v?echno, co jsi doposud vid?l. Je te? lehk? a masivn?.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_05");	//Je PERFEKTN?.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_06");	//M??e? ho koupit, jestli chce?. Ned?v?m tuhle nab?dku jen tak n?komu a nav?c cena zahrnuje pouze v?robn? n?klady.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_07");	//Ale jen kvuli tob? si nebudu ??tovat nic nav?c, tak?e to bude? m?t levn?j??
};


var int Bennet_DIA_Bennet_DJG_ARMOR_H_permanent;

instance DIA_Bennet_DJG_ARMOR_H(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DJG_ARMOR_H_Condition;
	information = DIA_Bennet_DJG_ARMOR_H_Info;
	permanent = TRUE;
	description = "Dra?? r?dn? zbroj. Ochrana: zbran? 150, ??py 150. (10000 zla??k?).";
};


func int DIA_Bennet_DJG_ARMOR_H_Condition()
{
	if((Bennet_DIA_Bennet_DJG_ARMOR_H_permanent == FALSE) && (hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Bennet_BetterArmor))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_H_Info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_H_15_00");	//Dej mi to brn?n?.
	if(Npc_HasItems(other,ItMi_Gold) >= 10000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_01");	//Tohle je nejlep?? brn?n?, jak? jsem kdy vyrobil.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_02");	//Opravdov? skvost.
		B_GiveInvItems(other,self,ItMi_Gold,10000);
		CreateInvItems(self,itar_dragonss,1);
		B_GiveInvItems(self,other,itar_dragonss,1);
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_03");	//Nem?? dost zlata.
	};
};


instance DIA_Bennet_RepairNecklace(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_RepairNecklace_Condition;
	information = DIA_Bennet_RepairNecklace_Info;
	permanent = FALSE;
	description = "Um?? opravit i klenoty?";
};


func int DIA_Bennet_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Bennet_RepairNecklace_15_00");	//Um?? opravit i klenoty?
	AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_01");	//Z?le?? na tom, jak?. Nejd??v mi uka?, co m?? na mysli.
	if(MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_02");	//Taky se odsud mus?m nejd??v dostat.
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_03");	//P?edt?m ti tu v?c z?ejm? neoprav?m.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Bennet_ShowInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_ShowInnosEye_Condition;
	information = DIA_Bennet_ShowInnosEye_Info;
	permanent = FALSE;
	description = "M??e? se pod?vat na tenhle amulet?";
};


func int DIA_Bennet_ShowInnosEye_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_ShowInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_00");	//M??e? se pod?vat na tenhle amulet?
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_01");	//Jasn?, uka? mi ho.
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_02");	//Hmm, to je skute?n? n?dhern? pr?ce. Oprava bude z?hul. Ale mysl?m si, ?e jsem schopnej to opravit.
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_03");	//Jak dlouho ti to potrv??
	if(MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_04");	//No, te? jsem se zaseknul tady. Nebo tu snad vid?? n?kde d?lnu?
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_05");	//Kdybych byl ve sv? kov?rn?, byl bych schopnej to v?echno ud?lat za jeden den. Ale samoz?ejm? se mus?m nejd??v dostat ven.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_06");	//Pokud mi ho tu nech??, bude hotovej do doby, ne? se sem z?tra vr?t??.
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_07");	//A dokonce ti to ani nebudu ??tovat. V?dy? jsi m? dostal ven z lochu.
	};
	B_LogEntry(TOPIC_INNOSEYE,"Bennet je ten prav? kov??, kter? mi oprav? ten amulet.");
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Bennet_GiveInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_GiveInnosEye_Condition;
	information = DIA_Bennet_GiveInnosEye_Info;
	permanent = FALSE;
	description = "Tady je ten amulet, oprav mi ho, pros?m.";
};


func int DIA_Bennet_GiveInnosEye_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) >= 1) && (MIS_SCKnowsInnosEyeIsBroken == TRUE) && (MIS_RescueBennet == LOG_SUCCESS) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GiveInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_GiveInnosEye_15_00");	//Tady je ten amulet, oprav mi ho, pros?m.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_01");	//Dob?e. Budu to m?t opraven? do z?t?ka.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_02");	//M??e? potom ke mn? p?ij?t a dostat ho.
	Npc_RemoveInvItems(other,ItMi_InnosEye_Broken_Mis,1);
	AI_PrintScreen(Print_InnoseyeGiven,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	Bennet_RepairDay = Wld_GetDay();
};


instance DIA_Bennet_GetInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_GetInnosEye_Condition;
	information = DIA_Bennet_GetInnosEye_Info;
	permanent = TRUE;
	description = "Je amulet hotov??";
};


func int DIA_Bennet_GetInnosEye_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_GiveInnosEye) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GetInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_GetInnosEye_15_00");	//Je amulet hotov??
	if(Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_01");	//Ano, tady.
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
		AI_PrintScreen(Print_InnosEyeGet,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_02");	//Musel jsem tam zasadit nov? k?men.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_03");	//Pracoval jsem na n?m celou noc a te? vypad? jako nov?.
		B_LogEntry(TOPIC_INNOSEYE,"Amulet je op?t cel?, Bennet odvedl skv?lou pr?ci.");
		MIS_Bennet_InnosEyeRepairedSetting = LOG_SUCCESS;
		B_GivePlayerXP(XP_InnosEyeIsRepaired);
	}
	else
	{
		B_SayBennetLATER();
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_05");	//Pokud m? bude? zdr?ovat, bude to trvat d?le.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Bennet_KAP4_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_KAP4_EXIT_Condition;
	information = DIA_Bennet_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_DRACHENEIER(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_DRACHENEIER_Condition;
	information = DIA_Bennet_DRACHENEIER_Info;
	permanent = TRUE;
	description = "Je n?co, co m??e? ud?lat s dra??mi vejci?";
};


func int DIA_Bennet_DRACHENEIER_Condition()
{
	if((Kapitel >= 4) && (BennetsDragonEggOffer == 0) && (Npc_HasItems(other,ItAt_DragonEgg_MIS) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int BennetsDragonEggOffer;
var int DRACHENEIER_angebotenXP_OneTime;

func void DIA_Bennet_DRACHENEIER_Info()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_00");	//Je n?co, co m??e? ud?lat s dra??mi vejci?
	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_01");	//Dra??mi vejci? Jak jsi k nim krucin?l p?i?el?
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_02");	//Vzal jsem je je?t?ran?m.
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_03");	//Uka? mi ho.
	};
	Npc_RemoveInvItems(other,ItAt_DragonEgg_MIS,1);
	AI_PrintScreen(PRINT_ItemGegeben,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_04");	//Mmh. Velmi ?ikovn? materi?l. Ide?ln? k dokon?en? brn?n?. Teda pokud se mi je poda?? rozlousknout.
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_05");	//Tak?e co bude? Chce? je?
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_06");	//Jasn?! Dej je sem.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_07");	//Jak dlouho tu bude? s tou v?c? m?vat? Chce?, abych to koupil, nebo ne?
	};
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_08");	//Zaplat?m ti, hmm, ?ekn?me, 300 zlat?ch za ka?d? dra?? vejce, kter? mi p?inese?.
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"Tak si nech svoje zlato. Mysl?m, ?e si to nech?m.",DIA_Bennet_DRACHENEIER_nein);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"Toto jsou dra?? vejce, ne bezcenn? slepi?? vejce.",DIA_Bennet_DRACHENEIER_mehr);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"Dohodnuto.",DIA_Bennet_DRACHENEIER_ok);
	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_DRACHENEIER,"Bennet je ochoten mi dob?e zaplatit za v?echna dra?? vejce, kter? naleznu.");
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
		DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};

func void DIA_Bennet_DRACHENEIER_ok()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_00");	//Dohodnuto.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_01");	//Dob?e.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_02");	//Tak tyhle v?ci?ky nos d?l, pokud je bude? schopen dostat.
	if(BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;
	};
	CreateInvItems(self,ItMi_Gold,BennetsDragonEggOffer);
	B_GiveInvItems(self,other,ItMi_Gold,BennetsDragonEggOffer);
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_03");	//Ehm. ??k??, ?e jsi je vzal je?t?ran?m?
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_04");	//Spr?vn?.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_05");	//Z toho, co jsem sly?el, tak v?t?ina je?t?ran? bydl? v jeskyn?ch.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_06");	//Nep?ekvapilo by m?, kdybys na?el v?c t?chhle v?c? v jeskyn?ch tady v okol?.
	B_LogEntry(TOPIC_DRACHENEIER,"Bennet si mysl?, ?e bych se po vejc?ch m?l pod?vat v khorinissk?ch jeskyn?ch, kde by m?li je?t?rani p?eb?vat.");
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_07");	//Tady. Vem si tuhle mapu. Ta ti pom??e naj?t ty jeskyn?.
	CreateInvItems(self,ItWr_Map_Caves_MIS,1);
	B_GiveInvItems(self,other,ItWr_Map_Caves_MIS,1);
	B_LogEntry(TOPIC_DRACHENEIER,"Dal mi mapu jeskyn?, kter? by mi m?la pomoci.");
	if(1 == 2)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_08");	//Nejd??v ale mus?? z?skat mapu jeskyn? od zem?pisce ve m?st?. Byla by to ?koda, kdybys je nemohl naj?t v?echny.
		B_LogEntry(TOPIC_DRACHENEIER,"M?l bych si u m?stn?ho kartografa obstarat mapu jeskyn?, aby mi ??dn? vejce neuniklo.");
	};
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_mehr_15_00");	//Tohle jsou dra?? vejce, ne bezcenn? slepi?? vaj??ka.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_mehr_06_01");	//(podr??d?n?) Dob?e. Tak 350. Ale v?c ti za n? u? d?t nem??u - pak by se mi to nevyplatilo.
	BennetsDragonEggOffer = 350;
};

func void DIA_Bennet_DRACHENEIER_nein()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_nein_15_00");	//Tak si nech svoje zlato. Mysl?m, ?e si to nech?m.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_nein_06_01");	//Dej mi v?d?t, a? si to rozmysl??.
	CreateInvItems(other,ItAt_DragonEgg_MIS,1);
	AI_PrintScreen(PRINT_ItemErhalten,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	BennetsDragonEggOffer = 0;
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};


instance DIA_Bennet_EierBringen(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_EierBringen_Condition;
	information = DIA_Bennet_EierBringen_Info;
	permanent = TRUE;
	description = "Zaj?maj? t? je?t? dal?? dra?? vejce?";
};


func int DIA_Bennet_EierBringen_Condition()
{
	if((BennetsDragonEggOffer > 0) && (Kapitel >= 4) && (Npc_HasItems(other,ItAt_DragonEgg_MIS) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int DragonEggCounter;

func void DIA_Bennet_EierBringen_Info()
{
	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;
	AI_Output(other,self,"DIA_Bennet_EierBringen_15_00");	//Zaj?maj? t? je?t? dal?? dra?? vejce?
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_01");	//Jist?!
	DragonEggCount = Npc_HasItems(other,ItAt_DragonEgg_MIS);
	if(DragonEggCount == 1)
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_02");	//Tady. M?m dal??.
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
		Npc_RemoveInvItems(other,ItAt_DragonEgg_MIS,1);
		AI_PrintScreen(PRINT_ItemGegeben,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		DragonEggCounter = DragonEggCounter + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_03");	//M?m tady je?t? n?jak?.
		Npc_RemoveInvItems(other,ItAt_DragonEgg_MIS,DragonEggCount);
		concatText = ConcatStrings(IntToString(DragonEggCount),PRINT_ItemsGegeben);
		AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		XP_DJG_BringDragonEggs = DragonEggCount * XP_DJG_BringDragonEgg;
		DragonEggCounter = DragonEggCounter + DragonEggCount;
		B_GivePlayerXP(XP_DJG_BringDragonEggs);
	};
	if(DragonEggCounter <= 7)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_04");	//Skv?le. Dej to sem. D?val ses po nich v?ude? Jist? mus? n?kde b?t je?t? n?jak?.
	}
	else if(DragonEggCounter <= 11)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_05");	//Kdy tyhle v?ci?ky v?bec po??d nach?z??? Vsad?m se, ?e u? jich tady moc nebude.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_06");	//Nemysl?m si, ?e te? n?jak? dal?? najde?. A j? u? jich m?m tolik, ?e ani nev?m, co s nimi budu d?lat.
		TOPIC_END_DRACHENEIER = TRUE;
	};
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_07");	//Jo, spr?vn?. Tady m?? pen?ze.
	DragonEggGeld = DragonEggCount * BennetsDragonEggOffer;
	CreateInvItems(self,ItMi_Gold,DragonEggGeld);
	B_GiveInvItems(self,other,ItMi_Gold,DragonEggGeld);
};


instance DIA_Bennet_KAP5_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_KAP5_EXIT_Condition;
	information = DIA_Bennet_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_KnowWhereEnemy(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_KnowWhereEnemy_Condition;
	information = DIA_Bennet_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Pot?ebuju se dostat na ostrov. Kov?? by se mi mohl hodit.";
};


func int DIA_Bennet_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Bennet_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_00");	//Pot?ebuju se dostat na ostrov. Kov?? by se mi mohl hodit.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_01");	//A to si myslel jako mne?
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_02");	//Jo. Co na to ??k??? V ka?d?m p??pad? by t? to dostalo odtud pry?.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_03");	//Je to lep?? ne? Onarova farma. Chlap?e, dokonce i peklo nem??e b?t tak ?patn?. Po??tej se mnou.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Bennet by mohl odej?t klidn? hned te?. Jeho kov??sk?mu um?n? se hned tak n?kdo nevyrovn? a j? se od n?j mohu lecos p?iu?it.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_04");	//M? pos?dka je v tuto chv?li ji? kompletn?.
		AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_05");	//Pak tedy jednoho z nich po?li zase pry?.
	}
	else
	{
		Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy,"D?m ti v?as v?d?t a? t? budu pot?ebovat.",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy,"Tak bu? tedy m?m kov??em. Sejdeme se v p??stavu!",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

func void DIA_Bennet_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_Yes_15_00");	//Tak tedy bu? m?m kov??em. Uvid?me se v p??stavu.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01");	//Dob?e. Uvid?me se pozd?ji.
	B_GivePlayerXP(XP_Crewmember_Success);
	self.flags = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
};

func void DIA_Bennet_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_No_15_00");	//D?m ti v?as v?d?t, a? t? budu pot?ebovat.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_No_06_01");	//Fajn. Budu tady.
	Bennet_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
};


instance DIA_Bennet_LeaveMyShip(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_LeaveMyShip_Condition;
	information = DIA_Bennet_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Budu si muset naj?t jin?ho kov??e.";
};


func int DIA_Bennet_LeaveMyShip_Condition()
{
	if((Bennet_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Bennet_LeaveMyShip_15_00");	//Budu si muset naj?t jin?ho kov??e.
	AI_Output(self,other,"DIA_Bennet_LeaveMyShip_06_01");	//Jednou je to takhle a za chv?li zase jinak. Dej si to v hlav? dohromady, jo? A a? bude? v?d?t, co vlastn? chce?, dej mi potom v?d?t.
	Bennet_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Bennet_StillNeedYou(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_StillNeedYou_Condition;
	information = DIA_Bennet_StillNeedYou_Info;
	permanent = TRUE;
	description = "Poj? zp?tky. Nem??u naj?t jin?ho kov??e.";
};


func int DIA_Bennet_StillNeedYou_Condition()
{
	if(((Bennet_IsOnBoard == LOG_OBSOLETE) || (Bennet_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Bennet_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Bennet_StillNeedYou_15_00");	//Poj? zp?tky. Nem??u naj?t jin?ho kov??e.
	AI_Output(self,other,"DIA_Bennet_StillNeedYou_06_01");	//(na?tvan?) Spr?vn?! Jsem tu jenom j?, tak nikoho nehledej. Uvid?me se pozd?ji v doc?ch.
	self.flags = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_BENNET_SELLWHAT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = dia_bennet_sellwhat_condition;
	information = dia_bennet_sellwhat_info;
	permanent = FALSE;
	description = "Mohl bys my odd?lat helmu na zbroji drakobijc? ?.";
};


func int dia_bennet_sellwhat_condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_HALLO))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_bennet_sellwhat_info()
{
	AI_Output(other,self,"DIA_Bennet_SellWhat_15_00");	//Mohl bys my od?lat helmu na zbroji drakobijc??
	AI_Output(self,other,"DIA_Bennet_SellWhat_09_01");	//Ano kdy? bude? m?t zbroj tak nen? probl?m, pro drakobijce to je zdarma.
};


instance DIA_BENNET_LEATHER(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 650;
	condition = dia_bennet_leather_condition;
	information = dia_bennet_leather_info;
	permanent = TRUE;
	description = "(Zbroj drakobijc? bez ochrany hlavy)";
};


func int dia_bennet_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_sellwhat) && (other.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_bennet_leather_info()
{
	AI_Output(other,self,"DIA_Bennet_LEATHER_15_00");	//Uprav my T??kou
	if(B_GiveInvItems(other,self,itar_djg_m,1))
	{
		AI_Output(self,other,"DIA_Bennet_LEATHER_09_01");	//Hotovo tady to je. (u?kl?bne se)
		CreateInvItems(other,itar_djg_helm,1);
		AI_PrintScreen("Zbroj od Benneta z?sk?na.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_LEATHER_09_02");	//Nemu?u ti upravit zbroj kdy? j? nem??.
	};
	AI_Output(other,self,"DIA_Bennet_LEATHER_15_00");	//Uprav my T??kou
	if(B_GiveInvItems(other,self,itar_djg_h,1))
	{
		AI_Output(self,other,"DIA_Bennet_LEATHER_09_01");	//Hotovo tady to je. (u?kl?bne se)
		CreateInvItems(other,itar_djg_helm2,1);
		AI_PrintScreen("Zbroj od Benneta z?sk?na.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_LEATHER_09_02");	//Nemu?u ti upravit zbroj kdy? j? nem??.
	};
};


instance DIA_BENNET_MELTING(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 650;
	condition = dia_bennet_melting_condition;
	information = dia_bennet_melting_info;
	permanent = TRUE;
	description = "Nau? m? taven? zbran? (cena: 30 VB)";
};


func int dia_bennet_melting_condition()
{
	if((Bennet_TeachCommon == TRUE) && (KNOWS_MELTINGLER == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	{
		return TRUE;
	};
};

func void dia_bennet_melting_info()
{
	AI_Output(other,self,"DIA_Bennet_LEA_15_00");	//Nau? m? taven? zbran?.
	if(hero.lp >= 30)
	{
		hero.lp = hero.lp - 30;
		B_TeachThiefTalent(self,other,NPC_TALENT_FORGE);
		AI_Output(self,other,"DIA_Bennet_LEA_12_01");	//Nejd??v je nutn? rozd?lat a o?istit sk?et? nebo rezav? zbran? a potom teprve je hod?? do v?hn?.
		AI_Output(self,other,"DIA_Bennet_LEA_12_02");	//Ze t?? rozd?lan?ch zbran? se d? ud?lat jedna surov? ocel a u sk?et?ch to sam?, ale mus?? po?kat del?? dobu ne? se roztav?.
		AI_Output(self,other,"DIA_Bennet_LEA_12_04");	//A je to, nejlep?? je surov? ?elezn? ruda z t? se d? vyrobit mnohem v?c surov? ocele a to by bylo asi v?echno.
		Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
		B_LogEntry(TOPIC_TalentSmith,"Bennet m? nau?il jak tavit sk?et? a rezav? zbran?, nejprve je nutn? je rozebrat a o?istit a tprve potom p?etavit na surovou ocel, na jednu ocel budu pot?ebovat 3x rozebran? star? rezav? ?elezo.");
		KNOWS_MELTINGLER = TRUE;
		PrintScreen("Um?m tavit sk?et? a rezav? zbran?",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek v?domostn?ch bod?!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Bennet_PICKPOCKET(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 900;
	condition = DIA_Bennet_PICKPOCKET_Condition;
	information = DIA_Bennet_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Bennet_PICKPOCKET_Condition()
{
	return C_Beklauen(35,45);
};

func void DIA_Bennet_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
	Info_AddChoice(DIA_Bennet_PICKPOCKET,Dialog_Back,DIA_Bennet_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bennet_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bennet_PICKPOCKET_DoIt);
};

func void DIA_Bennet_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};

func void DIA_Bennet_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};

