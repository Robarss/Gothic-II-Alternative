
instance DIA_Addon_Fisk_EXIT(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 999;
	condition = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Fisk_PICKPOCKET(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 900;
	condition = DIA_Addon_Fisk_PICKPOCKET_Condition;
	information = DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	return C_Beklauen(118,300);
};

func void DIA_Addon_Fisk_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET,Dialog_Back,DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};

func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};


instance DIA_Addon_Fisk_Hi(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 1;
	condition = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Fisk_Hi_Condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_00");	//Hej, jestli hledáš férového obchodníka, tak jsi ho právě našel.
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_01");	//Moje chatrč stojí přesně za Estebanovou. Takže, pokud budeš něco potřebovat, zastav se.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Fisk obchoduje se všemi druhy zbraní.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Fisk_Trade(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 888;
	condition = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Fisk_Trade_Condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Trade_Info()
{
	B_Say(other,self,"$TRADE_2");
	B_GiveTradeInv(self);
};


instance DIA_Addon_Fisk_Attentat(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Attentat_Condition;
	information = DIA_Addon_Fisk_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Fisk_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_00");	//Pozorně poslouchej, nemám s tím nic společného, jasný?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_01");	//(nevinně) Mám své vlastní problémy, jsem jen oběť.
	AI_Output(other,self,"DIA_Addon_Fisk_Attentat_15_02");	//Proč?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_03");	//Za svoji poslední dodávku jsem zaplatil kopu zlata.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_04");	//Ale ta nikdy nedorazila! Nějaká svině ji musela sebrat!
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_05");	//(zhnuseně) Někdo mi ji ukradl - asi od jednoho z mojich chlapů!
};


instance DIA_Addon_Fisk_Lieferung(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 3;
	condition = DIA_Addon_Fisk_Lieferung_Condition;
	information = DIA_Addon_Fisk_Lieferung_Info;
	permanent = FALSE;
	description = "Co to bylo za dodávku?";
};


func int DIA_Addon_Fisk_Lieferung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_Attentat))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Lieferung_15_00");	//Co to bylo za dodávku?
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_01");	//Balíček plný paklíčů. Někdo by je mohl střelit pirátům.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_02");	//Ale ten chlápek se jí zmocnil.(naštvaný) Se vším zlatem, co jsem mu dal.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_03");	//Ten zkurvysyn se schovává někde v bažině ...
	MIS_Lennar_Lockpick = LOG_Running;
	Log_CreateTopic(Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Fisk,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillJuan,"Nějaký chlápek jménem Juan byl pověřen obchodovat s bandity. Říká se, že se ukryl někde v bažinách.");
	B_LogEntry(Topic_Addon_Fisk,"Juan ukradl Fiskovu dodávku (balíček s paklíči). Schovává se někde v bažině.");
};

func void B_Addon_Fisk_AboutJuan()
{
	if(Npc_IsDead(Juan))
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_00");	//Je mrtvý.
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_01");	//Dobrý, už nemůže dále podvádět!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_02");	//Pořád žije ...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_03");	//Ty jsi tu svini nechal žít?
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_04");	//Nebyl sám ...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_05");	//Co už - zlikviduju i ty chlápky, co jsou s ním ...
	};
};

func void B_Addon_Fisk_Belohnung()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_00");	//Pokud jde o tebe ...
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_01");	//Mám dobré styky s Hunem.
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_02");	//Zajistím, abys dostal zbraně velmi levně.
	Huno_ArmorCheap = TRUE;
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_03");	//Podívej, jednou jsem dostal tenhle kámen od Corrista.
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_04");	//Je to moje jediná věc, kterou jsem zachránil po úniku z bariéry. Myslím, že se ti bude hodit více než mě.
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_05");	//A ještě navíc ti dám jednu z mých zbraní.
		if(other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])
		{
			B_GiveInvItems(self,other,ItMw_Streitaxt1,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMw_Bartaxt,1);
		};
	};
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_06");	//(podivínsky) Podrazíš mě a já podrazím tebe - to platí pořád.
};


instance DIA_Addon_Fisk_GivePaket(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 4;
	condition = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent = FALSE;
	description = "Mám tvůj balíček.";
};


func int DIA_Addon_Fisk_GivePaket_Condition()
{
	if((MIS_Lennar_Lockpick == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Lennar_Paket) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePaket_15_00");	//Mám tvůj balíček.
	B_GiveInvItems(other,self,ItMi_Addon_Lennar_Paket,1);
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_LennarPaket);
	AI_Output(self,other,"DIA_Addon_Fisk_GivePaket_12_01");	//(štastně) Fakt! (podezřívavě) A co Juan?
	B_Addon_Fisk_AboutJuan();
	B_Addon_Fisk_Belohnung();
};


instance DIA_Addon_Fisk_PaketOpen(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 5;
	condition = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent = FALSE;
	description = "Otevřel jsem tvůj balíček!";
};


func int DIA_Addon_Fisk_PaketOpen_Condition()
{
	if((MIS_Lennar_Lockpick == LOG_Running) && (LennarPaket_Open == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_PaketOpen_15_00");	//Otevřel jsem tvůj balíček!
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_01");	//(směje se) To se dalo čekat! Nemohl ses dočkat, že?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_02");	//Máš aspoň ty paklíče?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_03");	//A co je důležitější - co se stalo s Juanem?
	B_Addon_Fisk_AboutJuan();
};


instance DIA_Addon_Fisk_GivePicks(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 6;
	condition = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent = TRUE;
	description = "Tady máš tucet paklíčů ...";
};


func int DIA_Addon_Fisk_GivePicks_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_PaketOpen) && (MIS_Lennar_Lockpick == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePicks_15_00");	//Tady máš tucet paklíčů ...
	if(B_GiveInvItems(other,self,ItKE_lockpick,12))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_01");	//Perfektní. Kdo si počká, ten se dočká.
		B_Addon_Fisk_Belohnung();
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_02");	//To není tucet! (chytře) Nechceš jen zboží přenášet, co?
	};
};


instance DIA_Addon_Fisk_Inspektor(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 7;
	condition = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent = FALSE;
	description = "Juan pracoval pro Estebana!";
};


func int DIA_Addon_Fisk_Inspektor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_Lieferung) && Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_00");	//Juan pracoval pro Estebana!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_01");	//(ohromeně) Cože?
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_02");	//Nehraj si se mnou! Věděl jsi to!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_03");	//(s jistotou) Dobře. Máš pravdu. Doufám, že ale chápeš, proč jsem ti to neřekl.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_04");	//Všichni v tomhle táboře ví, že děláš pro Estebana.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_05");	//Nechci se do toho moc míchat jenom kvůli tomu, že ty chceš ten svůj červený kámen.
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"Já nedělám pro Estebana ...",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"Nevěřím ti.",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"Tomu rozumím!",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_ISee_15_00");	//Tomu rozumím!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_ISee_12_01");	//Dobře! Teď zavři hubu! Jinak nás někdo uslyší.
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_DontBelieve_15_00");	//Nevěřím ti.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_DontBelieve_12_01");	//Věř si čemu chceš! Ale dám ti radu - pokud bys chtěl o mě Estebanovi navykládat nějaké lži, tak tě nakopu!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00");	//Já nedělám pro Estebana ...
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01");	//Aha? Tak ty bys chtěl toho blba ošidit?
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02");	//Potom ti poradím - nedělej to.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03");	//Pokud jde o Estebana, nemůžeš nikomu věřit - jenom sobě, chápeš?
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04");	//Ale teď už dost těch řečí - někdo nás uslyší!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};


instance DIA_Addon_Fisk_Meeting(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent = FALSE;
	description = "TY jsi za tou vraždou.";
};


func int DIA_Addon_Fisk_Meeting_Condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") <= 500) && Npc_IsInState(self,ZS_Talk) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_15_00");	//TY jsi za tou vraždou.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_01");	//Ano. Esteban je mi trnem v oku.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_02");	//Žádného z banditů, kteří pro mě dělají, nepustí do dolu. Ujistíl se, že VŠICHNI dělají pro něho - jen pro něho.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_03");	//Takže si může vzít provizi z každého obchodu a tak může ovládat celý tábor.
	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	Info_AddChoice(DIA_Addon_Fisk_Meeting,"A co chceš dělat?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice(DIA_Addon_Fisk_Meeting,"Chceš na jeho místo?",DIA_Addon_Fisk_Meeting_You);
	if(!Npc_IsDead(Esteban))
	{
		Info_AddChoice(DIA_Addon_Fisk_Meeting,"Mohl bych tě vydat Estebanovi ...",DIA_Addon_Fisk_Meeting_sell);
	};
};

func void DIA_Addon_Fisk_Meeting_You()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_You_15_00");	//Chceš na jeho místo?
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_You_12_01");	//Ne, já jsem jen obchodník - jen nechci, aby se mi někdo míchal do řemesla.
};

func void DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_sell_15_00");	//Mohl bych tě vydat Estebanovi ...
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_01");	//A pak? A co by bylo potom? Ty fakt věříš, že ti dá, co chceš?
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_02");	//Zapomeň na to - mám lepší nápad.
};

func void DIA_Addon_Fisk_Meeting_now()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_00");	//Co cheš dělat?
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_01");	//Zbavíme se Estebana. To znamená, že ho zabiješ a nastoupíš na jeho místo.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_02");	//Ale jak, má kolem sebe ty stráže, nemám šanci.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_03");	//Proto je musíme nějak odlákat. A odlákáme je pravdou.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_04");	//Jakou pravdou?
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_05");	//Udělal jsi svou práci. Víš, že já stojím za tou vraždou.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_06");	//Řekni to Estebanovi a on pošle stráže, aby mě zabily. Budu je čekat.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_07");	//Až budou pryč, můžeš si to s tím zkurvysynem vyřídit a já se postarám o stráže.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_08");	//Esteban je mrtvý. Budu se dál věnovat své práci ...
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_09");	//Tady, to je pro tebe ...
		B_GiveInvItems(self,other,ItMi_Gold,500);
	};
	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AMBUSH");
	B_LogEntry(Topic_Addon_Esteban,"Fisk stojí za tou vraždou na Estebana.");
};


instance DIA_Addon_Fisk_Sieg(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent = FALSE;
	description = "Esteban byl zabit.";
};


func int DIA_Addon_Fisk_Sieg_Condition()
{
	if((MIS_Judas == LOG_SUCCESS) && Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Sieg_15_00");	//Esteban byl zabit.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_01");	//Na to jsem čekal věčnost.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_02");	//Myslím, že máš ještě udělat dost práce a já taky.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_03");	//Pokud bys něco potřeboval, víš, kde mě najít.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Ambient);
};

