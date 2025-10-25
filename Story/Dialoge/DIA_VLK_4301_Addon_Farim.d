
instance DIA_Addon_Farim_EXIT(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 999;
	condition = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Farim_PICKPOCKET(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 900;
	condition = DIA_Addon_Farim_PICKPOCKET_Condition;
	information = DIA_Addon_Farim_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Farim_PICKPOCKET_Condition()
{
	return C_Beklauen(20,11);
};

func void DIA_Addon_Farim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET,Dialog_Back,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};

func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};


instance DIA_Addon_Farim_Hallo(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Hallo_Condition;
	information = DIA_Addon_Farim_Hallo_Info;
	description = "Ty jsi rybář?";
};


func int DIA_Addon_Farim_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Hallo_15_00");	//Ty jsi rybář?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_01");	//(cynicky) Jak si to uhodl?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_02");	//Nemůžeš mě prostě nechat na pokoji?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_02");	//Nevykládej si to špatně, ale já nemám domobranu moc v lásce.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_03");	//Nevykládej si to špatně, ale v poslední době mám špatnou náladu. Problémy s domobranou ...
	};
};


instance DIA_Addon_Farim_MilizProbs(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MilizProbs_Condition;
	information = DIA_Addon_Farim_MilizProbs_Info;
	description = "Problémy s domobranou?";
};


func int DIA_Addon_Farim_MilizProbs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_MilizProbs_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_15_00");	//Problémy s domobranou?
	if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_01");	//Ti šmejdi sem prostě normálně přišli a vzali si, co chtěli.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_02");	//Minulý týden mi vzali celý úlovek. 'Je to pro dobrou věc', říkali.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_03");	//Vím, že se teď všichni musíme starat sami o sebe, ještě když farmáři přestali obchodovat.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_04");	//Někdy musím chodit spávat s prázdným žaludkem. Nezajímá je to. Seberou mi všechny ryby a já nemůžu nic dělat.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_05");	//A pokud to tak půjde dál, nebudu mít, co jíst.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Dej mi všechny tvé ryby.",DIA_Addon_Farim_MilizProbs_klauen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Možná bych ti mohl pomoci.",DIA_Addon_Farim_MilizProbs_helfen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Mluvil jsi o tom s paladiny?",DIA_Addon_Farim_MilizProbs_paladine);
};

func void DIA_Addon_Farim_MilizProbs_paladine()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_paladine_15_00");	//Mluvil jsi o tom s paladiny?
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_paladine_11_01");	//(směje se) To si děláš srandu? Myslíš, že je zajímá, že nějaký chudák jako já má problém s domobranou?
};


var int Farim_PissedOff;

func void DIA_Addon_Farim_MilizProbs_klauen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_klauen_15_00");	//Dej mi všechny tvé ryby.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_01");	//(naštvaně) Věděl jsem to. Další z těch parchantů.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_02");	//Ale myslím, že jdeš pozdě. Tvoji kámoši mi všechno vzali už včera.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_04");	//Řekl bych, že bys měl radši odejít.
	Farim_PissedOff = TRUE;
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
};

func void DIA_Addon_Farim_MilizProbs_helfen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_00");	//Možná bych ti mohl pomoci.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_02");	//Nevím. Musel bys znát někoho z domobrany, kdo se zná s paladiny ...
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_03");	//Paladinové moje ryby jen stěží vykoupí.
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_04");	//Uvidím, co se dá dělat.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Log_CreateTopic(TOPIC_Addon_FarimsFish,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish,LOG_Running);
	B_LogEntry(TOPIC_Addon_FarimsFish,"Rybář Farim má problémy s domobranou. Berou mu příliš mnoho ryb. Musím najít někoho z domobrany, kdo má kontakt na paladiny a kdo mu pomůže.");
	MIS_Addon_Farim_PaladinFisch = LOG_Running;
};


instance DIA_Addon_Farim_MartinHelps(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MartinHelps_Condition;
	information = DIA_Addon_Farim_MartinHelps_Info;
	description = "Mám řešení tvého problému.";
};


func int DIA_Addon_Farim_MartinHelps_Condition()
{
	if((MIS_Addon_Farim_PaladinFisch == LOG_Running) && (Martin_KnowsFarim == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_MartinHelps_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_00");	//Mám řešení tvého problému.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_01");	//Fakt? A jaké?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_02");	//Trošku jsem to tady omrknul.
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_03");	//A znám někoho, kdo by mohl pomoci.
	};
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_04");	//Martin, důstojník paladinů, si vyslechne tvůj problém s domobranou.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_05");	//A myslíš, že může zajistit, aby mě domobrana už neotravovala?
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_06");	//Přesně tak.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_07");	//Paráda. Díky. Nemůžu ti toho moc dát. Ale počkej ...
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_08");	//Našel jsem tenhle zvláštní modrý kámen na ostrově blízko khorinisu.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_09");	//Nemyslím, že je to nějak cenné, ale někdo jako ty, by to mohl využít.
	B_GiveInvItems(self,other,ItMi_Aquamarine,1);
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Farim_PaladinFisch);
};


instance DIA_Addon_Farim_Landstreicher(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Landstreicher_Condition;
	information = DIA_Addon_Farim_Landstreicher_Info;
	description = "Můžeš mi říct něco o chybějících lidech?";
};


func int DIA_Addon_Farim_Landstreicher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Landstreicher_15_01");	//Můžeš mi říct něco o chybějících lidech?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_02");	//Můj kamarád Wiliam se zapletl s podezřelými lidmi. A co se mu stalo?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_03");	//Jednoho dne přestal pracovat a od té doby jsem o něm neslyšel.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


instance DIA_Addon_Farim_William(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_William_Condition;
	information = DIA_Addon_Farim_William_Info;
	description = "Tvůj kamarád William zmizel?";
};


func int DIA_Addon_Farim_William_Condition()
{
	if((SCKnowsFarimAsWilliamsFriend == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_15_00");	//Tvůj kamarád William zmizel?
	AI_Output(self,other,"DIA_Addon_Farim_William_11_01");	//Asi jo. Mohl z něho být rybář, ale to by na sobě musel pracovat, ale to on ne - je trochu náladový.
	AI_Output(self,other,"DIA_Addon_Farim_William_11_02");	//Nikdy se neměl zaplést s těmi chlápky.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	Log_AddEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
	Info_ClearChoices(DIA_Addon_Farim_William);
	Info_AddChoice(DIA_Addon_Farim_William,"O kom přesně mluvíš?",DIA_Addon_Farim_William_typen);
	Info_AddChoice(DIA_Addon_Farim_William,"Jsem si jistý, že se znovu objeví.",DIA_Addon_Farim_William_auftauchen);
	Info_AddChoice(DIA_Addon_Farim_William,"Co s ním bylo pak?",DIA_Addon_Farim_William_WasGemacht);
	Info_AddChoice(DIA_Addon_Farim_William,"Kdy jsi je viděl naposled?",DIA_Addon_Farim_William_WannWeg);
};

func void DIA_Addon_Farim_William_WasGemacht()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WasGemacht_15_00");	//Co s ním bylo pak?
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_01");	//William a ti hrdlořezové se zapletli do nějaké špinavé práce.
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_02");	//Myslím, že ho to mělo přivést na jejich stranu.
};

func void DIA_Addon_Farim_William_typen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_typen_15_00");	//O kom přesně mluvíš?
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_01");	//Nevím kdo jsou ani co dělají v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_02");	//Vím jen, kde se setkali s Wiliamem.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_03");	//Jen co jsem Wiliama poprvé viděl, řekl jsem si, že je to rozený rybář.
	Info_AddChoice(DIA_Addon_Farim_William,"Kde se přesně setkali?",DIA_Addon_Farim_William_Wo);
};

func void DIA_Addon_Farim_William_Wo()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Wo_15_00");	//Kde se přesně setkali?
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_01");	//Na druhé straně přístavu na severu, je tam zátoka.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_02");	//Dá se tam dostat jen lodí nabo plaváním.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_03");	//Je tam pláž a malý rybářský tábor. Tam jsem je viděl.
	self.flags = 0;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Rybář Farim postrádá svého kamaráda Williama. Farim říká, že William se setkával s nějakými hrdlořezy v zátoce na severu přístavu.");
	Info_AddChoice(DIA_Addon_Farim_William,"Myslím, že jsem slyšel dost.",DIA_Addon_Farim_William_Tschau);
};

func void DIA_Addon_Farim_William_WannWeg()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WannWeg_15_00");	//Kdy jsi je viděl naposled?
	AI_Output(self,other,"DIA_Addon_Farim_William_WannWeg_11_01");	//Před několika dny.
	Info_AddChoice(DIA_Addon_Farim_William,"Nešel jenom někam dál rybařit?",DIA_Addon_Farim_William_Fischen);
};

func void DIA_Addon_Farim_William_Fischen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Fischen_15_00");	//Nešel jenom někam dál rybařit?
	AI_Output(self,other,"DIA_Addon_Farim_William_Fischen_11_01");	//To ne. Jeho loď zůstala v přístavu.
};

func void DIA_Addon_Farim_William_auftauchen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_auftauchen_15_00");	//Jsem si jistý, že se znovu objeví.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_01");	//To si nemyslím. Už je pryč příliš dlouho.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_02");	//Bojím se, že jednoho dne z moře vylovím jeho mrtvolu.
};

func void DIA_Addon_Farim_William_Tschau()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Tschau_15_00");	//Myslím, že jsem slyšel dost.
	AI_Output(self,other,"DIA_Addon_Farim_William_Tschau_11_01");	//Nedělej si s tím starosti. Nemyslím si, že bys ho našel.
	Info_ClearChoices(DIA_Addon_Farim_William);
};


instance DIA_Addon_Farim_Perm(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 99;
	condition = DIA_Addon_Farim_Perm_Condition;
	information = DIA_Addon_Farim_Perm_Info;
	permanent = TRUE;
	description = "Takže, jak jdou obchody?";
};


func int DIA_Addon_Farim_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//Takže, jak jdou obchody?
	if(Farim_PissedOff == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_01");	//Ah. Nedělej, že tě to zajímá.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_02");	//Už jsem zažil lepší časy. Příliš málo pro život a příliš mnoho pro smrt.
	};
};


instance DIA_Addon_Farim_WilliamReport(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 1;
	condition = DIA_Addon_Farim_WilliamReport_Condition;
	information = DIA_Addon_Farim_WilliamReport_Info;
	important = TRUE;
};


func int DIA_Addon_Farim_WilliamReport_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_William))
	{
		if((Npc_HasItems(other,ITWr_Addon_William_01) > 0) || (Saturas_AboutWilliam == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info()
{
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_01");	//Jsi zpět!
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_02");	//Slyšel jsi něco o Wiliamovi?
	AI_Output(other,self,"DIA_Addon_Farim_Add_15_02");	//Je mrtvý.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_03");	//(vzdychne) Ano, to jsem čekal.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_04");	//Díky, že jsi mi to přišl říct.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_05");	//Půjdu do hospody a za jeho podíl na posledním úlovku se napiju - on by to tak chtěl ...
};

