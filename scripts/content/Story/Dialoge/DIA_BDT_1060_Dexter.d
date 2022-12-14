
instance DIA_Dexter_EXIT(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 999;
	condition = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Hallo(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 1;
	condition = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Hallo_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Hallo_Info()
{
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//Pod?vejme, koho tady m?me. Velk? zast?nce pr?va. Fajn, hrdino, copak tu pohled?v?me?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//Hled?m p?r odpov?d?.
	if(Ranger_SCKnowsDexter == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_00");	//Ne?ekal jsem, ?e sem vleze? dobrovoln?.
		AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_01");	//Co to m? znamenat?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_02");	//To zanemen?, ?e jsem vypsal odm?nu na tvou hlavu. Je?t? jsi nevid?l ty plak?ty?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_03");	//Je na nich TV?J obli?ej. Ano ... jsi hledan? mu?. Nev?? o tom?
	}
	else
	{
		AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//N?KDO dal do ob?hu pap?ry s moj? tv???. N?KDO mi ?ekl, ?es to byl ty.
		AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//N?KDO moc mluvil.
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_04");	//M?? ale pravdu. St?hl jsem je. A co se nestalo? P?i?el jsi s?m.
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	};
	AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_05");	//Co ode m? chce??
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_06");	//J?? Nic. Ale m?j ??f t? chce ??len? vid?t mrtv?ho.
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_07");	//To je to, pro? jsem t? m?l naj?t a p?in?st mu tvoji hlavu.
};


instance DIA_Dexter_Glaube(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent = FALSE;
	description = "Nev???m ti ani slovo.";
};


func int DIA_Dexter_Glaube_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Glaube_Info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Nev???m ti ani slovo.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Hele, je to pravda. P??sah?m na hrob sv? matky!
};


instance DIA_Addon_Dexter_Patrick(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Addon_Dexter_Patrick_Condition;
	information = DIA_Addon_Dexter_Patrick_Info;
	description = "Byl tady vid?n ?old?k jm?nem Patrick.";
};


func int DIA_Addon_Dexter_Patrick_Condition()
{
	if((MIS_Addon_Cord_Look4Patrick == LOG_Running) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Patrick_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Patrick_15_00");	//Byl tady vid?n ?old?k jm?nem Patrick.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_01");	//Patrik? Eh? Nikdy jsem o n?m nesly?el.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_02");	//Pamatuju se na ?old?ka, kter? byl zvykl? si to n?kdy rozdat s m?mi lidmi.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_03");	//(n?padn? l?e) A?koli jsem ho posledn? dobou nevid?l.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_04");	//(zlomysln?) Mo?n? ho chlapci pov?sili. T??ko ??ct.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Dexter tvrd?, ?e o ?old?kovi Patrickovi nic nev?.");
	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP(XP_Addon_Dexter_KnowsPatrick);
};


instance DIA_Addon_Dexter_Greg(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Addon_Dexter_Greg_Condition;
	information = DIA_Addon_Dexter_Greg_Info;
	description = "Je tady n?jak? chlap se z?platou na oku. Hled? T?.";
};


func int DIA_Addon_Dexter_Greg_Condition()
{
	if((SC_KnowsGregsSearchsDexter == TRUE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Greg_15_00");	//Je tady n?jak? chlap se z?platou na oku. Hled? T?.
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_01");	//Vypad? to, ?e m? v?ichni hledaj?. Nestar?m se o to.
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_02");	//Jestli ten chap n?co pot?ebuje, m? p?ij?t sem.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Dexter_missingPeople(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Addon_Dexter_missingPeople_Condition;
	information = DIA_Addon_Dexter_missingPeople_Info;
	description = "Bylo mi ?e?eno, ?e un???? lidi z Khorinisu.";
};


func int DIA_Addon_Dexter_missingPeople_Condition()
{
	if((SC_KnowsDexterAsKidnapper == TRUE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_missingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_15_00");	//Bylo mi ?e?eno, ?e un???? lidi z Khorinisu.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_01");	//Tak?e jsi to nakonec zjistil. Dobr? pr?ce, gratuluji.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_02");	//Mysl?m, ?e budu muset sv? stopy zahlazovat l?pe.
	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Kdo ti dal ten p??kaz?",DIA_Addon_Dexter_missingPeople_wer);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Kde ti lid? kon??? Tady okolo dol??",DIA_Addon_Dexter_missingPeople_Wo);
};

func void DIA_Addon_Dexter_missingPeople_Wo()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Wo_15_00");	//Kde ti lid? kon??? Tady okolo dol??
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_01");	//(sm?je se) Skon?? daleko. Za horami na severo-v?chod? a z tv?ho dosahu.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_02");	//Mohl bych ti uk?zat, kde p?esn?, ale nev?m pro? bych m?l.
};

func void DIA_Addon_Dexter_missingPeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_wer_15_00");	//Kdo ti dal ten p??kaz?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_01");	//M?j ??f. Nebezpe?n? ?lov?k. Ty ho zn??. Je to Raven, jeden z trestaneck?ch rudn?ch baron?, ze Star?ho t?bora v Hornick?m ?dol?.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_02");	//Pot?ebuje je pro sv?j pl?n. To je v?e, co pot?ebuje? v?d?t.
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Raven nebezpe?n?? No ...",DIA_Addon_Dexter_missingPeople_Raven);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Rudn? baron tady v Khorinisu?",DIA_Addon_Dexter_missingPeople_RavenTot);
};

func void DIA_Addon_Dexter_missingPeople_Raven()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Raven_15_00");	//Raven nebezpe?n?? No ...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_01");	//(popuzen?) CO si mysl??, ?e v??? Nezn?? ho tak jako j?.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_02");	//(rozru?en?) Byl to blb, ale te? ...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_03");	//Od t? doby, co padla bari?ra, se zm?nil. Jeho tv?? je zata?en? ?ern?m st?nem.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_04");	//(vystra?en?) Jeho pohled tebou pronikne, jako dr?p dravce, kdy? mu bude? hled?t do o?? moc dlouho.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_05");	//M??u ti jen poradit, abys opustil Khorinis co nejrychleji, dokud m?? je?t? ?as, proto?e za chv?li u? bude p??li? pozd?.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_06");	//(skl??en?) Tady t? nic ne?ek?, jenom jist? smrt.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Dexter m? ??fa. Jmenuje se Raven. Raven je trestaneck? rudn? baron. Nakonec to vypad?, ?e Raven je ten, kdo stoj? za t?mi ?nosy. V?echno co pot?ebuju je d?kaz.");
	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
};

func void DIA_Addon_Dexter_missingPeople_RavenTot()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_RavenTot_15_00");	//Rudn? baron tady v Khorinisu?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_RavenTot_09_01");	//U? nen? rudn? baron. Te? m? sv? vlastn? pl?ny, a Khorinis brzy zjist? dost.
};


instance DIA_Addon_Dexter_Boss(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 3;
	condition = DIA_Addon_Dexter_Boss_Condition;
	information = DIA_Addon_Dexter_Boss_Info;
	description = "Tv?j ??f? Kdo to m??e b?t?";
};


func int DIA_Addon_Dexter_Boss_Condition()
{
	if((Knows_Dexter == TRUE) && (SC_KnowsDexterAsKidnapper == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Boss_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Boss_15_00");	//Tv?j ??f? Kdo to m??e b?t?
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_01");	//(sm?je se) R?d bys to v?d?l, co? Ano, um?m si to p?edstavit.
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_02");	//(v??n?) Nem??u uva?ovat o dvoj?m ?e?en?, tak pro? bych ti to m?l ??kat.
};


instance DIA_Dexter_Vor(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent = FALSE;
	description = "A co m?? te? v ?myslu? Zab?t m??";
};


func int DIA_Dexter_Vor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Dexter_missingPeople))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Vor_Info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//A co m?? te? v ?myslu? Zab?t m??
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Jo. Ale tys n?s odtamtud v?echny dostal. Proto ti taky d?m je?t? jednu ?anci. Zmizni, vypa? se, ud?lej se neviditeln?m. Jdi a u? se mi nikdy nep?iple? do cesty.
	AI_Output(other,self,"DIA_Addon_Dexter_Vor_15_00");	//Mus?m zjistit, kde jsou zajat? lid?.
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_01");	//(sm?je se) Jo. M??e? to zkusit ze m? vyt??skat.
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_02");	//(v?hru?n?) Bude lep??, kdy? odejde?.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Kdy? t? tu je?t? n?kdy uvid?m, bez rozpak? t? zabiju.
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Kill(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Kill_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((Dexter_NoMoreSmallTalk == TRUE) || (Knows_Dexter == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kill_Info()
{
	if(Knows_Dexter == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Add_09_02");	//(?to?n?) Kdy? je to tak, jak si p?eje? ...
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//Ach jo, chlape. Ud?lal bys l?p, kdyby ses tu neukazoval. Jsi ve ?patnou chv?li na ?patnym m?st?.
	};
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	B_Greg_ComesToDexter();
	Info_ClearChoices(DIA_Dexter_Kill);
	Info_AddChoice(DIA_Dexter_Kill,Dialog_Ende,DIA_Dexter_Kill_ENDE);
};

func void DIA_Dexter_Kill_ENDE()
{
	var C_Item itm;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	itm = Npc_GetEquippedArmor(Greg_NW);
	if(Hlp_IsItem(itm,ITAR_PIR_H_Addon) == FALSE)
	{
		AI_EquipArmor(Greg_NW,ITAR_PIR_H_Addon);
	};
};


instance DIA_Dexter_Kopf(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Kopf_Condition;
	information = DIA_Dexter_Kopf_Info;
	permanent = FALSE;
	description = "Chce? moji hlavu? Poj? si pro ni!";
};


func int DIA_Dexter_Kopf_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kopf_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Add_15_00");	//Chce? moji hlavu? Poj? si pro ni!
	AI_Output(self,other,"DIA_Addon_Dexter_Add_09_01");	//(?to?n?) Jak si p?eje?.
	DIA_Dexter_Kill_ENDE();
};


instance DIA_Dexter_PICKPOCKET(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 900;
	condition = DIA_Dexter_PICKPOCKET_Condition;
	information = DIA_Dexter_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Dexter_PICKPOCKET_Condition()
{
	return C_Beklauen(96,370);
};

func void DIA_Dexter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,Dialog_Back,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

