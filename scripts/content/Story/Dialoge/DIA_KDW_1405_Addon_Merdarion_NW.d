
instance DIA_Addon_Merdarion_EXIT(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 999;
	condition = DIA_Addon_Merdarion_EXIT_Condition;
	information = DIA_Addon_Merdarion_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Merdarion_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Merdarion_Hallo(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Hallo_Condition;
	information = DIA_Addon_Merdarion_Hallo_Info;
	description = "Zanepr?zdn?n?";
};


func int DIA_Addon_Merdarion_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Hallo_15_00");	//Zanepr?zdn?n?
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_01");	//Tyhle hrobky jsou pro m? ?plnou z?hadou. Nepochop?m, ?e z?staly nepov?imnuty po tak dlouhou dobu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_02");	//Vyhloubili jsme vstup bez pot???.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_03");	//Lid? jsou tak zabr?ni do jejich pr?ce, ?e nikdo nem?l ?as se bl??e d?vat na tyto stavby.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_04");	//Nem?m ??dn? dal?? vysv?tlen?.
};


instance DIA_Addon_Merdarion_Aufgabe(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Aufgabe_Condition;
	information = DIA_Addon_Merdarion_Aufgabe_Info;
	description = "Jak? je zde v?? ?kol?";
};


func int DIA_Addon_Merdarion_Aufgabe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Aufgabe_15_00");	//Jak? je zde v?? ?kol?
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_01");	//Zkou??m zjistit, kam by n?s port?l mohl zav?st.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_02");	//Tak? pom?h?m Nefariusovi s hled?n?m ztracen?ch ornament?.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_03");	//Je jist?, ?e port?l n?s zavede na ?pln? jinou ??st ostrova. Nikdo ale nev? kam.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_04");	//(hloubav?) Nem??u si vzpomenout, zda jsem o tom ?etl nebo sly?el ...
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(Cronos_NW,"START");
	if(Nefarius_NW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry(TOPIC_Addon_KDW,"Nefarius hled? ztracen? ornamenty.");
	};
};


instance DIA_Addon_Merdarion_DaDurch(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_DaDurch_Condition;
	information = DIA_Addon_Merdarion_DaDurch_Info;
	description = "Vy chcete proj?t port?lem?";
};


func int DIA_Addon_Merdarion_DaDurch_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_DaDurch_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_DaDurch_15_00");	//Vy chcete proj?t port?lem?
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_01");	//Jist?. Proto pochopiteln? pot?ebujeme naj?t zmizel? ornamenty.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_02");	//Mus?m ale ??ct, ?e je to celkem riskantn? pokus.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_03");	//Ale my mus?me naj?t p?irozen? d?vod t?chto zem?t?esen?.
};


instance DIA_Addon_Merdarion_Bedrohung(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Bedrohung_Condition;
	information = DIA_Addon_Merdarion_Bedrohung_Info;
	description = "Co v?? o t?ch zem?t?esen?ch?";
};


func int DIA_Addon_Merdarion_Bedrohung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_DaDurch))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Bedrohung_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Bedrohung_15_00");	//Co v?? o t?ch zem?t?esen?ch?
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_01");	//N?co na druh? stran? je ??d?.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_02");	//Pravd?podobn? to sam? zap???inilo n?hl? probuzen? str??c?.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_03");	//Ale toto nen? m?j ?kol. Saturas a Cronos ti o tom ?eknou v?c.
};


instance DIA_Addon_Merdarion_Wasdahinter2(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information = DIA_Addon_Merdarion_Wasdahinter2_Info;
	description = "Co si mysl??, ?e najdete na druh? stran??";
};


func int DIA_Addon_Merdarion_Wasdahinter2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Wasdahinter2_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Wasdahinter2_15_00");	//Co si mysl??, ?e najdete na druh? stran??
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_01");	//Nev?m jist?.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_02");	//Ale p?edpokl?d?m, ?e tam bude stavba podobn? t?hle. A druh? ??st port?lu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_03");	//V?e ostatn? se uvid?, jakmile tam budeme.
};


instance DIA_Addon_Merdarion_PERM(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 99;
	condition = DIA_Addon_Merdarion_PERM_Condition;
	information = DIA_Addon_Merdarion_PERM_Info;
	permanent = TRUE;
	description = "M??e? m? nau?it n?co z magie?";
};


func int DIA_Addon_Merdarion_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_PERM_15_00");	//M??e? m? nau?it n?co z magie?
	AI_Output(self,other,"DIA_Addon_Merdarion_PERM_06_01");	//Jakmile budeme na druh? stran?, velice r?d ti pomohu.
};


instance DIA_Addon_Merdarion_Teleportstein(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Teleportstein_Condition;
	information = DIA_Addon_Merdarion_Teleportstein_Info;
	description = "Jak? je nejrychlej?? cesta zp?t do m?sta?";
};


func int DIA_Addon_Merdarion_Teleportstein_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe) && (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Teleportstein_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_00");	//Jak? je nejrychlej?? cesta zp?t do m?sta?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_01");	//Nejlep?? je j?t cestou, kterou jsi pr?v? p?i?el.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_02");	//(zaduman?) Nebo bys mohl ... Ne. Je to p??li? nebezpe?n?.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_03");	//Nech to b?t.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_04");	//Dob?e. Stavitel? t?chto s?n? m?li jejich vlastn? zp?sob cestov?n?.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_05");	//Mysl?me, ?e nejsp?? byli schopni se teleportovat.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_06");	//Co je na tom tak zvl??tn??
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_07");	//Teleporta?n? kameny, kter? jsme na?li v Khorinisu, jsou tou cestou.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_08");	//Zd? se, ?e teleporta?n? kameny vedly z t?chto s?n? p??mo do p??stavu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_09");	//Nicm?n?, nikdo z n?s nem?l dost odvahy, aby to zkusil.
	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"Co si mysl??, ?e se stane, kdy? to zkus?m?",DIA_Addon_Merdarion_Teleportstein_ich);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"Kde je teleporta?n? k?men?",DIA_Addon_Merdarion_Teleportstein_wo);
};

func void DIA_Addon_Merdarion_Teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_wo_15_00");	//Kde je teleporta?n? k?men?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_wo_06_01");	//V m?stnosti s d?rou jsou dve?e. Vid?l jsem ho za nimi.
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"Dej mi kl??. Chci se na to pod?vat.",DIA_Addon_Merdarion_Teleportstein_key);
};

func void DIA_Addon_Merdarion_Teleportstein_ich()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_ich_15_00");	//Co si mysl??, ?e se stane, kdy? to zkus?m?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_ich_06_01");	//Zde nen? nic, co k tomu dodat. V?me o tom p??li? m?lo. Je celkem pravd?podobn?, ?e nep?e?ije?.
};

func void DIA_Addon_Merdarion_Teleportstein_key()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_00");	//Dej mi kl??. Chci to zkusit.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_01");	//(neur?it?) Opravdu? Ale nebudeme za to zodpov?dn?.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_02");	//Dej mi ho.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_03");	//Kdy? ho chce?. Zde m??.
	CreateInvItems(self,itke_portaltempelwalkthrough_addon,1);
	B_GiveInvItems(self,other,itke_portaltempelwalkthrough_addon,1);
	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;
	Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Merdarion mi dal kl??, kter? otev?r? zam?en? dve?e v komo?e bl?zko port?lu. Douf?m, ?e je to teleport, kter? m? hod? zp?tky do p??stavu.");
	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
};


instance DIA_Addon_Merdarion_WHereOtherTeleports(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information = DIA_Addon_Merdarion_WHereOtherTeleports_Info;
	description = "Kde jsou dal?? teleporta?n? kameny?";
};


func int DIA_Addon_Merdarion_WHereOtherTeleports_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Teleportstein))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_WHereOtherTeleports_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_WHereOtherTeleports_15_00");	//Kde jsou dal?? teleporta?n? kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_01");	//Na?li jsme je?t? jeden. P??mo z centra Khorinisu.
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_02");	//Bl?zko hospody u "Mrtv? harpyje".
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Bl?zko hospody 'U mrtv? harpyje' je pravd?pdobn? dal?? teleport.");
};


instance DIA_Addon_Merdarion_TeleportsteinSuccess(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information = DIA_Addon_Merdarion_TeleportsteinSuccess_Info;
	description = "Teleporta?n? kameny pracuj? velice dob?e, jak se zd?.";
};


func int DIA_Addon_Merdarion_TeleportsteinSuccess_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Teleportstein) && (SCUsed_NW_TELEPORTSTATION_MAYA == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_TeleportsteinSuccess_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_00");	//Teleporta?n? kameny pracuj? velice dob?e, jak se zd?.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_01");	//Chce? ??ct, ?e jsi je vyzkou?el? ?l?pl jsi na jeden?
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_02");	//Ano. A jak se zd?, st?le funguj?.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_03");	//(fascinovan?) Neuv??iteln?. Pozd?ji se na to bl?? pod?v?m.
};

