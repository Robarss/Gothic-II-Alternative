
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
	AI_Output(self,other,"DIA_Harad_Hallo_12_00");	//(nevrle) Co chceš?
};


instance DIA_Harad_Arbeit(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Arbeit_Condition;
	information = DIA_Harad_Arbeit_Info;
	permanent = FALSE;
	description = "Hledám práci!";
};


func int DIA_Harad_Arbeit_Condition()
{
	return TRUE;
};

func void DIA_Harad_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Harad_Arbeit_15_00");	//Hledám práci!
	AI_Output(self,other,"DIA_Harad_Arbeit_12_01");	//Hm - hodil by se mi nový učedník.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_02");	//Brian brzy dokončí své učení a potom opustí město.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_03");	//Umíš něco?
	AI_Output(other,self,"DIA_Harad_Arbeit_15_04");	//Jestli máš na mysli kovářství...
	AI_Output(self,other,"DIA_Harad_Arbeit_12_05");	//Ne, to jsem zrovna nemyslel.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_06");	//Dřív nebo později skřeti celé tohle město obklíčí a pak budou něco platní pouze ti, kteří je dokáží ubránit.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Harad_Arbeit_12_07");	//A já si do učení nevezmu žádného budižkničemu, který při první známce potíží uteče z města se ženami a ostatními poseroutky, místo aby zůstal tady a bránil pevnost.
	};
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Pokud se mi podaří přesvědčit Harada, že nejsem žádný budižkničemu, přijme mě za svého učně.");
};


instance DIA_Harad_Taugenichts(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Taugenichts_Condition;
	information = DIA_Harad_Taugenichts_Info;
	permanent = FALSE;
	description = "Já nejsem žádný budižkničemu!";
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
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_00");	//Já nejsem žádný budižkničemu!
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_01");	//To jsou silná slova! Můžeš to ale podložit i nějakými skutky?
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_02");	//A to jakými?
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_03");	//Přines mi nějakou skřetí zbraň.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_04");	//Skřeti už byli zpozorováni přímo u města, takže s trochou štěstí nebudeš hledat dlouho.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_05");	//Jestli se ti povede nějakého skolit, pak tě přijmu do učení.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_06");	//Pokud s tím tedy budou souhlasit i ostatní mistři.
	MIS_Harad_Orc = LOG_Running;
	Log_CreateTopic(TOPIC_HaradOrk,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaradOrk,LOG_Running);
	B_LogEntry(TOPIC_HaradOrk,"Za městem se usadil skřet, kterého mám na prosbu kováře Harada zabít. Jako důkaz mu postačí jakákoliv skřetí zbraň.");
};


instance DIA_Harad_OrcRunning(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcRunning_Condition;
	information = DIA_Harad_OrcRunning_Info;
	permanent = FALSE;
	description = "Promluvme si ještě o té skřetí věci...";
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
	AI_Output(other,self,"DIA_Harad_OrcRunning_15_00");	//Promluvme si ještě o té skřetí věci...
	AI_Output(self,other,"DIA_Harad_OrcRunning_12_01");	//(stroze) Co?
	Info_ClearChoices(DIA_Harad_OrcRunning);
	Info_AddChoice(DIA_Harad_OrcRunning,"Tvůj skřet už je teď mrtvý!",DIA_Harad_OrcRunning_Done);
	Info_AddChoice(DIA_Harad_OrcRunning,"Skřet je zatraceně tuhý protivník...",DIA_Harad_OrcRunning_TooHard);
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_00");	//Ale skřet je zatraceně tuhý protivník.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_01");	//Hm - jak tak na tebe koukám, možná máš pravdu. Jsi fakt docela vyžle, ale to se může změnit.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_02");	//Stejně mi musíš dokázat, že se nebojíš bojovat.
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_03");	//Takže by to mohlo být něco menšího?
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_04");	//Hm - (přemýšlí) Hakon, co na tržišti obchoduje se zbraněmi, se mi svěřil, že ho před pár dny přepadli banditi.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_05");	//Prý se potulují někde za jižní branou.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_06");	//Ti zbabělí lupiči nejspíš moc rozumu nepobrali.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_07");	//Tak je všechny pochytej - až do posledního! Tak mi dokážeš, že nám tady ve městě snad přece jen budeš něco platný.
	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	if(MIS_HakonBandits != LOG_Running)
	{
		B_LogEntry(TOPIC_Lehrling,"Harad mi řekl, že nějací bandité okradli za městem kupce Hakona. Jestli se mi je podaří dostihnout, přesvědčím ho, že za něco stojím. Měl bych si tedy promluvit s Hakonem - snad bude spíš vědět, kde se ti bandité potloukají.");
	}
	else
	{
		B_LogEntry(TOPIC_Lehrling,"Harad mi řekl, že nějací bandité okradli za městem kupce Hakona. Jestli se mi je podaří dostihnout, přesvědčím ho, že za něco stojím.");
	};
	Info_ClearChoices(DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_Done_15_00");	//Jako by ten skřet byl už teď mrtvý!
	AI_Output(self,other,"DIA_Harad_OrcRunning_Done_12_01");	//Dobře! Tak teď přestaň plýtvat dechem a koukej, ať za tebe mluví činy!
	Info_ClearChoices(DIA_Harad_OrcRunning);
};


instance DIA_Harad_OrcSuccess(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcSuccess_Condition;
	information = DIA_Harad_OrcSuccess_Info;
	permanent = FALSE;
	description = "Získal jsem tu skřetí zbraň, jak jsi chtěl.";
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
	AI_Output(other,self,"DIA_Harad_OrcSuccess_15_00");	//Získal jsem tu skřetí zbraň, jak jsi chtěl.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//Ukaž...
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
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_02");	//Tak tys to PŘECE dokázal! Tos tedy fakt dobrý!
	};
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_03");	//Takovou zbraň už jsem neměl v ruce, ani nepamatuju - naposledy, když jsem sloužil jako voják ve skřetí válce.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_04");	//To byly krušné časy, to ti povím.
	if(Player_IsApprentice == APP_Harad)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_05");	//Já věděl, že udělám dobře, když tě přijmu do učení. Skvělá práce!
	}
	else if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_06");	//Nevěřil jsem, že to zvládneš. Je to obdivuhodné.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_07");	//Škoda že ses rozhodl pro jinou dráhu.
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_08");	//Opravdu bych tu pro tebe našel uplatnění.
	};
	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP(XP_Harad_Orc);
	B_LogEntry(TOPIC_Lehrling,"Harad mě přijme jako svého učedníka, pokud s tím budou souhlasit i ostatní mistři.");
};


var int Harad_StartGuild;

instance DIA_Harad_LEHRLING(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_LEHRLING_Condition;
	information = DIA_Harad_LEHRLING_Info;
	permanent = TRUE;
	description = "Kdy můžu jako tvůj učedník začít?";
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
	AI_Output(other,self,"DIA_Harad_LEHRLING_15_00");	//Kdy můžu jako tvůj učedník začít?
	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		if(MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_01");	//Chlap, který dokáže skolit skřeta, se nám opravdu hodí.
			if(MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_02");	//Krom toho se mi Hakon pochlubil, jak statečně ses vypořádal s bandity. To tě šlechtí!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_03");	//Sice jsi nezabil žádného skřeta, ale Hakon se chlubil, jak skvěle ses vypořádal s bandity. To tě šlechtí!
		};
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_04");	//Co se mě týče, můžeš začít třeba hned.
		stimmen = stimmen + 1;
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_05");	//A co se týče ostatních mistrů...
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_06");	//Thorben ti dal své požehnání.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_07");	//Starý dobrý Thorben by byl rád, kdyby sis napřed vyprosil boží požehnání. Myslím, že to je dobrý nápad.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_08");	//Thorben prý s tebou ještě nikdy nemluvil.
		};
		if(Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_09");	//Bosper se mi to snažil vymluvit - chce tě totiž za učedníka sám.
			if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_10");	//Měl jsem s ním na tohle téma krátkou, ale ostrou diskusi.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_11");	//Nakonec souhlasil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_12");	//Požádal mě, zda bych mu nedovolil, aby ti mohl svou profesi aspoň představit.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_13");	//Takže si to omrkni - potom se můžeš vždycky rozhodnout. Tedy leda že bys nechtěl jeho hlas, samozřejmě.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_14");	//A Bosper tě zatím vůbec nezná.
		};
		if(Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_15");	//Constantinovi je jako vždycky všecko jedno. Co se jeho týče, tak prý můžeš začít, u koho chceš.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_16");	//Constantino tvrdí, žes tady ve městě spáchal nějaký zločin - je to pravda?
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_17");	//Jestli jo, tak bys to měl jít okamžitě napravit!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_18");	//Constantino o tobě ještě nikdy neslyšel.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_19");	//A Matteo hlásí, žes mu vrátil jeho zlato. Zdá se mi, že jsi opravdu čestný muž.
				stimmen = stimmen + 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_20");	//A Matteo hlásí, že mu ještě pořád něco dlužíš. Nevím, co mezi sebou máte, ale měl bys to dát rychle do pořádku.
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_21");	//A Matteo prý s tebou na tohle téma ještě vůbec nemluvil.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_22");	//A Matteo tě prý ve svém krámku ještě neviděl.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_23");	//To znamená, žes získal doporučení ode všech mistrů!
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_24");	//To znamená, žes získal doporučení od čtyř mistrů. Což pro přijetí do učení stačí.
			};
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_25");	//Chceš tedy vstoupit do učení ke mně?
			Info_ClearChoices(DIA_Harad_LEHRLING);
			Info_AddChoice(DIA_Harad_LEHRLING,"Dobře - rozmyslím si to.",DIA_Harad_LEHRLING_Later);
			Info_AddChoice(DIA_Harad_LEHRLING,"Jdu do toho!",DIA_Harad_LEHRLING_OK);
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_26");	//Potřebuješ doporučení alespoň od čtyř mistrů, jinak tě nikdo v dolní části města do učení nepřijme.
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_27");	//Měl by sis proto promluvit se všemi, které jsi ještě nepřesvědčil.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_28");	//Dokud mi nedokážeš, že nejsi úplný budižkničemu, nemáš šanci.
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00");	//Jdu do toho!
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_01");	//Výborně! A teď tě naučím, jak vykovat pěkný meč.
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//To už umím!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_03");	//No tak tím líp!
	};
	if(other.attribute[ATR_STRENGTH] < (T_MED - 30))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04");	//Krom toho bys měl taky trochu posilovat. Vždyť se mi úplně ztrácíš před očima!
	};
	Player_IsApprentice = APP_Harad;
	Npc_ExchangeRoutine(Lothar,"START");
	Harad_StartGuild = other.guild;
	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	CreateInvItems(other,ITAR_Smith,1);
	AI_PrintScreen("Oděv od Harada získán.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	B_LogEntry(Topic_Bonus,"Harad mě přijal za učedníka. Nyní mám přístup i do horní čtvrti.");
	B_LogEntry(Topic_Bonus,"Harad za dobrou cenu odkoupí zbraně, které vykovám.");
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_GivePlayerXP(XP_Lehrling);
	B_LogEntry(TOPIC_CityTeacher,"Harad mě vyučí kovářskému umění a také se s jeho pomocí mohu stát silnějším.");
	Info_ClearChoices(DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_Later_15_00");	//Dobře - rozmyslím si to.
	if(!Npc_IsDead(Brian))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_Later_12_01");	//Žádný spěch, Brian tu ještě nějakou dobu zůstane.
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
	description = "Mohu se zapsat do učení k některému z ostatních mistrů?";
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
	AI_Output(other,self,"DIA_Harad_Zustimmung_15_00");	//Mohu se zapsat do učení k některému z ostatních mistrů?
	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_01");	//Jsi dobrý člověk.
		if(MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_02");	//Hakon mi líčil, jak ses vypořádal s bandity.
		};
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_03");	//Dám ti své doporučení.
		if(DIA_Harad_Zustimmung_Permanent == FALSE)
		{
			B_GivePlayerXP(XP_Zustimmung);
			DIA_Harad_Zustimmung_Permanent = TRUE;
		};
		B_LogEntry(TOPIC_Lehrling,"Harad mě doporučí, pokud se budu chtít stát učedníkem někde jinde.");
		if(!Npc_IsDead(Brian))
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_04");	//Brian tu ještě nějakou dobu pobude. A časem jistě najdu jiného siláka, který ho zastoupí.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_05");	//Ostatní mistři ti své svolení klidně dát mohou, ale já tě nedoporučím, dokud mě nepřesvědčíš, že nejsi jenom neschopné jelito!
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
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_00");	//Takže tys vstoupil do řad domobrany? Jsem na tebe hrdý!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_01");	//Během služby v armádě nejspíš nebudeš moci zároveň plnit své učednické povinnosti. Ani to od tebe nečekám.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_02");	//Ale když budeš něco potřebovat, klidně přijď.
		Harad_MILKommentar = TRUE;
	}
	else if((other.guild == GIL_PAL) && (Harad_StartGuild != GIL_PAL) && (Harad_PALKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_03");	//Koukám, že ses dokázal dostat mezi paladiny!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_04");	//Jsem rád, že jsem tě přijal do učení. I když jsi za kovadlinou zrovna moc času nestrávil.
		Harad_PALKommentar = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Harad_StartGuild != GIL_NOV) && (Harad_StartGuild != GIL_KDF) && (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_05");	//Takže tys vstoupil do kláštera. Já osobně bych byl radši, kdybys zůstal ve městě. Potřebujeme každého muže.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_06");	//Ale když tě Innos povolal, asi to tak má být.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_07");	//Když budeš něco potřebovat, jsem ti vždycky k dispozici.
		Harad_INNOSKommentar = TRUE;
	}
	else if((Harad_Lehrling_Day <= (Wld_GetDay() - 4)) && (Harad_MILKommentar == FALSE) && (Harad_PALKommentar == FALSE) && (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_08");	//Už ses tu hezkou dobu neukázal. Kdepak ses toulal, co?
		Harad_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_09");	//Tak tě tu máme zas.
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
	description = "Prodáváš také zbraně?";
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
	AI_Output(other,self,"DIA_Harad_Waffen_15_00");	//Prodáváš také zbraně?
	AI_Output(self,other,"DIA_Harad_Waffen_12_01");	//Na to zapomeň. Všechno, co vyrobím, si berou paladinové nebo domobrana.
	AI_Output(self,other,"DIA_Harad_Add_12_00");	//Od lorda Hagena jsem dostal zakázku na 100 mečů - chce s nimi vybavit městskou stráž.
};


instance DIA_Harad_Aufgaben(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Aufgaben_Condition;
	information = DIA_Harad_Aufgaben_Info;
	permanent = FALSE;
	description = "Jaké mám jako učedník povinnosti?";
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
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_00");	//Jaké mám jako učedník povinnosti?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_01");	//Celkem tři.
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_02");	//Kovat, kovat a kovat.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_03");	//Nejsi tak hloupý, jak vypadáš. Za každý meč ti zaplatím - takže když se budeš flákat, žádné penízky se neposypou. Jak prosté.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_05");	//Krom toho tě můžu naučit, jak vyrobit prostý meč.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_06");	//Magické meče mohou vyrábět pouze zkušení kováři - a k tomu máš ještě hodně daleko.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_07");	//Jestli potřebuješ nocleh, můžeš se uložit někde v mém domě. Už je ti všechno jasné?
};


instance DIA_Harad_SellBlades(C_Info)
{
	npc = VLK_412_Harad;
	nr = 200;
	condition = DIA_Harad_SellBlades_Condition;
	information = DIA_Harad_SellBlades_Info;
	permanent = TRUE;
	description = "Chtěl bych prodat zbraně, co jsem vykoval.";
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
	AI_Output(other,self,"DIA_Harad_SellBlades_15_00");	//Chtěl bych prodat zbraně, co jsem vykoval.
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
			AI_Output(self,other,"DIA_Harad_SellBlades_12_01");	//Jedinou, kterou bych mohl přijmout, máš zrovna připnutou u pasu, a tu si radši nechej.
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_04");	//Tak nějaké vykovej! Přijímám pouze prosté meče.
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
		AI_Output(self,other,"DIA_Harad_SellBlades_12_03");	//Tak, a tady máš výplatu.
				Npc_RemoveInvItems(other,ItMw_1H_Common_01,anzahl_common);
		Npc_RemoveInvItems(other,ItMw_Schwert1,anzahl_schwert1);
		Npc_RemoveInvItems(other,ItMw_Schwert4,anzahl_schwert4);
		Npc_RemoveInvItems(other,ItMw_Rubinklinge,anzahl_rubinklinge);
		Npc_RemoveInvItems(other,ItMw_ElBastardo,anzahl_elbastardo);
		lohn = (anzahl_common * Value_Common1) + (anzahl_schwert1 * Value_Schwert1) + (anzahl_schwert4 * Value_Schwert4) + (anzahl_rubinklinge * Value_Rubinklinge) + (anzahl_elbastardo * Value_ElBastardo);
		lohn = lohn / 5;
		B_GiveInvItems(self,other,ItMi_Gold,lohn);
	};
};

func void B_Harad_TeachSmith()
{
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_01");	//Je to docela snadné, hochu. Stačí mít kousek surové oceli a podržet ji v ohni, dokud nezčervená.
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_02");	//Pak čepel na kovadlině náležitě vyklepeš.
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
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString("Nauč mě kování",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Harad_TeachSmith_Common);
	};
};


instance DIA_Harad_TeachSmith(C_Info)
{
	npc = VLK_412_Harad;
	nr = 50;
	condition = DIA_Harad_TeachSmith_Condition;
	information = DIA_Harad_TeachSmith_Info;
	permanent = TRUE;
	description = "Nauč mě vykovat prostý meč!";
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
	AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//Nauč mě vykovat prostý meč!
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
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//Napoprvé to asi nebude žádný zázrak, ale všechno ostatní se časem taky naučíš.
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
	description = "Chci se stát silnějším!";
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
	AI_Output(other,self,"DIA_Harad_TeachSTR_15_00");	//Chci se stát silnějším!
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
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_01");	//Už jsi zase o něco svalnatější.
	};
	if(other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_02");	//Vrať se, až se budeš chtít dozvědět víc.
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
	description = "Ještě pořád pracuješ pro paladiny?";
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
	AI_Output(other,self,"DIA_Harad_Add_15_01");	//Ještě pořád pracuješ pro paladiny?
	AI_Output(self,other,"DIA_Harad_Add_12_02");	//Se službou u lorda Hagena jsem už skončil.
	AI_Output(self,other,"DIA_Harad_Add_12_03");	//Teď pro něj vyrábím meče z magické rudy - ale tentokrát mi za ně platí.
	AI_Output(self,other,"DIA_Harad_Add_12_04");	//Ale aspoň teď sem tam můžu bokem vyrobit pár zbraní, které poskytnu kupcům na tržišti.
	AI_Output(self,other,"DIA_Harad_Add_12_05");	//Takže jestli hledáš dobrý meč, měl bys to zkusit u nich.
};


instance DIA_Harad_AboutErzklingen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_AboutErzklingen_Condition;
	information = DIA_Harad_AboutErzklingen_Info;
	permanent = FALSE;
	description = "Prozraď mi něco bližšího o břitech z magické rudy!";
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
	AI_Output(other,self,"DIA_Harad_Add_15_06");	//Prozraď mi něco bližšího o břitech z magické rudy!
	AI_Output(self,other,"DIA_Harad_Waffen_12_02");	//Proces výroby magických břitů je velmi složitý a drahý, ale výsledkem je čepel, která se velmi dobře ovládá a je prakticky nezničitelná.
	AI_Output(self,other,"DIA_Harad_Waffen_12_03");	//Meč je určitě velmi kvalitní, ale jeho skutečná moc se projeví teprve v rukou paladina.
	AI_Output(self,other,"DIA_Harad_Waffen_12_04");	//Paladinský meč je zasvěcený Innosovi. Výsledkem je, že takto očarovaná zbraň je neskutečně účinná!
};


instance DIA_Harad_Erzklingen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Erzklingen_Condition;
	information = DIA_Harad_Erzklingen_Info;
	permanent = TRUE;
	description = "Chci si koupit meč z magické rudy.";
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
	AI_Output(other,self,"DIA_Harad_Erzklingen_15_00");	//Chci si koupit meč z magické rudy.
	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_01");	//Magické břity prodávám pouze paladinům, a to vždy pouze jeden kus.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_02");	//Jako paladinové můžete být rádi, že můžete třímat tak skvělé zbraně.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_03");	//Dle rozkazu lorda Hagena ti mohu prodat pouze jedinou magickou zbraň.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_04");	//Takže co ti mohu nabídnout?
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"Obouruční meč (4000 zlaťáků, 100x magická ruda)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Jednoruční meč (3000 zlaťáků, 50x magická ruda )",DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void B_Harad_NotEnoughGold()
{
	AI_Output(self,other,"B_Harad_NotEnoughGold_12_00");	//Nemáš dost zlata.
};

func void B_Harad_HaveFunWithYourSword()
{
	AI_Output(self,other,"B_Harad_HaveGunWithYourSword_12_00");	//Starej se o svou novou zbraň dobře. Je cennější než všechen tvůj majetek.
	OreBladeBought = TRUE;
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void DIA_Harad_Erzklingen_2h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_2h_15_00");	//Vezmu si obouruční meč!
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
		Info_AddChoice(DIA_Harad_Erzklingen,"Obouruční meč (4000 zlaťáků,100x magická ruda)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Jednoruční meč (3000 zlaťáků, 50x magická ruda)",DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_1h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_1h_15_00");	//Vezmu si jednoruční meč!
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
		Info_AddChoice(DIA_Harad_Erzklingen,"Obouruční meč (4000 zlaťáků, 100x magická ruda)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Jednoruční meč (3000 zlaťáků, 50x magická ruda)",DIA_Harad_Erzklingen_1h);
	};
};


instance DIA_Harad_RepairNecklace(C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_RepairNecklace_Condition;
	information = DIA_Harad_RepairNecklace_Info;
	permanent = FALSE;
	description = "Umíš opravit i klenoty?";
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
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//Umíš opravit i klenoty?
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_01");	//Jsem kovář, ne zlatník. Budeš si tady ve městě muset najít někoho jiného, kdo ti pomůže.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_02");	//Lidi mají jednu kapsu prázdnou a druhou vysypanou - už hezkou dobu tady nikdo nezbohatnul.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_03");	//Většinou jsou rádi, že mají co do úst.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Harad_Goldsmith(C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_Goldsmith_Condition;
	information = DIA_Harad_Goldsmith_Info;
	permanent = FALSE;
	description = "Kde bych sehnal nějakého zlatníka?";
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
	AI_Output(other,self,"DIA_Harad_Goldsmith_15_00");	//Kde bych sehnal nějakého zlatníka?
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_01");	//Nějaký dobrý kovář se prý přidal k žoldákům na Onarově farmě.
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_02");	//Zkus se po něm poohlédnout tam.
};


instance DIA_HARAD_SELLWHAT(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = dia_harad_sellwhat_condition;
	information = dia_harad_sellwhat_info;
	permanent = FALSE;
	description = "Mohl bys my oddělat helmu na rytířské zbroji?";
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
	AI_Output(other,self,"DIA_Harad_SellWhat_15_00");	//Mohl bys my oddělat helmu na Rytířské zbroji?
	AI_Output(self,other,"DIA_Harad_SellWhat_09_01");	//Ano když budeš mít zbroj tak není problém, pro Hágenovy muže to je zdarma.
};


instance DIA_HARAD_LEATHER(C_Info)
{
	npc = VLK_412_Harad;
	nr = 650;
	condition = dia_harad_leather_condition;
	information = dia_harad_leather_info;
	permanent = TRUE;
	description = "(Paladinskou/Rytířskou zbroj bez ochrany hlavy)";
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
		AI_Output(self,other,"DIA_Harad_LEATHER_09_01");	//Hotovo tady to je. (ušklíbne se)
		CreateInvItems(other,itar_pal_helm,1);
		AI_PrintScreen("Zbroj od Harada získána.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEATHER_09_02");	//Nemužu ti upravit zbroj když jí nemáš.
	};
	AI_Output(other,self,"DIA_Harad_LEATHER_15_00");	//Uprav my Paladinskou
	if(B_GiveInvItems(other,self,ItAr_PAl_H,1))
	{
		AI_Output(self,other,"DIA_Harad_LEATHER_09_01");	//Hotovo tady to je. (ušklíbne se)
		CreateInvItems(other,itar_pal_helm2,1);
		AI_PrintScreen("Zbroj od Harada získána.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEATHER_09_02");	//Nemužu ti upravit zbroj když jí nemáš.
	};
};


instance DIA_HARAD_MELTING(C_Info)
{
	npc = VLK_412_Harad;
	nr = 650;
	condition = dia_harad_melting_condition;
	information = dia_harad_melting_info;
	permanent = TRUE;
	description = "Nauč mě tavení zbraní (cena: 10 VB)";
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
	AI_Output(other,self,"DIA_Harad_LEA_15_00");	//Nauč mě tavení zbraní.
	if(hero.lp >= 10)
	{
		hero.lp = hero.lp - 10;
		B_TeachThiefTalent(self,other,NPC_TALENT_FORGE);
		AI_Output(self,other,"DIA_Harad_LEA_12_01");	//Nejdřív je nutné rozdělat a očistit skřetí nebo rezavé zbraně a potom teprve je hodíš do výhně.
		AI_Output(self,other,"DIA_Harad_LEA_12_02");	//Ze tří rozdělaných zbraní se dá udělat jedna surová ocel a u skřetích to samé, ale musíš počkat delší dobu než se roztaví.
		AI_Output(self,other,"DIA_Harad_LEA_12_04");	//A je to, nejlepší je surová železná ruda z té se dá vyrobit mnohem víc surové ocele a to by bylo asi všechno.
		Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
		B_LogEntry(TOPIC_TalentSmith,"Harad mě naučil jak tavit skřetí a rezavé zbraně, nejprve je nutné je rozebrat a očistit a tprve potom přetavit na surovou ocel, na jednu ocel budu potřebovat 3x rozebrané staré rezavé železo.");
		KNOWS_MELTINGLER = TRUE;
		PrintScreen("Umím tavit skřetí a rezavé zbraně",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
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
	description = "Můžeš mě naučit ještě vykovat jiné meče?";
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
	AI_Output(other,self,"DIA_harad_teachii_15_00");	//Můžeš mě naučit ještě vykovat jiné meče?
	AI_Output(self,other,"DIA_harad_teachii_15_01");	//Zrovna jsi začal u mě pracovat!
	AI_Output(other,self,"DIA_harad_teachii_15_02");	//Já vím ale Mistr jako ty určitě má o trochu něco lepšího než to co jsi mě naučil.
	AI_Output(self,other,"DIA_harad_teachii_15_03");	//No když ti to tak jde tak bych ti mohl ukazat mojí specialitu.
	AI_Output(other,self,"DIA_harad_teachii_15_04");	//Děkuji mistře, co pro to můžu udělat
	AI_Output(self,other,"DIA_harad_teachii_15_05");	//Především musíš pochopit že jsou to moje specialní meče které jsem se naučil na Argaanu.
	AI_Output(self,other,"DIA_harad_teachii_15_06");	//Takže to nebude zadarmo, řekněme za 1000 až 2000 zlatých ti to prozradím ale nevykoupím je od tebe.
};


instance DIA_HARAD_NEWSMITH(C_Info)
{
	npc = VLK_412_Harad;
	nr = 66;
	condition = dia_harad_newsmith_condition;
	information = dia_harad_newsmith_info;
	permanent = TRUE;
	description = "Haraduv specilaní meč (1000 zlatých, 5VB)";
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
	AI_Output(other,self,"DIA_newsmith_15_00");	//Nauč mě vyrobit specialní jednoruční zbraň.
	if((hero.lp >= 5) && (Npc_HasItems(other,ItMi_Gold) > 1000))
	{
		hero.lp = hero.lp - 5;
		Npc_RemoveInvItems(hero,ItMi_Gold,1000);
		AI_Output(self,other,"DIA_newsmith_12_01");	//Tady už to chce trochu umění a trpělivost, podívej.
		B_LogEntry(TOPIC_TalentSmith,"Harad mě naučil kovat 'Spravedlnost' - Haradova nejlepší jednoruční obyčejnou zbraň (Potřeba 5x rozžhavenou ocel).");
		KNOWS_NEWSMITH = TRUE;
		PrintScreen("Umím vykovat meč Spravedlnost",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
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
	description = "Haraduv velký specilaní meč (2000 zlatých, 10VB)";
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
	AI_Output(other,self,"DIA_newsmith_15_00");	//Nauč mě vyrobit specialní jednoruční zbraň.
	if((hero.lp >= 10) && (Npc_HasItems(other,ItMi_Gold) > 2000))
	{
		hero.lp = hero.lp - 10;
		Npc_RemoveInvItems(hero,ItMi_Gold,2000);
		AI_Output(self,other,"DIA_newsmith_12_01");	//Tady už to chce trochu umění a trpělivost, podívej.
		B_LogEntry(TOPIC_TalentSmith,"Harad mě naučil kovat 'Mírotvůrce' - Haradova nejlepší obouruční obyčejnou zbraň (Potřeba 10x rozžhavenou ocel).");
		KNOWS_NEWSMITH2 = TRUE;
		PrintScreen("Umím vykovat meč Mírotvůrce",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
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

