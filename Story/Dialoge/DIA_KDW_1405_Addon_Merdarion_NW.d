
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
	description = "Zaneprázdněn?";
};


func int DIA_Addon_Merdarion_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Hallo_15_00");	//Zaneprázdněn?
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_01");	//Tyhle hrobky jsou pro mě úplnou záhadou. Nepochopím, že zůstaly nepovšimnuty po tak dlouhou dobu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_02");	//Vyhloubili jsme vstup bez potíží.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_03");	//Lidé jsou tak zabráni do jejich práce, že nikdo neměl čas se blíže dívat na tyto stavby.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_04");	//Nemám žádné další vysvětlení.
};


instance DIA_Addon_Merdarion_Aufgabe(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Aufgabe_Condition;
	information = DIA_Addon_Merdarion_Aufgabe_Info;
	description = "Jaký je zde váš úkol?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_Aufgabe_15_00");	//Jaký je zde váš úkol?
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_01");	//Zkouším zjistit, kam by nás portál mohl zavést.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_02");	//Také pomáhám Nefariusovi s hledáním ztracených ornamentů.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_03");	//Je jisté, že portál nás zavede na úplně jinou část ostrova. Nikdo ale neví kam.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_04");	//(hloubavě) Nemůžu si vzpomenout, zda jsem o tom četl nebo slyšel ...
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(Cronos_NW,"START");
	if(Nefarius_NW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry(TOPIC_Addon_KDW,"Nefarius hledá ztracené ornamenty.");
	};
};


instance DIA_Addon_Merdarion_DaDurch(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_DaDurch_Condition;
	information = DIA_Addon_Merdarion_DaDurch_Info;
	description = "Vy chcete projít portálem?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_DaDurch_15_00");	//Vy chcete projít portálem?
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_01");	//Jistě. Proto pochopitelně potřebujeme najít zmizelé ornamenty.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_02");	//Musím ale říct, že je to celkem riskantní pokus.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_03");	//Ale my musíme najít přirozený důvod těchto zemětřesení.
};


instance DIA_Addon_Merdarion_Bedrohung(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Bedrohung_Condition;
	information = DIA_Addon_Merdarion_Bedrohung_Info;
	description = "Co víš o těch zemětřeseních?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_Bedrohung_15_00");	//Co víš o těch zemětřeseních?
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_01");	//Něco na druhé straně je řídí.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_02");	//Pravděpodobně to samé zapříčinilo náhlé probuzení strážců.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_03");	//Ale toto není můj úkol. Saturas a Cronos ti o tom řeknou víc.
};


instance DIA_Addon_Merdarion_Wasdahinter2(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information = DIA_Addon_Merdarion_Wasdahinter2_Info;
	description = "Co si myslíš, že najdete na druhé straně?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_Wasdahinter2_15_00");	//Co si myslíš, že najdete na druhé straně?
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_01");	//Nevím jistě.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_02");	//Ale předpokládám, že tam bude stavba podobná téhle. A druhá část portálu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_03");	//Vše ostatní se uvidí, jakmile tam budeme.
};


instance DIA_Addon_Merdarion_PERM(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 99;
	condition = DIA_Addon_Merdarion_PERM_Condition;
	information = DIA_Addon_Merdarion_PERM_Info;
	permanent = TRUE;
	description = "Můžeš mě naučit něco z magie?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_PERM_15_00");	//Můžeš mě naučit něco z magie?
	AI_Output(self,other,"DIA_Addon_Merdarion_PERM_06_01");	//Jakmile budeme na druhé straně, velice rád ti pomohu.
};


instance DIA_Addon_Merdarion_Teleportstein(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Teleportstein_Condition;
	information = DIA_Addon_Merdarion_Teleportstein_Info;
	description = "Jaká je nejrychlejší cesta zpět do města?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_00");	//Jaká je nejrychlejší cesta zpět do města?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_01");	//Nejlepší je jít cestou, kterou jsi právě přišel.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_02");	//(zadumaně) Nebo bys mohl ... Ne. Je to příliš nebezpečné.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_03");	//Nech to být.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_04");	//Dobře. Stavitelé těchto síní měli jejich vlastní způsob cestování.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_05");	//Myslíme, že nejspíš byli schopni se teleportovat.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_06");	//Co je na tom tak zvláštní?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_07");	//Teleportační kameny, které jsme našli v Khorinisu, jsou tou cestou.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_08");	//Zdá se, že teleportační kameny vedly z těchto síní přímo do přístavu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_09");	//Nicméně, nikdo z nás neměl dost odvahy, aby to zkusil.
	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"Co si myslíš, že se stane, když to zkusím?",DIA_Addon_Merdarion_Teleportstein_ich);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"Kde je teleportační kámen?",DIA_Addon_Merdarion_Teleportstein_wo);
};

func void DIA_Addon_Merdarion_Teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_wo_15_00");	//Kde je teleportační kámen?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_wo_06_01");	//V místnosti s dírou jsou dveře. Viděl jsem ho za nimi.
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"Dej mi klíč. Chci se na to podívat.",DIA_Addon_Merdarion_Teleportstein_key);
};

func void DIA_Addon_Merdarion_Teleportstein_ich()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_ich_15_00");	//Co si myslíš, že se stane, když to zkusím?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_ich_06_01");	//Zde není nic, co k tomu dodat. Víme o tom příliš málo. Je celkem pravděpodobné, že nepřežiješ.
};

func void DIA_Addon_Merdarion_Teleportstein_key()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_00");	//Dej mi klíč. Chci to zkusit.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_01");	//(neurčitě) Opravdu? Ale nebudeme za to zodpovědní.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_02");	//Dej mi ho.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_03");	//Když ho chceš. Zde máš.
	CreateInvItems(self,itke_portaltempelwalkthrough_addon,1);
	B_GiveInvItems(self,other,itke_portaltempelwalkthrough_addon,1);
	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;
	Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Merdarion mi dal klíč, který otevírá zamčené dveře v komoře blízko portálu. Doufám, že je to teleport, který mě hodí zpátky do přístavu.");
	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
};


instance DIA_Addon_Merdarion_WHereOtherTeleports(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information = DIA_Addon_Merdarion_WHereOtherTeleports_Info;
	description = "Kde jsou další teleportační kameny?";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_WHereOtherTeleports_15_00");	//Kde jsou další teleportační kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_01");	//Našli jsme ještě jeden. Přímo z centra Khorinisu.
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_02");	//Blízko hospody u "Mrtvé harpyje".
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Blízko hospody 'U mrtvé harpyje' je pravděpdobně další teleport.");
};


instance DIA_Addon_Merdarion_TeleportsteinSuccess(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information = DIA_Addon_Merdarion_TeleportsteinSuccess_Info;
	description = "Teleportační kameny pracují velice dobře, jak se zdá.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_00");	//Teleportační kameny pracují velice dobře, jak se zdá.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_01");	//Chceš říct, že jsi je vyzkoušel? Šlápl jsi na jeden?
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_02");	//Ano. A jak se zdá, stále fungují.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_03");	//(fascinovaně) Neuvěřitelné. Později se na to blíž podívám.
};

