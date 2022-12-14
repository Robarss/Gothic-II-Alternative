
instance DIA_Parlan_Kap1_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap1_EXIT_Condition;
	information = DIA_Parlan_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Parlan_Hammer;

func void B_Parlan_HAMMER()
{
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_00");	//(p??sn?) Po?kej chv?li, synu.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_01");	//??k? se, ?e ze svatyn? 'zmizel' cenn? artefakt.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_02");	//Ani o tom nechci sly?et nic dal??ho - p?edpokl?d?m, ?e se vr?t? na sv? m?sto.
	Parlan_Hammer = TRUE;
};


var int Parlan_LastPetzCounter;
var int Parlan_LastPetzCrime;

instance DIA_Parlan_PMSchulden(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_PMSchulden_Condition;
	information = DIA_Parlan_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Parlan_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Parlan_LastPetzCrime))
	{
		return TRUE;
	};
};

func void DIA_Parlan_PMSchulden_Info()
{
	var int diff;
	if((Parlan_Hammer == FALSE) && (Hammer_Taken == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(Garwig) == FALSE))
	{
		B_Parlan_HAMMER();
	};
	AI_Output(self,other,"DIA_Parlan_PMSchulden_05_00");	//Poru?il jsi z?kona na?eho spole?enstv?.
	if(B_GetTotalPetzCounter(self) > Parlan_LastPetzCounter)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_01");	//A i kdy? jsi u? byl obvin?n, provinil ses je?t? v?c.
		if(Parlan_Schulden < 1000)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_02");	//Tv? vina m??e b?t smyta jen v?t??m darem kl??teru.
			AI_Output(other,self,"DIA_Parlan_PMAdd_15_00");	//Kolik?
			diff = B_GetTotalPetzCounter(self) - Parlan_LastPetzCounter;
			if(diff > 0)
			{
				Parlan_Schulden = Parlan_Schulden + (diff * 50);
			};
			if(Parlan_Schulden > 1000)
			{
				Parlan_Schulden = 1000;
			};
			B_Say_Gold(self,other,Parlan_Schulden);
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_03");	//Kdo si mysl??, ?e jsi? Modli se k Innosovi za odpu?t?n? sv?ch skutk?!
		};
	}
	else if(B_GetGreatestPetzCrime(self) < Parlan_LastPetzCrime)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_04");	//Tvoje situace se zm?nila.
		if(Parlan_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_05");	//Nejsou u? ??dn? sv?dkov? tv? vra?dy!
		};
		if((Parlan_LastPetzCrime == CRIME_THEFT) || ((Parlan_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_06");	//Nikdo u? nebude sv?d?it, ?e t? vid?l kr?st!
		};
		if((Parlan_LastPetzCrime == CRIME_ATTACK) || ((Parlan_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_07");	//U? t? nikdo neobvi?uje z toho, ?e by ses pral!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_08");	//V?echna obvin?n? proti tob? byla sta?ena!
		};
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_09");	//Mo?n? se ti poda?? m? o??lit - ale Innos zn? tv? prav? skutky!
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_10");	//Tv? h??chy jsou nyn? odpu?t?ny.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_11");	//A sna? se, aby to tak tak? z?stalo!
			Parlan_Schulden = 0;
			Parlan_LastPetzCounter = 0;
			Parlan_LastPetzCrime = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_12");	//Zaplat?? svou pokutu - takov? je v?le Innosova!
			B_Say_Gold(self,other,Parlan_Schulden);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_13");	//Osvobo? se od sv? viny!
		};
	};
	if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(DIA_Parlan_PMSchulden);
		Info_ClearChoices(DIA_Parlan_PETZMASTER);
		Info_AddChoice(DIA_Parlan_PMSchulden,"Nem?m dost pen?z!",DIA_Parlan_PETZMASTER_PayLater);
		Info_AddChoice(DIA_Parlan_PMSchulden,"Kolik ?e to bylo?",DIA_Parlan_PMSchulden_HowMuchAgain);
		if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
		{
			Info_AddChoice(DIA_Parlan_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Parlan_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Parlan_PMSchulden_HowMuchAgain()
{
	AI_Output(other,self,"DIA_Parlan_PMSchulden_HowMuchAgain_15_00");	//Kolik ?e to bylo?
	B_Say_Gold(self,other,Parlan_Schulden);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	Info_AddChoice(DIA_Parlan_PMSchulden,"Nem?m dost pen?z!",DIA_Parlan_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Parlan_PMSchulden,"Kolik ?e to bylo?",DIA_Parlan_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
	{
		Info_AddChoice(DIA_Parlan_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Parlan_PETZMASTER_PayNow);
	};
};


instance DIA_Parlan_PETZMASTER(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_PETZMASTER_Condition;
	information = DIA_Parlan_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_PETZMASTER_Condition()
{
	if(B_GetGreatestPetzCrime(self) > Parlan_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Parlan_PETZMASTER_Info()
{
	if((Parlan_Hammer == FALSE) && (Hammer_Taken == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(Garwig) == FALSE))
	{
		B_Parlan_HAMMER();
	};
	Parlan_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_00");	//Je?t? jsme spolu nemluvili, a u? na sob? m?? b?emeno viny!
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_01");	//Provinil ses nejhor??m ze v?ech zlo?in?! Vra?dou!
		Parlan_Schulden = B_GetTotalPetzCounter(self) * 50;
		Parlan_Schulden = Parlan_Schulden + 500;
		if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_02");	//A zat??il ses je?t? dal?? vinou!
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_03");	//Kdyby z?le?elo na mn?, na m?st? bych t? odsoudil, vrahu!
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_04");	//Ale kdy? za sv?j zlo?in zaplat?? pokutu, zbav?m t? tv? viny.
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_05");	//Kr?de? je poru?en?m z?kon? kl??tera!
		if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_06");	//Krom? toho jsi poru?il i dal?? z?kony.
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_07");	//Tyto proh?e?ky mus? b?t potrest?ny. Tak zn? Innosovo p?ik?z?n?.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_08");	//Zaplat?? kl??teru p?im??enou pokutu.
		Parlan_Schulden = B_GetTotalPetzCounter(self) * 50;
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_09");	//V kl??te?e netolerujeme rva?ky. Takov? chov?n? se protiv? na?im z?kon?m.
		if(PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_10");	//A pro? zab?j?? na?e ovce?
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_11");	//?ijeme tady podle p?ik?z?n?. A ta se vztahuj? i na tebe.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_12");	//Za sv?j zlo?in mus?? d?t kl??teru dar.
		Parlan_Schulden = B_GetTotalPetzCounter(self) * 50;
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_13");	//Zabil jsi na?e ovce. Za to zaplat?? od?kodn?!
		Parlan_Schulden = 100;
	};
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_15_14");	//Kolik?
	if(Parlan_Schulden > 1000)
	{
		Parlan_Schulden = 1000;
	};
	B_Say_Gold(self,other,Parlan_Schulden);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	Info_AddChoice(DIA_Parlan_PETZMASTER,"Nem?m dost pen?z!",DIA_Parlan_PETZMASTER_PayLater);
	if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
	{
		Info_AddChoice(DIA_Parlan_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Parlan_PETZMASTER_PayNow);
	};
};

func void DIA_Parlan_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayNow_15_00");	//Chci tu pokutu zaplatit!
	B_GiveInvItems(other,self,ItMi_Gold,Parlan_Schulden);
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayNow_05_01");	//P?ij?m?m tv?j dar. Tv? h??chy jsou odpu?t?ny. Nech? ti Innos d? moudrost, abys stejn? chyby ji? v?ckr?t neopakoval.
	B_GrantAbsolution(LOC_MONASTERY);
	Parlan_Schulden = 0;
	Parlan_LastPetzCounter = 0;
	Parlan_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
};

func void DIA_Parlan_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayLater_15_00");	//Nem?m dost pen?z!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_01");	//Na to jsi m?l myslet, ne? ses sv?ch proh?e?k? dopustil.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_02");	//Mo?n? se z toho ponau???. Ned?lej ??dn? dal?? pot??e, nebude? muset platit.
	Parlan_LastPetzCounter = B_GetTotalPetzCounter(self);
	Parlan_LastPetzCrime = B_GetGreatestPetzCrime(self);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_WELCOME(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_WELCOME_Condition;
	information = DIA_Parlan_WELCOME_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Parlan_WELCOME_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void B_DIA_Parlan_WELCOME_GoForTribute()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//A? to ud?l??, promluv?me si o tv? pr?ci tady v kl??te?e.
};

func void B_DIA_Parlan_WELCOME_BringTribute2Gorax()
{
	AI_Output(self,other,"DIA_Addon_Parlan_WELCOME_05_00");	//Odnes okam?it? sv?j poplatek kl??teru Goraxovi. Ten se o to postar?.
};

func void DIA_Parlan_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_00");	//V?tej, novici, j? jsem Parlan.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_01");	//J? jsem...
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_02");	//(p?eru?? t?)... NOVIC. Nen? d?le?it?, kdo jsi byl p?edt?m. Te? jsi Innos?v slu?ebn?k. To je v?e, na ?em z?le??.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_03");	//A jakmile bude? p?ijat do Bratrstva ohn?, budou v?echny tv? p?edchoz? proh?e?ky odpu?t?ny.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_04");	//Nech? Innos po?ehn? tomuto mu?i, kter? zasv?t? sv?j ?ivot jeho slu?b?, a smyje z n?j v?echny jeho h??chy.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_05");	//A te??
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Nejprve bude? plnit sv? povinnosti novice. Bude? pracovat a slou?it pro blaho Bratrstva.
	B_GrantAbsolution(LOC_ALL);
	Snd_Play("LEVELUP");
	Log_CreateTopic(Topic_Gemeinschaft,LOG_MISSION);
	Log_SetTopicStatus(Topic_Gemeinschaft,LOG_Running);
	B_LogEntry(Topic_Gemeinschaft,"Jako novic m?m povinnost plnit ?koly, kter? poslou?? cel?mu spole?enstv?.");
	if(Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE)
	{
		if(Liesel_Giveaway == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Nejprve v?ak dove? svou ovci k Opolosovi, postar? se o ni.
		};
		if(DIA_Gorax_GOLD_perm == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Sv? zlato m??e? d?t Goraxovi, na?emu spr?vci. Najde? ho ve st???rn? v?na.
			B_DIA_Parlan_WELCOME_GoForTribute();
		};
	}
	else if(DIA_Gorax_GOLD_perm == FALSE)
	{
		B_DIA_Parlan_WELCOME_BringTribute2Gorax();
		B_DIA_Parlan_WELCOME_GoForTribute();
	};
};


instance DIA_Parlan_Auge(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_Auge_Condition;
	information = DIA_Parlan_Auge_Info;
	permanent = FALSE;
	description = "Hled?m Innosovo oko.";
};


func int DIA_Parlan_Auge_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Auge_Info()
{
	AI_Output(other,self,"DIA_Parlan_Auge_15_00");	//Hled?m Innosovo oko.
	AI_Output(self,other,"DIA_Parlan_Auge_05_01");	//Nev?m, kdo ti o n?m ?ekl, ale k tomuto posv?tn?mu artefaktu nem? nikdo p??stup.
	AI_Output(other,self,"DIA_Parlan_Auge_15_02");	//Kde je Innosovo oko uschov?no?
	AI_Output(self,other,"DIA_Parlan_Auge_05_03");	//??m m?n? lid? toto tajemstv? zn?, t?m l?pe. Hledej ho - a nenajde? jej.
};


instance DIA_Parlan_Amulett(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Amulett_Condition;
	information = DIA_Parlan_Amulett_Info;
	permanent = FALSE;
	description = "?ekni mi n?co o Innosov? oku.";
};


func int DIA_Parlan_Amulett_Condition()
{
	if((Kapitel <= 2) && Npc_KnowsInfo(other,DIA_Parlan_Auge))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Amulett_Info()
{
	AI_Output(other,self,"DIA_Parlan_Amulett_15_00");	//?ekni mi n?co o Innosov? oku.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_01");	//Dobr?. Innosovo oko obsahuje ??st Innosovy svat? moci. Nosit tento amulet m??e jen JEDIN? vyvolen? Innos?v slu?ebn?k.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_02");	//Bylo vytvo?eno, aby n?s v prav? ?as ochr?nilo p?ed silami Zla.
};


instance DIA_Parlan_Hagen(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_Hagen_Condition;
	information = DIA_Parlan_Hagen_Info;
	permanent = FALSE;
	description = "Pot?ebuji si promluvit s v?dcem paladin?!";
};


func int DIA_Parlan_Hagen_Condition()
{
	if((Kapitel <= 2) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Hagen_Info()
{
	AI_Output(other,self,"DIA_Parlan_Hagen_15_00");	//Pot?ebuji si promluvit s v?dcem paladin?!
	AI_Output(self,other,"DIA_Parlan_Hagen_05_01");	//Lord Hagen novice nep?ij?m? - setkat se s n?m mohou pouze m?gov?.
};


instance DIA_Parlan_WORK(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_WORK_Condition;
	information = DIA_Parlan_WORK_Info;
	permanent = TRUE;
	description = "Jak mohu poslou?it zdej?? komunit??";
};


var int DIA_Parlan_WORK_perm;

func int DIA_Parlan_WORK_Condition()
{
	if((Kapitel == 1) && (Npc_KnowsInfo(other,DIA_Parlan_KNOWSJUDGE) == FALSE) && Npc_KnowsInfo(other,DIA_Parlan_WELCOME) && (DIA_Parlan_WORK_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_WORK_Info()
{
	AI_Output(other,self,"DIA_Parlan_WORK_15_00");	//Jak mohu poslou?it zdej?? komunit??
	if((Liesel_Giveaway == FALSE) || (DIA_Gorax_GOLD_perm == FALSE))
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Nejprve bude? plnit sv? povinnosti novice. Bude? pracovat a slou?it pro blaho Bratrstva.
		if(Liesel_Giveaway == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Nejprve v?ak dove? svou ovci k Opolosovi, postar? se o ni.
		};
		if(DIA_Gorax_GOLD_perm == FALSE)
		{
			if(Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE)
			{
				B_DIA_Parlan_WELCOME_BringTribute2Gorax();
				B_DIA_Parlan_WELCOME_GoForTribute();
			}
			else
			{
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Sv? zlato m??e? d?t Goraxovi, na?emu spr?vci. Najde? ho ve st???rn? v?na.
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//A? to ud?l??, promluv?me si o tv? pr?ci tady v kl??te?e.
			};
		};
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(22,0,7,30))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_01");	//Je ?as klidu. Pr?ce novic? za??n? za rozb?esku a pokra?uje a? do setm?n?.
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_02");	//M?l by ses vyspat. P?ij?, a? nadejde ?as pr?ce.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_WORK_05_03");	//Promluv si s ostatn?mi m?gy. Oni ti zadaj? ?koly.
		AI_Output(self,other,"DIA_Parlan_WORK_05_04");	//J? budu na tvou pr?ci dohl??et, a a? sv? povinnosti uspokojiv? spln??, dostane? povolen? vstoupit do knihovny a studovat Innosovo u?en?.
		DIA_Parlan_WORK_perm = TRUE;
		MIS_KlosterArbeit = LOG_Running;
		B_LogEntry(Topic_Gemeinschaft,"Kdy? spln?m ?koly pro m?gy, dovol? mi pak studovat v knihovn?.");
	};
};


instance DIA_Parlan_Stand(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_Stand_Condition;
	information = DIA_Parlan_Stand_Info;
	permanent = TRUE;
	description = "Mohu vstoupit do knihovny?";
};


func int DIA_Parlan_Stand_Condition()
{
	if((MIS_KlosterArbeit == LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Stand_Info()
{
	Kloster_Punkte = 0;
	AI_Output(other,self,"DIA_Parlan_Stand_15_00");	//Mohu vstoupit do knihovny?
	if(MIS_NeorasPflanzen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_01");	//Sehnal jsi ohniv? kop?ivy pro bratra Neorase.
		Kloster_Punkte = Kloster_Punkte + 2;
	};
	if(MIS_NeorasRezept == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_02");	//Na?el jsi recept bratra Neorase.
		Kloster_Punkte = Kloster_Punkte + 2;
	};
	if(MIS_IsgarothWolf == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_03");	//Zdolal jsi ?ern?ho vlka, kter? ohro?oval svatyni.
		Kloster_Punkte = Kloster_Punkte + 1;
	};
	if(MIS_ParlanFegen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_04");	//Poda?ilo se ti naj?t ?ty?i novice a t?m p?dem i uklidit pokoje.
		Kloster_Punkte = Kloster_Punkte + 3;
	};
	if(MIS_GoraxEssen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_05");	//Rozd?lil jsi j?dlo mezi novice spravedliv?, p?esn? jak ti bratr Gorax nak?zal.
		Kloster_Punkte = Kloster_Punkte + 1;
	}
	else if(MIS_GoraxEssen == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_06");	//Gorax s tebou nebyl spokojen, proto?e jsi j?dlo nerozd?lil spravedliv?.
	};
	if(MIS_GoraxWein == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_07");	//Prodal jsi v?no ke Goraxov? spokojenosti.
		Kloster_Punkte = Kloster_Punkte + 1;
	}
	else if(MIS_GoraxWein == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_08");	//??m m?n? toho bude ?e?eno o t? z?le?itosti s v?nem, t?m l?pe.
	};
	if(Kloster_Punkte >= 8)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_09");	//Ano, u? jsi pracoval dost. Nade?el ?as, abys studoval Innosovo u?en?. Promluv si s mistrem Hyglasem v knihovn?.
		AI_Output(self,other,"DIA_Parlan_Stand_05_10");	//Zde ti d?v?m kl??.
		Parlan_Erlaubnis = TRUE;
		MIS_KlosterArbeit = LOG_SUCCESS;
		Wld_AssignRoomToGuild("Kloster02",GIL_PUBLIC);
		B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
		if(MIS_NeorasPflanzen == LOG_Running)
		{
			MIS_NeorasPflanzen = LOG_OBSOLETE;
		};
		if(MIS_NeorasRezept == LOG_Running)
		{
			MIS_NeorasRezept = LOG_OBSOLETE;
		};
		if(MIS_IsgarothWolf == LOG_Running)
		{
			MIS_IsgarothWolf = LOG_OBSOLETE;
		};
		if(MIS_ParlanFegen == LOG_Running)
		{
			MIS_ParlanFegen = LOG_OBSOLETE;
		};
		if(MIS_GoraxEssen == LOG_Running)
		{
			MIS_GoraxEssen = LOG_OBSOLETE;
		};
		if(MIS_GoraxWein == LOG_Running)
		{
			MIS_GoraxWein = LOG_OBSOLETE;
		};
		if(MIS_MardukBeten == LOG_Running)
		{
			MIS_MardukBeten = LOG_OBSOLETE;
		};
		B_CheckLog();
	}
	else if(Kloster_Punkte >= 1)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_11");	//Nepracoval jsi m?lo, ale tvou povinnost? je d?l slou?it spole?enstv?.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_12");	//Nejprve spl? sv? ?koly ve slu?b? spole?enstv?. A? bude? se v??m hotov, m??eme si o tom promluvit znovu.
	};
};


instance DIA_Parlan_Aufgabe(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_Aufgabe_Condition;
	information = DIA_Parlan_Aufgabe_Info;
	permanent = FALSE;
	description = "M?? pro m? n?jak? ?kol?";
};


func int DIA_Parlan_Aufgabe_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_00");	//M?? pro m? n?jak? ?kol?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_01");	//Hmm... Ano, opravdu tady je n?co, co bys mohl pro na?i komunitu ud?lat.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_02");	//Komnaty novic? by pot?ebovaly po??dn? zam?st. Postarej se o to.
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_03");	//Ale to bude trvat v??n?.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_04");	//V tom p??pad? bys m?l za??t co nejd??v, nezd? se ti?
	MIS_ParlanFegen = LOG_Running;
	Log_CreateTopic(Topic_ParlanFegen,LOG_MISSION);
	Log_SetTopicStatus(Topic_ParlanFegen,LOG_Running);
	B_LogEntry(Topic_ParlanFegen,"Mistr Parlan chce, abych zametl ?ty?i cely pro novice. To potrv? celou v??nost!");
};


instance DIA_Parlan_Fegen(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Fegen_Condition;
	information = DIA_Parlan_Fegen_Info;
	permanent = TRUE;
	description = "Co se t?ch komnat novic? t??e...";
};


var int DIA_Parlan_Fegen_permanent;

func int DIA_Parlan_Fegen_Condition()
{
	if((MIS_ParlanFegen == LOG_Running) && (DIA_Parlan_Fegen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Fegen_Info()
{
	AI_Output(other,self,"DIA_Parlan_Fegen_15_00");	//Co se t?ch komnat novic? t??e...
	if(NOV_Helfer >= 4)
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_01");	//Poda?ilo se ti naj?t ?ty?i novice, aby ti pomohli. Mysl?m, ?e se te? mohou zase vr?tit ke sv? b??n? pr?ci.
		AI_Output(self,other,"DIA_Parlan_Fegen_05_02");	//Dobr? pr?ce, novici. Splnil jsi ?kol, kter? jsem ti zadal.
		MIS_ParlanFegen = LOG_SUCCESS;
		B_GivePlayerXP(XP_ParlanFegen);
		DIA_Parlan_Fegen_permanent = TRUE;
		B_StartOtherRoutine(Feger1,"START");
		B_StartOtherRoutine(Feger2,"START");
		B_StartOtherRoutine(Feger3,"START");
		B_StartOtherRoutine(Babo,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_03");	//O tom nen? sporu - nen? to jednoduch? ?kol. Ale s Innosovou pomoc? to jist? zvl?dne?.
	};
};


instance DIA_Parlan_LEARN(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_LEARN_Condition;
	information = DIA_Parlan_LEARN_Info;
	permanent = FALSE;
	description = "Jak se mohu nau?it um?n? magie?";
};


func int DIA_Parlan_LEARN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_Hagen) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_LEARN_Info()
{
	AI_Output(other,self,"DIA_Parlan_LEARN_15_00");	//Jak se mohu nau?it um?n? magie?
	AI_Output(self,other,"DIA_Parlan_LEARN_05_01");	//Nejsi zde proto, abys dostal dar magie - jsi zde, abys slou?il Innosovi.
	AI_Output(self,other,"DIA_Parlan_LEARN_05_02");	//Ale mohu ti uk?zat, jak zv??it svou magickou moc.
	B_LogEntry(Topic_KlosterTeacher,"Mistr Parlan mi pom??e vylep?it magick? um?n?.");
};


instance DIA_Parlan_KNOWSJUDGE(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_KNOWSJUDGE_Condition;
	information = DIA_Parlan_KNOWSJUDGE_Info;
	permanent = FALSE;
	description = "Cht?l bych podstoupit Zkou?ku ohn?.";
};


func int DIA_Parlan_KNOWSJUDGE_Condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_KNOWSJUDGE_Info()
{
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_00");	//Cht?l bych podstoupit Zkou?ku ohn?.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_01");	//Co?e...? Hm... (nal?hav?) Mysl?? to v??n??
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_02");	//Trv?m na tom.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_03");	//Jsi v?jime?n? novic. Dobr?, pokud jsi rozhodnut, promluv si s mistrem Pyrokarem.
	B_LogEntry(TOPIC_FireContest,"Kdybych n?kdy cht?l podstoupit Zkou?ku ohn?, mus?m si promluvit s mistrem Pyrokarem.");
};


instance DIA_Parlan_TEACH_MANA(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_TEACH_MANA_Condition;
	information = DIA_Parlan_TEACH_MANA_Info;
	permanent = TRUE;
	description = "Cht?l bych pos?lit svoji magickou moc.";
};


func int DIA_Parlan_TEACH_MANA_Condition()
{
	if(((other.guild == GIL_KDF) || (other.guild == GIL_PAL) || ((other.guild == GIL_NOV) && Npc_KnowsInfo(hero,DIA_Parlan_LEARN))) && (Parlan_Sends == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_TEACH_MANA_Info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_MANA_15_00");	//Cht?l bych pos?lit svoji magickou moc.
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};

func void DIA_Parlan_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_00");	//Tvoje magick? s?la se zv??ila. D?l u? ti pomoci nemohu.
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_01");	//Jestli se chce? u?it d?l, po??dej Pyrokara.
		Parlan_Sends = TRUE;
	};
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
};

func void DIA_Parlan_TEACH_MANA_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};

func void DIA_Parlan_TEACH_MANA_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};


instance DIA_Parlan_MAGE(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_MAGE_Condition;
	information = DIA_Parlan_MAGE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Parlan_MAGE_Condition()
{
	if((other.guild == GIL_KDF) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Parlan_MAGE_Info()
{
	AI_Output(self,other,"DIA_Parlan_MAGE_05_00");	//Slo?il jsi slib, brat?e. V?tej mezi n?mi.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_01");	//A? bude? dostate?n? zku?en?, budu t? u?it v Kruz?ch magie.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_02");	//Na d?kaz, ?e ve tv?ch rukou nyn? d??m? moc, si vezmi tenhle runov? k?men.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
};


instance DIA_Parlan_CIRCLE1(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE1_Condition;
	information = DIA_Parlan_CIRCLE1_Info;
	permanent = TRUE;
	description = "Nau? m? prvn? Kruh magie.";
};


func int DIA_Parlan_CIRCLE1_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE1_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE1_15_00");	//Nau? m? prvn? Kruh magie.
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_01");	//V prvn?m Kruhu magie m??e? pou??vat runy, kter? jsi s?m vytvo?il.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_02");	//Ke stvo?en? run se bude? muset nau?it kouzeln? formule.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_03");	//Ka?d? z n?s se soust?ed? na jeden okruh magie. Dob?e si tedy rozmysli, jak? by ses cht?l v?novat ty.
	};
};


instance DIA_Parlan_CIRCLE2(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE2_Condition;
	information = DIA_Parlan_CIRCLE2_Info;
	permanent = TRUE;
	description = "Nau? m? druh? Kruh magie.";
};


func int DIA_Parlan_CIRCLE2_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE2_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE2_15_00");	//Nau? m? druh? Kruh magie.
	if(Kapitel >= 2)
	{
		if(B_TeachMagicCircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_01");	//Vstup do druh?ho Kruhu a nau? se je?t? siln?j?? magii.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_02");	//Ale m?j na pam?ti, ?e na sebe bere? zodpov?dnost. Ne ke mn? nebo k Pyrokarovi - ale k Innosovi.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_03");	//On ti ukazuje sm?r - cestu v?ak tvo?? tv? skutky.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_04");	//Je?t? nenade?el spr?vn? ?as.
	};
};


instance DIA_Parlan_CIRCLE3(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE3_Condition;
	information = DIA_Parlan_CIRCLE3_Info;
	permanent = TRUE;
	description = "Nau? m? t?et? Kruh magie.";
};


func int DIA_Parlan_CIRCLE3_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE3_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE3_15_00");	//Nau? m? t?et? Kruh magie.
	if(Kapitel >= 3)
	{
		if(B_TeachMagicCircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_01");	//Ano, u? nade?el ten spr?vn? ?as. Vstup do t?et?ho Kruhu magie. Nov? kouzla t? ji? o?ek?vaj?.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_02");	//Bude? je pot?ebovat, proto?e Zlo se stahuje a odrazit jej m??e jen Innosova s?la.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_03");	//U? jsem t? nau?il v?em Kruh?m, jimi? jsem t? mohl prov?st. Vy??? Kruhy t? nau?? Karas.
			B_LogEntry(Topic_KlosterTeacher,"Bratr Parlan m? nau?il prvn? t?i kruhy. Do dal??ch m? uvede bratr Karras.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_04");	//Je?t? nenade?el prav? ?as, aby ses nau?il t?et? Kruh.
	};
};


instance DIA_Parlan_TEACH(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_TEACH_Condition;
	information = DIA_Parlan_TEACH_Info;
	permanent = TRUE;
	description = "U? m?!";
};


func int DIA_Parlan_TEACH_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Parlan_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//U? m?!
	Info_ClearChoices(DIA_Parlan_TEACH);
	Info_AddChoice(DIA_Parlan_TEACH,Dialog_Back,DIA_Parlan_TEACH_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),DIA_Parlan_TEACH_LIGHT_HEAL);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_Light] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_LIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),DIA_Parlan_TEACH_LIGHT);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),DIA_Parlan_TEACH_WINDFIST);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),DIA_Parlan_TEACH_Sleep);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MediumHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_MediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MediumHeal)),DIA_Parlan_TEACH_MediumHeal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_Fear] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),DIA_Parlan_TEACH_Fear);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),DIA_Parlan_TEACH_DestroyUndead);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),DIA_Parlan_TEACH_FullHeal);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_05_01");	//V tuhle chv?li t? nemohu nau?it ??dn? dal?? formule.
	};
};

func void DIA_Parlan_TEACH_BACK()
{
	Info_ClearChoices(DIA_Parlan_TEACH);
};

func void DIA_Parlan_TEACH_LIGHT_HEAL()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void DIA_Parlan_TEACH_LIGHT()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};

func void DIA_Parlan_TEACH_WINDFIST()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void DIA_Parlan_TEACH_Sleep()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Sleep);
};

func void DIA_Parlan_TEACH_MediumHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MediumHeal);
};

func void DIA_Parlan_TEACH_Fear()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Fear);
};

func void DIA_Parlan_TEACH_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void DIA_Parlan_TEACH_FullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};


instance DIA_Parlan_Kap2_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap2_EXIT_Condition;
	information = DIA_Parlan_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_Parlan_Exit()
{
	AI_Output(self,other,"DIA_Parlan_EXIT_05_00");	//Nech? t? Innos ochra?uje.
};


instance DIA_Parlan_Kap3_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap3_EXIT_Condition;
	information = DIA_Parlan_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_IAmParlan(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_IAmParlan_Condition;
	information = DIA_Parlan_IAmParlan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Parlan_IAmParlan_Condition()
{
	if((Kapitel >= 3) && Npc_IsInState(self,ZS_Talk) && ((other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Parlan_IAmParlan_Info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_00");	//Vid?m, ?e ses nakonec rozhodl bojovat po na?em boku. Jsem r?d.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_01");	//Bude se n?m hodit ka?d? ruka. B?? si promluvit p??mo s Mardukem, ten zodpov?d? za v?s paladiny.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_02");	//Netu??m, pro? ti byl povolen vstup sem do kl??tera. Jsem Parlan a zodpov?d?m za v?s nov??ky.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_03");	//Nerad bych, abys je zdr?oval od pr?ce sv?mi hloup?mi ot?zkami. Je to jasn??
		Parlan_DontTalkToNovice = LOG_Running;
		Info_ClearChoices(DIA_Parlan_IAmParlan);
		Info_AddChoice(DIA_Parlan_IAmParlan,"Budu si d?lat, co se mi zl?b?.",DIA_Parlan_IAmParlan_MyChoice);
		Info_AddChoice(DIA_Parlan_IAmParlan,"Jasn?.",DIA_Parlan_IAmParlan_OK);
	};
	Wld_InsertItem(ItKe_KlosterBibliothek,"NW_MONASTERY_CORRIDOR_02");
};

func void DIA_Parlan_IAmParlan_MyChoice()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_MyChoice_15_00");	//Budu si d?lat, co se mi zl?b?.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_01");	//Ur?it? je n?jak? d?vod, pro? tu jsi trp?n, ale v?echno m? sv? meze.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_02");	//Kdy? bude? d?lat probl?my, zaplat?? za to. Tak se dr? od novic? d?l.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};

func void DIA_Parlan_IAmParlan_OK()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_OK_15_00");	//Jasn?.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_OK_05_01");	//To douf?m.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};


instance DIA_Parlan_Bibliothek(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 40;
	condition = DIA_Parlan_Bibliothek_Condition;
	information = DIA_Parlan_Bibliothek_Info;
	permanent = FALSE;
	description = "M?? pro m? je?t? n?co?";
};


func int DIA_Parlan_Bibliothek_Condition()
{
	if((other.guild != GIL_KDF) && (Kapitel >= 3) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Bibliothek_Info()
{
	AI_Output(other,self,"DIA_Parlan_Bibliothek_15_00");	//M?? pro m? je?t? n?co?
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_01");	//Ano. Jako?to ?len knihovny bys m?l dostat kl?? ke knihovn?. Najde? tam bratry Karase a Hyglase.
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_02");	//Pokud chce?, m??e? si tam s nimi promluvit
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_DontDisturb_05_03");	//Ale od novic? se dr? d?l!
	};
	B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
};


instance DIA_Parlan_DontDisturb(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_DontDisturb_Condition;
	information = DIA_Parlan_DontDisturb_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_DontDisturb_Condition()
{
	if((Parlan_DontTalkToNovice == LOG_SUCCESS) && (B_GetGreatestPetzCrime(self) == CRIME_NONE) && ((other.guild != GIL_PAL) || (other.guild != GIL_NOV) || (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Parlan_DontDisturb_Info()
{
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_00");	//(v?hr??n?) Nerad bych se opakoval. Dr? se od novic? d?l.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_01");	//M?li by o?istit sv? du?e fyzickou prac? a p?ipravit se na ?ivot v kl??te?e.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_02");	//(r?zn?) Dal?? vyru?ov?n? nebudu tolerovat!
	Parlan_DontTalkToNovice = LOG_Running;
};


instance DIA_Parlan_Kap3U4U5_PERM(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_Kap3U4U5_PERM_Condition;
	information = DIA_Parlan_Kap3U4U5_PERM_Info;
	permanent = TRUE;
	description = "Kde bych na?el...";
};


func int DIA_Parlan_Kap3U4U5_PERM_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3U4U5_PERM_Info()
{
	AI_Output(other,self,"DIA_Parlan_Kap3_PERM_15_00");	//Kde bych na?el...
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,Dialog_Back,DIA_Parlan_Kap3U4U5_PERM_Back);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"... kostel?",DIA_Parlan_Kap3U4U5_PERM_Church);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"... knihovnu?",DIA_Parlan_Kap3U4U5_PERM_Library);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"... kapli?",DIA_Parlan_Kap3U4U5_PERM_Chapel);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"... sklepy?",DIA_Parlan_Kap3U4U5_PERM_Cellar);
};

func void DIA_Parlan_Kap3U4U5_PERM_Back()
{
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
};

func void DIA_Parlan_Kap3U4U5_PERM_Church()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00");	//... kostel?
	AI_Output(self,other,"DIA_Parlan_Add_05_00");	//Bo?e v?emohouc?! Copak t? Innos oslepil?
	AI_Output(self,other,"DIA_Parlan_Add_05_01");	//(sarkasticky) Kdepak je kostel? Bo???ku, kde by asi tak mohl b?t?
};

func void DIA_Parlan_Kap3U4U5_PERM_Library()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00");	//... knihovnu?
	AI_Output(self,other,"DIA_Parlan_Add_05_02");	//Knihovna je na konci kolon?dy, p??mo naproti kostelu.
};

func void DIA_Parlan_Kap3U4U5_PERM_Chapel()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00");	//... kapli?
	AI_Output(self,other,"DIA_Parlan_Add_05_03");	//Kaple je m?stnost v polovin? kolon?dy nalevo. Paladinov? se v n? modl? k Innosovi.
};

func void DIA_Parlan_Kap3U4U5_PERM_Cellar()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00");	//... sklepy?
	AI_Output(self,other,"DIA_Parlan_Add_05_04");	//Vstup do sklep? je v polovin? kolon?dy napravo.
};


instance DIA_Parlan_Kap4_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap4_EXIT_Condition;
	information = DIA_Parlan_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap4_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_Kap5_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap5_EXIT_Condition;
	information = DIA_Parlan_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap5_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};

