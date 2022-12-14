
instance DIA_Addon_Miguel_EXIT(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 999;
	condition = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Miguel_PICKPOCKET(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 900;
	condition = DIA_Addon_Miguel_PICKPOCKET_Condition;
	information = DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	return C_Beklauen(40,48);
};

func void DIA_Addon_Miguel_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Miguel_PICKPOCKET,Dialog_Back,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Miguel_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
};

func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
};


instance DIA_Addon_Miguel_Hi(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 1;
	condition = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent = FALSE;
	description = "Co tu d?l???";
};


func int DIA_Addon_Miguel_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_00");	//Co tu d?l???
	if(Wld_IsTime(6,0,22,0))
	{
		AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_01");	//Hled?? n?co?
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_02");	//Rostliny - hled?m rostliny.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_03");	//Obvykle hled?m rostliny.
	};
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_04");	//V?t?ina z v?c?, kter? zde rostou, mohou b?t k n??emu u?ite?n?.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_05");	//Mnoho rostlin m? l??iv? efekt a tr?va z ba?in se d? kou?it.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_06");	//Pracoval jsem pro alchymistu p?edt?m, ne? m? hodili za bari?ru.
};


instance DIA_Addon_Miguel_Story(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 2;
	condition = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent = FALSE;
	description = "??m ses provinil?";
};


func int DIA_Addon_Miguel_Story_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Story_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Story_15_00");	//??m ses provinil?
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_01");	//Experimentoval jsem s lektvary, kter? mohou ovliv?ovat a manipulovat s mysl?.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_02");	//Ignaz, m?j mistr, vypil jednou jeden z m?ch experiment? m?sto jeho ve?ern?ho v?na.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_03");	//Dob?e, to ho poznamenalo ... trochu nerozumn? ?in. A od t? doby je jeho mysl trochu ... Jakoby zaml?en?.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_04");	//M?gov? jsou zodpov?dn? za to, ?e m? hodili do v?z??sk? kolonie. Pr? za v?zkum "zak?zan?ch v?domost?".
};


instance DIA_Addon_Miguel_Lager(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 3;
	condition = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent = FALSE;
	description = "Co mi m??e? ??ci o t?bo?e?";
};


func int DIA_Addon_Miguel_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Lager_15_00");	//Co mi m??e? ??ci o t?bo?e?
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_01");	//Ne mnoho. Nikdy jsem tam nebyl.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_02");	//Pouze Ravenovi lid? jsou zde od za??tku. V?ichni ostatn? p?i?li pozd?ji nebo st?le ?ekaj? na najmut? nov?ch d?ln?k?. Jako j?.
};


instance DIA_Addon_Miguel_WhereFrom(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 4;
	condition = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent = FALSE;
	description = "Odkud jsi?";
};


func int DIA_Addon_Miguel_WhereFrom_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Hi) || Npc_KnowsInfo(other,DIA_Addon_Miguel_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_00");	//Jak jsi se sem dostal?
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_01");	//Dob?e, h?d?m, ?e stejn? jako ty. P?es mo?e s pir?ty.
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_02");	//?dol? je kompletn? odd?leno od zbytku ostrova. M??e? ho pouze dos?hnout ze strany od mo?e.
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_03");	//(v?dom?) P?esn?.
};


instance DIA_Addon_Miguel_Angefordert(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 4;
	condition = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent = FALSE;
	description = "Kdy obvykle pot?ebuj? nov? pracovn?ky?";
};


func int DIA_Addon_Miguel_Angefordert_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Angefordert_15_00");	//Kdy obvykle pot?ebuj? nov? pracovn?ky?
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_01");	//O, kdykoliv jim n?kdo chyb?.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_02");	//N?hradn?k je pot?eba, kdy? je n?kter? z d?ln?k? zabit d?ln?m ?ervem.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_03");	//A n?kdy se chlapi pozab?jej? tak? mezi sebou. Ale nen? to tak zl?, jak to b?valo kdysi.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_04");	//Raven to z n?jak?ho d?vodu organizuje a star? se o to, aby nikdo nepracoval v dole ve stejnou dobu.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_05");	//Nev?m, jak to p?esn? funguje. Nikdy jsem tam nebyl.
};


instance DIA_Addon_Miguel_Fortuno(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 6;
	condition = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent = FALSE;
	description = "O Fortunovi ...";
};


func int DIA_Addon_Miguel_Fortuno_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_00");	//Fortuno se zd? "pomaten?". H?dal bych, ?e n?jak? lektvar by mu mohl vr?tit pam??.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_01");	//Fortuno? To je jeden z Ravenov?ch slu?ebn?k?.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_02");	//Dobr?, byl. Nyn? je z n?j troska. A to je Ravenova chyba.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_03");	//Raven? Nikdy jsem si o n?m moc nemyslel. Hmm, dobr?. Bohu?el, nemohu nam?chat lektvar zde v ba?in?ch.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_04");	//Mohl bych nam?chat lektvar. V t?bo?e je alchymistick? kolona. Pouze kdybych m?l recept ...
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_05");	//Bu? opatrn?. Nam?chat tento lektvar je nebezpe?n?.
	B_GiveInvItems(self,other,ITWr_Addon_MCELIXIER_01,1);
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_06");	//Tento lektvar je smrt?c?, pokud je n?co ud?l?no ?patn?. A? u? v ingredienc?ch nebo v procesu.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_07");	//Budu opatrn?.
	B_LogEntry(Topic_Addon_Fortuno,"Miguel mi dal recept na lektvarm tak m??u pomoci Fortunovi znovu z?skat pam??. M?l bych nam?chat lektvar pouze pokud budu m?t pln? v?domosti s v?emi ingrediencemi. Jinak by mohl b?t smrteln?.");
};


instance DIA_Addon_Miguel_BRAU(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 7;
	condition = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent = FALSE;
	description = "Co m? d?l m??e? nau?it?";
};


func int DIA_Addon_Miguel_BRAU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Story))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_BRAU_15_00");	//Co m? d?l m??e? nau?it?
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_01");	//Nic. P?i?el jsem zde, abych si vyd?lal n?jak? pen?ze. Vyd?l?v?m si prod?v?n?m rostlin dokud m? nepust? do t?bora.
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_02");	//Nicm?n?, mohu ti poskytnout n?kolik lektvar?, jestli pot?ebuje?.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"U Miguela si mohu kupovat rostliny a lektvary");
};


instance DIA_Addon_Miguel_trade(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 888;
	condition = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Miguel_trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_BRAU))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_trade_Info()
{
	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};

