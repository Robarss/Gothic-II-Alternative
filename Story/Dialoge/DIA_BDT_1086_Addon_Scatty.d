
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
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_01");	//Hůř od doby, co byla otevřena krypta ...
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_02");	//Raven už nepotřebuje otroky. Teď kutají zlato na Bloodwynův příkaz.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_03");	//A kopáči si dávají oraz. (mumlá) Kopáči, kteří mají pauzu nejsou dobří pro můj obchod.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Scatty prodává různé věci.");
};


instance DIA_Addon_Scatty_last(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent = FALSE;
	description = "Bloodwyn? Má tady nějaký úkol?";
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
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_00");	//Bloodwyn? Má tady nějaký úkol?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_01");	//Kontroluje důl. Ale je tady dole jen sťeží. Většinu času je s Ravenem v chrámu.
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_02");	//Co to 'těžce' znamená doopravdy?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_03");	//Naposled jsem ho viděl, když opouštěl kryptu ...
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_04");	//(uvažuje) Ne, počkej! Myslím, že to bylo když posílal otroky dolů, aby kopali zlato.
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_05");	//Narozdíl od Ravena, ON je velmi zaujat zlatem.
};


instance DIA_Addon_Scatty_Gruft(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Gruft_Info;
	permanent = FALSE;
	description = "O jaké kryptě mluvíš?";
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
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_00");	//O jaké kryptě mluvíš?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_01");	//Je to prokletá krypta! Její ochránci zabili mnoho mužů!
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_02");	//Ochránci? Mluvíš o kamenných stvořeních? Plochý a kulatý obličej?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_03");	//Ano! Nesčetněkrát se objevili z hluboké skály.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_04");	//Věděl jsem, že otevření krypty není dobrý nápad už od začátku.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_05");	//Ale Raven byl posedlý nápadem tady dolovat. A jen co byla krypta odkryta, on a jeho strážce do ní vstoupili.
};


instance DIA_Addon_Scatty_GruftAgain(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent = FALSE;
	description = "Proč chtěl Raven do té krypty?";
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
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_00");	//Proč chtěl Raven do té krypty?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_01");	//(uvažuje) Hmm ... jsi hodně nosatý. Podobáš se chlápkovi, kterého jsem znal.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_02");	//Byl stejně nosatý jak ty. A jednoho dne se obrátil k osudu.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_03");	//Nezakecávej to. Co se stalo v kryptě?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_04");	//Dobrá ... uhm ... Je trochu sucho a mě by nevadilo něco k pití ...
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_05");	//Hej Scatty, ne teď. Tohle je důležité, takže, co tam dole Raven dělal?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_06");	//Dobrá, dobrá. (dýchá) On ... přivolal ... něco. Používal slova jazyka, který nezněl známě.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_07");	//Oslňující světlo se uvolnilo z vnitřku krypty a potom jsem slyšel výkřik. Byl to šokující, démonický výkřik.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_08");	//A potom?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_09");	//To je vše, co jsem viděl. Bloodwyn vyšel z krypty a řekl mi, abych odešel. A to jsem také udělal.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_10");	//Raven a jeho chlapi opustili chrám krátce potom. A potom už tady dole nebyl vůbec.
};


instance DIA_Addon_Scatty_Trinken(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent = FALSE;
	description = "Chtěl by jsi něco k pití?";
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
	AI_Output(other,self,"DIA_Addon_Scatty_Trinken_15_00");	//Chtěl by jsi něco k pití?
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_01");	//Určitě jsi nemyslel pivo. To je velice vzácné v tomhle táboře.
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_02");	//Možná má Lucia stále někde láhev ...
};


instance DIA_Addon_Scatty_Bier(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent = FALSE;
	description = "Na zdraví! (dát pivo)";
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
	AI_Output(other,self,"DIA_Addon_Scatty_Bier_15_00");	//Na zdraví!
	if(B_GiveInvItems(other,self,ItFo_Beer,1))
	{
		AI_UseItem(self,ItFo_Beer);
	};
	AI_Output(self,other,"DIA_Addon_Scatty_Bier_01_01");	//Oh, tohle chutná skvěle. Díky, chlape, jseš můj hrdina.
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
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_00");	//Získat krumpáč a bušit zlaté mince ... Každý to může dělat.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_01");	//Nicméně, pokud do toho bušíš mince se roztříští na mnoho malých nugetů. Proto mohou dolovat je zkušení lidé.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_02");	//Můžu ti dát pár informací, pokud jsi dostatěčně zkušený.
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
	description = "Naučit se dolovat zlato (Stojí: 2 VB - 10 procent)";
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
	AI_Output(other,self,"DIA_Addon_Scatty_teach_15_00");	//Co víš o dolování zlata?
	if(other.lp >= 1)
	{
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_01");	//Musíš si být vědom, že zlato není jako ruda. Je jemné jako máslo. Pokud udeříš moc silně, rozpadne se na malé kousky.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_02");	//Každý kopáč má své vlastní triky jak ze skály získat nějaké pěkné nugety.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_03");	//A právě tyto triky odlišují dobré a špatné kopáče.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_04");	//Také, je to všechno o praxi. Budeš se zlepšovat, pokud tady budeš chvíli pracovat.
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
	description = "Bloodwyn je mrtvý.";
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
	AI_Output(other,self,"DIA_Addon_Scatty_tot_15_00");	//Bloodwyn je mrtvý.
	AI_Output(self,other,"DIA_Addon_Scatty_tot_01_01");	//Hm, normálně nepřipíjím na takovéhle zprávy - nicméně, Bloodwyn byl náhodou jeden z chlapů, kteří jsou lepší mrtví.
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

