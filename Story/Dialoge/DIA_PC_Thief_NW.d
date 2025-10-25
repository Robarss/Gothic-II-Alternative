
instance DIA_DiegoNW_EXIT(C_Info)
{
	npc = PC_Thief_NW;
	nr = 999;
	condition = DIA_DiegoNW_EXIT_Condition;
	information = DIA_DiegoNW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoNW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoNW_Perm(C_Info)
{
	npc = PC_Thief_NW;
	nr = 998;
	condition = DIA_DiegoNW_Perm_Condition;
	information = DIA_DiegoNW_Perm_Info;
	permanent = TRUE;
	description = "Jak jdou obchody?";
};


func int DIA_DiegoNW_Perm_Condition()
{
	if(Diego_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Perm_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//Jak jdou obchody?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//Mizerně. Někdo mi měl říct, že to s Khorinisem šlo k šípku.
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//No nevím. Já to město znám jenom takhle.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//Měl jsi ho vidět před pár lety. To by se ti vážně líbilo.
};


instance DIA_DiegoNW_NeedHelp(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = DIA_DiegoNW_NeedHelp_Condition;
	information = DIA_DiegoNW_NeedHelp_Info;
	important = TRUE;
};


func int DIA_DiegoNW_NeedHelp_Condition()
{
	if(Diego_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_NeedHelp_Info()
{
	if(Diego_IsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_01");	//Netvař se tak překvapeně.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_02");	//(směje se) Ty jsi si opravdu myslel, že jsem se mrtvý?
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_03");	//Byl jsem chvíli v bezvědomí. Nicméně žiji, jak sis mohl všimnout.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_04");	//A nyní jsme spolu. A to se počítá.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_05");	//Potřebuji tvou pomoc.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//Dobře že jsi tady. Budeš mi muset pomoci.
	};
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	if(DiegoOW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	};
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co je tohle za šaty?",DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co tady děláš?",DIA_DiegoNW_NeedHelp_Plan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co jako?",DIA_DiegoNW_NeedHelp_Problem);
};

func void DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//Pozoroval jsem stráže. Jsou pořád na nohou.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//Řekl bych, že proklouznout mezi nimi nebude nijak snadné.
};

func void DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//Asi to bude mými šaty. Stráže mě nechtějí pustit do města.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//Proto jsem před městem koupil od jednoho obchodníka tyhle hadry. Doufám, že si na mě už vzpomínáš. Jsem Diego.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//Tenkrát v base jsem tě naučil všechno, co jsi potřeboval vědět, abys přežil.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//Přece jsi to všechno nemohl zapomenout.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//Ehm... co všechno se vlastně stalo?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//No to mě omyj, ty si vážně nic nepamatuješ.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//Hele, vážně teď nemám čas ti všechno vysvětlovat. Řeknu to takhle: bývali jsme zatraceně dobří přátelé a několikrát jsem ti zachránil život.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//A teď potřebuji tvou pomoc.
};

func void DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//Co je tohle za šaty?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//Koupil jsem je před městem od jednoho obchodníka. Stráže mě poprvé nechtěli pustit dovnitř.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//Také není nutné, aby celý svět věděl, odkud jsem.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//To je fakt.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//Také to tak vidím. Ale i když jsem zahodil svůj hábit Stínu, jsem pořád tím, kým jsem byl vždycky.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//A s tímhle městem mám velké plány.
};

func void DIA_DiegoNW_NeedHelp_Problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//Co jako?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//Hodně věcí se změnilo, co jsem odešel. Musím se znovu postavit na nohy.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//V čem je problém?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//Musím se dostat do horní části města.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//Nejsem ale občanem města a nemám dost peněz, abych podplatil stráže. Ale naštěstí tady jsi ty!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//Takže po mně chceš, abych ti půjčil nějaké peníze?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//Nesmysl. Nějaké zlato mám - dokonce spoustu zlata! Bohužel ho nemám s sebou.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//Takže mi to moje zlato přineseš.
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Na to nemám čas.",DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co z toho budu mít?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Dobrá, pomůžu ti.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

func void DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//Na to nemám čas.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//Hele, já myslel, že jsme kámoši! Byl jsem to konec konců já, kdo ti zachránil kejhák, když tě hodili do kolonie.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//Přeháníš.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//Vážně? Tak se zkus na chvilku zamyslet, jak by to s tebou dopadlo, kdybych ti tehdy nevysvětlil, jak se chovat.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//Rudní baroni by si tě dali k snídani, čekala by tě mizerná smrt v dolech.
	MIS_HelpDiegoNW = LOG_FAILED;
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};

func void DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//Co z toho budu mít?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//Ptal jsem se snad někdy já tebe, co dostanu na oplátku? Jsme přátelé, copak to je málo?
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//Dobrá, pomůžu ti.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01");	//Dobrá, poslouchej: Když ještě stála bariéra, schoval jsem si malý poklad.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02");	//Počkej chvíli. To je to, co jsem si zapomněl vzít s sebou.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03");	//Ale musím zde zůstat.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03");	//Abych to zkrátil, prostě běž do Hornického údolí a přines mi moje zlato.
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"Diegovo zlato je ukryto v Hornickém údolí. Potřebuje se dostat mezi smetánku, a tak mě pro ně poslal.");
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co chceš s tím zlatem dělat?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Kde jsi to zlato získal?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Kam jsi to zlato ukryl?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//Co chceš s tím zlatem dělat?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//V horní části města je obchodník, kterému musím zaplatit dluh. Potřebuju to dát konečně do pořádku.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//A pak budu moci začít zcela nový život!
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//Kde jsi to zlato získal?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//Jsem snad jediný, kdo si v Hornickém údolí šetřil pro strýčka Příhodu?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//Štípnout pár nugetů byla hračka. Dělal jsem to prostě pro případ, že bychom se nakonec dostali ven.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//Každý se staral pouze o rudu, nikdo se nestaral o zlato ...
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//Kam jsi to zlato ukryl?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//Je přímo na tržnici. Nad opuštěným dolem. Jsou v kožené kabele.
	if(Diego_angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01");	//Ale ticho. Myslím, že si toho nikdo nevšiml.
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02");	//Prostě vezmi váček a dones mi ho.
	};
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//Nezapomeň se ale přesvědčit, že tam opravdu je, ať se nevracíš s prázdnou.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//Jak to poznám?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//Ten vak je plný zlata. Je to spousta zlata!
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Zkusím to tvoje zlato najít.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);
	B_LogEntry(TOPIC_HelpDiegoNW,"Diegovo zlato je ukryto kdesi na staré obchodní cestě, nad opuštěným dolem - tam, kudy kdysi lanovkou dopravovali do kolonie zboží.");
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//Zkusím to tvoje zlato najít.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//(zašklebí se) Jen do toho. Budeme si kvit.
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};


instance DIA_DiegoNW_HelpYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_HelpYou_Condition;
	information = DIA_DiegoNW_HelpYou_Info;
	permanent = FALSE;
	description = "Dobrá, přece jenom ti pomůžu.";
};


func int DIA_DiegoNW_HelpYou_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_HelpDiegoNW == LOG_FAILED) && (Diego_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_HelpYou_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//Dobrá, přece jenom ti pomůžu.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//Věděl jsem to.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//Fajn, přejděme rovnou k věci.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//Takže. V Hornickém údolí jsem si schoval poklad, a ty mi ho přineseš.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//Já mezitím zůstanu tady a všechno připravím.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"Diegovo zlato je ukryto kdesi na staré obchodní cestě, nad opuštěným dolem - tam, kudy kdysi lanovkou dopravovali do kolonie zboží.");
};


instance DIA_DiegoNW_HaveYourGold(C_Info)
{
	npc = PC_Thief_NW;
	nr = 31;
	condition = DIA_DiegoNW_HaveYourGold_Condition;
	information = DIA_DiegoNW_HaveYourGold_Info;
	permanent = TRUE;
	description = "Našel jsem tvoje zlato!";
};


func int DIA_DiegoNW_HaveYourGold_Condition()
{
	if(((OpenedDiegosBag == TRUE) || (Npc_HasItems(other,ItSe_DiegosTreasure_Mis) >= 1)) && (MIS_HelpDiegoNW == LOG_Running) && (Diego_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void b_diegonw_diegosrevenge()
{
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//Prefekt. Gerbrandt by se měl radši mít na pozoru.
};


var int DiegosRevenge;

func void DIA_DiegoNW_HaveYourGold_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//Našel jsem tvoje zlato!
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//Výborně. Ukaž.
	if(Npc_HasItems(other,ItSe_DiegosTreasure_Mis) >= 1)
	{
		B_GiveInvItems(other,self,ItSe_DiegosTreasure_Mis,1);
		b_diegonw_diegosrevenge();
		DiegosRevenge = TRUE;
	}
	else if(Npc_HasItems(other,ItMi_Gold) < DiegosTreasure)
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//Ale to není všechno! Nevěříš mi? Potřebuju všechno.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//Pokud můj plán vyjde, zbude dost i na tebe.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//Takže se snaž, aby nic nechybělo. Je to důležité!
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,DiegosTreasure);
		b_diegonw_diegosrevenge();
		DiegosRevenge = TRUE;
	};
	if((Npc_IsDead(Gerbrandt) == FALSE) && (DiegosRevenge == TRUE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//Poslouchej, ještě se musím postarat o ty stráže.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//Chtěl bych, abys donesl tenhle dopis Gerbrandtovi. Je to jeden z těch tlustých obchodníků v horní čtvrti.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//Pozdravuj ho ode mne. Pak se s tebou setkám před Gerbrandtovým domem.
		CreateInvItems(self,ItWr_DiegosLetter_MIS,1);
		B_GiveInvItems(self,other,ItWr_DiegosLetter_MIS,1);
		B_StartOtherRoutine(Gerbrandt,"WaitForDiego");
		MIS_HelpDiegoNW = LOG_SUCCESS;
		MIS_DiegosResidence = LOG_Running;
		B_GivePlayerXP(XP_HelpDiegoNW);
		Log_CreateTopic(TOPIC_DiegosResidence,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DiegosResidence,LOG_Running);
		B_LogEntry(TOPIC_DiegosResidence,"Diego mi předal dopis pro obchodníka Gerbrandta.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_DiegoNW_DeliveredLetter(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_DeliveredLetter_Condition;
	information = DIA_DiegoNW_DeliveredLetter_Info;
	permanent = FALSE;
	description = "Doručil jsem ten dopis.";
};


func int DIA_DiegoNW_DeliveredLetter_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_DiegosResidence == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_DeliveredLetter_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//Doručil jsem ten dopis.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//Velmi dobře. Jak to Gerbrandt vzal?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//Vypadal docela šokovaně a okamžitě se ztratil.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//(spokojeně) To bych řekl.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//Obávám se, že ze všeho nejdřív budu muset dohlédnout na vybavení svého nového domu. Pokud si dobře pamatuju, tak Gerbrandt měl strašný vkus, co se nábytku týče.
	B_GivePlayerXP(XP_DiegoHasANewHome);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"A jak jsi to vlastně udělal?",DIA_DiegoNW_DeliveredLetter_YourTrick);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"Takže ten dům je tvůj?",DIA_DiegoNW_DeliveredLetter_YourHouse);
};

func void DIA_DiegoNW_DeliveredLetter_Gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//A co Gerbrandt?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//Už si užíval toho pohodlného života příliš dlouho.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//On si žil tady, uprostřed luxusu, zatímco já dlabal v dolech vývar z krys.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//Netuším, kam měl namířeno, ale do Khorinisu už nikdy nevkročí - na to dohlédnu.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//Kdybys ho hledal, najdeš ho asi v přístavní čtvrti.
};

func void DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//Takže ten dům je tvůj?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//Ano, od sklepa až po půdu, včetně všeho nábytku.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//Po několika letech strávených v krajně nevyhovujících podmínkách se těším, až se vyspím v posteli s nebesy.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//A k snídani si pak dám dobré víno a šťavnatou šunčičku.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//Chytáš štěstí za pačesy, co?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//Se vsaď.
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//A jak jsi to vlastně udělal?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//Myslíš snad, že Gerbrandt přišel ke všemu tomu bohatství poctivým obchodem?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//Když přišlo na nějakou levotu, tak si sám ruce pochopitelně nikdy nezašpinil. Na to měl pomocníka.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//Samozřejmě, že jsem tu a tam něco pochytil. Gerbrandt se mě nakonec zbavil. Nejspíš se bál, že toho vím příliš.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//O tom jsi mi nikdy neřekl.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//Nikdy ses neptal.
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,Dialog_Back,DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"A co můj podíl?",DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"A co Gerbrandt?",DIA_DiegoNW_DeliveredLetter_Gerbrandt);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//A co můj podíl?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//Zdá se, že jsi nakonec přece jenom nezapomněl na všechno, co jsem tě naučil.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//Ale máš pravdu, bez tebe bych to nedokázal. Tady je tvůj díl.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_BACK()
{
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
};


var int Diego_Teach;

instance DIA_DiegoNW_CanYouTeach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 995;
	condition = DIA_DiegoNW_CanYouTeach_Condition;
	information = DIA_DiegoNW_CanYouTeach_Info;
	permanent = TRUE;
	description = "Můžeš mě něčemu naučit?";
};


func int DIA_DiegoNW_CanYouTeach_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Diego_Teach == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_CanYouTeach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//Můžeš mě něčemu naučit?
	if(Npc_KnowsInfo(other,DIA_DiegoNW_DeliveredLetter))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//Ale jistě. Jen mi řekni, až budeš připraven.
		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//Nejdřív se musím postarat o vlastní záležitosti.
	};
};


var int DiegoNW_Merke_DEX;

instance DIA_DiegoNW_Teach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 995;
	condition = DIA_DiegoNW_Teach_Condition;
	information = DIA_DiegoNW_Teach_Info;
	permanent = TRUE;
	description = "Uč mě.";
};


func int DIA_DiegoNW_Teach_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Diego_Teach == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//Uč mě.
	AI_Output(self,other,"DIA_DiegoNW_Teach_11_01");	//Naučím tě, jak být o něco obratnější.
	DiegoNW_Merke_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_Teach_BACK()
{
	if(DiegoNW_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//Už jsi obratnější. Jen tak dál!
	};
	Info_ClearChoices(DIA_DiegoNW_Teach);
};

func void DIA_DiegoNW_TeachDEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_TeachDEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};


instance DIA_DiegoNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_KnowWhereEnemy_Condition;
	information = DIA_DiegoNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Odcházím z Khorinisu.";
};


func int DIA_DiegoNW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Diego_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//Odcházím z Khorinisu.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//Moudré rozhodnutí. Přál bych si jít s tebou. Tohle město se příliš rychle změnilo - časy, kdy jsi mohl rychle zbohatnout, už jsou pryč.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//Mohl bych tě učit v lučištnictví, páčení zámků a navyšování obratnosti.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//Navíc by se ti určitě hodil nějaký slušný zloděj.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Diego chce jít samozřejmě se mnou. Vidí to tak, že čím dřív Khorinis opustí, tím líp. Mohl by mi ukázat, jak se stát obratnějším a vycvičit mě v lukostřelbě. Také se se mnou podělí o umění páčit zámky.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//Nechám si to projít hlavou. Momentálně je moje posádka v plném stavu.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//Rozmysli si to. Tak jako tak mě najdeš tady.
	}
	else
	{
		Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"Snad ti dám vědět, až přijde ten pravý čas.",DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"Nechceš jít taky?",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//Tak pojeď se mnou setkáme se v přístavu.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//Hmm. Máš pravdu, Khorinis je žumpa. Jdu s tebou.
	self.flags = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_GivePlayerXP(XP_Crewmember_Success);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//Počkej, za okamžik budu připraven.
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,ITAR_Diego,1);
		AI_EquipArmor(self,ITAR_Diego);
		AI_Wait(self,1);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//Tak, jsem připraven. Uvidíme se u lodi.
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};

func void DIA_DiegoNW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//Možná ti dám vědět, až nadejde čas.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//Jak myslíš. A možná s tebou dokonce i půjdu. Kdo ví?
	Diego_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};


instance DIA_DiegoNW_LeaveMyShip(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_LeaveMyShip_Condition;
	information = DIA_DiegoNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Dohlídni radši na město.";
};


func int DIA_DiegoNW_LeaveMyShip_Condition()
{
	if((Diego_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//Dohlídni radši na město.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//Vážně? Už mě nepotřebuješ? No dobrá. Nezapomeň se stavit, až budeš zpátky ve městě.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//Myslíš, že se ještě setkáme?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//Nikdy nezapomenu na ten výraz, který jsi měl ve tváři, když ses válel po zemi po té ráně od Bullita a my se poprvé setkali.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//Nemají šanci sehnat někoho lepšího, než jsi ty. MĚLI bychom se znovu setkat. Dávej na sebe pozor.
	Diego_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_DiegoNW_StillNeedYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_StillNeedYou_Condition;
	information = DIA_DiegoNW_StillNeedYou_Info;
	permanent = TRUE;
	description = "Rozmyslel jsem si to. Chci, abys šel se mnou.";
};


func int DIA_DiegoNW_StillNeedYou_Condition()
{
	if(((Diego_IsOnBoard == LOG_OBSOLETE) || (Diego_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//Rozmyslel jsem si to. Chci, abys šel se mnou.
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//Kam se podělo tvé odhodlání, příteli? Jasně, že s tebou půjdu - ale už se sakra rozhodni.
	self.flags = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_02");	//Počkej, za okamžik budu připraven.
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,ITAR_Diego,1);
		AI_EquipArmor(self,ITAR_Diego);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//Dobrá, můžeme jít.
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


instance DIA_Thief_NW_PICKPOCKET(C_Info)
{
	npc = PC_Thief_NW;
	nr = 900;
	condition = DIA_Thief_NW_PICKPOCKET_Condition;
	information = DIA_Thief_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Thief_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(120,600);
};

func void DIA_Thief_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,Dialog_Back,DIA_Thief_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thief_NW_PICKPOCKET_DoIt);
};

func void DIA_Thief_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};

func void DIA_Thief_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};

