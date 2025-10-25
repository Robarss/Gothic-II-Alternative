
var int Edgor_Exiteinmal;

instance DIA_Addon_Edgor_EXIT(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 999;
	condition = DIA_Addon_Edgor_EXIT_Condition;
	information = DIA_Addon_Edgor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Edgor_EXIT_Info()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_MIS2) && (Edgor_Exiteinmal == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Edgor_EXIT_06_00");	//Potěšením tě zmlátit ...
		Edgor_Exiteinmal = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Edgor_PICKPOCKET(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 900;
	condition = DIA_Addon_Edgor_PICKPOCKET_Condition;
	information = DIA_Addon_Edgor_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Edgor_PICKPOCKET_Condition()
{
	return C_Beklauen(10,7);
};

func void DIA_Addon_Edgor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Edgor_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Edgor_PICKPOCKET,Dialog_Back,DIA_Addon_Edgor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Edgor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Edgor_PICKPOCKET_DoIt);
};

func void DIA_Addon_Edgor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	B_Say(self,self,"$AWAKE");
	Info_ClearChoices(DIA_Addon_Edgor_PICKPOCKET);
};

func void DIA_Addon_Edgor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Edgor_PICKPOCKET);
};


instance DIA_Addon_Edgor_Hi(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 2;
	condition = DIA_Addon_Edgor_Hi_Condition;
	information = DIA_Addon_Edgor_Hi_Info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int DIA_Addon_Edgor_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Edgor_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Hi_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_01");	//Chceš vědět, jak to jde? Řeknu ti, jak to jde.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_02");	//Byl jsem na tohle místo přivezen několika piráty. V bouřlivé noci. Chlape, vyzvracel jsem všechno přes palubu.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_03");	//Dobrá, a potom Raven zamkl důl, protože několik debilů bylo příliš chtivých.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_04");	//A Franco se stal velitelem lovců a má sklony zabíjet každého, kdo je proti němu.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_05");	//Tak, řekl bych, že to jde docela špatně.
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_Edgor_Franco(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 2;
	condition = DIA_Addon_Edgor_Franco_Condition;
	information = DIA_Addon_Edgor_Franco_Info;
	permanent = FALSE;
	description = "Jak se Franco stal velitelem téhle party?";
};


func int DIA_Addon_Edgor_Franco_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Franco_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Franco_15_00");	//Jak se Franco stal velitelem tohoto tábora?
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_01");	//To bylo velice lehké. Zabil Fletchera, minulého velitele.
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_02");	//Fletcher byl dobrý. Franco, ten nás opravdu vytáčí.
};


instance DIA_Addon_Edgor_MIS2(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 4;
	condition = DIA_Addon_Edgor_MIS2_Condition;
	information = DIA_Addon_Edgor_MIS2_Info;
	permanent = FALSE;
	description = "Franco se mě zaptal na kamenné desky. Našel jsi je?";
};


func int DIA_Addon_Edgor_MIS2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_Hi) && (MIS_HlpEdgor == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_MIS2_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_MIS2_15_00");	//Franco se mě zaptal na kamenné desky. Našel jsi je?
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_01");	//Chlape, ani jsem je nehledal. Všechno, co vím, je, že to má být ve staré budově v pravo v bažině.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_02");	//A víš, můj vnitřní hlas mi říká, Edgore zůstaň hezky daleko od těch starých budov umístěných hluboko v bažině.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_03");	//Jako bych měl riskovat svůj zadek, kvůli tomu arogantnímu idiotovi Francovi!
	B_LogEntry(Topic_Addon_Stoneplate,"Edgor nikdy nepůjde hledat kamenné desky . Myslí, že jsou někde ve staré budově v bažině.");
};


instance DIA_Addon_Edgor_Weg(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 4;
	condition = DIA_Addon_Edgor_Weg_Condition;
	information = DIA_Addon_Edgor_Weg_Info;
	permanent = FALSE;
	description = "Kde že je ta stará budova?";
};


func int DIA_Addon_Edgor_Weg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_MIS2))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Weg_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Weg_15_00");	//Kde že je ta stará budova?
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_01");	//Vidíš tu velkou skálu tady? Následuj stezku od ní nelevo. Po chvíli se dostaneš skrz další skály.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_02");	//Tady se musíš dát doleva ... nebo doprava. Chlape, nepamatuji se, už je to nějaká doba.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_03");	//Ruiny jsou umístěny na malém kopci, skryté uvnitř rostlin.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_04");	//Možná budeš mít štěstí a nenajdeš to ...
};


instance DIA_Addon_Edgor_Found(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 4;
	condition = DIA_Addon_Edgor_Found_Condition;
	information = DIA_Addon_Edgor_Found_Info;
	permanent = FALSE;
	description = "Našel jsem kamennou desku!";
};


func int DIA_Addon_Edgor_Found_Condition()
{
	if((Npc_HasItems(other,ItMi_Addon_Stone_04) >= 1) && !Npc_IsDead(Franco) && (MIS_HlpEdgor == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Found_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Found_15_00");	//(šťastný) Našel jsem kamennou desku!
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_01");	//(znuděně) Opravdu. Jsi statečný chlap.
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_02");	//(znuděně) Hádám, že tím si možná vyděláš propustku do tábora. (zívá)
};


instance DIA_Addon_Edgor_Teach(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 9;
	condition = DIA_Addon_Edgor_Teach_Condition;
	information = DIA_Addon_Edgor_Teach_Info;
	permanent = FALSE;
	description = "Je tady něco, co by jsi mě mohl naučit?";
};


func int DIA_Addon_Edgor_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Teach_15_00");	//Je tady něco, co by jsi mě mohl naučit?
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_01");	//Znám pár věcí o krvavých mouchách. Nenávidím tyhle stvoření málem víc než Franca!
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_02");	//Ale vím, jak můžeš odtrhnout křídla a žihadlo z jejich mrtvých těl. (nepatrně šíleně) Ano, urvat ...
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_03");	//K tomu vím jak získat extrakt z jejich žihadel.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_04");	//Můžu tě to naučit všechno, pokud chceš.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_05");	//ne zadarmo samozřejmě ...
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher,"Edgor toho hodně ví o krvavých mouchách a jejich trofejích.");
	Edgor_Teach = TRUE;
};

func void B_Edgor_NotEnoughGold()
{
	AI_Output(self,other,"DIA_Addon_Edgor_NotEnoughGold_06_00");	//Přines trochu zlata. Přijímám pouze mince, ne nějaké drobky.
};


instance DIA_Addon_Edgor_TrainStart(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 9;
	condition = DIA_Addon_Edgor_Start_Condition;
	information = DIA_Addon_Edgor_Start_Info;
	permanent = TRUE;
	description = "O krvavých mouchách ...";
};


func int DIA_Addon_Edgor_Start_Condition()
{
	if(Edgor_Teach == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Start_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_SEKRET_15_00");	//O krvavých mouchách ...
	AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_SEKRET_06_01");	//Co chceš vědět?
	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
	Info_AddChoice(DIA_Addon_Edgor_TrainStart,Dialog_Back,DIA_Addon_Edgor_TrainStart_BACK);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Edgor_TrainStart,"Vyndat žihadlo. (Stojí: 1 LP, 100 Zlata)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Edgor_TrainStart,"Utrhnout křídla. (Stojí: 1 LP, 100 Zlata)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if(Knows_Bloodfly == FALSE)
	{
		Info_AddChoice(DIA_Addon_Edgor_TrainStart,"Získat sekret z žihadla (Stojí: 1 LP, 100 Zlata)",DIA_Addon_Edgor_TrainStart_GIFT);
	};
};

func void DIA_Addon_Edgor_TrainStart_BACK()
{
	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
};

func void DIA_Addon_Edgor_TrainStart_Sting()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
		{
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Sting_15_00");	//Jak můžu vyjmout žihadlo?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_01");	//Zakruť jím a usekni ho široce rozevřené. Teď rozsekni maso okolo ocasní části.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_02");	//Teď můžeš lehce vyndat žihadlo.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
};

func void DIA_Addon_Edgor_TrainStart_Wing()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
		{
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Wing_15_00");	//Jaká je nejlepší cesta k vyjmutí křídel?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Wing_06_01");	//Lehké. Vezmi křídlo jednou rukou a usekni horní část kůže skrz ostatní.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
};

func void DIA_Addon_Edgor_TrainStart_GIFT()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		if(other.lp >= 1)
		{
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_GIFT_15_00");	//Jak můžu získat sekret krvavých much?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_01");	//Usekni horní vrstvu otevřeného žihadla - měl by jsi vidět léčivý sekret vykapávající ven.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_02");	//Není žádný risk v pití nebo používaní toho sekretu na lektvary.
			other.lp = other.lp - 1;
			Knows_Bloodfly = TRUE;
			PrintScreen(PRINT_ADDON_KNOWSBF,-1,-1,FONT_Screen,2);
		}
		else
		{
			PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_Screen,2);
			B_Say(self,other,"$NOLEARNNOPOINTS");
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
};

