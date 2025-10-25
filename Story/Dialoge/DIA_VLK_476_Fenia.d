
instance DIA_Fenia_EXIT(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 999;
	condition = DIA_Fenia_EXIT_Condition;
	information = DIA_Fenia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fenia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fenia_EXIT_Info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Fenia_EXIT_17_00");	//Pěknej den, pane paladin.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fenia_EXIT_17_01");	//Přeju bezpečnou cestu, ctihodný mágu.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Fenia_PICKPOCKET(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 900;
	condition = DIA_Fenia_PICKPOCKET_Condition;
	information = DIA_Fenia_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60_Female;
};


func int DIA_Fenia_PICKPOCKET_Condition()
{
	return C_Beklauen(50,75);
};

func void DIA_Fenia_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fenia_PICKPOCKET);
	Info_AddChoice(DIA_Fenia_PICKPOCKET,Dialog_Back,DIA_Fenia_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fenia_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fenia_PICKPOCKET_DoIt);
};

func void DIA_Fenia_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fenia_PICKPOCKET);
};

func void DIA_Fenia_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fenia_PICKPOCKET);
};


instance DIA_Fenia_Hallo(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 3;
	condition = DIA_Fenia_Hallo_Condition;
	information = DIA_Fenia_Hallo_Info;
	important = TRUE;
};


func int DIA_Fenia_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Hallo_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Fenia_Hallo_17_00");	//Vypadáš nějak utrmáceně. Dlouho jsi nespal, co?
		AI_Output(other,self,"DIA_Fenia_Hallo_15_01");	//Moc dlouho, dalo by se říct.
	};
	AI_Output(self,other,"DIA_Fenia_Hallo_17_02");	//Pojď sem, blíž. Se mnou najdeš to, co hledáš!
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Fenia prodává při cestě do přístavu jídlo.");
};


instance DIA_Fenia_HANDELN(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 10;
	condition = DIA_Fenia_HANDELN_Condition;
	information = DIA_Fenia_HANDELN_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Fenia_HANDELN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fenia_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Fenia_HANDELN_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Fenia_HANDELN_15_00");	//Ukaž mi své zboží.
};


instance DIA_Fenia_Infos(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 10;
	condition = DIA_Fenia_Infos_Condition;
	information = DIA_Fenia_Infos_Info;
	permanent = FALSE;
	description = "Říkala jsi, že máš, co potřebuju. Týká se to i informací?";
};


func int DIA_Fenia_Infos_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fenia_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Infos_Info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_15_00");	//Říkala jsi, že máš, co potřebuju. Týká se to i informací?
	AI_Output(self,other,"DIA_Fenia_Infos_17_01");	//Ale samozřejmě. Co bys chtěl vědět?
};


instance DIA_Fenia_MoreTraders(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 11;
	condition = DIA_Fenia_MoreTraders_Condition;
	information = DIA_Fenia_MoreTraders_Info;
	permanent = FALSE;
	description = "Jsou tady v přístavu ještě nějací další kupci?";
};


func int DIA_Fenia_MoreTraders_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fenia_Infos))
	{
		return TRUE;
	};
};

func void DIA_Fenia_MoreTraders_Info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_haendler_15_00");	//Jsou tady v přístavu ještě nějací další kupci?
	AI_Output(self,other,"DIA_Fenia_Infos_haendler_17_01");	//Když se pustíš po molu nalevo, narazíš na Halvora, mého muže. Prodává ryby.
	AI_Output(self,other,"DIA_Fenia_Infos_haendler_17_02");	//Na opačném konci je Brahim, kartograf.
};


instance DIA_Fenia_OV(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 13;
	condition = DIA_Fenia_OV_Condition;
	information = DIA_Fenia_OV_Info;
	permanent = FALSE;
	description = "Znáš někoho z horní čtvrti?";
};


func int DIA_Fenia_OV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fenia_Infos) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Fenia_OV_Info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_oberesViertel_15_00");	//Znáš někoho z horní čtvrti?
	AI_Output(self,other,"DIA_Fenia_Infos_oberesViertel_17_01");	//(smích) Kdybych znala někoho z horní čtvrti, tak bych tady nebyla, hochu.
};


instance DIA_Fenia_Interesting(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 14;
	condition = DIA_Fenia_Interesting_Condition;
	information = DIA_Fenia_Interesting_Info;
	permanent = FALSE;
	description = "Co je tady v přístavu zajímavého k vidění?";
};


func int DIA_Fenia_Interesting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fenia_Infos))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Interesting_Info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_interessantes_15_00");	//Co je tady v přístavu zajímavého k vidění?
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_01");	//No, jestli hledáš nějakou zábavu, zajdi do Kardifovy krčmy na molu. Každou chvíli se tam něco semele.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_02");	//To můžeš jen těžko minout. Ten chlápek, co stojí u vchodu, určitě upoutá tvoji pozornost.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_03");	//Kromě toho je tady ještě ta velká loď paladinů. Králova majestátní válečná galéra. To je to jediný, co tady stojí za zhlédnutí.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_04");	//Najdeš ji, když se od toho chlápka dáš doleva a pak kolem skalnatého srázu.
};


instance DIA_Fenia_Aufregend(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 15;
	condition = DIA_Fenia_Aufregend_Condition;
	information = DIA_Fenia_Aufregend_Info;
	permanent = FALSE;
	description = "Stalo se v poslední době něco zajímavého?";
};


func int DIA_Fenia_Aufregend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fenia_Infos))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Aufregend_Info()
{
	AI_Output(other,self,"DIA_Fenia_Add_15_00");	//Stalo se v poslední době něco zajímavého?
	AI_Output(self,other,"DIA_Fenia_Add_17_01");	//Dalo by se to tak říct. Něco takovýho už tu dlouho nebylo.
	AI_Output(self,other,"DIA_Fenia_Add_17_02");	//Běžel tudy nějaký zloděj. Musel v dolní části města ukrást luk.
	AI_Output(self,other,"DIA_Fenia_Add_17_03");	//Samozřejmě že domobrana přišla moc pozdě. Jako vždycky.
	AI_Output(self,other,"DIA_Fenia_Add_17_04");	//Utekl jim - stačilo mu jen seskočit do přístavu a byl pryč.
};

