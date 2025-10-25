
instance DIA_Cord_EXIT(C_Info)
{
	npc = Sld_805_Cord;
	nr = 999;
	condition = DIA_Cord_EXIT_Condition;
	information = DIA_Cord_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cord_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cord_MeetingIsRunning(C_Info)
{
	npc = Sld_805_Cord;
	nr = 1;
	condition = DIA_Addon_Cord_MeetingIsRunning_Condition;
	information = DIA_Addon_Cord_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Cord_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};


var int DIA_Addon_Cord_MeetingIsRunning_OneTime;

func void DIA_Addon_Cord_MeetingIsRunning_Info()
{
	if(DIA_Addon_Cord_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_00");	//Vítej v 'Kruhu Vody', bratře.
		DIA_Addon_Cord_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_01");	//Měl bys jít za Vatrasem ...
	};
	AI_StopProcessInfos(self);
};


instance DIA_Cord_Hallo(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Cord_Hallo_Condition;
	information = DIA_Cord_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cord_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE) && (RangerMeetingRunning != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cord_Hallo_Info()
{
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//Jestli máš problém s vlky nebo polními škůdci, tak si běž promluvit s jedním z našich mladších žoldáků.
	AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//Můžeš ke mně přijít, až se tu ukážou paladinové.
	if(SC_IsRanger == FALSE)
	{
		AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//Co?
		AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//Kdykoliv někdo z vás rolníků přijde ke mně, vždycky se mluví o vyvraždění nevinných tvorů.
		AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//Nejsem rolník.
		AI_Output(self,other,"DIA_Cord_Hallo_14_05");	//Hm? A co tedy potom chceš?
	};
};


var int Cord_SchonmalGefragt;

instance DIA_Cord_WannaJoin(C_Info)
{
	npc = Sld_805_Cord;
	nr = 5;
	condition = DIA_Cord_WannaJoin_Condition;
	information = DIA_Cord_WannaJoin_Info;
	permanent = TRUE;
	description = "Chtěl bych se stát žoldákem!";
};


func int DIA_Cord_WannaJoin_Condition()
{
	if((Cord_Approved == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void B_Cord_BeBetter()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//A protože ty sotva víš, jak se zachází se zbraní, řekl bych, že jsi tady na špatném místě!
};

func void DIA_Cord_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//Chtěl bych se stát žoldákem!
	if(Cord_SchonmalGefragt == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Vypadáš spíš jako někdo, kdo se narodil pro práci na poli, chlapče.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Umíš tedy ovládat zbraň?
		Cord_SchonmalGefragt = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//Už jsi se zlepšil?
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//Takže umíš ovládat jednoruční zbraně?
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Nejsem v tom špatnej.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//Noooo...
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//A umíš ovládat obouruční zbraně?
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//Umím s nimi zacházet.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//Určitě se zlepším!
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//No, alespoň nejsi úplnej začátečník. V pořádku. Budu tě volit.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_11");	//Když budeš potřebovat něco dalšího, můžeš se to naučit ode mne.
		Cord_Approved = TRUE;
		B_GivePlayerXP(XP_Cord_Approved);
		B_LogEntry(TOPIC_SLDRespekt,"Cordovu přímluvu už mám v kapse.");
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher,"Cord mě vycvičí v používání jedno- a obouručních zbraní.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Jinými slovy: jsi mizernej zelenáč!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Každý žoldnéř se musí spolehnout na své kamarády. Závisí na tom všechny naše životy.
		B_Cord_BeBetter();
		Log_CreateTopic(TOPIC_CordProve,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CordProve,LOG_Running);
		B_LogEntry(TOPIC_CordProve,"Cord se za mě přimluví až poté, co se naučím lépe bojovat.");
	};
};


instance DIA_Addon_Cord_YouAreRanger(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Addon_Cord_YouAreRanger_Condition;
	information = DIA_Addon_Cord_YouAreRanger_Info;
	description = "Slyšel jsem, že jsi členem 'Kruhu Vody'.";
};


func int DIA_Addon_Cord_YouAreRanger_Condition()
{
	if((RangerHelp_gildeSLD == TRUE) && (Cord_SchonmalGefragt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_00");	//Slyšel jsem, že jsi členem "Kruhu Vody".
	if(SC_IsRanger == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_01");	//Kterej idiot o tom nemohl držet hubu?
		if(SC_KnowsCordAsRangerFromLee == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_02");	//Lee mi o tom řekl.
		};
		if(SC_KnowsCordAsRangerFromLares == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_03");	//Lares ti vzkazuje, abys mi pomohl, když ti řeknu, že 'žiju pod jeho ochrannými křídly'.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_04");	//(povzdechne si) To vypadá, že tě teď budu muset přijmout, že?
	AI_Output(self,other,"DIA_Addon_Cord_Add_14_01");	//Dobrá, co potřebuješ?
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_06");	//A pozor na hubu. I když nemám radost, z toho, co jsi mi řekl ...
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Právě teď nic nepotřebuji, udělám si to posvém.",DIA_Addon_Cord_YouAreRanger_nix);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Chci tvé brnění.",DIA_Addon_Cord_YouAreRanger_ruestung);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Chci tvou zbraň!",DIA_Addon_Cord_YouAreRanger_waffe);
	if(Cord_Approved == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Nauč mě, jak bojovat.",DIA_Addon_Cord_YouAreRanger_kampf);
	};
	if(hero.guild == GIL_NONE)
	{
	};
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Pomoz mi dostat se k žoldákům.",DIA_Addon_Cord_YouAreRanger_SLDAufnahme);
	};
};


var int Cord_SC_Dreist;

func void B_DIA_Addon_Cord_YouAreRanger_WARN()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_WARN_14_00");	//(hrozí) A nechtěj být nadohled, pokud uslyším, že jsi nedržel jazyk za zuby. To ti říkám pouze jednou!
};

func void B_DIA_Addon_Cord_YouAreRanger_FRESSE()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_FRESSE_14_00");	//(nazlobeně) Dobrá, tady to máš. Zašel jsi příliš daleko, toho budeš litovat.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Cord_RangerHelp_GetSLD = FALSE;
	Cord_RangerHelp_Fight = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
};

func void DIA_Addon_Cord_YouAreRanger_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_ruestung_15_00");	//Chci tvé brnění.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_ruestung_14_01");	//Ještě jednou to zkusíš a budeš sbírat zuby ze země.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_waffe()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Add_15_00");	//Chci tvou zbraň!
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_03");	//(výhružně)  Je to tak?
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_02");	//(zubí se) Á, správně ...
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_weg()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_weg_15_00");	//Rád bych měl tvou pozici na farmě.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_weg_14_01");	//Nezkoušej ze mě udělat hlupáka, kámo, jinak ti zpřelámu každou kost v těle.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};


var int DIA_Addon_Cord_YouAreRanger_SCGotOffer;

func void DIA_Addon_Cord_YouAreRanger_kampf()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_kampf_15_00");	//Nauč mě jak bojovat.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_kampf_14_01");	//Dobrá, co dál?
	Cord_RangerHelp_Fight = TRUE;
	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"To stačí.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_SLDAufnahme()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00");	//Mohl bys mi pomoct dostat se k žoldákům?
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01");	//(směje se) Á, to bude sranda. Dobrá, zkusím to. Co dál?
	Cord_RangerHelp_GetSLD = TRUE;
	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"To stačí.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Gold()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Gold_15_00");	//Zaplať mi a nebudu o tom mluvit.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_Gold_14_01");	//Sorry, ale já se vydírat nenechám ty bastarde.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_nix()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_nix_15_00");	//Právě nic nepotřebuji. Udělám si vše raději sám.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_nix_14_01");	//Jak chceš. Měls na výběr.
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};

func void DIA_Addon_Cord_YouAreRanger_reicht()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_reicht_15_00");	//To stačí.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_reicht_14_01");	//Hádám, že to je.
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};


instance DIA_Addon_Cord_RangerHelp2GetSLD(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Addon_Cord_RangerHelp2GetSLD_Condition;
	information = DIA_Addon_Cord_RangerHelp2GetSLD_Info;
	permanent = TRUE;
	description = "Pomoz mi stát se žoldákem.";
};


var int DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm;

func int DIA_Addon_Cord_RangerHelp2GetSLD_Condition()
{
	if((Cord_RangerHelp_GetSLD == TRUE) && (hero.guild == GIL_NONE) && (DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void B_Cord_RangerHelpObsolete()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_00");	//Problém je vyřešen.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_01");	//Oh, to se pak stává obtížnější.
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_02");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_03");	//Dobrá, to znamená, že ti nemůžu pomoct.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_04");	//Nebo bys chtěl, abych bojoval s každým žoldákem jen proto, aby tě přijali?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_05");	//Musíš to udělat sám.
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
	TOPIC_End_RangerHelpSLD = TRUE;
};

func void B_Cord_ComeLaterWhenDone()
{
	AI_Output(self,other,"DIA_Addon_Cord_ComeLaterWhenDone_14_00");	//Dobrá, zajdi pro to za ním a vrať se, jakmile ti ji zadá.
	AI_StopProcessInfos(self);
};

func void B_Cord_IDoItForYou()
{
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_00");	//Ó ano. To je jednoduché. Poslouchej, vrať se zítra. To už to budu mít vyřešené.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_01");	//Jistě, ale rád bych, kdyby si za to pro mě něco udělal.
	AI_Output(other,self,"DIA_Addon_Cord_IDoItForYou_15_02");	//A co by to mělo být?
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_03");	//Je tu malý tábor banditů v horách na jihovýchod odtud.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_04");	//Půjdeš přímo na jihovýchod odsud, měl bys tam vidět věž.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_05");	//Jeden z mých mužů - Patrick - tam šel před několika dny. Chtěl s těmi bastardy obchodovat.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_06");	//Říkal jsem mu, aby tam nechodil, ale ten blbec mě neposlouchal.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_07");	//Možná jim padl za oběť. Ale nevím to jistě?
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_08");	//Zajdeš tam a podíváš se tam kvůli mě.
	B_LogEntry(TOPIC_Addon_RangerHelpSLD,"Cord se postará o Torlofovu zkoušku. Cordův kamarád Patrick se ztratil. Půjdu do tábora banditů nedaleko odsud na jihovýchodě a podívám se, zda-li tam Patrick není.");
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD,"Zapomeň na to. Úkol je mnohem těžší než ten Torlofův.",B_Cord_IDoItForYou_mist);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD,"A jak si mohu být jist, že na mě nezaútočí, jakmile mě uvidí?",B_Cord_IDoItForYou_Dexter);
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
};

func void B_Cord_IDoItForYou_mist()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_mist_15_00");	//Zapomeň na to. Úkol je mnohem těžší než ten Torlofův.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_01");	//Neboj, takový malý lstivý chlapík se jim dozajista podezřelý zdát nebude.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_02");	//Taky to nemohu udělat sám, protože jsem už žoldák a na toho by zaútočili.
};

func void B_Cord_IDoItForYou_Dexter()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_Dexter_15_00");	//A jak si mohu být jist, že na mě nezaútočí, jakmile mě uvidí?
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_01");	//Protože znám jméno jejich vůdce. Jeho jméno je DEXTER. Prostě řekneš, že ho znáš.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_02");	//To si pak ti chlápci dvakrát rozmyslí, než na tebe zaútočí.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_03");	//Samozřejmě to může být nebezpečné dobrodružství.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_04");	//Ale ty to nějak zvládneš.
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	B_LogEntry(TOPIC_Addon_RangerHelpSLD,"Vůdce banditů se jmenuje Dexter.");
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Žoldák Cord hledá svého přítele Patricka.");
	MIS_Addon_Cord_Look4Patrick = LOG_Running;
	Ranger_SCKnowsDexter = TRUE;
};

func void DIA_Addon_Cord_RangerHelp2GetSLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_00");	//Pomoz mi stát se žoldákem.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_01");	//Podívej. Musíš udělat Torlofovu zkoušku, jestli chceš projít. To je jisté.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_02");	//Už jsi o tom řekl Torlofovi?
	if(Torlof_Go == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_03");	//Opravdu ne.
		B_Cord_ComeLaterWhenDone();
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_04");	//Á, zkouška.
		AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_05");	//Vidím. A co přesně znamená ten test?
		if((Torlof_ProbeBestanden == TRUE) || ((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_IsDead(Rumbold) && Npc_IsDead(Rick)) || ((MIS_Torlof_HolPachtVonSekob == LOG_Running) && ((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE) || Npc_IsDead(Sekob))))
		{
			B_Cord_RangerHelpObsolete();
		}
		else if(Torlof_Probe == 0)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_06");	//Ještě jsem se k tomu nedostal.
			B_Cord_ComeLaterWhenDone();
		}
		else if(Torlof_Probe == Probe_Sekob)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_07");	//Mám vybrat nájemné od Sekoba.
			B_Cord_IDoItForYou();
		}
		else if(Torlof_Probe == Probe_Bengar)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_08");	//Mám se postarat o domobranu u Bengarovy farmy.
			B_Cord_IDoItForYou();
		}
		else
		{
			B_Cord_RangerHelpObsolete();
		};
	};
};


instance DIA_Addon_Cord_TalkedToDexter(C_Info)
{
	npc = Sld_805_Cord;
	nr = 5;
	condition = DIA_Addon_Cord_TalkedToDexter_Condition;
	information = DIA_Addon_Cord_TalkedToDexter_Info;
	description = "Byl jsem za tím Dextrem.";
};


func int DIA_Addon_Cord_TalkedToDexter_Condition()
{
	if(((BDT_1060_Dexter.aivar[AIV_TalkedToPlayer] == TRUE) || Npc_IsDead(BDT_1060_Dexter)) && (MIS_Addon_Cord_Look4Patrick == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_TalkedToDexter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_00");	//Byl jsem za tím Dextrem.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_01");	//Dobrá, a?
	if(Npc_IsDead(BDT_1060_Dexter))
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_02");	//Je mrtev.
	};
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_03");	//Nicméně jsem nenašel ani stopu po tvém příteli Patrickovi.
	if(Dexter_KnowsPatrick == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_04");	//Dexter si na něj vzpomněl, ale řekl mi, že nenavštívil tábor.
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_05");	//A jsi si jist, že ti Dexter nelhal?
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_06");	//Ne, to nejsem. Ale to jsou všechny informace, které jsem byl schopen sehnat.
	};
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_07");	//Ten chlap prostě zmizel beze stopy.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_08");	//Dobrá, dodržel jsi svou část dohody ...
	MIS_Addon_Cord_Look4Patrick = LOG_SUCCESS;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_GivePlayerXP(XP_Addon_Cord_Look4Patrick);
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_09");	//Co Torlofův test?
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_10");	//Prostě se vrať k Torlofovi. Považuj test za zvládnutý. Jen mu řekni, že se o to postarám.
	Cord_RangerHelp_TorlofsProbe = TRUE;
	if(Torlof_Probe == Probe_Sekob)
	{
		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
	}
	else if(Torlof_Probe == Probe_Bengar)
	{
		MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	};
};


instance DIA_Cord_ReturnPatrick(C_Info)
{
	npc = Sld_805_Cord;
	nr = 8;
	condition = DIA_Cord_ReturnPatrick_Condition;
	information = DIA_Cord_ReturnPatrick_Info;
	permanent = FALSE;
	description = "Patrick se vrátil.";
};


func int DIA_Cord_ReturnPatrick_Condition()
{
	if((Npc_GetDistToWP(Patrick_NW,"NW_BIGFARM_PATRICK") <= 1000) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cord_ReturnPatrick_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_00");	//Patrick se vrátil.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_01");	//Á, ani jsem nevěřil, že ho ještě někdy uvidím. Ty ...
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_02");	//Hej, udělej mi laskavost.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_03");	//Ano?
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_04");	//Uchraň mě svého vděku.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_05");	//Neplánoval jsem ti děkovat.
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_06");	//Dobře ... ?
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_07");	//(směje se) Jen jsem ti chtěl říct, že jsi strašný blázen.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_09");	//(směje se) Opatruj se!
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Cord_ExplainSkills(C_Info)
{
	npc = Sld_805_Cord;
	nr = 1;
	condition = DIA_Cord_ExplainSkills_Condition;
	information = DIA_Cord_ExplainSkills_Info;
	permanent = FALSE;
	description = "Co bych se měl naučit...";
};


func int DIA_Cord_ExplainSkills_Condition()
{
	if(Cord_Approved == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainSkills_Info()
{
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//Co bych se měl naučit jako první, boj s jednoručními, nebo obouručními zbraněmi?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//Oba dva druhy boje jsou si hodně podobné.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_02");	//Jakmile dosáhneš u jednoho typu zbraní další úrovně, automaticky se to naučíš také i pro druhý typ zbraní.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_03");	//Jestliže jsi například dobrý v boji s jednoručními meči, ale jsi stále začátečník v boji s obouručními zbraněmi...
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_04");	//... tvé dovednosti s obouručními zbraněmi se zvýší, i když trénuješ s jednoruční zbraní.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_05");	//Pokud trénuješ pouze s jedním typem zbraní, zjistíš, že výcvik je mnohem více vyčerpávající.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_06");	//Pokud trénuješ vždy s oběma typy zbraní, dosáhneš stejného výsledku s menším úsilím.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//V konečném důsledku dosáhneš stejného výsledku oběma způsoby - výběr je na tobě.
};


instance DIA_Cord_ExplainWeapons(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Cord_ExplainWeapons_Condition;
	information = DIA_Cord_ExplainWeapons_Info;
	permanent = FALSE;
	description = "Jaké jsou výhody jednoručních a obouručních zbraní?";
};


func int DIA_Cord_ExplainWeapons_Condition()
{
	if(Cord_Approved == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainWeapons_Info()
{
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//Jaké jsou výhody jednoručních a obouručních zbraní?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Dobrá otázka. Vidím, že téhle věci věnuješ dostatečnou pozornost.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//Jednoruční zbraně jsou rychlejší, ale trochu slabší.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Obouruční zbraně způsobují větší poškození, ale nemůžeš s nimi útočit tak rychle.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//K ovládání obouručních zbraní také potřebuješ více síly. To znamená dodatečný trénink.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Jediný způsob, jak se stát skutečně dobrým, je vložit do toho mnoho úsilí.
};


var int Cord_Merke_1h;
var int Cord_Merke_2h;

instance DIA_Cord_Teach(C_Info)
{
	npc = Sld_805_Cord;
	nr = 3;
	condition = DIA_Cord_Teach_Condition;
	information = DIA_Cord_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě bojovat!";
};


func int DIA_Cord_Teach_Condition()
{
	return TRUE;
};

func void B_Cord_Zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nebudu plýtvat svým časem se začátečníky.
};

func void DIA_Cord_Teach_Info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nauč mě bojovat!
	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		if(((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) && (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)) || (Cord_RangerHelp_Fight == TRUE))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_01");	//Mohu tě naučit používat jakoukoliv zbraň - kde začneme?
			Cord_Approved = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_02");	//Mohu tě naučit používat jednoruční meč. Ale nejsi dost dobrej na to, abys používal obouručák.
			B_Cord_Zeitverschwendung();
			Cord_Approved = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_04");	//Co se týče jednoručních zbraní, jsi naprostý začátečník! Ale tvé dovednosti v obouručních zbraních nejsou tak špatné.
			AI_Output(self,other,"DIA_Cord_Teach_14_05");	//Pokud potřebuješ více zkušeností s jednoručními zbraněmi, jdi si najít jiného učitele.
			Cord_Approved = TRUE;
		}
		else
		{
			B_Cord_Zeitverschwendung();
			B_Cord_BeBetter();
		};
		if(Cord_Approved == TRUE)
		{
			Info_ClearChoices(DIA_Cord_Teach);
			Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
			if((Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0) || (Cord_RangerHelp_Fight == TRUE))
			{
				Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
				Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
			};
			if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (Cord_RangerHelp_Fight == TRUE))
			{
				Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
				Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);
			};
			Cord_Merke_1h = other.HitChance[NPC_TALENT_1H];
			Cord_Merke_2h = other.HitChance[NPC_TALENT_2H];
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_Teach_14_06");	//Já trénuji pouze žoldáky nebo vhodné uchazeče!
	};
};

func void DIA_Cord_Teach_Back()
{
	if((Cord_Merke_1h < other.HitChance[NPC_TALENT_1H]) || (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Jestli jsi se už zlepšil, tak v tom pokračuj!
	};
	Info_ClearChoices(DIA_Cord_Teach);
};

func void DIA_Cord_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,90);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);
	};
	if((hero.HitChance[NPC_TALENT_1H] >= 60) && (hero.HitChance[NPC_TALENT_1H] <= 79))
	{
		AI_UnequipWeapons(hero);
	};
};

func void DIA_Cord_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,90);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);
	};
	if((hero.HitChance[NPC_TALENT_1H] >= 60) && (hero.HitChance[NPC_TALENT_1H] <= 79))
	{
		AI_UnequipWeapons(hero);
	};
};


instance DIA_CORD_TEACH2(C_Info)
{
	npc = Sld_805_Cord;
	nr = 3;
	condition = dia_cord_teach2_condition;
	information = dia_cord_teach2_info;
	permanent = TRUE;
	description = "(Boj ze štítem. Požadavek: 30% jednoručních zbraní, cena: 5 VB)";
};


func int dia_cord_teach2_condition()
{
	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		if((SCATTY_TEACH_PERM1 == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0))
		{
			return TRUE;
		};
	};
};

func void dia_cord_teach2_info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nauč mě bojovat!
	if((other.lp >= 5) && (Npc_GetTalentSkill(other,NPC_TALENT_1H) >= 1))
	{
		other.lp = other.lp - 5;
		B_TeachThiefTalent(self,other,NPC_TALENT_SHIELDD);
		SCATTY_TEACH_PERM1 = TRUE;
		PrintScreen("Naučil ses: Boj se štítem",-1,-1,FONT_Screen,3);
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_CORD_TEACH3(C_Info)
{
	npc = Sld_805_Cord;
	nr = 3;
	condition = dia_cord_teach3_condition;
	information = dia_cord_teach3_info;
	permanent = TRUE;
	description = "(Pokročilý boj ze štítem. Požadavek: 60% jednoručních zbraní, cena: 10 VB)";
};


func int dia_cord_teach3_condition()
{
	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		if((SCATTY_TEACH_PERM1 == TRUE) && (SCATTY_TEACH_PERM2 == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0))
		{
			return TRUE;
		};
	};
};

func void dia_cord_teach3_info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nauč mě bojovat!
	if((other.lp >= 10) && (Npc_GetTalentSkill(other,NPC_TALENT_1H) >= 2))
	{
		other.lp = other.lp - 10;
		SCATTY_TEACH_PERM2 = TRUE;
		PrintScreen("Naučil ses: Pokročilý boj ze štítem",-1,-1,FONT_Screen,3);
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_CORD_TEACH4(C_Info)
{
	npc = Sld_805_Cord;
	nr = 3;
	condition = dia_cord_teach4_condition;
	information = dia_cord_teach4_info;
	permanent = TRUE;
	description = "(Mistrovský boj ze štítem. Požadavek: 90% jednoručních zbraní, cena: 15 VB)";
};


func int dia_cord_teach4_condition()
{
	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		if((SCATTY_TEACH_PERM1 == TRUE) && (SCATTY_TEACH_PERM2 == TRUE) && (SCATTY_TEACH_PERM3 == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0))
		{
			return TRUE;
		};
	};
};

func void dia_cord_teach4_info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nauč mě bojovat!
	if((other.lp >= 15) && (Npc_GetTalentSkill(other,NPC_TALENT_1H) >= 3))
	{
		other.lp = other.lp - 15;
		SCATTY_TEACH_PERM3 = TRUE;
		PrintScreen("Naučil ses: Mistrovský boj ze štítem",-1,-1,FONT_Screen,3);
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Cord_PICKPOCKET(C_Info)
{
	npc = Sld_805_Cord;
	nr = 900;
	condition = DIA_Cord_PICKPOCKET_Condition;
	information = DIA_Cord_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Cord_PICKPOCKET_Condition()
{
	return C_Beklauen(65,75);
};

func void DIA_Cord_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
	Info_AddChoice(DIA_Cord_PICKPOCKET,Dialog_Back,DIA_Cord_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cord_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cord_PICKPOCKET_DoIt);
};

func void DIA_Cord_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};

func void DIA_Cord_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};

