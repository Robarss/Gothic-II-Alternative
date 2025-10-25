
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
	description = "Co tu děláš?";
};


func int DIA_Addon_Miguel_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_00");	//Co tu děláš?
	if(Wld_IsTime(6,0,22,0))
	{
		AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_01");	//Hledáš něco?
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_02");	//Rostliny - hledám rostliny.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_03");	//Obvykle hledám rostliny.
	};
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_04");	//Většina z věcí, které zde rostou, mohou být k něčemu užitečné.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_05");	//Mnoho rostlin má léčivý efekt a tráva z bažin se dá kouřit.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_06");	//Pracoval jsem pro alchymistu předtím, než mě hodili za bariéru.
};


instance DIA_Addon_Miguel_Story(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 2;
	condition = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent = FALSE;
	description = "Čím ses provinil?";
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
	AI_Output(other,self,"DIA_Addon_Miguel_Story_15_00");	//Čím ses provinil?
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_01");	//Experimentoval jsem s lektvary, které mohou ovlivňovat a manipulovat s myslí.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_02");	//Ignaz, můj mistr, vypil jednou jeden z mých experimentů místo jeho večerního vína.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_03");	//Dobře, to ho poznamenalo ... trochu nerozumný čin. A od té doby je jeho mysl trochu ... Jakoby zamlžená.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_04");	//Mágové jsou zodpovědní za to, že mě hodili do vězěňské kolonie. Prý za výzkum "zakázaných vědomostí".
};


instance DIA_Addon_Miguel_Lager(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 3;
	condition = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent = FALSE;
	description = "Co mi můžeš říci o táboře?";
};


func int DIA_Addon_Miguel_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Lager_15_00");	//Co mi můžeš říci o táboře?
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_01");	//Ne mnoho. Nikdy jsem tam nebyl.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_02");	//Pouze Ravenovi lidé jsou zde od začátku. Všichni ostatní přišli později nebo stále čekají na najmutí nových dělníků. Jako já.
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
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_01");	//Dobře, hádám, že stejně jako ty. Přes moře s piráty.
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_02");	//Údolí je kompletně odděleno od zbytku ostrova. Můžeš ho pouze dosáhnout ze strany od moře.
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_03");	//(vědomě) Přesně.
};


instance DIA_Addon_Miguel_Angefordert(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 4;
	condition = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent = FALSE;
	description = "Kdy obvykle potřebují nové pracovníky?";
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
	AI_Output(other,self,"DIA_Addon_Miguel_Angefordert_15_00");	//Kdy obvykle potřebují nové pracovníky?
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_01");	//O, kdykoliv jim někdo chybí.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_02");	//Náhradník je potřeba, když je některý z dělníků zabit důlním červem.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_03");	//A někdy se chlapi pozabíjejí také mezi sebou. Ale není to tak zlé, jak to bývalo kdysi.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_04");	//Raven to z nějakého důvodu organizuje a stará se o to, aby nikdo nepracoval v dole ve stejnou dobu.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_05");	//Nevím, jak to přesně funguje. Nikdy jsem tam nebyl.
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
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_00");	//Fortuno se zdá "pomatený". Hádal bych, že nějaký lektvar by mu mohl vrátit paměť.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_01");	//Fortuno? To je jeden z Ravenových služebníků.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_02");	//Dobrá, byl. Nyní je z něj troska. A to je Ravenova chyba.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_03");	//Raven? Nikdy jsem si o něm moc nemyslel. Hmm, dobrá. Bohužel, nemohu namíchat lektvar zde v bažinách.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_04");	//Mohl bych namíchat lektvar. V táboře je alchymistická kolona. Pouze kdybych měl recept ...
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_05");	//Buď opatrný. Namíchat tento lektvar je nebezpečné.
	B_GiveInvItems(self,other,ITWr_Addon_MCELIXIER_01,1);
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_06");	//Tento lektvar je smrtící, pokud je něco uděláno špatně. Ať už v ingrediencích nebo v procesu.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_07");	//Budu opatrný.
	B_LogEntry(Topic_Addon_Fortuno,"Miguel mi dal recept na lektvarm tak můžu pomoci Fortunovi znovu získat paměť. Měl bych namíchat lektvar pouze pokud budu mít plné vědomosti s všemi ingrediencemi. Jinak by mohl být smrtelný.");
};


instance DIA_Addon_Miguel_BRAU(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 7;
	condition = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent = FALSE;
	description = "Co mě dál můžeš naučit?";
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
	AI_Output(other,self,"DIA_Addon_Miguel_BRAU_15_00");	//Co mě dál můžeš naučit?
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_01");	//Nic. Přišel jsem zde, abych si vydělal nějaké peníze. Vydělávám si prodáváním rostlin dokud mě nepustí do tábora.
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_02");	//Nicméně, mohu ti poskytnout několik lektvarů, jestli potřebuješ.
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

