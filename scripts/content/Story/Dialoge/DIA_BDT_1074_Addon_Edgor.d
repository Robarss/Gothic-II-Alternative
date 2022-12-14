
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
		AI_Output(self,other,"DIA_Addon_Edgor_EXIT_06_00");	//Pot??en?m t? zml?tit ...
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
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_01");	//Chce? v?d?t, jak to jde? ?eknu ti, jak to jde.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_02");	//Byl jsem na tohle m?sto p?ivezen n?kolika pir?ty. V bou?liv? noci. Chlape, vyzvracel jsem v?echno p?es palubu.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_03");	//Dobr?, a potom Raven zamkl d?l, proto?e n?kolik debil? bylo p??li? chtiv?ch.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_04");	//A Franco se stal velitelem lovc? a m? sklony zab?jet ka?d?ho, kdo je proti n?mu.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_05");	//Tak, ?ekl bych, ?e to jde docela ?patn?.
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
	description = "Jak se Franco stal velitelem t?hle party?";
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
	AI_Output(other,self,"DIA_Addon_Edgor_Franco_15_00");	//Jak se Franco stal velitelem tohoto t?bora?
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_01");	//To bylo velice lehk?. Zabil Fletchera, minul?ho velitele.
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_02");	//Fletcher byl dobr?. Franco, ten n?s opravdu vyt???.
};


instance DIA_Addon_Edgor_MIS2(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 4;
	condition = DIA_Addon_Edgor_MIS2_Condition;
	information = DIA_Addon_Edgor_MIS2_Info;
	permanent = FALSE;
	description = "Franco se m? zaptal na kamenn? desky. Na?el jsi je?";
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
	AI_Output(other,self,"DIA_Addon_Edgor_MIS2_15_00");	//Franco se m? zaptal na kamenn? desky. Na?el jsi je?
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_01");	//Chlape, ani jsem je nehledal. V?echno, co v?m, je, ?e to m? b?t ve star? budov? v pravo v ba?in?.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_02");	//A v??, m?j vnit?n? hlas mi ??k?, Edgore z?sta? hezky daleko od t?ch star?ch budov um?st?n?ch hluboko v ba?in?.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_03");	//Jako bych m?l riskovat sv?j zadek, kv?li tomu arogantn?mu idiotovi Francovi!
	B_LogEntry(Topic_Addon_Stoneplate,"Edgor nikdy nep?jde hledat kamenn? desky . Mysl?, ?e jsou n?kde ve star? budov? v ba?in?.");
};


instance DIA_Addon_Edgor_Weg(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 4;
	condition = DIA_Addon_Edgor_Weg_Condition;
	information = DIA_Addon_Edgor_Weg_Info;
	permanent = FALSE;
	description = "Kde ?e je ta star? budova?";
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
	AI_Output(other,self,"DIA_Addon_Edgor_Weg_15_00");	//Kde ?e je ta star? budova?
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_01");	//Vid?? tu velkou sk?lu tady? N?sleduj stezku od n? nelevo. Po chv?li se dostane? skrz dal?? sk?ly.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_02");	//Tady se mus?? d?t doleva ... nebo doprava. Chlape, nepamatuji se, u? je to n?jak? doba.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_03");	//Ruiny jsou um?st?ny na mal?m kopci, skryt? uvnit? rostlin.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_04");	//Mo?n? bude? m?t ?t?st? a nenajde? to ...
};


instance DIA_Addon_Edgor_Found(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 4;
	condition = DIA_Addon_Edgor_Found_Condition;
	information = DIA_Addon_Edgor_Found_Info;
	permanent = FALSE;
	description = "Na?el jsem kamennou desku!";
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
	AI_Output(other,self,"DIA_Addon_Edgor_Found_15_00");	//(??astn?) Na?el jsem kamennou desku!
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_01");	//(znud?n?) Opravdu. Jsi state?n? chlap.
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_02");	//(znud?n?) H?d?m, ?e t?m si mo?n? vyd?l?? propustku do t?bora. (z?v?)
};


instance DIA_Addon_Edgor_Teach(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 9;
	condition = DIA_Addon_Edgor_Teach_Condition;
	information = DIA_Addon_Edgor_Teach_Info;
	permanent = FALSE;
	description = "Je tady n?co, co by jsi m? mohl nau?it?";
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
	AI_Output(other,self,"DIA_Addon_Edgor_Teach_15_00");	//Je tady n?co, co by jsi m? mohl nau?it?
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_01");	//Zn?m p?r v?c? o krvav?ch mouch?ch. Nen?vid?m tyhle stvo?en? m?lem v?c ne? Franca!
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_02");	//Ale v?m, jak m??e? odtrhnout k??dla a ?ihadlo z jejich mrtv?ch t?l. (nepatrn? ??len?) Ano, urvat ...
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_03");	//K tomu v?m jak z?skat extrakt z jejich ?ihadel.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_04");	//M??u t? to nau?it v?echno, pokud chce?.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_05");	//ne zadarmo samoz?ejm? ...
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher,"Edgor toho hodn? v? o krvav?ch mouch?ch a jejich trofej?ch.");
	Edgor_Teach = TRUE;
};

func void B_Edgor_NotEnoughGold()
{
	AI_Output(self,other,"DIA_Addon_Edgor_NotEnoughGold_06_00");	//P?ines trochu zlata. P?ij?m?m pouze mince, ne n?jak? drobky.
};


instance DIA_Addon_Edgor_TrainStart(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 9;
	condition = DIA_Addon_Edgor_Start_Condition;
	information = DIA_Addon_Edgor_Start_Info;
	permanent = TRUE;
	description = "O krvav?ch mouch?ch ...";
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
	AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_SEKRET_15_00");	//O krvav?ch mouch?ch ...
	AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_SEKRET_06_01");	//Co chce? v?d?t?
	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
	Info_AddChoice(DIA_Addon_Edgor_TrainStart,Dialog_Back,DIA_Addon_Edgor_TrainStart_BACK);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Edgor_TrainStart,"Vyndat ?ihadlo. (Stoj?: 1 LP, 100 Zlata)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Edgor_TrainStart,"Utrhnout k??dla. (Stoj?: 1 LP, 100 Zlata)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if(Knows_Bloodfly == FALSE)
	{
		Info_AddChoice(DIA_Addon_Edgor_TrainStart,"Z?skat sekret z ?ihadla (Stoj?: 1 LP, 100 Zlata)",DIA_Addon_Edgor_TrainStart_GIFT);
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
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Sting_15_00");	//Jak m??u vyjmout ?ihadlo?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_01");	//Zakru? j?m a usekni ho ?iroce rozev?en?. Te? rozsekni maso okolo ocasn? ??sti.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_02");	//Te? m??e? lehce vyndat ?ihadlo.
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
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Wing_15_00");	//Jak? je nejlep?? cesta k vyjmut? k??del?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Wing_06_01");	//Lehk?. Vezmi k??dlo jednou rukou a usekni horn? ??st k??e skrz ostatn?.
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
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_GIFT_15_00");	//Jak m??u z?skat sekret krvav?ch much?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_01");	//Usekni horn? vrstvu otev?en?ho ?ihadla - m?l by jsi vid?t l??iv? sekret vykap?vaj?c? ven.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_02");	//Nen? ??dn? risk v pit? nebo pou??van? toho sekretu na lektvary.
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

