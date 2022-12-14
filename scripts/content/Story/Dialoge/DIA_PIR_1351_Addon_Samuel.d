
instance DIA_Addon_Samuel_EXIT(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 999;
	condition = DIA_Addon_Samuel_EXIT_Condition;
	information = DIA_Addon_Samuel_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Samuel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Samuel_Hello(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 1;
	condition = DIA_Addon_Samuel_Hello_Condition;
	information = DIA_Addon_Samuel_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Samuel_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_00");	//Ah, nov? tv??!
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_01");	//Chce? rum - anebo n?co siln?j??ho?
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};


instance DIA_Addon_Samuel_Francis(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 2;
	condition = DIA_Addon_Samuel_Francis_Condition;
	information = DIA_Addon_Samuel_Francis_Info;
	description = "Chci si s tebou promluvit o Francisovi.";
};


func int DIA_Addon_Samuel_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Samuel_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_00");	//Chci si s tebou promluvit o Francisovi.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_01");	//Neza??nej o tom r?doby-kapit?novi!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_02");	//Cel? den vysed?v? na lavi?ce a c?t? se d?le?it?!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_03");	//V?echny zaj?ma, kter?mu ?ertu jsem dlu?ni, ?e kapit?n vybral zrovna jeho!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_04");	//Co chce? od toho mal?ho nafoukance?
};


instance DIA_Addon_Samuel_Versteck(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 3;
	condition = DIA_Addon_Samuel_Versteck_Condition;
	information = DIA_Addon_Samuel_Versteck_Info;
	description = "Pot?ebuji se dostat do Gregovy chatr?e.";
};


func int DIA_Addon_Samuel_Versteck_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Samuel_Francis) && (Francis_ausgeschissen == FALSE) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Versteck_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_02");	//Pot?ebuji se dostat do Gregovy chatr?e.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_05");	//(?ibalsky) Jo? Pro??
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_01");	//Pot?ebuji zbroj bandit?.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_06");	//(sm?ch) Francis t? nikdy dobrovoln? do chatr?e nepust?, aby sis mohl ?lohnout Gregovy v?ci.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_07");	//Jedin?, ?e by ...
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_03");	//Ano?
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_08");	//... jsi m?l n?co, co skute?n? shan?.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_09");	//V?m, ?e Francis n?co ukr?v? v opu?t?n?m dole v ka?onu.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_10");	//M?li jsme jednou spolu str??. Usnul a mluvil o tom ze span?.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_11");	//Nem?m pon?t?, co tam zahrabal, ale pokud je to dostate?n? d?le?it?, pak t? dovnit? pust? ...
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_12");	//A? se kapit?n vr?t? a zjist?, ?e jeho v?ci chyb?, d? Francisovi v?c ne? po??dnej v?prask.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Samuel mi ?ekl o tajn? Francisov? skr??i v jednom dolu v ka?onu. Mo?n? najdu n?co, co mi pom??e dostat se do chatr?e.");
};


var int Samuel_Knows_LousHammer;
var int Samuel_Knows_SchlafHammer;

instance DIA_Addon_Samuel_Recipe(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 4;
	condition = DIA_Addon_Samuel_Recipe_Condition;
	information = DIA_Addon_Samuel_Recipe_Info;
	permanent = TRUE;
	description = "M?m pro tebe recept!";
};


func int DIA_Addon_Samuel_Recipe_Condition()
{
	if(((Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept) > 0)) || ((Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept2) > 0)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Recipe_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_15_00");	//M?m pro tebe recept!
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_14_01");	//Oh, nech m? pod?vat, co za recept to je?
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);
	if((Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept) > 0))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe,"Louovo Kladivo",DIA_Addon_Samuel_Recipe_LousHammer);
	};
	if((Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept2) > 0))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe,"Louovo dvojit? kladivo",DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};

func void DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);
};

func void DIA_Addon_Samuel_Recipe_LousHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousHammer_15_00");	//Je to od Snafa.
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04");	//Zn? to ?pln? hrozn?. Hned to jdu zkusit.
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};

func void DIA_Addon_Samuel_Recipe_LousDoubleHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00");	//Je to skute?nej zabij?k, dej si pozor!
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept2,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04");	//Za??n?m se b?t. Mysl?m, ?e to i tak vyzkou??m.
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_SchlafHammer = TRUE;
};


var int Samuel_Grog_Varianz;

instance DIA_Addon_Samuel_Grog(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 5;
	condition = DIA_Addon_Samuel_Grog_Condition;
	information = DIA_Addon_Samuel_Grog_Info;
	permanent = TRUE;
	description = "Chci si vz?t sv?j pod?l grogu. (10 zlata)";
};


func int DIA_Addon_Samuel_Grog_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Grog_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Grog_15_00");	//Chci si vz?t sv?j pod?l grogu.
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		if(Samuel_Grog_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_01");	//Vy mlad?ci nepohnete ani prstem bez grogu co? A to je spr?vn?.
			Samuel_Grog_Varianz = 1;
		}
		else if(Samuel_Grog_Varianz == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_02");	//Douf?m, ?e to je p?ijateln?. Nem?m dostatek ?ist? vody. Ale trochu slan? tomu neubl???, ne?
			Samuel_Grog_Varianz = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_03");	//M??e? m?t tolik grogu, kolik chce?.
		};
		B_GiveInvItems(self,other,ItFo_Addon_Grog,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_04");	//Prod?v?m to levn?, ale ne zadarmo! Se?e? si nejd??v zlato, mlad?ku!
	};
};


var int Samuel_Rum_Varianz;

instance DIA_Addon_Samuel_Rum(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 6;
	condition = DIA_Addon_Samuel_Rum_Condition;
	information = DIA_Addon_Samuel_Rum_Info;
	permanent = TRUE;
	description = "Dej mi rum (30 zlata)";
};


func int DIA_Addon_Samuel_Rum_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Rum_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Rum_15_00");	//Dej mi rum!
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		if(Samuel_Rum_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_01");	//Ah! Mate?sk? ml?ko n?mo?n?ka. Tady m??!
			Samuel_Rum_Varianz = 1;
		}
		else if(Samuel_Rum_Varianz == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_02");	//Rum m??e tro?ku smrd?t rybinou. M?me jen star? sudy od sle??. Ale rum z?stane rumem. Nech? ti chutn?.
			Samuel_Rum_Varianz = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_03");	//Tady m??!
		};
		B_GiveInvItems(self,other,ItFo_Addon_Rum,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_04");	//Nem?? dost zlata, mlad?ku! Co? takhle d?t si grog?
	};
};


var int Samuel_Stronger_Varianz;
var int Samuel_DoppelHammer_Varianz;

instance DIA_Addon_Samuel_Stronger(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 7;
	condition = DIA_Addon_Samuel_Stronger_Condition;
	information = DIA_Addon_Samuel_Stronger_Info;
	permanent = TRUE;
	description = "Pot?ebuji n?co siln?j??ho!";
};


func int DIA_Addon_Samuel_Stronger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Stronger_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_00");	//Pot?ebuji n?co siln?j??ho!
	if(Samuel_Stronger_Varianz == 0)
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_01");	//??, dobrodru?n? du?e! Ja v?dy hled?m nov? recepty!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_02");	//Po??dn? ko?alka m? b?t ?ist? a siln?. Mus? proj?t hrdlem jako tekut? ohe?.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_03");	//Je to dost t??k?. Ale u? moc ?e?n?m. Ty chce? p?t!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_04");	//Tady! M?j vlastn? recept! Chutn? ti to? Jmenuje se to 'Rychl? sle?'
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
		B_UseItem(other,ItFo_Addon_SchnellerHering);
		AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_05");	//P?sobiv?!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_06");	//(sm?ch) ?ekl bych, ?e jo.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_07");	//Nezn?? n?hodou n?jakej dobrej recept na ko?alku? Pokud jo, tak mi ?ekni.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_08");	//Chce? dal???
		Samuel_Stronger_Varianz = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_09");	//Co m??u dostat?
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo dvojit? kladivo (60 zlata)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo kladivo (30 zlata)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Rychl? sle? (30 zlata)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void B_Addon_Samuel_NoGold()
{
	AI_Output(self,other,"DIA_Addon_Samuel_NoGold_14_00");	//Nen? zlato, nen? pit?!
};

func void DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
};

func void DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00");	//Dej mi tro?ku z toho rychl?ho sled?.
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01");	//Siln? v?ci?ka, ale ud?l? svoje!
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo Dvojit? kladivo (60 zlata)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo Kladivo (30 zlata)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Rychl? sle? (30 zlata)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousHammer_15_00");	//Chci Louovo kladivo!
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01");	//Dobr? v?c! Na ochranu!
		B_GiveInvItems(self,other,ItFo_Addon_LousHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo Dvojit? kladivo (60 zlata)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo Kladivo (30 zlata)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Rychl? sle? (30 zlata)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00");	//(nenucen?) Dej mi dvojit?. Dvojit? kladivo.
	if(B_GiveInvItems(other,self,ItMi_Gold,Value_SchlafHammer))
	{
		if(Samuel_DoppelHammer_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01");	//Neud?lej ze sebe ubo??ka. Douf?m, ?e to nen? pro tebe.
		}
		else
		{
			AI_Output(self,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02");	//Ano! To bude du?evn? tanec!
		};
		B_GiveInvItems(self,other,ItFo_Addon_SchlafHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo Dvojit? kladivo (60 zlata)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo Kladivo (30 zlata)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Rychl? sle? (30 zlata)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};


instance DIA_Addon_Samuel_Trade(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 8;
	condition = DIA_Addon_Samuel_Trade_Condition;
	information = DIA_Addon_Samuel_Trade_Info;
	permanent = TRUE;
	description = "Co je?t? m???";
	trade = TRUE;
};


func int DIA_Addon_Samuel_Trade_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Trade_Info()
{
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItFo_Addon_Grog,Npc_HasItems(self,ItFo_Addon_Grog));
	CreateInvItems(self,ItFo_Addon_Grog,15);
	AI_Output(other,self,"DIA_Addon_Samuel_Trade_15_00");	//Co je?t? m???
	AI_Output(self,other,"DIA_Addon_Samuel_Trade_14_01");	//Dod?v?m v?echno, co pir?t pot?ebuje pro p?e?it?.
};


instance DIA_Addon_Samuel_News(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 99;
	condition = DIA_Addon_Samuel_News_Condition;
	information = DIA_Addon_Samuel_News_Info;
	permanent = TRUE;
	description = "N?co nov?ho v t?bo?e?";
};


func int DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_News_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_News_15_00");	//N?co nov?ho v t?bo?e?
	if(Npc_IsDead(Francis) || (Francis_ausgeschissen == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_01");	//Francis dostal ??dnej trest! Ani nev??, jak jsem r?d!
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_02");	//Ty jsi v pohod?. Poj?, vypijeme n?co!
		if(GregIsBack == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_03");	//A Greg je kone?n? zp?tky. Sice ztratil lo?, ale aspo? ud?lal po??dek v t?bo?e.
		};
	}
	else
	{
		if(!Npc_IsDead(Morgan))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_04");	//Od Gregova odjezdu se nic moc ned?je. Morgan a v?t?ina jeho chlapu jenom chlastaj?.
		};
		if(!Npc_IsDead(Henry))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_05");	//Jedin?, kdo n?co d?l? je Henry. On a jeho chlapci stav?j? palis?du.
		};
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_06");	//U? je na?ase, aby se kapit?n Greg vr?til a nakopal Francisovi ?i?.
	};
};

