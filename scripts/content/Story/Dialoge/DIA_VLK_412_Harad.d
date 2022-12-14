
instance DIA_Harad_EXIT(C_Info)
{
	npc = VLK_412_Harad;
	nr = 999;
	condition = DIA_Harad_EXIT_Condition;
	information = DIA_Harad_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Harad_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Harad_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Harad_Hallo(C_Info)
{
	npc = VLK_412_Harad;
	nr = 2;
	condition = DIA_Harad_Hallo_Condition;
	information = DIA_Harad_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Harad_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Harad_Hallo_Info()
{
	AI_Output(self,other,"DIA_Harad_Hallo_12_00");	//(nevrle) Co chce??
};


instance DIA_Harad_Arbeit(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Arbeit_Condition;
	information = DIA_Harad_Arbeit_Info;
	permanent = FALSE;
	description = "Hled?m pr?ci!";
};


func int DIA_Harad_Arbeit_Condition()
{
	return TRUE;
};

func void DIA_Harad_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Harad_Arbeit_15_00");	//Hled?m pr?ci!
	AI_Output(self,other,"DIA_Harad_Arbeit_12_01");	//Hm - hodil by se mi nov? u?edn?k.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_02");	//Brian brzy dokon?? sv? u?en? a potom opust? m?sto.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_03");	//Um?? n?co?
	AI_Output(other,self,"DIA_Harad_Arbeit_15_04");	//Jestli m?? na mysli kov??stv?...
	AI_Output(self,other,"DIA_Harad_Arbeit_12_05");	//Ne, to jsem zrovna nemyslel.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_06");	//D??v nebo pozd?ji sk?eti cel? tohle m?sto obkl??? a pak budou n?co platn? pouze ti, kte?? je dok??? ubr?nit.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Harad_Arbeit_12_07");	//A j? si do u?en? nevezmu ??dn?ho budi?kni?emu, kter? p?i prvn? zn?mce pot??? ute?e z m?sta se ?enami a ostatn?mi poseroutky, m?sto aby z?stal tady a br?nil pevnost.
	};
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Pokud se mi poda?? p?esv?d?it Harada, ?e nejsem ??dn? budi?kni?emu, p?ijme m? za sv?ho u?n?.");
};


instance DIA_Harad_Taugenichts(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Taugenichts_Condition;
	information = DIA_Harad_Taugenichts_Info;
	permanent = FALSE;
	description = "J? nejsem ??dn? budi?kni?emu!";
};


func int DIA_Harad_Taugenichts_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Harad_Taugenichts_Info()
{
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_00");	//J? nejsem ??dn? budi?kni?emu!
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_01");	//To jsou siln? slova! M??e? to ale podlo?it i n?jak?mi skutky?
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_02");	//A to jak?mi?
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_03");	//P?ines mi n?jakou sk?et? zbra?.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_04");	//Sk?eti u? byli zpozorov?ni p??mo u m?sta, tak?e s trochou ?t?st? nebude? hledat dlouho.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_05");	//Jestli se ti povede n?jak?ho skolit, pak t? p?ijmu do u?en?.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_06");	//Pokud s t?m tedy budou souhlasit i ostatn? mist?i.
	MIS_Harad_Orc = LOG_Running;
	Log_CreateTopic(TOPIC_HaradOrk,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaradOrk,LOG_Running);
	B_LogEntry(TOPIC_HaradOrk,"Za m?stem se usadil sk?et, kter?ho m?m na prosbu kov??e Harada zab?t. Jako d?kaz mu posta?? jak?koliv sk?et? zbra?.");
};


instance DIA_Harad_OrcRunning(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcRunning_Condition;
	information = DIA_Harad_OrcRunning_Info;
	permanent = FALSE;
	description = "Promluvme si je?t? o t? sk?et? v?ci...";
};


func int DIA_Harad_OrcRunning_Condition()
{
	if((MIS_Harad_Orc == LOG_Running) && (Harad_HakonMission == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_OrcRunning_Info()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_15_00");	//Promluvme si je?t? o t? sk?et? v?ci...
	AI_Output(self,other,"DIA_Harad_OrcRunning_12_01");	//(stroze) Co?
	Info_ClearChoices(DIA_Harad_OrcRunning);
	Info_AddChoice(DIA_Harad_OrcRunning,"Tv?j sk?et u? je te? mrtv?!",DIA_Harad_OrcRunning_Done);
	Info_AddChoice(DIA_Harad_OrcRunning,"Sk?et je zatracen? tuh? protivn?k...",DIA_Harad_OrcRunning_TooHard);
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_00");	//Ale sk?et je zatracen? tuh? protivn?k.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_01");	//Hm - jak tak na tebe kouk?m, mo?n? m?? pravdu. Jsi fakt docela vy?le, ale to se m??e zm?nit.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_02");	//Stejn? mi mus?? dok?zat, ?e se neboj?? bojovat.
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_03");	//Tak?e by to mohlo b?t n?co men??ho?
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_04");	//Hm - (p?em??l?) Hakon, co na tr?i?ti obchoduje se zbran?mi, se mi sv??il, ?e ho p?ed p?r dny p?epadli banditi.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_05");	//Pr? se potuluj? n?kde za ji?n? branou.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_06");	//Ti zbab?l? lupi?i nejsp?? moc rozumu nepobrali.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_07");	//Tak je v?echny pochytej - a? do posledn?ho! Tak mi dok??e?, ?e n?m tady ve m?st? snad p?ece jen bude? n?co platn?.
	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	if(MIS_HakonBandits != LOG_Running)
	{
		B_LogEntry(TOPIC_Lehrling,"Harad mi ?ekl, ?e n?jac? bandit? okradli za m?stem kupce Hakona. Jestli se mi je poda?? dostihnout, p?esv?d??m ho, ?e za n?co stoj?m. M?l bych si tedy promluvit s Hakonem - snad bude sp?? v?d?t, kde se ti bandit? potloukaj?.");
	}
	else
	{
		B_LogEntry(TOPIC_Lehrling,"Harad mi ?ekl, ?e n?jac? bandit? okradli za m?stem kupce Hakona. Jestli se mi je poda?? dostihnout, p?esv?d??m ho, ?e za n?co stoj?m.");
	};
	Info_ClearChoices(DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_Done_15_00");	//Jako by ten sk?et byl u? te? mrtv?!
	AI_Output(self,other,"DIA_Harad_OrcRunning_Done_12_01");	//Dob?e! Tak te? p?esta? pl?tvat dechem a koukej, a? za tebe mluv? ?iny!
	Info_ClearChoices(DIA_Harad_OrcRunning);
};


instance DIA_Harad_OrcSuccess(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcSuccess_Condition;
	information = DIA_Harad_OrcSuccess_Info;
	permanent = FALSE;
	description = "Z?skal jsem tu sk?et? zbra?, jak jsi cht?l.";
};


func int DIA_Harad_OrcSuccess_Condition()
{
	if(MIS_Harad_Orc == LOG_Running)
	{
		if((Npc_HasItems(other,ItMw_2H_OrcAxe_01) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_02) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_03) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_04) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_01) > 0))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_OrcSuccess_Info()
{
	AI_Output(other,self,"DIA_Harad_OrcSuccess_15_00");	//Z?skal jsem tu sk?et? zbra?, jak jsi cht?l.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//Uka?...
	if(Npc_HasItems(other,ItMw_2H_OrcAxe_01) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_01,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_02) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_02,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_03) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_03,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_04) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_04,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_01,1);
	};
	if(Harad_HakonMission == TRUE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_02");	//Tak tys to P?ECE dok?zal! Tos tedy fakt dobr?!
	};
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_03");	//Takovou zbra? u? jsem nem?l v ruce, ani nepamatuju - naposledy, kdy? jsem slou?il jako voj?k ve sk?et? v?lce.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_04");	//To byly kru?n? ?asy, to ti pov?m.
	if(Player_IsApprentice == APP_Harad)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_05");	//J? v?d?l, ?e ud?l?m dob?e, kdy? t? p?ijmu do u?en?. Skv?l? pr?ce!
	}
	else if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_06");	//Nev??il jsem, ?e to zvl?dne?. Je to obdivuhodn?.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_07");	//?koda ?e ses rozhodl pro jinou dr?hu.
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_08");	//Opravdu bych tu pro tebe na?el uplatn?n?.
	};
	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP(XP_Harad_Orc);
	B_LogEntry(TOPIC_Lehrling,"Harad m? p?ijme jako sv?ho u?edn?ka, pokud s t?m budou souhlasit i ostatn? mist?i.");
};


var int Harad_StartGuild;

instance DIA_Harad_LEHRLING(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_LEHRLING_Condition;
	information = DIA_Harad_LEHRLING_Info;
	permanent = TRUE;
	description = "Kdy m??u jako tv?j u?edn?k za??t?";
};


func int DIA_Harad_LEHRLING_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_Arbeit) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Harad_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Harad_LEHRLING_15_00");	//Kdy m??u jako tv?j u?edn?k za??t?
	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		if(MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_01");	//Chlap, kter? dok??e skolit sk?eta, se n?m opravdu hod?.
			if(MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_02");	//Krom toho se mi Hakon pochlubil, jak state?n? ses vypo??dal s bandity. To t? ?lecht?!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_03");	//Sice jsi nezabil ??dn?ho sk?eta, ale Hakon se chlubil, jak skv?le ses vypo??dal s bandity. To t? ?lecht?!
		};
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_04");	//Co se m? t??e, m??e? za??t t?eba hned.
		stimmen = stimmen + 1;
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_05");	//A co se t??e ostatn?ch mistr?...
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_06");	//Thorben ti dal sv? po?ehn?n?.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_07");	//Star? dobr? Thorben by byl r?d, kdyby sis nap?ed vyprosil bo?? po?ehn?n?. Mysl?m, ?e to je dobr? n?pad.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_08");	//Thorben pr? s tebou je?t? nikdy nemluvil.
		};
		if(Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_09");	//Bosper se mi to sna?il vymluvit - chce t? toti? za u?edn?ka s?m.
			if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_10");	//M?l jsem s n?m na tohle t?ma kr?tkou, ale ostrou diskusi.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_11");	//Nakonec souhlasil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_12");	//Po??dal m?, zda bych mu nedovolil, aby ti mohl svou profesi aspo? p?edstavit.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_13");	//Tak?e si to omrkni - potom se m??e? v?dycky rozhodnout. Tedy leda ?e bys necht?l jeho hlas, samoz?ejm?.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_14");	//A Bosper t? zat?m v?bec nezn?.
		};
		if(Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_15");	//Constantinovi je jako v?dycky v?ecko jedno. Co se jeho t??e, tak pr? m??e? za??t, u koho chce?.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_16");	//Constantino tvrd?, ?es tady ve m?st? sp?chal n?jak? zlo?in - je to pravda?
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_17");	//Jestli jo, tak bys to m?l j?t okam?it? napravit!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_18");	//Constantino o tob? je?t? nikdy nesly?el.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_19");	//A Matteo hl?s?, ?es mu vr?til jeho zlato. Zd? se mi, ?e jsi opravdu ?estn? mu?.
				stimmen = stimmen + 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_20");	//A Matteo hl?s?, ?e mu je?t? po??d n?co dlu???. Nev?m, co mezi sebou m?te, ale m?l bys to d?t rychle do po??dku.
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_21");	//A Matteo pr? s tebou na tohle t?ma je?t? v?bec nemluvil.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_22");	//A Matteo t? pr? ve sv?m kr?mku je?t? nevid?l.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_23");	//To znamen?, ?es z?skal doporu?en? ode v?ech mistr?!
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_24");	//To znamen?, ?es z?skal doporu?en? od ?ty? mistr?. Co? pro p?ijet? do u?en? sta??.
			};
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_25");	//Chce? tedy vstoupit do u?en? ke mn??
			Info_ClearChoices(DIA_Harad_LEHRLING);
			Info_AddChoice(DIA_Harad_LEHRLING,"Dob?e - rozmysl?m si to.",DIA_Harad_LEHRLING_Later);
			Info_AddChoice(DIA_Harad_LEHRLING,"Jdu do toho!",DIA_Harad_LEHRLING_OK);
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_26");	//Pot?ebuje? doporu?en? alespo? od ?ty? mistr?, jinak t? nikdo v doln? ??sti m?sta do u?en? nep?ijme.
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_27");	//M?l by sis proto promluvit se v?emi, kter? jsi je?t? nep?esv?d?il.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_28");	//Dokud mi nedok??e?, ?e nejsi ?pln? budi?kni?emu, nem?? ?anci.
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00");	//Jdu do toho!
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_01");	//V?born?! A te? t? nau??m, jak vykovat p?kn? me?.
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//To u? um?m!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_03");	//No tak t?m l?p!
	};
	if(other.attribute[ATR_STRENGTH] < (T_MED - 30))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04");	//Krom toho bys m?l taky trochu posilovat. V?dy? se mi ?pln? ztr?c?? p?ed o?ima!
	};
	Player_IsApprentice = APP_Harad;
	Npc_ExchangeRoutine(Lothar,"START");
	Harad_StartGuild = other.guild;
	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	CreateInvItems(other,ITAR_Smith,1);
	AI_PrintScreen("Od?v od Harada z?sk?n.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	B_LogEntry(Topic_Bonus,"Harad m? p?ijal za u?edn?ka. Nyn? m?m p??stup i do horn? ?tvrti.");
	B_LogEntry(Topic_Bonus,"Harad za dobrou cenu odkoup? zbran?, kter? vykov?m.");
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_GivePlayerXP(XP_Lehrling);
	B_LogEntry(TOPIC_CityTeacher,"Harad m? vyu?? kov??sk?mu um?n? a tak? se s jeho pomoc? mohu st?t siln?j??m.");
	Info_ClearChoices(DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_Later_15_00");	//Dob?e - rozmysl?m si to.
	if(!Npc_IsDead(Brian))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_Later_12_01");	//??dn? sp?ch, Brian tu je?t? n?jakou dobu z?stane.
	};
	Info_ClearChoices(DIA_Harad_LEHRLING);
};


instance DIA_Harad_Zustimmung(C_Info)
{
	npc = VLK_412_Harad;
	nr = 2;
	condition = DIA_Harad_Zustimmung_Condition;
	information = DIA_Harad_Zustimmung_Info;
	permanent = TRUE;
	description = "Mohu se zapsat do u?en? k n?kter?mu z ostatn?ch mistr??";
};


func int DIA_Harad_Zustimmung_Condition()
{
	if((Player_IsApprentice == APP_NONE) && Npc_KnowsInfo(other,DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};


var int DIA_Harad_Zustimmung_Permanent;

func void DIA_Harad_Zustimmung_Info()
{
	AI_Output(other,self,"DIA_Harad_Zustimmung_15_00");	//Mohu se zapsat do u?en? k n?kter?mu z ostatn?ch mistr??
	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_01");	//Jsi dobr? ?lov?k.
		if(MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_02");	//Hakon mi l??il, jak ses vypo??dal s bandity.
		};
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_03");	//D?m ti sv? doporu?en?.
		if(DIA_Harad_Zustimmung_Permanent == FALSE)
		{
			B_GivePlayerXP(XP_Zustimmung);
			DIA_Harad_Zustimmung_Permanent = TRUE;
		};
		B_LogEntry(TOPIC_Lehrling,"Harad m? doporu??, pokud se budu cht?t st?t u?edn?kem n?kde jinde.");
		if(!Npc_IsDead(Brian))
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_04");	//Brian tu je?t? n?jakou dobu pobude. A ?asem jist? najdu jin?ho sil?ka, kter? ho zastoup?.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_05");	//Ostatn? mist?i ti sv? svolen? klidn? d?t mohou, ale j? t? nedoporu??m, dokud m? nep?esv?d???, ?e nejsi jenom neschopn? jelito!
	};
};


var int Harad_MILKommentar;
var int Harad_PALKommentar;
var int Harad_INNOSKommentar;

instance DIA_Harad_AlsLehrling(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_AlsLehrling_Condition;
	information = DIA_Harad_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Harad_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Harad) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Harad_AlsLehrling_Info()
{
	if((other.guild == GIL_MIL) && (Harad_StartGuild != GIL_MIL) && (Harad_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_00");	//Tak?e tys vstoupil do ?ad domobrany? Jsem na tebe hrd?!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_01");	//B?hem slu?by v arm?d? nejsp?? nebude? moci z?rove? plnit sv? u?ednick? povinnosti. Ani to od tebe ne?ek?m.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_02");	//Ale kdy? bude? n?co pot?ebovat, klidn? p?ij?.
		Harad_MILKommentar = TRUE;
	}
	else if((other.guild == GIL_PAL) && (Harad_StartGuild != GIL_PAL) && (Harad_PALKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_03");	//Kouk?m, ?e ses dok?zal dostat mezi paladiny!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_04");	//Jsem r?d, ?e jsem t? p?ijal do u?en?. I kdy? jsi za kovadlinou zrovna moc ?asu nestr?vil.
		Harad_PALKommentar = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Harad_StartGuild != GIL_NOV) && (Harad_StartGuild != GIL_KDF) && (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_05");	//Tak?e tys vstoupil do kl??tera. J? osobn? bych byl rad?i, kdybys z?stal ve m?st?. Pot?ebujeme ka?d?ho mu?e.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_06");	//Ale kdy? t? Innos povolal, asi to tak m? b?t.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_07");	//Kdy? bude? n?co pot?ebovat, jsem ti v?dycky k dispozici.
		Harad_INNOSKommentar = TRUE;
	}
	else if((Harad_Lehrling_Day <= (Wld_GetDay() - 4)) && (Harad_MILKommentar == FALSE) && (Harad_PALKommentar == FALSE) && (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_08");	//U? ses tu hezkou dobu neuk?zal. Kdepak ses toulal, co?
		Harad_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_09");	//Tak t? tu m?me zas.
		Harad_Lehrling_Day = Wld_GetDay();
	};
};


instance DIA_Harad_Waffen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Waffen_Condition;
	information = DIA_Harad_Waffen_Info;
	permanent = FALSE;
	description = "Prod?v?? tak? zbran??";
};


func int DIA_Harad_Waffen_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Harad_Waffen_Info()
{
	AI_Output(other,self,"DIA_Harad_Waffen_15_00");	//Prod?v?? tak? zbran??
	AI_Output(self,other,"DIA_Harad_Waffen_12_01");	//Na to zapome?. V?echno, co vyrob?m, si berou paladinov? nebo domobrana.
	AI_Output(self,other,"DIA_Harad_Add_12_00");	//Od lorda Hagena jsem dostal zak?zku na 100 me?? - chce s nimi vybavit m?stskou str??.
};


instance DIA_Harad_Aufgaben(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Aufgaben_Condition;
	information = DIA_Harad_Aufgaben_Info;
	permanent = FALSE;
	description = "Jak? m?m jako u?edn?k povinnosti?";
};


func int DIA_Harad_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_00");	//Jak? m?m jako u?edn?k povinnosti?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_01");	//Celkem t?i.
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_02");	//Kovat, kovat a kovat.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_03");	//Nejsi tak hloup?, jak vypad??. Za ka?d? me? ti zaplat?m - tak?e kdy? se bude? fl?kat, ??dn? pen?zky se neposypou. Jak prost?.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_05");	//Krom toho t? m??u nau?it, jak vyrobit prost? me?.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_06");	//Magick? me?e mohou vyr?b?t pouze zku?en? kov??i - a k tomu m?? je?t? hodn? daleko.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_07");	//Jestli pot?ebuje? nocleh, m??e? se ulo?it n?kde v m?m dom?. U? je ti v?echno jasn??
};


instance DIA_Harad_SellBlades(C_Info)
{
	npc = VLK_412_Harad;
	nr = 200;
	condition = DIA_Harad_SellBlades_Condition;
	information = DIA_Harad_SellBlades_Info;
	permanent = TRUE;
	description = "Cht?l bych prodat zbran?, co jsem vykoval.";
};


func int DIA_Harad_SellBlades_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_SellBlades_Info()
{
	var C_Item EquipWeap;
	var int anzahl_common;
	var int anzahl_schwert1;
	var int anzahl_schwert4;
	var int anzahl_rubinklinge;
	var int anzahl_elbastardo;
	var int gesamt;
	var string concatText;
	var int lohn;
	AI_Output(other,self,"DIA_Harad_SellBlades_15_00");	//Cht?l bych prodat zbran?, co jsem vykoval.
	EquipWeap = Npc_GetEquippedMeleeWeapon(other);
	anzahl_common = Npc_HasItems(other,ItMw_1H_Common_01);
	if(Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) == TRUE)
	{
		anzahl_common = anzahl_common - 1;
	};
	anzahl_schwert1 = Npc_HasItems(other,ItMw_Schwert1);
	if(Hlp_IsItem(EquipWeap,ItMw_Schwert1) == TRUE)
	{
		anzahl_schwert1 = anzahl_schwert1 - 1;
	};
	anzahl_schwert4 = Npc_HasItems(other,ItMw_Schwert4);
	if(Hlp_IsItem(EquipWeap,ItMw_Schwert4) == TRUE)
	{
		anzahl_schwert4 = anzahl_schwert4 - 1;
	};
	anzahl_rubinklinge = Npc_HasItems(other,ItMw_Rubinklinge);
	if(Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) == TRUE)
	{
		anzahl_rubinklinge = anzahl_rubinklinge - 1;
	};
	anzahl_elbastardo = Npc_HasItems(other,ItMw_ElBastardo);
	if(Hlp_IsItem(EquipWeap,ItMw_ElBastardo) == TRUE)
	{
		anzahl_elbastardo = anzahl_elbastardo - 1;
	};
	gesamt = anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo;
	if(gesamt == 0)
	{
		if((Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Schwert1) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Schwert4) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_ElBastardo) == TRUE))
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_01");	//Jedinou, kterou bych mohl p?ijmout, m?? zrovna p?ipnutou u pasu, a tu si rad?i nechej.
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_04");	//Tak n?jak? vykovej! P?ij?m?m pouze prost? me?e.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SellBlades_12_02");	//Prima - dej to sem.
		Npc_RemoveInvItems(other,ItMw_1H_Common_01,anzahl_common);
		Npc_RemoveInvItems(other,ItMw_Schwert1,anzahl_schwert1);
		Npc_RemoveInvItems(other,ItMw_Schwert4,anzahl_schwert4);
		Npc_RemoveInvItems(other,ItMw_Rubinklinge,anzahl_rubinklinge);
		Npc_RemoveInvItems(other,ItMw_ElBastardo,anzahl_elbastardo);
		concatText = ConcatStrings(IntToString(gesamt),PRINT_ItemsGegeben);
		AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		AI_Output(self,other,"DIA_Harad_SellBlades_12_03");	//Tak, a tady m?? v?platu.
		lohn = (anzahl_common * Value_Common1) + (anzahl_schwert1 * Value_Schwert1) + (anzahl_schwert4 * Value_Schwert4) + (anzahl_rubinklinge * Value_Rubinklinge) + (anzahl_elbastardo * Value_ElBastardo);
		lohn = lohn / 5;
		B_GiveInvItems(self,other,ItMi_Gold,lohn);
	};
};

func void B_Harad_TeachSmith()
{
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_01");	//Je to docela snadn?, hochu. Sta?? m?t kousek surov? oceli a podr?et ji v ohni, dokud nez?erven?.
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_02");	//Pak ?epel na kovadlin? n?le?it? vyklepe?.
};

func void B_HaradSmithChoices()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
	Info_AddChoice(DIA_Harad_TeachSmith,Dialog_Back,DIA_Harad_TeachSmith_BACK);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString(NAME_Addon_Harad_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_04)),DIA_Harad_TeachSmith_Harad04);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString(NAME_Addon_Harad_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_03)),DIA_Harad_TeachSmith_Harad03);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString(NAME_Addon_Harad_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_02)),DIA_Harad_TeachSmith_Harad02);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString(NAME_Addon_Harad_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_01)),DIA_Harad_TeachSmith_Harad01);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString("Nau? m? kov?n?",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Harad_TeachSmith_Common);
	};
};


instance DIA_Harad_TeachSmith(C_Info)
{
	npc = VLK_412_Harad;
	nr = 50;
	condition = DIA_Harad_TeachSmith_Condition;
	information = DIA_Harad_TeachSmith_Info;
	permanent = TRUE;
	description = "Nau? m? vykovat prost? me?!";
};


func int DIA_Harad_TeachSmith_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_TeachSmith_Info()
{
	AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//Nau? m? vykovat prost? me?!
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_BACK()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
};

func void DIA_Harad_TeachSmith_Common()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		B_Harad_TeachSmith();
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//Napoprv? to asi nebude ??dn? z?zrak, ale v?echno ostatn? se ?asem taky nau???.
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad01()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_01))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad02()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_02))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad03()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_03))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad04()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_04))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};


var int Harad_Merke_STR;

instance DIA_Harad_TeachSTR(C_Info)
{
	npc = VLK_412_Harad;
	nr = 100;
	condition = DIA_Harad_TeachSTR_Condition;
	information = DIA_Harad_TeachSTR_Info;
	permanent = 1;
	description = "Chci se st?t siln?j??m!";
};


func int DIA_Harad_TeachSTR_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_TeachSTR_Info()
{
	AI_Output(other,self,"DIA_Harad_TeachSTR_15_00");	//Chci se st?t siln?j??m!
	Harad_Merke_STR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_BACK()
{
	if(Harad_Merke_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_01");	//U? jsi zase o n?co svalnat?j??.
	};
	if(other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_02");	//Vra? se, a? se bude? cht?t dozv?d?t v?c.
	};
	Info_ClearChoices(DIA_Harad_TeachSTR);
};

func void DIA_Harad_TeachSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};


instance DIA_Harad_ImmerNoch(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_ImmerNoch_Condition;
	information = DIA_Harad_ImmerNoch_Info;
	permanent = FALSE;
	description = "Je?t? po??d pracuje? pro paladiny?";
};


func int DIA_Harad_ImmerNoch_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Harad_ImmerNoch_Info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_01");	//Je?t? po??d pracuje? pro paladiny?
	AI_Output(self,other,"DIA_Harad_Add_12_02");	//Se slu?bou u lorda Hagena jsem u? skon?il.
	AI_Output(self,other,"DIA_Harad_Add_12_03");	//Te? pro n?j vyr?b?m me?e z magick? rudy - ale tentokr?t mi za n? plat?.
	AI_Output(self,other,"DIA_Harad_Add_12_04");	//Ale aspo? te? sem tam m??u bokem vyrobit p?r zbran?, kter? poskytnu kupc?m na tr?i?ti.
	AI_Output(self,other,"DIA_Harad_Add_12_05");	//Tak?e jestli hled?? dobr? me?, m?l bys to zkusit u nich.
};


instance DIA_Harad_AboutErzklingen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_AboutErzklingen_Condition;
	information = DIA_Harad_AboutErzklingen_Info;
	permanent = FALSE;
	description = "Prozra? mi n?co bli???ho o b?itech z magick? rudy!";
};


func int DIA_Harad_AboutErzklingen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_ImmerNoch))
	{
		return TRUE;
	};
};

func void DIA_Harad_AboutErzklingen_Info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_06");	//Prozra? mi n?co bli???ho o b?itech z magick? rudy!
	AI_Output(self,other,"DIA_Harad_Waffen_12_02");	//Proces v?roby magick?ch b?it? je velmi slo?it? a drah?, ale v?sledkem je ?epel, kter? se velmi dob?e ovl?d? a je prakticky nezni?iteln?.
	AI_Output(self,other,"DIA_Harad_Waffen_12_03");	//Me? je ur?it? velmi kvalitn?, ale jeho skute?n? moc se projev? teprve v rukou paladina.
	AI_Output(self,other,"DIA_Harad_Waffen_12_04");	//Paladinsk? me? je zasv?cen? Innosovi. V?sledkem je, ?e takto o?arovan? zbra? je neskute?n? ??inn?!
};


instance DIA_Harad_Erzklingen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Erzklingen_Condition;
	information = DIA_Harad_Erzklingen_Info;
	permanent = TRUE;
	description = "Chci si koupit me? z magick? rudy.";
};


func int DIA_Harad_Erzklingen_Condition()
{
	if((OreBladeBought == FALSE) && Npc_KnowsInfo(other,DIA_Harad_AboutErzklingen))
	{
		return TRUE;
	};
};


var int OreBladeBought;

func void DIA_Harad_Erzklingen_Info()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_15_00");	//Chci si koupit me? z magick? rudy.
	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_01");	//Magick? b?ity prod?v?m pouze paladin?m, a to v?dy pouze jeden kus.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_02");	//Jako paladinov? m??ete b?t r?di, ?e m??ete t??mat tak skv?l? zbran?.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_03");	//Dle rozkazu lorda Hagena ti mohu prodat pouze jedinou magickou zbra?.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_04");	//Tak?e co ti mohu nab?dnout?
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"Obouru?n? me? (4000 zla??k?, 100x magick? ruda)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Jednoru?n? me? (3000 zla??k?, 50x magick? ruda )",DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void B_Harad_NotEnoughGold()
{
	AI_Output(self,other,"B_Harad_NotEnoughGold_12_00");	//Nem?? dost zlata.
};

func void B_Harad_HaveFunWithYourSword()
{
	AI_Output(self,other,"B_Harad_HaveGunWithYourSword_12_00");	//Starej se o svou novou zbra? dob?e. Je cenn?j?? ne? v?echen tv?j majetek.
	OreBladeBought = TRUE;
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void DIA_Harad_Erzklingen_2h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_2h_15_00");	//Vezmu si obouru?n? me?!
	if((Npc_HasItems(other,ItMi_Gold) >= Value_Blessed_2H_1) && (Npc_HasItems(other,ItMi_Nugget) >= 100))
	{
		B_GiveInvItems(other,self,ItMi_Gold,Value_Blessed_2H_1);
		B_GiveInvItems(other,self,ItMi_Nugget,100);
		CreateInvItems(self,ItMw_2H_Blessed_01,1);
		B_GiveInvItems(self,other,ItMw_2H_Blessed_01,1);
		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"Obouru?n? me? (4000 zla??k?,100x magick? ruda)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Jednoru?n? me? (3000 zla??k?, 50x magick? ruda)",DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_1h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_1h_15_00");	//Vezmu si jednoru?n? me?!
	if((Npc_HasItems(other,ItMi_Gold) >= Value_Blessed_1H_1) && (Npc_HasItems(other,ItMi_Nugget) >= 50))
	{
		B_GiveInvItems(other,self,ItMi_Gold,Value_Blessed_1H_1);
		B_GiveInvItems(other,self,ItMi_Nugget,50);
		CreateInvItems(self,ItMw_1H_Blessed_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Blessed_01,1);
		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"Obouru?n? me? (4000 zla??k?, 100x magick? ruda)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Jednoru?n? me? (3000 zla??k?, 50x magick? ruda)",DIA_Harad_Erzklingen_1h);
	};
};


instance DIA_Harad_RepairNecklace(C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_RepairNecklace_Condition;
	information = DIA_Harad_RepairNecklace_Info;
	permanent = FALSE;
	description = "Um?? opravit i klenoty?";
};


func int DIA_Harad_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Harad_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//Um?? opravit i klenoty?
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_01");	//Jsem kov??, ne zlatn?k. Bude? si tady ve m?st? muset naj?t n?koho jin?ho, kdo ti pom??e.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_02");	//Lidi maj? jednu kapsu pr?zdnou a druhou vysypanou - u? hezkou dobu tady nikdo nezbohatnul.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_03");	//V?t?inou jsou r?di, ?e maj? co do ?st.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Harad_Goldsmith(C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_Goldsmith_Condition;
	information = DIA_Harad_Goldsmith_Info;
	permanent = FALSE;
	description = "Kde bych sehnal n?jak?ho zlatn?ka?";
};


func int DIA_Harad_Goldsmith_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_RepairNecklace))
	{
		return TRUE;
	};
};

func void DIA_Harad_Goldsmith_Info()
{
	AI_Output(other,self,"DIA_Harad_Goldsmith_15_00");	//Kde bych sehnal n?jak?ho zlatn?ka?
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_01");	//N?jak? dobr? kov?? se pr? p?idal k ?old?k?m na Onarov? farm?.
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_02");	//Zkus se po n?m poohl?dnout tam.
};


instance DIA_HARAD_SELLWHAT(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = dia_harad_sellwhat_condition;
	information = dia_harad_sellwhat_info;
	permanent = FALSE;
	description = "Mohl bys my odd?lat helmu na ryt??sk? zbroji?";
};


func int dia_harad_sellwhat_condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_harad_sellwhat_info()
{
	AI_Output(other,self,"DIA_Harad_SellWhat_15_00");	//Mohl bys my odd?lat helmu na Ryt??sk? zbroji?
	AI_Output(self,other,"DIA_Harad_SellWhat_09_01");	//Ano kdy? bude? m?t zbroj tak nen? probl?m, pro H?genovy mu?e to je zdarma.
};


instance DIA_HARAD_LEATHER(C_Info)
{
	npc = VLK_412_Harad;
	nr = 650;
	condition = dia_harad_leather_condition;
	information = dia_harad_leather_info;
	permanent = TRUE;
	description = "(Paladinskou/Ryt??skou zbroj bez ochrany hlavy)";
};


func int dia_harad_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_sellwhat) && (other.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_harad_leather_info()
{
	AI_Output(other,self,"DIA_Harad_LEATHER_15_00");	//Uprav my Paladinskou
	if(B_GiveInvItems(other,self,ItAr_PAL_M,1))
	{
		AI_Output(self,other,"DIA_Harad_LEATHER_09_01");	//Hotovo tady to je. (u?kl?bne se)
		CreateInvItems(other,itar_pal_helm,1);
		AI_PrintScreen("Zbroj od Harada z?sk?na.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEATHER_09_02");	//Nemu?u ti upravit zbroj kdy? j? nem??.
	};
	AI_Output(other,self,"DIA_Harad_LEATHER_15_00");	//Uprav my Paladinskou
	if(B_GiveInvItems(other,self,ItAr_PAl_H,1))
	{
		AI_Output(self,other,"DIA_Harad_LEATHER_09_01");	//Hotovo tady to je. (u?kl?bne se)
		CreateInvItems(other,itar_pal_helm2,1);
		AI_PrintScreen("Zbroj od Harada z?sk?na.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEATHER_09_02");	//Nemu?u ti upravit zbroj kdy? j? nem??.
	};
};


instance DIA_HARAD_MELTING(C_Info)
{
	npc = VLK_412_Harad;
	nr = 650;
	condition = dia_harad_melting_condition;
	information = dia_harad_melting_info;
	permanent = TRUE;
	description = "Nau? m? taven? zbran? (cena: 10 VB)";
};


func int dia_harad_melting_condition()
{
	if((Player_IsApprentice == APP_Harad) && (KNOWS_MELTINGLER == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	{
		return TRUE;
	};
};

func void dia_harad_melting_info()
{
	AI_Output(other,self,"DIA_Harad_LEA_15_00");	//Nau? m? taven? zbran?.
	if(hero.lp >= 10)
	{
		hero.lp = hero.lp - 10;
		B_TeachThiefTalent(self,other,NPC_TALENT_FORGE);
		AI_Output(self,other,"DIA_Harad_LEA_12_01");	//Nejd??v je nutn? rozd?lat a o?istit sk?et? nebo rezav? zbran? a potom teprve je hod?? do v?hn?.
		AI_Output(self,other,"DIA_Harad_LEA_12_02");	//Ze t?? rozd?lan?ch zbran? se d? ud?lat jedna surov? ocel a u sk?et?ch to sam?, ale mus?? po?kat del?? dobu ne? se roztav?.
		AI_Output(self,other,"DIA_Harad_LEA_12_04");	//A je to, nejlep?? je surov? ?elezn? ruda z t? se d? vyrobit mnohem v?c surov? ocele a to by bylo asi v?echno.
		Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
		B_LogEntry(TOPIC_TalentSmith,"Harad m? nau?il jak tavit sk?et? a rezav? zbran?, nejprve je nutn? je rozebrat a o?istit a tprve potom p?etavit na surovou ocel, na jednu ocel budu pot?ebovat 3x rozebran? star? rezav? ?elezo.");
		KNOWS_MELTINGLER = TRUE;
		PrintScreen("Um?m tavit sk?et? a rezav? zbran?",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek v?domostn?ch bod?!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_HARAD_TEACHII(C_Info)
{
	npc = VLK_412_Harad;
	nr = 65;
	condition = dia_harad_teachii_condition;
	information = dia_harad_teachii_info;
	permanent = 0;
	description = "M??e? m? nau?it je?t? vykovat jin? me?e?";
};


func int dia_harad_teachii_condition()
{
	if((Player_IsApprentice == APP_Harad) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == TRUE))
	{
		return TRUE;
	};
};

func void dia_harad_teachii_info()
{
	AI_Output(other,self,"DIA_harad_teachii_15_00");	//M??e? m? nau?it je?t? vykovat jin? me?e?
	AI_Output(self,other,"DIA_harad_teachii_15_01");	//Zrovna jsi za?al u m? pracovat!
	AI_Output(other,self,"DIA_harad_teachii_15_02");	//J? v?m ale Mistr jako ty ur?it? m? o trochu n?co lep??ho ne? to co jsi m? nau?il.
	AI_Output(self,other,"DIA_harad_teachii_15_03");	//No kdy? ti to tak jde tak bych ti mohl ukazat moj? specialitu.
	AI_Output(other,self,"DIA_harad_teachii_15_04");	//D?kuji mist?e, co pro to m??u ud?lat
	AI_Output(self,other,"DIA_harad_teachii_15_05");	//P?edev??m mus?? pochopit ?e jsou to moje specialn? me?e kter? jsem se nau?il na Argaanu.
	AI_Output(self,other,"DIA_harad_teachii_15_06");	//Tak?e to nebude zadarmo, ?ekn?me za 1000 a? 2000 zlat?ch ti to prozrad?m ale nevykoup?m je od tebe.
};


instance DIA_HARAD_NEWSMITH(C_Info)
{
	npc = VLK_412_Harad;
	nr = 66;
	condition = dia_harad_newsmith_condition;
	information = dia_harad_newsmith_info;
	permanent = TRUE;
	description = "Haraduv specilan? me? (1000 zlat?ch, 5VB)";
};


func int dia_harad_newsmith_condition()
{
	if(Npc_KnowsInfo(hero,dia_harad_teachii) && (Player_IsApprentice == APP_Harad) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == TRUE) && (KNOWS_NEWSMITH == FALSE))
	{
		return TRUE;
	};
};

func void dia_harad_newsmith_info()
{
	AI_Output(other,self,"DIA_newsmith_15_00");	//Nau? m? vyrobit specialn? jednoru?n? zbra?.
	if((hero.lp >= 5) && (Npc_HasItems(other,ItMi_Gold) > 1000))
	{
		hero.lp = hero.lp - 5;
		Npc_RemoveInvItems(hero,ItMi_Gold,1000);
		AI_Output(self,other,"DIA_newsmith_12_01");	//Tady u? to chce trochu um?n? a trp?livost, pod?vej.
		B_LogEntry(TOPIC_TalentSmith,"Harad m? nau?il kovat 'Spravedlnost' - Haradova nejlep?? jednoru?n? oby?ejnou zbra? (Pot?eba 5x roz?havenou ocel).");
		KNOWS_NEWSMITH = TRUE;
		PrintScreen("Um?m vykovat me? Spravedlnost",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek v?domostn?ch bod?!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_HARAD_NEWSMITH2(C_Info)
{
	npc = VLK_412_Harad;
	nr = 66;
	condition = dia_harad_newsmith2_condition;
	information = dia_harad_newsmith2_info;
	permanent = TRUE;
	description = "Haraduv velk? specilan? me? (2000 zlat?ch, 10VB)";
};


func int dia_harad_newsmith2_condition()
{
	if(Npc_KnowsInfo(hero,dia_harad_teachii) && (Player_IsApprentice == APP_Harad) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == TRUE) && (KNOWS_NEWSMITH2 == FALSE))
	{
		return TRUE;
	};
};

func void dia_harad_newsmith2_info()
{
	AI_Output(other,self,"DIA_newsmith_15_00");	//Nau? m? vyrobit specialn? jednoru?n? zbra?.
	if((hero.lp >= 10) && (Npc_HasItems(other,ItMi_Gold) > 2000))
	{
		hero.lp = hero.lp - 10;
		Npc_RemoveInvItems(hero,ItMi_Gold,2000);
		AI_Output(self,other,"DIA_newsmith_12_01");	//Tady u? to chce trochu um?n? a trp?livost, pod?vej.
		B_LogEntry(TOPIC_TalentSmith,"Harad m? nau?il kovat 'M?rotv?rce' - Haradova nejlep?? obouru?n? oby?ejnou zbra? (Pot?eba 10x roz?havenou ocel).");
		KNOWS_NEWSMITH2 = TRUE;
		PrintScreen("Um?m vykovat me? M?rotv?rce",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek v?domostn?ch bod?!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Harad_PICKPOCKET(C_Info)
{
	npc = VLK_412_Harad;
	nr = 900;
	condition = DIA_Harad_PICKPOCKET_Condition;
	information = DIA_Harad_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Harad_PICKPOCKET_Condition()
{
	return C_Beklauen(14,35);
};

func void DIA_Harad_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
	Info_AddChoice(DIA_Harad_PICKPOCKET,Dialog_Back,DIA_Harad_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Harad_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Harad_PICKPOCKET_DoIt);
};

func void DIA_Harad_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};

func void DIA_Harad_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};

