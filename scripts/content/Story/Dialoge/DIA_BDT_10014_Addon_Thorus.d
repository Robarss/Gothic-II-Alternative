
instance DIA_Addon_BDT_10014_Thorus_EXIT(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 999;
	condition = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Thorus_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10014_Thorus_Hi(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 2;
	condition = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Thorus_Hi_Condition()
{
	if(RavenIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_00");	//Zn?? pravidla. Bez ?erven? kamenn? desky se nikdo do dolu nedostane.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Hi_15_01");	//Zapome? na d?l - mus?m se dostat k Ravenovi.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_02");	//I tak. M?me pravidla, kter? plat? pro ka?d?ho. I pro tebe.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_03");	//Vra? se. Pokud se pokus?? vstoupit do horn? ??sti bez povolen?, str??e t? zabij?. TO jsou pravidla.
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_04");	//Pokud chce? m?t n?mitky, promluv si s Estebanem. Je zodpov?dn? za t?bor.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_BDT_10014_Thorus_Raven(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 3;
	condition = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent = FALSE;
	description = "Je velmi d?le?it?, abych se dostal k Ravenovi ...";
};


func int DIA_Addon_Thorus_Raven_Condition()
{
	if(RavenIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raven_15_00");	//Je velmi d?le?it?, abych se dostal k Ravenovi ...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_01");	//Ano? Opravdu ve???, ?e se k n?mu dostane??
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_02");	//Jeho str??e maj? rozkaz nikoho nevpou?t?t. Bude? mrtev d?iv, ne? ho v?bec spat???.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_03");	//Tak na to zapome?.
	Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_RavenKDW,"Raven je v?dce bandit?. Budu muset se k n?mu dostat podle pravidel, kter? tu jsou.");
};


instance DIA_Addon_BDT_10014_Thorus_Zeit(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 4;
	condition = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent = FALSE;
	description = "Vzpom?n?? si na m?? Ze Star?ho t?bora ...";
};


func int DIA_Addon_Thorus_Zeit_Condition()
{
	if(RavenIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Zeit_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Zeit_15_00");	//Vzpom?n?? si na m?? Ze Star?ho t?bora ...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_01");	//Jsi jeden z v?z??? Mo?n? jsi byl jeden z m?ch str???. Ano? D?l? to z n?s spojence?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_02");	//Ne, ned?l?.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_03");	//Mo?n? jsi ?lov?k, kter? strhl bari?ru - mo?n? jsi zabil moje lidi.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_04");	//Tak co?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_05");	//Tyhle dny jsou pry?.
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_06");	//Chce? vstoupit? Z?skej ?erven? k?men a u? nepl?tvej m?m ?asem.
	};
};


var int Thorus_GoodOldPerm;

instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 4;
	condition = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent = TRUE;
	description = "No tak, pus? m?. Kv?li star?m dobr?m ?as?m.";
};


func int DIA_Addon_Thorus_GoodOldPerm_Condition()
{
	if((MIS_Send_Buddler != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_BDT_10014_Thorus_Zeit) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_GoodOldPerm_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorus_Add_15_00");	//No tak, pus? m?. Kv?li star?m dobr?m ?as?m.
	if(Thorus_GoodOldPerm == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_01");	//Dobr? - nech m? to vysv?tlit. V??, pro? jsem st?le na?ivu?
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_02");	//Proto?e jsem byl v?dy loaj?ln? ke sv?m lidem.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_03");	//Nem?m r?d to, co Raven d?l?. Ale budu se dr?et pravidel.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_04");	//A ty taky bude?!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_05");	//(rozhodn?) NE!
	};
};

func int C_PlayerHasWrongToken()
{
	if((C_ScHasMagicStonePlate() == TRUE) || (Npc_HasItems(hero,ItWr_StonePlateCommon_Addon) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_02) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_03) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_04) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_05) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};


instance DIA_Addon_BDT_10014_Thorus_Stein(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent = TRUE;
	description = "M?m pro tebe kamennou desku ...";
};


func int DIA_Addon_Thorus_Stein_Condition()
{
	if((C_PlayerHasWrongToken() == TRUE) && (RavenIsDead == FALSE) && (MIS_Send_Buddler != LOG_Running) && (MIS_Send_Buddler != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Stein_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Stein_15_00");	//M?m pro tebe kamennou desku ...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Stein_12_01");	//Ta je ?patn?. Po??t? se jen ?erven?.
};


instance DIA_Addon_BDT_10014_Thorus_Rein(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent = FALSE;
	description = "M?m ?ervenou kamennou desku ...";
};


func int DIA_Addon_Thorus_Rein_Condition()
{
	if((Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Rein_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_00");	//M?m ?ervenou kamennou desku ...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_01");	//Dobr?.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_02");	//Vy??dil jsi Estebana - to znamen?, ?e ty te? d?l?? jeho pr?ci.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_03");	//V dole maj? p?r probl?mu s d?ln?mi ?ervy.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_04");	//T?i kop??i jsou ji? po smrti. Je tv?j ?kol opat?it nov?.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_05");	//A kdy se m??u kone?n? dostat do toho zatracen?ho dolu?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_06");	//Ud?lej svoji pr?ci - potom m??e? d?lat, co chce?.
	MIS_Send_Buddler = LOG_Running;
	Log_CreateTopic(Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Buddler,LOG_Running);
	B_LogEntry(Topic_Addon_Buddler,"Proto?e jsem te? dostal Esteban?v ?kol, m?l bych poslat t?i kop??e do dolu.");
};


instance DIA_Addon_BDT_10014_Thorus_Sent(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent = FALSE;
	description = "Poslal jsem t?i chlapy.";
};


func int DIA_Addon_Thorus_Sent_Condition()
{
	if((Player_SentBuddler >= 3) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Sent_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Sent_15_00");	//Poslal jsem t?i chlapy.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Sent_12_01");	//Dobr?. Dokud se tady o to star?m j?, tak m??e? dovnit?.
	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_BDT_10014_Thorus_Armor(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent = FALSE;
	description = "Hej, a co tvoje brn?n?? Kde dostanu takov??";
};


func int DIA_Addon_Thorus_Armor_Condition()
{
	if(RavenIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Armor_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Armor_15_00");	//Hej, a co tvoje brn?n?? Kde dostanu takov??
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_01");	//Nikde. Zbroj je ur?ena pro Ravenovy str??e.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_02");	//Nev???m, ?e je tu mo?nost, pro nov? ?adatele. Ale kone?n? rozhodnut? nen? moje, ale sp??e na Ravenovi.
};


instance DIA_Addon_Thorus_Gefangene(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 88;
	condition = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent = FALSE;
	description = "A co s v?zni?";
};


func int DIA_Addon_Thorus_Gefangene_Condition()
{
	if(!Npc_IsDead(Bloodwyn) && Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Gefangene_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");	//A co je s v?zni?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");	//Mmh, jejich pr?ce skon?ila. Co j? v?m, tak te? doluj? zlato.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");	//A pokud se pokus? o ?t?k ... ?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");	//... Bloodwyn za nimy po?le sv? str??e. Ale nev???m, ?e jsou dost ??len?, aby se pokusili o ?t?k.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");	//Jestli?e ...
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");	//Jestli?e co?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");	//... je n?kdo jin? nebude podporovat. Ale v?m, ?e nikdo nen? tak blb?, aby to ud?lal ... v ka?d?m p??pad?, dokud je tu Bloodwyn.
	B_Say(other,self,"$VERSTEHE");
};


instance DIA_Addon_Thorus_Speech(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Thorus_Speech_Condition()
{
	if(Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Speech_Info()
{
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_00");	//Co m?? vlastn? v ?myslu d?lat?
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_01");	//Co??
	if(RavenIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_02");	//Te? jsi odstranil z cesty Bloodwyna. Pt?m se s?m sebe: Kdo dal??. Raven? Nebo j??
		AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_03");	//Boj?? se?
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_04");	//Neboj?m se bitvy. Ale d?sledku tv?ch ?in?.
	};
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_05");	//Tenhle t?bor je jedin? v?c, co n?m zbyla.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_06");	//Nepracuje to sice tak, aby to ka?d?ho uspokojilo - Ale PRACUJE to.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_07");	//A s ka?d?m chlapem, kter?ho zabije? se na?e kolonie ten??.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_08");	//Jsme bandit?. Zadr?ovan?, nez?konn?, opovrhovan?.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_09");	//Kamkoli jdeme, lov? n?s, v?zn? n?s, zab?j? n?s.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_10");	//Nen? lep??ho m?sta, ne? tohohle, a lep?? ?as ne? te?.
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_11");	//Tak co tedy chce??
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_12");	//Tihle mu?i pot?ebuj? n?koho, kdo by je vedl. Kdo by to m?l d?lat? Ty? N?kdo, kdo neust?le chod? z m?sta na m?sto?
};


instance DIA_Addon_Thorus_Answer(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent = FALSE;
	description = "Dobr? - pro? se ty nestane? v?dcem v t?bo?e?";
};


func int DIA_Addon_Thorus_Answer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Speech))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Answer_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_00");	//Dobr? - pro? se ty nestane? v?dcem v t?bo?e?
	if(RavenIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_01");	//Dobr?, ale co Raven?
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_02");	//Raven bude m?t brzy jin? probl?my. Postar?m se o to.
	};
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_03");	//A postarej se, ?e v?zni budou moci odej?t.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_04");	//Oukej. Postar?m se o v?echny str??e venku.
	B_LogEntry(TOPIC_Addon_Sklaven,"Bloodwyn je mrtev a Thorus se postar?, aby otroci mohli odej?t.");
	if(!Npc_IsDead(PrisonGuard))
	{
		B_LogEntry(TOPIC_Addon_Sklaven,"Te? si promluv?m je?t? jednou se 'Str??cem otrok?', potom m??e Patrick a jeho ho?i zmizet.");
	}
	else
	{
		B_LogEntry(TOPIC_Addon_Sklaven,"Pot? co jsem promluvil se 'Str??cem otrok?', Patrick a jeho chlapi m??ou zmizet.");
	};
};


instance DIA_Addon_Thorus_Raventot(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent = FALSE;
	description = "Dok?zal jsem to. Raven je mrtev.";
};


func int DIA_Addon_Thorus_Raventot_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Raventot_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_00");	//Dok?zal jsem to. Raven je mrtev.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_01");	//T?m jsi zkrvavil Beliarovi nos.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_02");	//P?jde? te??
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_03");	//Moje pr?ce v tomhle ?dol? skon?ila. M??u p?r dn? odpo??vat.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_04");	//(sm?je se) Ano, jsi st?le na cest?? (v??n?) P?eji dobrou cestu.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_05");	//Kdo v?, mo?n? na sebe znovu natref?me.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_06");	//Kdo v?. Je tady mnoho bran a dve??, kter?mi projde?. A u n?kter? z nich m? najde? ...
	AI_StopProcessInfos(self);
};

