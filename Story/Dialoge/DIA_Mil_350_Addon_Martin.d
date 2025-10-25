
instance DIA_Addon_Martin_EXIT(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 999;
	condition = DIA_Addon_Martin_EXIT_Condition;
	information = DIA_Addon_Martin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Martin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Martin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Martin_PICKPOCKET(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 900;
	condition = DIA_Addon_Martin_PICKPOCKET_Condition;
	information = DIA_Addon_Martin_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Martin_PICKPOCKET_Condition()
{
	return C_Beklauen(65,77);
};

func void DIA_Addon_Martin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Martin_PICKPOCKET,Dialog_Back,DIA_Addon_Martin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Martin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Martin_PICKPOCKET_DoIt);
};

func void DIA_Addon_Martin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
};

func void DIA_Addon_Martin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
};


instance DIA_Addon_Martin_MeetingIsRunning(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 1;
	condition = DIA_Addon_Martin_MeetingIsRunning_Condition;
	information = DIA_Addon_Martin_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Martin_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};


var int DIA_Addon_Martin_MeetingIsRunning_OneTime;

func void DIA_Addon_Martin_MeetingIsRunning_Info()
{
	if(DIA_Addon_Martin_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_00");	//Tak ty jsi ten nový chlapík? Vítej mezi námi, bratře "Kruhu".
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_01");	//Bež a podívej se za Vatrasem. Možná na tebe budu mít čas později.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Martin_Hallo(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_Hallo_Condition;
	information = DIA_Addon_Martin_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Martin_Hallo_Condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 1000) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (RangerMeetingRunning != LOG_SUCCESS) && (SC_IsRanger == FALSE) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Martin_Hallo_07_00");	//Hej, ty. Ty tu nemáš co pohledávat. Pouze paladinové a domobrana tam může.
};


instance DIA_Addon_Martin_WasMachstDu(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_WasMachstDu_Condition;
	information = DIA_Addon_Martin_WasMachstDu_Info;
	description = "Co je tam k vidění?";
};


func int DIA_Addon_Martin_WasMachstDu_Condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_WasMachstDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_WasMachstDu_15_00");	//Co je tam k vidění?
	AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_01");	//Stojíš na půdě královských paladinů.
	if((other.guild == GIL_NONE) && (SC_IsRanger == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_02");	//Já zde velím a jsem zodpovědný za to, že se nic z paladinských věcí neztratí. A ty tu nejsi vítán.
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_03");	//Tak drž své prsty raději dál, jinak tě přes ně klepnu.
	};
};


instance DIA_Addon_Martin_PreTrade(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_PreTrade_Condition;
	information = DIA_Addon_Martin_PreTrade_Info;
	description = "Nemůžeš mi prodat nějaké paladinské věci?";
};


func int DIA_Addon_Martin_PreTrade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_PreTrade_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_00");	//Nemůžeš mi prodat nějaké paladinské věci?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_01");	//Chceš něco koupit? Uděláme to takto: Když mě odškodníš za potíže, které mi nastanou, pokud se znova něco ztratí, pak možná budeme moci spolu obchodovat.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_02");	//Je toho hodně, co se ztratilo?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_03");	//Důstojníci říkají, že je vše v pořádku. Ne, nic nechybí.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_04");	//Vidím.
};


instance DIA_Addon_Martin_Farim(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_Farim_Condition;
	information = DIA_Addon_Martin_Farim_Info;
	description = "Rybář Farim má problém s domobranou. Frajírci ho okrádají.";
};


func int DIA_Addon_Martin_Farim_Condition()
{
	if((MIS_Addon_Farim_PaladinFisch == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Martin_PreTrade))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Farim_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_00");	//Rybář Farim má problém s domobranou. Frajírci ho okrádají.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_01");	//A proč by mě to mělo zajímat?
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_02");	//Máš zde jistý vliv mezi paladiny.
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_03");	//Farim potřebuje tvou ochranu. Rád ti dá část svého úlovku jako odškodné.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_04");	//Vím, co tím myslíš.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_05");	//(sarkasticky) Ryby! Jako bych se neměl o co starat.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_06");	//Řekni mu, ať přijde ke mně. Chci přesně vědět, jak to s tou domobranou bylo.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_07");	//Podívám se na to.
	B_LogEntry(TOPIC_Addon_FarimsFish,"Důstojník Martin to prošetří.");
	Martin_KnowsFarim = TRUE;
	B_GivePlayerXP(XP_Addon_FarimSchutz);
};


instance DIA_Addon_Martin_Trade(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 80;
	condition = DIA_Addon_Martin_Trade_Condition;
	information = DIA_Addon_Martin_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Co mi nabídneš?";
};


func int DIA_Addon_Martin_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_PreTrade))
	{
		return TRUE;
	};
};


var int DIA_Addon_Martin_Trade_OneTime;

func void DIA_Addon_Martin_Trade_Info()
{
	if(DIA_Addon_Martin_Trade_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,LogText_Addon_MartinTrade);
		DIA_Addon_Martin_Trade_OneTime = TRUE;
	};
	AI_Output(other,self,"DIA_Addon_Martin_Trade_15_00");	//Co mi nabídneš?
	B_GiveTradeInv(self);
	AI_Output(self,other,"DIA_Addon_Martin_Trade_07_01");	//Pojď se podívat blíž.
};


instance DIA_Addon_Martin_Rangerhelp(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_Rangerhelp_Condition;
	information = DIA_Addon_Martin_Rangerhelp_Info;
	description = "Lares mě poslal. Řekl, že mi pomůžeš.";
};


func int DIA_Addon_Martin_Rangerhelp_Condition()
{
	if((RangerHelp_gildeMIL == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Martin_WasMachstDu) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Rangerhelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_00");	//Lares mě poslal. Řekl, že mi pomůžeš.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_01");	//Opravdu? Tak to tu máme. Co bys ode mě chtěl?
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_02");	//Chci se přidat k domobraně.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_03");	//(směje se) Opravdu bys to chtěl? Obvykle nepřijímáme takové hlupáky jako jsi ty. Ne bez dobrého důvodu.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_04");	//Hmmm musel bys prvně ...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_05");	//Nech hloupostí. Řekni mi, co musím udělat, abys mě tam dostal.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_06");	//(překvapeně) Ok. Poslouchej.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_07");	//Být důstojníkem je peklo, to ti říkám. Organizovat všechno tyhle bedny a pytle na tomto molu je špatné dost samo o sobě.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_08");	//Ale kdykoliv si zajdu večer ke Kardifovi do hospody, někdo pohýbe s bednami a když jsem ráno zpátky, něco chybí.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_09");	//(nevrle) Divné, paladinové nikdy nikoho nevypátrali.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_10");	//(rozzlobeně) Kašlu na to. Nemůžu tu přece zůstat celou noc jako nejaký idiot.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_11");	//Nicméně ty ...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_12");	//A, beru to. Předpokládám, že tu budu strážit celou noc, zatímco ty budeš v hospodě odpočívat.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_13");	//Ber nebo nech být.
	B_LogEntry(TOPIC_Addon_RangerHelpMIL,"Budu dohlížet na Martinovy bedny v noci. Jestliže chytím toho, kdo bere bedny, Martin mi pomůže přidat se k domobraně.");
};


instance DIA_Addon_Martin_Auftrag(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_Auftrag_Condition;
	information = DIA_Addon_Martin_Auftrag_Info;
	description = "Nespustím dnes večer oči z tvých dopravních beden.";
};


func int DIA_Addon_Martin_Auftrag_Condition()
{
	if((RangerHelp_gildeMIL == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Martin_Rangerhelp) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};


var int MIS_Addon_Martin_GetRangar_Day;

func void DIA_Addon_Martin_Auftrag_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Auftrag_15_00");	//Nespustím dnes večer oči z tvých dopravních beden.
	AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_01");	//(potěšeně) Výborně.
	if(Wld_IsTime(23,0,4,0))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_02");	//Jdu tedy ke Kardifovi do baru. A ne aby něco chybělo, jak se vrátím.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_03");	//Dobrá. Přiď večer a dohlížej na celé molo. Já budu u Kardifa v hospodě.
	};
	B_StartOtherRoutine(MIL_321_Rangar,"PrePalCampKlau");
	Info_ClearChoices(DIA_Addon_Martin_Auftrag);
	Info_AddChoice(DIA_Addon_Martin_Auftrag,"(weiter)",DIA_Addon_Martin_Auftrag_weiter);
};

func void DIA_Addon_Martin_Auftrag_weiter()
{
	MIS_Addon_Martin_GetRangar = LOG_Running;
	MIS_Addon_Martin_GetRangar_Day = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(MIL_321_Rangar,"PalCampKlau");
};


instance DIA_Addon_Martin_FromVatras(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_FromVatras_Condition;
	information = DIA_Addon_Martin_FromVatras_Info;
	description = "Hledáš muže, který prodává zbraně banditům?";
};


func int DIA_Addon_Martin_FromVatras_Condition()
{
	if(Vatras_ToMartin == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_FromVatras_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_00");	//Hledáš muže, který prodává zbraně banditům?
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_01");	//Říká kdo?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_02");	//Říká Vatras.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_03");	//Oh. Co o tom víš?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_04");	//Ne mnoho, ale mohl bych zjistit více.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_05");	//(uvědoměle) Uvidím, co řekneš ...
};


instance DIA_Addon_Martin_TellAll(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_TellAll_Condition;
	information = DIA_Addon_Martin_TellAll_Info;
	description = "Řekneš mi, co víš o tom dealerovi zbraní?";
};


func int DIA_Addon_Martin_TellAll_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_FromVatras))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_TellAll_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_TellAll_15_00");	//Řekneš mi, co víš o tom dealerovi zbraní?
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_01");	//Ok, poslouchej. Víme, že za tím stojí někdo z Horní čtvrti.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_02");	//Některé zbraně dokonce pocházejí ze zbrojnice domobrany.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_03");	//Ale nevíme kdo se přesně za tím skrývá.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_04");	//Kdybys měl dost odvahy zbouchat skupinu aspoň pěti banditů, pak bys možná zjistil více ...
	B_LogEntry(TOPIC_Addon_Bandittrader,"Prodejce zbraní je podle Martina někdo z Horní čtvrti.");
};


instance DIA_Addon_Martin_AboutBandits(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_AboutBandits_Condition;
	information = DIA_Addon_Martin_AboutBandits_Info;
	description = "Co víš o banditech?";
};


func int DIA_Addon_Martin_AboutBandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_TellAll))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_AboutBandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_AboutBandits_15_00");	//Co víš o banditech?
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_01");	//Víme, že banditi se skrývají po cestě mezi farmáři a městem.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_02");	//A také víme, že jim musela nedávno dojít dodávka zbraní.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_03");	//Možná najdeme nějakou stopu mezi bandity, která by nás dovedla k dealerovi zbraní.
	MIs_Martin_FindTheBanditTrader = LOG_Running;
	B_LogEntry(TOPIC_Addon_Bandittrader,"Banditi se skrývají na cestě mezi farmáři a přístavním městem. Možná u nich najdu nějakou stopu vedoucí k dopadení dealera zbraní.");
};


instance DIA_Addon_Martin_Fernando(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_Fernando_Condition;
	information = DIA_Addon_Martin_Fernando_Info;
	permanent = TRUE;
	description = "O prodejci zbraní ...";
};


func int DIA_Addon_Martin_Fernando_Condition()
{
	if(MIs_Martin_FindTheBanditTrader == LOG_Running)
	{
		return TRUE;
	};
};


var int Martin_IrrlichtHint;

func void DIA_Addon_Martin_Fernando_Info()
{
	var int FernandoHints;
	AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_00");	//O dealerovi zbraní ...
	if(Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE)) || (Fernando_HatsZugegeben == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_01");	//Ukaž, co máš ...
		FernandoHints = 0;
		if(Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE)))
		{
			if(Npc_HasItems(other,ItMw_Addon_BanditTrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_02");	//Vezmi si tento kord od banditů. Je na něm vyryto písmeno "F".
				FernandoHints = FernandoHints + 1;
			};
			if(Npc_HasItems(other,ItRi_Addon_BanditTrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_03");	//Tento prsten je od jednoho z banditů. Vypadá to na zámořského obchodníka.
				FernandoHints = FernandoHints + 1;
			};
			if(Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_04");	//Tento seznam zbraní a ostatního zboží doručeného banditům jasně ukazuje na Fernanda.
				FernandoHints = FernandoHints + 3;
			};
			if(Fernando_HatsZugegeben == TRUE)
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_05");	//Navíc Fernando, obchodník v horní čtvrti, se přiznal, že obchoduje s bandity.
				FernandoHints = FernandoHints + 1;
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_06");	//Fernando se přiznal, že podporoval bandity zbraněmi.
		};
		if(FernandoHints >= 3)
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_07");	//Myslím, že je to jasné. Je to Fernando. Půjde do vězení.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_08");	//Divné. Vždy vypadal jako občan Horní čtvrti.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_09");	//Můžu tě ubezpečit, že neuvidí denní světlo ještě hodně dlouho.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_10");	//Udělal jsi to opravdu dobře. Velmi dobře.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_11");	//Vatras bude potěšen těmito dobrými zprávami.
			B_StartOtherRoutine(Fernando,"Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry(TOPIC_Addon_Bandittrader,"Martin mě ujistil, že Fernando dostane, co si zasluží. Měl bych o tom Vatrase informovat.");
			B_GivePlayerXP(XP_Addon_FernandoMartin);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_12");	//Něco dalšího?
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_13");	//To je vše.
			if(Fernando_HatsZugegeben == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_14");	//(Odmítavě) Velmi pěkné, ale bez pádného důkazu nemůžu nic udělat.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_15");	//Nechci ze sebe udělat hlupáka před lordem Hagenem. Musíš najít víc důkazů.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_16");	//To nestačí. Může to být kdokoliv z Horní čtvrti.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_17");	//Vypadá to, že budeme muset sledovat bandity a kradené zboží ještě trochu dýl. Dokud nezjistíme, kdo za tím stojí.
				if(Martin_IrrlichtHint == FALSE)
				{
					AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_18");	//Možná bys měl s Vatrasem promluvit znova.
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_19");	//Co to, znovu?
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_20");	//Byls pověřen zjistit, kdo stojí za dodávkama zbraní banditům. Tak mi přines důkaz.
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_21");	//A bude to muset být vážně obviňující důkaz, nebo ho nebudeme moci zatknout.
	};
};


instance DIA_Addon_Martin_Perm(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 90;
	condition = DIA_Addon_Martin_Perm_Condition;
	information = DIA_Addon_Martin_Perm_Info;
	permanent = TRUE;
	description = "Bedny zde stále jsou?";
};


func int DIA_Addon_Martin_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Perm_15_00");	//Bedny zde stále jsou?
	if((MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay() - 2)) && (MIS_Addon_Martin_GetRangar == LOG_Running))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_01");	//(rozzlobeně) Ty zkurvysyne. Byl jsi pověřen hlídat bedny. Nyní chybí něco dalšího.
		if(Wld_IsTime(24,0,3,0))
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_02");	//(hlasitě) Půjdeš k skladišti na druhé straně přístavu a dostaneš toho hajzla, který mě okradl.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_03");	//Dnes večer se budeš dívat pořádně, jak odejdu. Rozuměls?
		};
	}
	else if((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (SC_IsRanger == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_04");	//Á, Á, směje se jak jen může. Rád se budu dívat, jak zde stojíš po celý den, a zkoušíš udělat pořádek v tomto svinstvu.
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_05");	//Paladinové rozvážející binec, jak deprimující.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_06");	//Na nic nešahej nebo zavolám stráže, slyšels mě?
	};
};


instance DIA_Addon_Martin_GotRangar(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_GotRangar_Condition;
	information = DIA_Addon_Martin_GotRangar_Info;
	description = "Našel jsem toho zloděje.";
};


func int DIA_Addon_Martin_GotRangar_Condition()
{
	if((MIS_Addon_Martin_GetRangar == LOG_Running) && (SC_GotRangar == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_GotRangar_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_00");	//Najdu toho zloděje.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_01");	//Je to Rangar, kdo rozebírá váš sklad.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_02");	//Konečně, aspoň vím, na koho si mám počkat. Ten darebák. Ten dostane lekci, až ho dostanu do rukou.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_03");	//Ale opravdu by mě zajímalo, proč paladinové nic neviděli.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_04");	//A? Proč?
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_05");	//Není to zřejmé. Ti blbci nám nemohou říci nic o domobraně. Přesto se jim divím.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_06");	//Byla to ale dobrá práce, kámo.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_07");	//Kdyby bylo cokoliv, s čím bych ti mohl pomoci, jen dej vědět.
	MIS_Addon_Martin_GetRangar = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Martin_GotRangar_Report);
};


instance DIA_Addon_Martin_GetMiliz(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_GetMiliz_Condition;
	information = DIA_Addon_Martin_GetMiliz_Info;
	description = "Ty víš, co chci.";
};


func int DIA_Addon_Martin_GetMiliz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_GotRangar))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_GetMiliz_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_GetMiliz_15_00");	//Ty víš, co chci.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_01");	//Ano, samozřejmě. Chceš se přidat k domobraně, neníliž pravda?
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_02");	//Prokázal jsi dobře své schopnosti.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_03");	//Oh, dobře, uděláme to takto. Radši bych věděl, zdali jsi na naší straně, nebo na něčí jiné.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_04");	//To je proč jsem ti pomáhal. Vezmi si tento doporučující dopis a ukaž ho Andremu, našemu velícímu paladinu.
	CreateInvItems(self,ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_GiveInvItems(self,other,ItWr_Martin_MilizEmpfehlung_Addon,1);
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_05");	//Najdeš ho v kasárnách. Jsem si jist, že využije chlapa jako ty.
	B_LogEntry(TOPIC_Addon_RangerHelpMIL,"Martin mi dal doporučující list pro velícho paladina Andreho. Andre mě nyní přijme k domobraně. Můžu ho nalézt v kasárnách.");
};

