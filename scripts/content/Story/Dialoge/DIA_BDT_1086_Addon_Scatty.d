
var int Scatty_Start;

instance DIA_Addon_Scatty_EXIT(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 999;
	condition = DIA_Addon_Scatty_EXIT_Condition;
	information = DIA_Addon_Scatty_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Scatty_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine(self,"START");
		Scatty_Start = TRUE;
	};
};


instance DIA_Addon_Scatty_PICKPOCKET(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 900;
	condition = DIA_Addon_Scatty_PICKPOCKET_Condition;
	information = DIA_Addon_Scatty_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Scatty_PICKPOCKET_Condition()
{
	return C_Beklauen(60,90);
};

func void DIA_Addon_Scatty_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Scatty_PICKPOCKET,Dialog_Back,DIA_Addon_Scatty_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Scatty_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Scatty_PICKPOCKET_DoIt);
};

func void DIA_Addon_Scatty_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
};

func void DIA_Addon_Scatty_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
};


instance DIA_Addon_Scatty_Hi(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Hi_Condition;
	information = DIA_Addon_Scatty_Hi_Info;
	permanent = FALSE;
	description = "Jak jde obchod?";
};


func int DIA_Addon_Scatty_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Hi_15_00");	//Jak jde obchod?
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_01");	//H?? od doby, co byla otev?ena krypta ...
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_02");	//Raven u? nepot?ebuje otroky. Te? kutaj? zlato na Bloodwyn?v p??kaz.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_03");	//A kop??i si d?vaj? oraz. (muml?) Kop??i, kte?? maj? pauzu nejsou dob?? pro m?j obchod.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Scatty prod?v? r?zn? v?ci.");
};


instance DIA_Addon_Scatty_last(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent = FALSE;
	description = "Bloodwyn? M? tady n?jak? ?kol?";
};


func int DIA_Addon_Scatty_last_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_last_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_00");	//Bloodwyn? M? tady n?jak? ?kol?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_01");	//Kontroluje d?l. Ale je tady dole jen s?e??. V?t?inu ?asu je s Ravenem v chr?mu.
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_02");	//Co to 't??ce' znamen? doopravdy?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_03");	//Naposled jsem ho vid?l, kdy? opou?t?l kryptu ...
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_04");	//(uva?uje) Ne, po?kej! Mysl?m, ?e to bylo kdy? pos?lal otroky dol?, aby kopali zlato.
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_05");	//Narozd?l od Ravena, ON je velmi zaujat zlatem.
};


instance DIA_Addon_Scatty_Gruft(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Gruft_Info;
	permanent = FALSE;
	description = "O jak? krypt? mluv???";
};


func int DIA_Addon_Scatty_Gruft_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Gruft_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_00");	//O jak? krypt? mluv???
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_01");	//Je to proklet? krypta! Jej? ochr?nci zabili mnoho mu??!
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_02");	//Ochr?nci? Mluv?? o kamenn?ch stvo?en?ch? Ploch? a kulat? obli?ej?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_03");	//Ano! Nes?etn?kr?t se objevili z hlubok? sk?ly.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_04");	//V?d?l jsem, ?e otev?en? krypty nen? dobr? n?pad u? od za??tku.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_05");	//Ale Raven byl posedl? n?padem tady dolovat. A jen co byla krypta odkryta, on a jeho str??ce do n? vstoupili.
};


instance DIA_Addon_Scatty_GruftAgain(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent = FALSE;
	description = "Pro? cht?l Raven do t? krypty?";
};


func int DIA_Addon_Scatty_GruftAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Gruft))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_00");	//Pro? cht?l Raven do t? krypty?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_01");	//(uva?uje) Hmm ... jsi hodn? nosat?. Podob?? se chl?pkovi, kter?ho jsem znal.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_02");	//Byl stejn? nosat? jak ty. A jednoho dne se obr?til k osudu.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_03");	//Nezakec?vej to. Co se stalo v krypt??
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_04");	//Dobr? ... uhm ... Je trochu sucho a m? by nevadilo n?co k pit? ...
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_05");	//Hej Scatty, ne te?. Tohle je d?le?it?, tak?e, co tam dole Raven d?lal?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_06");	//Dobr?, dobr?. (d?ch?) On ... p?ivolal ... n?co. Pou??val slova jazyka, kter? nezn?l zn?m?.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_07");	//Osl?uj?c? sv?tlo se uvolnilo z vnit?ku krypty a potom jsem sly?el v?k?ik. Byl to ?okuj?c?, d?monick? v?k?ik.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_08");	//A potom?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_09");	//To je v?e, co jsem vid?l. Bloodwyn vy?el z krypty a ?ekl mi, abych ode?el. A to jsem tak? ud?lal.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_10");	//Raven a jeho chlapi opustili chr?m kr?tce potom. A potom u? tady dole nebyl v?bec.
};


instance DIA_Addon_Scatty_Trinken(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent = FALSE;
	description = "Cht?l by jsi n?co k pit??";
};


func int DIA_Addon_Scatty_Trinken_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_GruftAgain))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Trinken_15_00");	//Cht?l by jsi n?co k pit??
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_01");	//Ur?it? jsi nemyslel pivo. To je velice vz?cn? v tomhle t?bo?e.
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_02");	//Mo?n? m? Lucia st?le n?kde l?hev ...
};


instance DIA_Addon_Scatty_Bier(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent = FALSE;
	description = "Na zdrav?! (d?t pivo)";
};


func int DIA_Addon_Scatty_Bier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Trinken) && Npc_HasItems(other,ItFo_Beer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Bier_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Bier_15_00");	//Na zdrav?!
	if(B_GiveInvItems(other,self,ItFo_Beer,1))
	{
		AI_UseItem(self,ItFo_Beer);
	};
	AI_Output(self,other,"DIA_Addon_Scatty_Bier_01_01");	//Oh, tohle chutn? skv?le. D?ky, chlape, jse? m?j hrdina.
	B_GivePlayerXP(XP_Ambient * 5);
};


instance DIA_Addon_Scatty_Gold(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Gold_Condition;
	information = DIA_Addon_Scatty_Gold_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int DIA_Addon_Scatty_Gold_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_Gold_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_00");	//Z?skat krump?? a bu?it zlat? mince ... Ka?d? to m??e d?lat.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_01");	//Nicm?n?, pokud do toho bu??? mince se rozt???t? na mnoho mal?ch nuget?. Proto mohou dolovat je zku?en? lid?.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_02");	//M??u ti d?t p?r informac?, pokud jsi dostat??n? zku?en?.
	B_Upgrade_Hero_HackChance(5);
};


var int Scatty_teach_perm;

instance DIA_Addon_Scatty_teach(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_teach_Condition;
	information = DIA_Addon_Scatty_teach_Info;
	permanent = TRUE;
	description = "Nau?it se dolovat zlato (Stoj?: 2 VB - 10 procent)";
};


func int DIA_Addon_Scatty_teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Gold) && (Scatty_teach_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_teach_15_00");	//Co v?? o dolov?n? zlata?
	if(other.lp >= 1)
	{
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_01");	//Mus?? si b?t v?dom, ?e zlato nen? jako ruda. Je jemn? jako m?slo. Pokud ude??? moc siln?, rozpadne se na mal? kousky.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_02");	//Ka?d? kop?? m? sv? vlastn? triky jak ze sk?ly z?skat n?jak? p?kn? nugety.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_03");	//A pr?v? tyto triky odli?uj? dobr? a ?patn? kop??e.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_04");	//Tak?, je to v?echno o praxi. Bude? se zlep?ovat, pokud tady bude? chv?li pracovat.
		other.lp = other.lp - 1;
		B_Upgrade_Hero_HackChance(10);
		Scatty_teach_perm = TRUE;
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Addon_Scatty_tot(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_tot_Condition;
	information = DIA_Addon_Scatty_tot_Info;
	permanent = FALSE;
	description = "Bloodwyn je mrtv?.";
};


func int DIA_Addon_Scatty_tot_Condition()
{
	if(Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_tot_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_tot_15_00");	//Bloodwyn je mrtv?.
	AI_Output(self,other,"DIA_Addon_Scatty_tot_01_01");	//Hm, norm?ln? nep?ip?j?m na takov?hle zpr?vy - nicm?n?, Bloodwyn byl n?hodou jeden z chlap?, kte?? jsou lep?? mrtv?.
};


instance DIA_Addon_Scatty_trade(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_trade_Condition;
	information = DIA_Addon_Scatty_trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Scatty_trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_trade_Info()
{
	B_GiveTradeInv(self);
	B_Say(other,self,"$TRADE_1");
};

