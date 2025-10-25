
instance DIA_Raoul_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_EXIT_Condition;
	information = DIA_Raoul_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Raoul_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_NoSentenza(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 1;
	condition = DIA_Raoul_NoSentenza_Condition;
	information = DIA_Raoul_NoSentenza_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Raoul_NoSentenza_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Sentenza_Hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Raoul_NoSentenza_Info()
{
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_00");	//Počkej chvíli, kámo!
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_01");	//Nevšiml jsem si, že by tě Sentenza hledal.
	if(Hlp_IsValidNpc(Sentenza) && !C_NpcIsDown(Sentenza))
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_02");	//SENTENZO! Pojď sem!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_03");	//(falešně slušně) Chvilku strpení, bude tu co by dup!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_04");	//Pak tě ale čeká nepříjemné překvapení!
		B_Attack(Sentenza,other,AR_NONE,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_05");	//Kde tedy je? No, to nevadí, měls prostě kliku.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_Hello(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 1;
	condition = DIA_Raoul_Hello_Condition;
	information = DIA_Raoul_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Raoul_Hello_Condition()
{
	if((other.guild == GIL_NONE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Hello_Info()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_00");	//(znuděně) Co chceš?
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_01");	//(otráveně) Co chceš teď?
	};
};


var int Raoul_gesagt;

instance DIA_Raoul_PERMNone(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 1;
	condition = DIA_Raoul_PERMNone_Condition;
	information = DIA_Raoul_PERMNone_Info;
	permanent = TRUE;
	description = "Chci se trochu porozhlédnout po farmě!";
};


func int DIA_Raoul_PERMNone_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERMNone_Info()
{
	if(Raoul_gesagt == FALSE)
	{
		AI_Output(other,self,"DIA_Raoul_PERMNone_15_00");	//Chci se trochu porozhlédnout po farmě!
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_01");	//Do toho stavení nalevo radši nechoď. Bydlí tam Sylvio a teď zrovna nemá nijak dobrou náladu.
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_02");	//Když narazí na nějakého slabocha, který nepatří ke statku, mohlo by ho napadnout, že by si na něm mohl vylít vztek.
		Raoul_gesagt = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_03");	//Tak si to užij!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Raoul_WannaJoin(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_WannaJoin_Condition;
	information = DIA_Raoul_WannaJoin_Info;
	permanent = FALSE;
	description = "Chci se přidat k Leeovi!";
};


func int DIA_Raoul_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_00");	//Chci se přidat k Leeovi!
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_01");	//Jestli to bude takhle pokračovat, Lee už za chvíli nebude mít hlavní slovo!
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_02");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_03");	//Chce, abychom tu všichni seděli s rukama v klíně. Jen tu a tam postrašíme pár sedláků a to je všechno.
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_04");	//Sylvio naopak vždycky říká, že nejlepší obrana je útok, a má sakra pravdu!
};


instance DIA_Raoul_AboutSylvio(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_AboutSylvio_Condition;
	information = DIA_Raoul_AboutSylvio_Info;
	permanent = FALSE;
	description = "Kdo je Sylvio?";
};


func int DIA_Raoul_AboutSylvio_Condition()
{
	if((Raoul_gesagt == TRUE) || Npc_KnowsInfo(other,DIA_Raoul_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Raoul_AboutSylvio_Info()
{
	AI_Output(other,self,"DIA_Raoul_AboutSylvio_15_00");	//Kdo je Sylvio?
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_01");	//Podle mě je to náš budoucí vůdce. Jestli se ho ale chceš zeptat, jestli se k nám můžeš přidat, tak na to rovnou zapomeň!
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_02");	//Vypadáš, že bys uměl leda tak pást ovce.
};


instance DIA_Raoul_Stimme(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_Stimme_Condition;
	information = DIA_Raoul_Stimme_Info;
	permanent = FALSE;
	description = "Nevadilo by ti, kdybych se tu stal žoldákem?";
};


func int DIA_Raoul_Stimme_Condition()
{
	if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_Stimme_Info()
{
	AI_Output(other,self,"DIA_Raoul_Stimme_15_00");	//Nevadilo by ti, kdybych se tu stal žoldákem?
	AI_Output(self,other,"DIA_Raoul_Stimme_01_01");	//Ále, dělej si, co chceš...
	Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
	B_LogEntry(TOPIC_SLDRespekt,"Raoul nemá nic proti tomu, abych se přidal k žoldnéřům.");
};


instance DIA_Raoul_Duell(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_Duell_Condition;
	information = DIA_Raoul_Duell_Info;
	permanent = TRUE;
	description = "Já myslím, že bych ti měl dát pár přes držku.";
};


func int DIA_Raoul_Duell_Condition()
{
	if((Raoul_gesagt == TRUE) || Npc_KnowsInfo(other,DIA_Raoul_AboutSylvio) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Duell_Info()
{
	AI_Output(other,self,"DIA_Raoul_Duell_15_00");	//Já myslím, že bych ti měl dát pár přes držku.
	AI_Output(self,other,"DIA_Raoul_Duell_01_01");	//Co?
	AI_Output(other,self,"DIA_Raoul_Duell_15_02");	//Přesně to bys teď potřeboval.
	AI_Output(self,other,"DIA_Raoul_Duell_01_03");	//Zatím jsem k tobě byl asi až moc milý, co?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Raoul_PERM(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 900;
	condition = DIA_Raoul_PERM_Condition;
	information = DIA_Raoul_PERM_Info;
	permanent = TRUE;
	description = "A co jinak. Všechno v pořádku?";
};


func int DIA_Raoul_PERM_Condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERM_Info()
{
	AI_Output(other,self,"DIA_Raoul_PERM_15_00");	//A co jinak. Všechno v pořádku?
	if(MIS_Raoul_KillTrollBlack == LOG_Running)
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_01");	//Přestaň žvanit a radši mi obstarej tu kůži z černého trola.
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_02");	//Snažíš se mi podlejzat, nebo co? Zmizni!
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Raoul_PERM_01_03");	//Nezapomněl jsem, cos mi provedl.
		};
	};
};


instance DIA_Raoul_TROLL(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_TROLL_Condition;
	information = DIA_Raoul_TROLL_Info;
	important = TRUE;
};


func int DIA_Raoul_TROLL_Condition()
{
	if(hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLL_Info()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_01_00");	//(cynicky) Jen se na to podívej!
	AI_Output(other,self,"DIA_Raoul_TROLL_15_01");	//Co chceš?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_02");	//Ty ses přidal k městským žebrákům? Skoro to tak vypadá.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_03");	//Nemysli si, že si tě teď budu vážit. To, že jsi jedním z nás, ještě nic neznamená.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_04");	//Hraješ si na velkého mága, co?
	};
	AI_Output(self,other,"DIA_Raoul_TROLL_01_05");	//Něco ti povím. Vůbec nesejde na tom, co máš zrovna na sobě. Já ti stejně vidím až do žaludku.
	AI_Output(self,other,"DIA_Raoul_TROLL_01_06");	//Pro mě vždycky nebudeš nic víc než špinavý flákač.
	Info_ClearChoices(DIA_Raoul_TROLL);
	Info_AddChoice(DIA_Raoul_TROLL,"Už musím jít.",DIA_Raoul_TROLL_weg);
	Info_AddChoice(DIA_Raoul_TROLL,"Co máš za problém?",DIA_Raoul_TROLL_rechnung);
};

func void DIA_Raoul_TROLL_weg()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_weg_15_00");	//Už musím jít.
	AI_Output(self,other,"DIA_Raoul_TROLL_weg_01_01");	//Jo, vymajzni.
	AI_StopProcessInfos(self);
};

func void DIA_Raoul_TROLL_rechnung()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_00");	//Co máš za problém?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_01");	//Takové jako ty moc dobře znám. Mají akorát plnou hubu keců.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_02");	//Nesnáším lidi, co dělají haura a kasají se, jaké hrdinské skutky vykonají.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_03");	//Zrovna včera jsem tu jednomu chlápkovi dal pár do zubů, protože tvrdil, že by černého trola sundal i s jednou rukou přivázanou za zády.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_04");	//A co?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_05");	//(ostře) Co myslíš tím "a co"?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_06");	//Už jsi někdy viděl černého trola, ty velkohubý nádivo? Máš vůbec ponětí, jak obrovská potvora to je?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_07");	//Když se k němu přiblížíš jen o krok víc, než je zdrávo, roztrhá tě na cucky.
	Info_ClearChoices(DIA_Raoul_TROLL);
	Info_AddChoice(DIA_Raoul_TROLL,"Nemám zájem.",DIA_Raoul_TROLL_rechnung_hastrecht);
	if(Npc_IsDead(Troll_Black))
	{
		Info_AddChoice(DIA_Raoul_TROLL,"Už jsem zabil toho černého trola.",DIA_Raoul_TROLL_rechnung_ich);
	}
	else
	{
		Info_AddChoice(DIA_Raoul_TROLL,"Černý trol? Žádný problém!",DIA_Raoul_TROLL_rechnung_noProb);
	};
};

func void B_Raoul_Blame()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00");	//Ty si o to ale přímo koleduješ, co? Měl bych ti rovnou zakroutit krkem, ale mám lepší nápad.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01");	//Jestli jsi fakt tak dobrý bojovník, tak to dokaž.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02");	//Co z toho budu mít?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03");	//To je ale hloupá otázka. Čest a nerozbitej ciferník?
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04");	//To teda není zrovna moc.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05");	//No, řekněme, že jestli mi přineseš kůži černého trola, dám ti pěknou hromadu peněz. Co ty na to?
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06");	//To už je lepší.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07");	//Tak na co čekáš?
	Log_CreateTopic(TOPIC_KillTrollBlack,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillTrollBlack,LOG_Running);
	B_LogEntry(TOPIC_KillTrollBlack,"Raoul žádá, abych mu přinesl kůži černého trola.");
	MIS_Raoul_KillTrollBlack = LOG_Running;
	Info_ClearChoices(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_hastrecht()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_hastrecht_15_00");	//Nemám zájem.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_hastrecht_01_01");	//To je pro tebe nejspíš lepší.
	Info_ClearChoices(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_ich()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_ich_15_00");	//Už jsem zabil toho černého trola.
	B_Raoul_Blame();
};

func void DIA_Raoul_TROLL_rechnung_noProb()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_noProb_15_00");	//Černý trol? Žádný problém!
	B_Raoul_Blame();
};


instance DIA_Raoul_TrophyFur(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_TrophyFur_Condition;
	information = DIA_Raoul_TrophyFur_Info;
	permanent = TRUE;
	description = "Nejdřív mi prozraď, jak z trola tu kůži stáhnout.";
};


func int DIA_Raoul_TrophyFur_Condition()
{
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) && (MIS_Raoul_KillTrollBlack == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Raoul_TrophyFur_Info()
{
	AI_Output(other,self,"DIA_Raoul_TrophyFur_15_00");	//Nejdřív mi prozraď, jak z trola tu kůži stáhnout.
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_01");	//Tak pozorně poslouchej, tuhle radu ti dám zadarmo.
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_02");	//Každou nohu té bestie opatrně nařízneš...
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_03");	//...a pak jí stáhneš kůži až k uším. Je to na tebe moc složité nebo co?
	};
};


instance DIA_Raoul_TROLLFELL(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_TROLLFELL_Condition;
	information = DIA_Raoul_TROLLFELL_Info;
	description = "Mám u sebe tu kůži černého trola.";
};


func int DIA_Raoul_TROLLFELL_Condition()
{
	if(Npc_HasItems(other,ItAt_TrollBlackFur) && Npc_KnowsInfo(other,DIA_Raoul_TROLL))
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLLFELL_Info()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_00");	//Mám u sebe tu kůži černého trola.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_01");	//To není možné. Ukaž mi ji.
	B_GiveInvItems(other,self,ItAt_TrollBlackFur,1);
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_02");	//To je fakt neuvěřitelné. Co za ni chceš?
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_03");	//Dej mi, co máš.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_04");	//Fajn, dám ti 500 zlaťáků a tři léčivé lektvary, co ty na to?
	Info_ClearChoices(DIA_Raoul_TROLLFELL);
	Info_AddChoice(DIA_Raoul_TROLLFELL,"To nestačí.",DIA_Raoul_TROLLFELL_nein);
	Info_AddChoice(DIA_Raoul_TROLLFELL,"Platí.",DIA_Raoul_TROLLFELL_ja);
	MIS_Raoul_KillTrollBlack = LOG_SUCCESS;
	B_GivePlayerXP(XP_Raoul_KillTrollBlack);
};

func void DIA_Raoul_TROLLFELL_ja()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_ja_15_00");	//Platí.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_ja_01_01");	//Těšilo mě.
	Npc_RemoveInvItems(self,ItAt_TrollBlackFur,1);
	CreateInvItems(self,ItPo_Health_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Info_ClearChoices(DIA_Raoul_TROLLFELL);
};

func void DIA_Raoul_TROLLFELL_nein()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_nein_15_00");	//To nestačí.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_01");	//Jen si posluž, já si tu kůži stejně nechám.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_02");	//Nenechám si mezi prsty proklouznout takovouhle šanci.
	MIS_Raoul_DoesntPayTrollFur = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_FELLZURUECK(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_FELLZURUECK_Condition;
	information = DIA_Raoul_FELLZURUECK_Info;
	permanent = TRUE;
	description = "Vrať mi tu trolí kůži.";
};


func int DIA_Raoul_FELLZURUECK_Condition()
{
	if((MIS_Raoul_DoesntPayTrollFur == LOG_Running) && Npc_HasItems(self,ItAt_TrollBlackFur))
	{
		return TRUE;
	};
};

func void DIA_Raoul_FELLZURUECK_Info()
{
	AI_Output(other,self,"DIA_Raoul_FELLZURUECK_15_00");	//Vrať mi tu trolí kůži.
	AI_Output(self,other,"DIA_Raoul_FELLZURUECK_01_01");	//Ne.
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_GotTrollFurBack(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_GotTrollFurBack_Condition;
	information = DIA_Raoul_GotTrollFurBack_Info;
	description = "Už se mě nikdy nesnaž oškubat, rozumíš?";
};


func int DIA_Raoul_GotTrollFurBack_Condition()
{
	if((MIS_Raoul_DoesntPayTrollFur == LOG_Running) && (Npc_HasItems(self,ItAt_TrollBlackFur) == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void DIA_Raoul_GotTrollFurBack_Info()
{
	AI_Output(other,self,"DIA_Raoul_GotTrollFurBack_15_00");	//Už se mě nikdy nesnaž oškubat, rozumíš?
	AI_Output(self,other,"DIA_Raoul_GotTrollFurBack_01_01");	//No jo. Víš přece, jak to tady chodí, ne? Tak se uklidni.
	MIS_Raoul_DoesntPayTrollFur = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_KAP3_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_KAP3_EXIT_Condition;
	information = DIA_Raoul_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_KAP4_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_KAP4_EXIT_Condition;
	information = DIA_Raoul_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_KAP5_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_KAP5_EXIT_Condition;
	information = DIA_Raoul_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_Ship(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_Ship_Condition;
	information = DIA_Raoul_Ship_Info;
	description = "Nechtěl by sis vyjet na moře?";
};


func int DIA_Raoul_Ship_Condition()
{
	if((Kapitel >= 5) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Ship_Info()
{
	AI_Output(other,self,"DIA_Raoul_Ship_15_00");	//Nechtěl by sis vyjet na moře?
	AI_Output(self,other,"DIA_Raoul_Ship_01_01");	//Co máš v plánu? Chceš zabrat tu paladinskou loď? (směje se)
	AI_Output(other,self,"DIA_Raoul_Ship_15_02");	//A co když jo?
	AI_Output(self,other,"DIA_Raoul_Ship_01_03");	//(vážně) Ty ses úplně zbláznil. Ne, díky, to není nic pro mě.
	AI_Output(self,other,"DIA_Raoul_Ship_01_04");	//Nemám důvod opustit Khorinis. Buď si nějaké prachy vydělám tady, nebo na pevnině - mně to přijde prašť jak uhoď.
	AI_Output(self,other,"DIA_Raoul_Ship_01_05");	//Najdi si někoho jiného.
	if(Npc_IsDead(Torlof) == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Ship_01_06");	//Zeptej se Torlofa. Pokud vím, tak se po moři kdysi plavil.
	};
};


instance DIA_Raoul_KAP6_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_KAP6_EXIT_Condition;
	information = DIA_Raoul_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_PICKPOCKET(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 900;
	condition = DIA_Raoul_PICKPOCKET_Condition;
	information = DIA_Raoul_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Raoul_PICKPOCKET_Condition()
{
	return C_Beklauen(45,85);
};

func void DIA_Raoul_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
	Info_AddChoice(DIA_Raoul_PICKPOCKET,Dialog_Back,DIA_Raoul_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Raoul_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Raoul_PICKPOCKET_DoIt);
};

func void DIA_Raoul_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
};

func void DIA_Raoul_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
};

