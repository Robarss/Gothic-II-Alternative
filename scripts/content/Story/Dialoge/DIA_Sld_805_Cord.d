
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
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_00");	//V?tej v 'Kruhu Vody', brat?e.
		DIA_Addon_Cord_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_01");	//M?l bys j?t za Vatrasem ...
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
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//Jestli m?? probl?m s vlky nebo poln?mi ?k?dci, tak si b?? promluvit s jedn?m z na?ich mlad??ch ?old?k?.
	AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//M??e? ke mn? p?ij?t, a? se tu uk??ou paladinov?.
	if(SC_IsRanger == FALSE)
	{
		AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//Co?
		AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//Kdykoliv n?kdo z v?s roln?k? p?ijde ke mn?, v?dycky se mluv? o vyvra?d?n? nevinn?ch tvor?.
		AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//Nejsem roln?k.
		AI_Output(self,other,"DIA_Cord_Hallo_14_05");	//Hm? A co tedy potom chce??
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
	description = "Cht?l bych se st?t ?old?kem!";
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
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//A proto?e ty sotva v??, jak se zach?z? se zbran?, ?ekl bych, ?e jsi tady na ?patn?m m?st?!
};

func void DIA_Cord_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//Cht?l bych se st?t ?old?kem!
	if(Cord_SchonmalGefragt == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Vypad?? sp?? jako n?kdo, kdo se narodil pro pr?ci na poli, chlap?e.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Um?? tedy ovl?dat zbra??
		Cord_SchonmalGefragt = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//U? jsi se zlep?il?
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//Tak?e um?? ovl?dat jednoru?n? zbran??
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Nejsem v tom ?patnej.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//Noooo...
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//A um?? ovl?dat obouru?n? zbran??
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//Um?m s nimi zach?zet.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//Ur?it? se zlep??m!
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//No, alespo? nejsi ?plnej za??te?n?k. V po??dku. Budu t? volit.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_11");	//Kdy? bude? pot?ebovat n?co dal??ho, m??e? se to nau?it ode mne.
		Cord_Approved = TRUE;
		B_GivePlayerXP(XP_Cord_Approved);
		B_LogEntry(TOPIC_SLDRespekt,"Cordovu p??mluvu u? m?m v kapse.");
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher,"Cord m? vycvi?? v pou??v?n? jedno- a obouru?n?ch zbran?.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Jin?mi slovy: jsi mizernej zelen??!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Ka?d? ?oldn?? se mus? spolehnout na sv? kamar?dy. Z?vis? na tom v?echny na?e ?ivoty.
		B_Cord_BeBetter();
		Log_CreateTopic(TOPIC_CordProve,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CordProve,LOG_Running);
		B_LogEntry(TOPIC_CordProve,"Cord se za m? p?imluv? a? pot?, co se nau??m l?pe bojovat.");
	};
};


instance DIA_Addon_Cord_YouAreRanger(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Addon_Cord_YouAreRanger_Condition;
	information = DIA_Addon_Cord_YouAreRanger_Info;
	description = "Sly?el jsem, ?e jsi ?lenem 'Kruhu Vody'.";
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
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_00");	//Sly?el jsem, ?e jsi ?lenem "Kruhu Vody".
	if(SC_IsRanger == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_01");	//Kterej idiot o tom nemohl dr?et hubu?
		if(SC_KnowsCordAsRangerFromLee == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_02");	//Lee mi o tom ?ekl.
		};
		if(SC_KnowsCordAsRangerFromLares == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_03");	//Lares ti vzkazuje, abys mi pomohl, kdy? ti ?eknu, ?e '?iju pod jeho ochrann?mi k??dly'.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_04");	//(povzdechne si) To vypad?, ?e t? te? budu muset p?ijmout, ?e?
	AI_Output(self,other,"DIA_Addon_Cord_Add_14_01");	//Dobr?, co pot?ebuje??
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_06");	//A pozor na hubu. I kdy? nem?m radost, z toho, co jsi mi ?ekl ...
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Pr?v? te? nic nepot?ebuji, ud?l?m si to posv?m.",DIA_Addon_Cord_YouAreRanger_nix);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Chci tv? brn?n?.",DIA_Addon_Cord_YouAreRanger_ruestung);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Chci tvou zbra?!",DIA_Addon_Cord_YouAreRanger_waffe);
	if(Cord_Approved == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Nau? m?, jak bojovat.",DIA_Addon_Cord_YouAreRanger_kampf);
	};
	if(hero.guild == GIL_NONE)
	{
	};
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Pomoz mi dostat se k ?old?k?m.",DIA_Addon_Cord_YouAreRanger_SLDAufnahme);
	};
};


var int Cord_SC_Dreist;

func void B_DIA_Addon_Cord_YouAreRanger_WARN()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_WARN_14_00");	//(hroz?) A necht?j b?t nadohled, pokud usly??m, ?e jsi nedr?el jazyk za zuby. To ti ??k?m pouze jednou!
};

func void B_DIA_Addon_Cord_YouAreRanger_FRESSE()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_FRESSE_14_00");	//(nazloben?) Dobr?, tady to m??. Za?el jsi p??li? daleko, toho bude? litovat.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Cord_RangerHelp_GetSLD = FALSE;
	Cord_RangerHelp_Fight = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
};

func void DIA_Addon_Cord_YouAreRanger_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_ruestung_15_00");	//Chci tv? brn?n?.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_ruestung_14_01");	//Je?t? jednou to zkus?? a bude? sb?rat zuby ze zem?.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_waffe()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Add_15_00");	//Chci tvou zbra?!
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_03");	//(v?hru?n?)  Je to tak?
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_02");	//(zub? se) ?, spr?vn? ...
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_weg()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_weg_15_00");	//R?d bych m?l tvou pozici na farm?.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_weg_14_01");	//Nezkou?ej ze m? ud?lat hlup?ka, k?mo, jinak ti zp?el?mu ka?dou kost v t?le.
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
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_kampf_15_00");	//Nau? m? jak bojovat.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_kampf_14_01");	//Dobr?, co d?l?
	Cord_RangerHelp_Fight = TRUE;
	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"To sta??.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_SLDAufnahme()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00");	//Mohl bys mi pomoct dostat se k ?old?k?m?
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01");	//(sm?je se) ?, to bude sranda. Dobr?, zkus?m to. Co d?l?
	Cord_RangerHelp_GetSLD = TRUE;
	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"To sta??.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Gold()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Gold_15_00");	//Zapla? mi a nebudu o tom mluvit.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_Gold_14_01");	//Sorry, ale j? se vyd?rat nenech?m ty bastarde.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_nix()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_nix_15_00");	//Pr?v? nic nepot?ebuji. Ud?l?m si v?e rad?ji s?m.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_nix_14_01");	//Jak chce?. M?ls na v?b?r.
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};

func void DIA_Addon_Cord_YouAreRanger_reicht()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_reicht_15_00");	//To sta??.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_reicht_14_01");	//H?d?m, ?e to je.
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
	description = "Pomoz mi st?t se ?old?kem.";
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
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_00");	//Probl?m je vy?e?en.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_01");	//Oh, to se pak st?v? obt??n?j??.
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_02");	//Co t?m mysl???
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_03");	//Dobr?, to znamen?, ?e ti nem??u pomoct.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_04");	//Nebo bys cht?l, abych bojoval s ka?d?m ?old?kem jen proto, aby t? p?ijali?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_05");	//Mus?? to ud?lat s?m.
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
	TOPIC_End_RangerHelpSLD = TRUE;
};

func void B_Cord_ComeLaterWhenDone()
{
	AI_Output(self,other,"DIA_Addon_Cord_ComeLaterWhenDone_14_00");	//Dobr?, zajdi pro to za n?m a vra? se, jakmile ti ji zad?.
	AI_StopProcessInfos(self);
};

func void B_Cord_IDoItForYou()
{
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_00");	//? ano. To je jednoduch?. Poslouchej, vra? se z?tra. To u? to budu m?t vy?e?en?.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_01");	//Jist?, ale r?d bych, kdyby si za to pro m? n?co ud?lal.
	AI_Output(other,self,"DIA_Addon_Cord_IDoItForYou_15_02");	//A co by to m?lo b?t?
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_03");	//Je tu mal? t?bor bandit? v hor?ch na jihov?chod odtud.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_04");	//P?jde? p??mo na jihov?chod odsud, m?l bys tam vid?t v??.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_05");	//Jeden z m?ch mu?? - Patrick - tam ?el p?ed n?kolika dny. Cht?l s t?mi bastardy obchodovat.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_06");	//??kal jsem mu, aby tam nechodil, ale ten blbec m? neposlouchal.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_07");	//Mo?n? jim padl za ob??. Ale nev?m to jist??
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_08");	//Zajde? tam a pod?v?? se tam kv?li m?.
	B_LogEntry(TOPIC_Addon_RangerHelpSLD,"Cord se postar? o Torlofovu zkou?ku. Cord?v kamar?d Patrick se ztratil. P?jdu do t?bora bandit? nedaleko odsud na jihov?chod? a pod?v?m se, zda-li tam Patrick nen?.");
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD,"Zapome? na to. ?kol je mnohem t잚? ne? ten Torlof?v.",B_Cord_IDoItForYou_mist);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD,"A jak si mohu b?t jist, ?e na m? neza?to??, jakmile m? uvid??",B_Cord_IDoItForYou_Dexter);
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
};

func void B_Cord_IDoItForYou_mist()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_mist_15_00");	//Zapome? na to. ?kol je mnohem t잚? ne? ten Torlof?v.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_01");	//Neboj, takov? mal? lstiv? chlap?k se jim dozajista podez?el? zd?t nebude.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_02");	//Taky to nemohu ud?lat s?m, proto?e jsem u? ?old?k a na toho by za?to?ili.
};

func void B_Cord_IDoItForYou_Dexter()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_Dexter_15_00");	//A jak si mohu b?t jist, ?e na m? neza?to??, jakmile m? uvid??
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_01");	//Proto?e zn?m jm?no jejich v?dce. Jeho jm?no je DEXTER. Prost? ?ekne?, ?e ho zn??.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_02");	//To si pak ti chl?pci dvakr?t rozmysl?, ne? na tebe za?to??.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_03");	//Samoz?ejm? to m??e b?t nebezpe?n? dobrodru?stv?.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_04");	//Ale ty to n?jak zvl?dne?.
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	B_LogEntry(TOPIC_Addon_RangerHelpSLD,"V?dce bandit? se jmenuje Dexter.");
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"?old?k Cord hled? sv?ho p??tele Patricka.");
	MIS_Addon_Cord_Look4Patrick = LOG_Running;
	Ranger_SCKnowsDexter = TRUE;
};

func void DIA_Addon_Cord_RangerHelp2GetSLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_00");	//Pomoz mi st?t se ?old?kem.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_01");	//Pod?vej. Mus?? ud?lat Torlofovu zkou?ku, jestli chce? proj?t. To je jist?.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_02");	//U? jsi o tom ?ekl Torlofovi?
	if(Torlof_Go == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_03");	//Opravdu ne.
		B_Cord_ComeLaterWhenDone();
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_04");	//?, zkou?ka.
		AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_05");	//Vid?m. A co p?esn? znamen? ten test?
		if((Torlof_ProbeBestanden == TRUE) || ((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_IsDead(Rumbold) && Npc_IsDead(Rick)) || ((MIS_Torlof_HolPachtVonSekob == LOG_Running) && ((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE) || Npc_IsDead(Sekob))))
		{
			B_Cord_RangerHelpObsolete();
		}
		else if(Torlof_Probe == 0)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_06");	//Je?t? jsem se k tomu nedostal.
			B_Cord_ComeLaterWhenDone();
		}
		else if(Torlof_Probe == Probe_Sekob)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_07");	//M?m vybrat n?jemn? od Sekoba.
			B_Cord_IDoItForYou();
		}
		else if(Torlof_Probe == Probe_Bengar)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_08");	//M?m se postarat o domobranu u Bengarovy farmy.
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
	description = "Byl jsem za t?m Dextrem.";
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
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_00");	//Byl jsem za t?m Dextrem.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_01");	//Dobr?, a?
	if(Npc_IsDead(BDT_1060_Dexter))
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_02");	//Je mrtev.
	};
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_03");	//Nicm?n? jsem nena?el ani stopu po tv?m p??teli Patrickovi.
	if(Dexter_KnowsPatrick == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_04");	//Dexter si na n?j vzpomn?l, ale ?ekl mi, ?e nenav?t?vil t?bor.
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_05");	//A jsi si jist, ?e ti Dexter nelhal?
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_06");	//Ne, to nejsem. Ale to jsou v?echny informace, kter? jsem byl schopen sehnat.
	};
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_07");	//Ten chlap prost? zmizel beze stopy.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_08");	//Dobr?, dodr?el jsi svou ??st dohody ...
	MIS_Addon_Cord_Look4Patrick = LOG_SUCCESS;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_GivePlayerXP(XP_Addon_Cord_Look4Patrick);
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_09");	//Co Torlof?v test?
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_10");	//Prost? se vra? k Torlofovi. Pova?uj test za zvl?dnut?. Jen mu ?ekni, ?e se o to postar?m.
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
	description = "Patrick se vr?til.";
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
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_00");	//Patrick se vr?til.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_01");	//?, ani jsem nev??il, ?e ho je?t? n?kdy uvid?m. Ty ...
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_02");	//Hej, ud?lej mi laskavost.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_03");	//Ano?
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_04");	//Uchra? m? sv?ho vd?ku.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_05");	//Nepl?noval jsem ti d?kovat.
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_06");	//Dob?e ... ?
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_07");	//(sm?je se) Jen jsem ti cht?l ??ct, ?e jsi stra?n? bl?zen.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_09");	//(sm?je se) Opatruj se!
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
	description = "Co bych se m?l nau?it...";
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
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//Co bych se m?l nau?it jako prvn?, boj s jednoru?n?mi, nebo obouru?n?mi zbran?mi?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//Oba dva druhy boje jsou si hodn? podobn?.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_02");	//Jakmile dos?hne? u jednoho typu zbran? dal?? ?rovn?, automaticky se to nau??? tak? i pro druh? typ zbran?.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_03");	//Jestli?e jsi nap??klad dobr? v boji s jednoru?n?mi me?i, ale jsi st?le za??te?n?k v boji s obouru?n?mi zbran?mi...
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_04");	//... tv? dovednosti s obouru?n?mi zbran?mi se zv???, i kdy? tr?nuje? s jednoru?n? zbran?.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_05");	//Pokud tr?nuje? pouze s jedn?m typem zbran?, zjist??, ?e v?cvik je mnohem v?ce vy?erp?vaj?c?.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_06");	//Pokud tr?nuje? v?dy s ob?ma typy zbran?, dos?hne? stejn?ho v?sledku s men??m ?sil?m.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//V kone?n?m d?sledku dos?hne? stejn?ho v?sledku ob?ma zp?soby - v?b?r je na tob?.
};


instance DIA_Cord_ExplainWeapons(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Cord_ExplainWeapons_Condition;
	information = DIA_Cord_ExplainWeapons_Info;
	permanent = FALSE;
	description = "Jak? jsou v?hody jednoru?n?ch a obouru?n?ch zbran??";
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
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//Jak? jsou v?hody jednoru?n?ch a obouru?n?ch zbran??
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Dobr? ot?zka. Vid?m, ?e t?hle v?ci v?nuje? dostate?nou pozornost.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//Jednoru?n? zbran? jsou rychlej??, ale trochu slab??.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Obouru?n? zbran? zp?sobuj? v?t?? po?kozen?, ale nem??e? s nimi ?to?it tak rychle.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//K ovl?d?n? obouru?n?ch zbran? tak? pot?ebuje? v?ce s?ly. To znamen? dodate?n? tr?nink.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Jedin? zp?sob, jak se st?t skute?n? dobr?m, je vlo?it do toho mnoho ?sil?.
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
	description = "Nau? m? bojovat!";
};


func int DIA_Cord_Teach_Condition()
{
	return TRUE;
};

func void B_Cord_Zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nebudu pl?tvat sv?m ?asem se za??te?n?ky.
};

func void DIA_Cord_Teach_Info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nau? m? bojovat!
	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		if(((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) && (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)) || (Cord_RangerHelp_Fight == TRUE))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_01");	//Mohu t? nau?it pou??vat jakoukoliv zbra? - kde za?neme?
			Cord_Approved = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_02");	//Mohu t? nau?it pou??vat jednoru?n? me?. Ale nejsi dost dobrej na to, abys pou??val obouru??k.
			B_Cord_Zeitverschwendung();
			Cord_Approved = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_04");	//Co se t??e jednoru?n?ch zbran?, jsi naprost? za??te?n?k! Ale tv? dovednosti v obouru?n?ch zbran?ch nejsou tak ?patn?.
			AI_Output(self,other,"DIA_Cord_Teach_14_05");	//Pokud pot?ebuje? v?ce zku?enost? s jednoru?n?mi zbran?mi, jdi si naj?t jin?ho u?itele.
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
		AI_Output(self,other,"DIA_Cord_Teach_14_06");	//J? tr?nuji pouze ?old?ky nebo vhodn? uchaze?e!
	};
};

func void DIA_Cord_Teach_Back()
{
	if((Cord_Merke_1h < other.HitChance[NPC_TALENT_1H]) || (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Jestli jsi se u? zlep?il, tak v tom pokra?uj!
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
	description = "(Boj ze ?t?tem. Po?adavek: 35% jednoru?n?ch zbran?, cena: 5 VB)";
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
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nau? m? bojovat!
	if((other.lp >= 5) && (hero.aivar[REAL_TALENT_1H] >= 35))
	{
		other.lp = other.lp - 5;
		B_TeachThiefTalent(self,other,NPC_TALENT_SHIELDD);
		SCATTY_TEACH_PERM1 = TRUE;
		PrintScreen("Nau?il ses: Boj se ?t?tem",-1,-1,FONT_Screen,3);
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
	description = "(Pokro?il? boj ze ?t?tem. Po?adavek: 65% jednoru?n?ch zbran?, cena: 10 VB)";
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
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nau? m? bojovat!
	if((other.lp >= 10) && (hero.aivar[REAL_TALENT_1H] >= 65))
	{
		other.lp = other.lp - 10;
		SCATTY_TEACH_PERM2 = TRUE;
		PrintScreen("Nau?il ses: Pokro?il? boj ze ?t?tem",-1,-1,FONT_Screen,3);
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
	description = "(Mistrovsk? boj ze ?t?tem. Po?adavek: 90% jednoru?n?ch zbran?, cena: 15 VB)";
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
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nau? m? bojovat!
	if((other.lp >= 15) && (hero.aivar[REAL_TALENT_1H] >= 90))
	{
		other.lp = other.lp - 15;
		SCATTY_TEACH_PERM3 = TRUE;
		PrintScreen("Nau?il ses: Mistrovsk? boj ze ?t?tem",-1,-1,FONT_Screen,3);
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

