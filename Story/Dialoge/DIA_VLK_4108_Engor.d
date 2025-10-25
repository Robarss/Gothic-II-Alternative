
instance DIA_Engor_EXIT(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 999;
	condition = DIA_Engor_EXIT_Condition;
	information = DIA_Engor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Engor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Engor_HALLO(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_HALLO_Condition;
	information = DIA_Engor_HALLO_Info;
	important = TRUE;
};


func int DIA_Engor_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Engor_HALLO_Info()
{
	AI_Output(self,other,"DIA_Engor_HALLO_13_00");	//Ah, ty jsi ten chlapík, který přežil cestu průsmykem.
	AI_Output(other,self,"DIA_Engor_HALLO_15_01");	//Ano.
	AI_Output(self,other,"DIA_Engor_HALLO_13_02");	//Výborně. Já jsem Engor - mám na starosti zásobování.
	AI_Output(self,other,"DIA_Engor_HALLO_13_03");	//Jen si nemysli, že ti dám něco zadarmo!
	AI_Output(self,other,"DIA_Engor_HALLO_13_04");	//Ale pokud máš po kapsách zlato, jsem vždy ochoten uzavřít obchod.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"Engor se stará o zásobování hradu a bokem taky trochu obchoduje.");
};


instance DIA_Engor_HANDELN(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 10;
	condition = DIA_Engor_HANDELN_Condition;
	information = DIA_Engor_HANDELN_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Engor_HANDELN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Engor_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Engor_HANDELN_Info()
{
	//var int McBolzenAmount;
	//var int McArrowAmount;
	B_GiveTradeInv(self);
	//Npc_RemoveInvItems(self,ItRw_Bolt,Npc_HasItems(self,ItRw_Bolt));
	//McBolzenAmount = Kapitel * 50;
	//CreateInvItems(self,ItRw_Bolt,McBolzenAmount);
	//Npc_RemoveInvItems(self,ItRw_Arrow,Npc_HasItems(self,ItRw_Arrow));
	//McArrowAmount = Kapitel * 50;
	//CreateInvItems(self,ItRw_Arrow,McArrowAmount);
	AI_Output(other,self,"DIA_Engor_HANDELN_15_00");	//Ukaž mi své zboží.
};


instance DIA_Engor_ABOUTPARLAF(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_ABOUTPARLAF_Condition;
	information = DIA_Engor_ABOUTPARLAF_Info;
	description = "Ty jsi jediný, který vydává potraviny, nemýlím-li se.";
};


func int DIA_Engor_ABOUTPARLAF_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlaf_ENGOR))
	{
		return TRUE;
	};
};

func void DIA_Engor_ABOUTPARLAF_Info()
{
	AI_Output(other,self,"DIA_Engor_ABOUTPARLAF_15_00");	//Ty jsi jediný, který vydává potraviny, nemýlím-li se.
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_01");	//To je pravda. Proč? Mám tě teď taky nakrmit?
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_02");	//Pokud něco chceš, zaplatíš za to - stejně jako všichni ostatní.
};


instance DIA_Engor_Ruestung(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_Ruestung_Condition;
	information = DIA_Engor_Ruestung_Info;
	permanent = FALSE;
	description = "Máš pro mě něco zajímavého?";
};


func int DIA_Engor_Ruestung_Condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Engor_Ruestung_Info()
{
	AI_Output(other,self,"DIA_Engor_Ruestung_15_00");	//Máš pro mě něco zajímavého?
	AI_Output(self,other,"DIA_Engor_Ruestung_13_01");	//Můžu ti sehnat lepší brnění - těžké brnění domobrany, pokud máš zájem.
	AI_Output(self,other,"DIA_Engor_Ruestung_13_02");	//Samozřejmě to není levné. Tak sežeň zlato a já ti dám brnění.
};


instance DIA_Engor_RSkaufen(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_RSkaufen_Condition;
	information = DIA_Engor_RSkaufen_Info;
	permanent = TRUE;
	description = "Koupit si těžkou zbroj domobrany (Obrana: zbraně 70, šípy 70 (2500 zlaťáků).";
};


var int DIA_Engor_RSkaufen_perm;

func int DIA_Engor_RSkaufen_Condition()
{
	if((other.guild == GIL_MIL) && Npc_KnowsInfo(other,DIA_Engor_Ruestung) && (DIA_Engor_RSkaufen_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Engor_RSkaufen_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,2500))
	{
		AI_Output(other,self,"DIA_Engor_RSkaufen_15_00");	//Dej mi to brnění.
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_01");	//Tady ho máš, dobře tě ochrání - je to zatraceně dobrá práce.
		B_GiveInvItems(self,other,ItAr_MIL_M,1);
		DIA_Engor_RSkaufen_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_02");	//Nejdříve sežeň zlato.
	};
};


instance DIA_Engor_HELP(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 3;
	condition = DIA_Engor_HELP_Condition;
	information = DIA_Engor_HELP_Info;
	description = "Možná ti můžu pomoci v tvé práci.";
};


func int DIA_Engor_HELP_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Engor_ABOUTPARLAF))
	{
		return TRUE;
	};
};

func void DIA_Engor_HELP_Info()
{
	AI_Output(other,self,"DIA_Engor_HELP_15_00");	//Možná ti můžu pomoci v tvé práci.
	AI_Output(self,other,"DIA_Engor_HELP_13_01");	//Hmm .. Jistě, proč ne? Potřeboval bych pomoc.
	AI_Output(other,self,"DIA_Engor_HELP_15_02");	//Tak, co je třeba udělat?
	AI_Output(self,other,"DIA_Engor_HELP_13_03");	//Naše zásoby jídla jsou malé. Především jsme téměř bez masa.
	AI_Output(self,other,"DIA_Engor_HELP_13_04");	//Tak pokud můžeš sehnat nějaké maso, syrové nebo vařené, šunku nebo klobásky, bylo by to kvitováno s velkým povděkem. Co tomu říkáš, pomůžeš nám?
	Info_ClearChoices(DIA_Engor_HELP);
	Info_AddChoice(DIA_Engor_HELP,"Na to nemám čas.",DIA_Engor_HELP_NO);
	Info_AddChoice(DIA_Engor_HELP,"Neměj strach, nějaké maso seženu.",DIA_Engor_HELP_YES);
};

func void DIA_Engor_HELP_NO()
{
	AI_Output(other,self,"DIA_Engor_HELP_NO_15_00");	//Na to nemám čas.
	AI_Output(self,other,"DIA_Engor_HELP_NO_13_01");	//Tak proč mrháš tím mým?
	MIS_Engor_BringMeat = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};

func void DIA_Engor_HELP_YES()
{
	AI_Output(other,self,"DIA_Engor_HELP_YES_15_00");	//Neměj strach, nějaké maso seženu.
	AI_Output(self,other,"DIA_Engor_HELP_YES_13_01");	//Asi dva tucty pořádných kusů masa by mi pomohlo nasytit nejméně sto hladových krků. Vrať se, až budeš mít maso. Teď se musím vrátit ke své práci.
	Log_CreateTopic(TOPIC_BringMeat,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BringMeat,LOG_Running);
	B_LogEntry(TOPIC_BringMeat,"Engor potřebuje dva tucty porcí masa, aby mohl zásobit své muže.");
	B_LogEntry(TOPIC_BringMeat,"Nevadí, půjde-li o klobásy, šunku, pečené či syrové maso. Jenom aby chlapi měli co zakousnout.");
	MIS_Engor_BringMeat = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Engor_BRINGMEAT(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 4;
	condition = DIA_Engor_BRINGMEAT_Condition;
	information = DIA_Engor_BRINGMEAT_Info;
	permanent = TRUE;
	description = "Tumáš, něco jsem ti koupil (předat maso)..";
};


func int DIA_Engor_BRINGMEAT_Condition()
{
	if((MIS_Engor_BringMeat == LOG_Running) && (Meat_Counter < Meat_Amount) && ((Npc_HasItems(hero,ItFo_Bacon) >= 1) || (Npc_HasItems(hero,ItFoMuttonRaw) >= 1) || (Npc_HasItems(hero,ItFoMutton) >= 1) || (Npc_HasItems(hero,ItFo_Sausage) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Engor_BRINGMEAT_Info()
{
	var string ConcatRaw;
	var string ConcatMutton;
	var string ConcatBacon;
	var string ConcatSausage;
	var string GesamtFleisch;
	AI_Output(other,self,"DIA_Engor_BRINGMEAT_15_00");	//Tady, něco jsem ti sehnal.
	if(Npc_HasItems(hero,ItFoMuttonRaw) >= 1)
	{
		if((Npc_HasItems(hero,ItFoMuttonRaw) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFoMuttonRaw,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFoMuttonRaw) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFoMuttonRaw);
			ConcatRaw = IntToString(Npc_HasItems(other,ItFoMuttonRaw));
			ConcatRaw = ConcatStrings(ConcatRaw,"(Dát syrové maso)");
			AI_PrintScreen(ConcatRaw,-1,35,FONT_ScreenSmall,2);
			Npc_RemoveInvItems(other,ItFoMuttonRaw,Npc_HasItems(other,ItFoMuttonRaw));
		};
	};
	if(Npc_HasItems(hero,ItFoMutton) >= 1)
	{
		if((Npc_HasItems(hero,ItFoMutton) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFoMutton,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFoMutton) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFoMutton);
			ConcatMutton = IntToString(Npc_HasItems(other,ItFoMutton));
			ConcatMutton = ConcatStrings(ConcatMutton,"(Dát opečené maso)");
			AI_PrintScreen(ConcatMutton,-1,38,FONT_ScreenSmall,2);
			Npc_RemoveInvItems(other,ItFoMutton,Npc_HasItems(other,ItFoMutton));
		};
	};
	if(Npc_HasItems(hero,ItFo_Bacon) >= 1)
	{
		if((Npc_HasItems(hero,ItFo_Bacon) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFo_Bacon,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFo_Bacon) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFo_Bacon);
			ConcatBacon = IntToString(Npc_HasItems(other,ItFo_Bacon));
			ConcatBacon = ConcatStrings(ConcatBacon,"(dát šunku)");
			AI_PrintScreen(ConcatBacon,-1,41,FONT_ScreenSmall,3);
			Npc_RemoveInvItems(other,ItFo_Bacon,Npc_HasItems(other,ItFo_Bacon));
		};
	};
	if(Npc_HasItems(hero,ItFo_Sausage) >= 1)
	{
		if((Npc_HasItems(hero,ItFo_Sausage) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFo_Sausage,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFo_Sausage) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFo_Sausage);
			ConcatSausage = IntToString(Npc_HasItems(other,ItFo_Sausage));
			ConcatSausage = ConcatStrings(ConcatSausage,"(dát klobásu)");
			AI_PrintScreen(ConcatSausage,-1,44,FONT_ScreenSmall,3);
			Npc_RemoveInvItems(other,ItFo_Sausage,Npc_HasItems(other,ItFo_Sausage));
		};
	};
	if(Meat_Amount > Meat_Counter)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_01");	//Pro začátek to není špatné, ale potřebuji toho víc.
		GesamtFleisch = IntToString(Meat_Counter);
		GesamtFleisch = ConcatStrings("(dát směs různého masa)",GesamtFleisch);
		AI_PrintScreen(GesamtFleisch,-1,48,FONT_ScreenSmall,3);
	};
	if(Meat_Counter >= Meat_Amount)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_02");	//Výborně, přinesl jsi dostatek masa. Nějakou dobu to vydrží.
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_03");	//Ale nemysli si, že ti dám něco zadarmo!
		MIS_Engor_BringMeat = LOG_SUCCESS;
		B_GivePlayerXP(XP_BringMeat);
		Log_AddEntry(TOPIC_BringMeat,"Engor už dostal maso a postará se, aby si je ostatní mezi sebou spravedlivě rozdělili.");
	};
};


instance DIA_Engor_Business(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 1;
	condition = DIA_Engor_Business_Condition;
	information = DIA_Engor_Business_Info;
	permanent = FALSE;
	description = "Jak jdou obchody?";
};


func int DIA_Engor_Business_Condition()
{
	if((Kapitel >= 4) && (MIS_Engor_BringMeat == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Engor_Business_Info()
{
	AI_Output(other,self,"DIA_Engor_Business_15_00");	//Jak jdou obchody?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_01");	//Jen tak tak. Doufám, že drakobijci mají tolik zlata, jako keců.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_02");	//Všiváci! Paladinové právě teď nic nekupují.
	};
	AI_Output(self,other,"DIA_Engor_Business_13_03");	//Co ty, vybral sis něco?
};


instance DIA_Engor_PICKPOCKET(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 900;
	condition = DIA_Engor_PICKPOCKET_Condition;
	information = DIA_Engor_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Krádež této mapy by byla riskantní.)";
};


func int DIA_Engor_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItWr_Map_OldWorld) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Engor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Engor_PICKPOCKET);
	Info_AddChoice(DIA_Engor_PICKPOCKET,Dialog_Back,DIA_Engor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Engor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Engor_PICKPOCKET_DoIt);
};

func void DIA_Engor_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems(self,other,ItWr_Map_OldWorld,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Engor_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Engor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Engor_PICKPOCKET);
};

