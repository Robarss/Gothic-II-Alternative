
instance DIA_Addon_Erol_EXIT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 999;
	condition = DIA_Addon_Erol_EXIT_Condition;
	information = DIA_Addon_Erol_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Erol_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Erol_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Erol_PICKPOCKET(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 900;
	condition = DIA_Addon_Erol_PICKPOCKET_Condition;
	information = DIA_Addon_Erol_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Tyto 3 kamené tabulky by šli ukrást .)";
};


func int DIA_Addon_Erol_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (70 - Theftdiff)) && (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Erol_PICKPOCKET,Dialog_Back,DIA_Addon_Erol_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Erol_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Erol_PICKPOCKET_DoIt);
};

func void DIA_Addon_Erol_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 70)
	{
		CreateInvItems(self,ItWr_StonePlateCommon_Addon,3);
		B_GiveInvItems(self,other,ItWr_StonePlateCommon_Addon,3);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Addon_Erol_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
};


instance DIA_Addon_Erol_Hallo(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Hallo_Condition;
	information = DIA_Addon_Erol_Hallo_Info;
	description = "Co se děje?";
};


func int DIA_Addon_Erol_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Hallo_15_00");	//Co se děje?
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_01");	//(rozmrzele) Co se děje? Podívej se na ten nepořádek tam pod mostem.
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_02");	//(rozmrzele) Za celý život jsem neviděl nic podobného. Někdo by je z tama měl vykouřit, to ti řeknu.
};


instance DIA_Addon_Erol_what(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_what_Condition;
	information = DIA_Addon_Erol_what_Info;
	description = "Co se stalo?";
};


func int DIA_Addon_Erol_what_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_what_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Erol_what_10_01");	//Byl jsem na cestách se svými asistenty, když nějací příšerní muži skočili na můj vozík a každého srazili dolů.
	AI_Output(self,other,"DIA_Addon_Erol_what_10_02");	//Díky bohu se umím trochu bránit, a tak mě nedostali.
	Log_CreateTopic(TOPIC_Addon_Erol,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol,LOG_Running);
	B_LogEntry(TOPIC_Addon_Erol,"Obchodník Erol byl přepaden bandity. Vzali mu veškeré jeho zboží. Bandité pod mostem nedaleko hospody U mrtvé harpyje stále mají jeho cenné kamenné desky. Erol by je chtěl získat zpět");
	MIS_Addon_Erol_BanditStuff = LOG_Running;
	Info_ClearChoices(DIA_Addon_Erol_what);
	Info_AddChoice(DIA_Addon_Erol_what,"To pod mostem je tvé?",DIA_Addon_Erol_what_dein);
	Info_AddChoice(DIA_Addon_Erol_what,"Co to bylo za muže?",DIA_Addon_Erol_what_wer);
};

func void DIA_Addon_Erol_what_back()
{
	Info_ClearChoices(DIA_Addon_Erol_what);
};

func void DIA_Addon_Erol_what_dein()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_dein_15_00");	//To pod mostem je tvé?
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_01");	//Kára, zboží, prostě vše.
	if(Npc_HasItems(other,itmi_erolskelch) > 0)
	{
		AI_Output(other,self,"DIA_Addon_Erol_what_dein_Add_15_00");	//Vzal jsem něco ze tvého zboží ...
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_01");	//Nech si to. Nic z toho pro mě nemá žádnou cenu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_02");	//Nic z toho pro mě nemá žádnou cenu.
	};
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_02");	//Jedinou pro mě nenahraditelnou věcí jsou tři kamenné desky. Samozřejmě, že mi je vzali.
	Info_AddChoice(DIA_Addon_Erol_what,Dialog_Back,DIA_Addon_Erol_what_back);
	Info_AddChoice(DIA_Addon_Erol_what,"Kamenné desky?",DIA_Addon_Erol_what_Was);
};

func void DIA_Addon_Erol_what_Was()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_Was_15_00");	//Kamenné desky?
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_01");	//Mágové Vody ve městě je chtějí ode mě koupit a já jsem jim je slíbil.
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_02");	//Musím je mít zpět za každou cenu, nebo velice poškodí moji dobrou reputaci.
	Info_AddChoice(DIA_Addon_Erol_what,"Kde jsi získal tyto kamenné desky?",DIA_Addon_Erol_what_woher);
	Info_AddChoice(DIA_Addon_Erol_what,"Co s nimi chtějí Mágové vody dělat?",DIA_Addon_Erol_what_KDW);
};

func void DIA_Addon_Erol_what_KDW()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_KDW_15_00");	//Co s nimi chtějí mágové Vody dělat?
	AI_Output(self,other,"DIA_Addon_Erol_what_KDW_10_01");	//Chtějí je studovat a pověřili mě, abych jim je přinesl.
};

func void DIA_Addon_Erol_what_woher()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_woher_15_00");	//Odkud máš tyto kamenné desky?
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_01");	//Našel jsem je blízko starých budov vypadajících jako mausolea a ostatní v některých jeskyních.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_02");	//Do dnes jsem byl schopen dodat mnoho věcí, o které mágové žádali.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_03");	//Tady dole jsou celkem vzácné. Severovýchodně od Khorinisu jsem jich ale našel spoustu.
	Info_AddChoice(DIA_Addon_Erol_what,"Proč prostě nenajdeš další?",DIA_Addon_Erol_what_neue);
};

func void DIA_Addon_Erol_what_neue()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_neue_15_00");	//Proč prostě nenajdeš další?
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_01");	//Vyvrtnul jsem si kotník v boji s bandity.
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_02");	//Můžu chodit, ale nechci cestovat tak daleko se špatnou nohou.
};

func void DIA_Addon_Erol_what_wer()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_wer_15_00");	//Co to bylo za muže?
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_01");	//Banditi. Kdo jiný? Skočili na mě z mostu.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_02");	//Každý, kdo chce přejít most, je jimi okraden.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_03");	//Věděl jsem, že jsou nahoře, proto jsem šel pod ním.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_04");	//Ale můj vozík a mé zboží asi vzbudily příliš mnoho pokušení, zdá se.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_05");	//Ti bastardi skočili z mostu - přímo na můj vozík.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_06");	//Zkoušel jsem se za nimi v noci plížit ...
};


instance DIA_Addon_Erol_FernandosWeapons(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_FernandosWeapons_Condition;
	information = DIA_Addon_Erol_FernandosWeapons_Info;
	description = "Potřebuji informace o zásilkách zbraní banditům.";
};


func int DIA_Addon_Erol_FernandosWeapons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_FernandosWeapons_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_15_00");	//Potřebuji informace o zásilkách zbraní banditům.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_01");	//Zásilka zbraní? Jasně, jedna tu je. Nějaký hajzl z města jim prodal mnoho zbraní. Taktak je mohli odnést.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_02");	//Někteří z nich jsou i ti, kteří na mě zaútočili u mostu.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_03");	//Ostatní museli cestovat někam na pastvinu za Bengarovou farmou.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_04");	//Možná chtěli dosáhnout průsmyku.
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons,Dialog_Back,DIA_Addon_Erol_FernandosWeapons_back);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons,"Kde je ta pastvina?",DIA_Addon_Erol_FernandosWeapons_bengar);
};

func void DIA_Addon_Erol_FernandosWeapons_bengar()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_bengar_15_00");	//Kde je ta pastvina?
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_01");	//Přibližně uprostřed ostrova Khorinis leží Orlanova hospoda. Nazývá se "U mrtvé harpyje".
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_02");	//Z tama vede cesta na jih. Tam někde je ta pastvina a poblíž také vchod do Hornického údolí.
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
};

func void DIA_Addon_Erol_FernandosWeapons_back()
{
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
};


instance DIA_Addon_Erol_Stoneplates(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Stoneplates_Condition;
	information = DIA_Addon_Erol_Stoneplates_Info;
	permanent = TRUE;
	description = "O kamenných deskách ...";
};


func int DIA_Addon_Erol_Stoneplates_Condition()
{
	if(MIS_Addon_Erol_BanditStuff == LOG_Running)
	{
		return TRUE;
	};
};


var int StoneplatesCounter;
const int Addon_ErolsStoneplatesOffer = 10;

func void DIA_Addon_Erol_Stoneplates_Info()
{
	var int StoneplatesCount;
	var int XP_Addon_BringStoneplates;
	var int StoneplatesGeld;
	AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_00");	//O kamenných deskách ...
	if(Npc_HasItems(other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		StoneplatesCount = Npc_HasItems(other,ItWr_StonePlateCommon_Addon);
		if(StoneplatesCount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_01");	//Mám jednu z nich.
			B_GivePlayerXP(XP_Addon_BringStoneplate);
			B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,1);
			StoneplatesCounter = StoneplatesCounter + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_02");	//Mám některé z nich.
			if((StoneplatesCount + StoneplatesCounter) >= 3)
			{
				B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,3 - StoneplatesCounter);
				XP_Addon_BringStoneplates = (3 - StoneplatesCounter) * XP_Addon_BringStoneplate;
				StoneplatesCounter = 3;
			}
			else
			{
				B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,StoneplatesCount);
				XP_Addon_BringStoneplates = StoneplatesCount * XP_Addon_BringStoneplate;
				StoneplatesCounter = StoneplatesCounter + StoneplatesCount;
			};
			B_GivePlayerXP(XP_Addon_BringStoneplates);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_03");	//Velmi ti děkuji.
		if(StoneplatesCounter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_04");	//Už pouze dvě chybí.
		}
		else if(StoneplatesCounter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_05");	//Už jen jedna chybí.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_06");	//To stačí, nyní můžu dodržet svůj slib mágům Vody ve městě a pak jít domů.
			MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_07");	//Zaplatím ti za ně, samozřejmě.
		StoneplatesGeld = Addon_ErolsStoneplatesOffer * Npc_HasItems(self,ItWr_StonePlateCommon_Addon);
		CreateInvItems(self,ItMi_Gold,StoneplatesGeld);
		B_GiveInvItems(self,other,ItMi_Gold,StoneplatesGeld);
		Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
		if(MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_08");	//Jdu domů. Jestli chceš, tak se ke mně můžeš přidat.
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_09");	//Možná ti budu schopen něco prodat, když se dostanu domů.
			AI_StopProcessInfos(self);
			AI_UseMob(self,"BENCH",-1);
			AI_GotoWP(self,"NW_TAVERN_TO_FOREST_03");
			Npc_ExchangeRoutine(self,"Start");
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
	}
	else if(C_ScHasMagicStonePlate() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_10");	//A co tyhle?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_11");	//Ne, tento druh kamenných desek je magicky nabitý.
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_12");	//Mágové Vody tyto bohužel nechtějí koupit.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_13");	//Kolik ti jich chybí?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_14");	//Abych si zachránil svou reputaci ve městě u mágů Vody, potřebuji 3 kamenné desky.
	};
};


instance DIA_Addon_Erol_Buerger(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Buerger_Condition;
	information = DIA_Addon_Erol_Buerger_Info;
	description = "Jsi občanem města?";
};


func int DIA_Addon_Erol_Buerger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_Buerger_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Buerger_15_00");	//Jsi občanem města?
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_01");	//Už ne dlouho, můj synu. Nemám rád tyto zkorumpované lidi z Horní čtvrti v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_02");	//Míval jsem velký vliv. Jen abys věděl. Ale to bylo před mnoha měsíci.
};


instance DIA_Addon_Erol_PreTeach(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_PreTeach_Condition;
	information = DIA_Addon_Erol_PreTeach_Info;
	description = "Tys dokázal zahnat bandity?";
};


func int DIA_Addon_Erol_PreTeach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_00");	//Tys dokázal zahnat bandity?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_01");	//Ano. Jsem si jist, že jsou stále na mostě.
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_02");	//Můžeš mi ukázat, jak uděřit tak tvrdě jako ty?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_03");	//Jistěže můžu.
	Erol_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(Topic_OutTeacher,LOG_NOTE);
	B_LogEntry(Topic_OutTeacher,LogText_Addon_Erol_Teach);
};


instance DIA_Addon_Erol_PreTrade(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 100;
	condition = DIA_Addon_Erol_PreTrade_Condition;
	information = DIA_Addon_Erol_PreTrade_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Addon_Erol_PreTrade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") > 2000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTrade_Info()
{
	B_Say(other,self,"$TRADE_2");
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_00");	//Nemůžu ti nic prodat, všechno, co jsem měl, leží pod mostem.
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_01");	//Můžu začít prodávat znova, až se vrátím domů.
	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_02");	//Ale dokud nedostanu zpět mé kamenné desky, nemůžu odsud odejít.
	};
};


instance DIA_Addon_Erol_SLD(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_SLD_Condition;
	information = DIA_Addon_Erol_SLD_Info;
	description = "To je TVŮJ dům?";
};


func int DIA_Addon_Erol_SLD_Condition()
{
	if(Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 2000)
	{
		return TRUE;
	};
};


var int Erol_IsAtHome;

func void DIA_Addon_Erol_SLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_00");	//(překvapeně) To je TVŮJ dům?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_01");	//Ano. Proč? Co je na tom špatného?
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_02");	//Nemáš problémy se žoldáky?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_03");	//Dokud jsem nevyrušoval je a jejich práci, nechávali mě napokoji.
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_04");	//Kromě toho, jsou tam mí dobří zákazníci a já jsem jim zaplatil, aby dohlídli na můj majetek, zatímco jsem pryč.
	B_GivePlayerXP(XP_Ambient);
	if(Erol_IsAtHome == FALSE)
	{
		Npc_ExchangeRoutine(self,"HOME");
		Erol_IsAtHome = TRUE;
	};
};


instance DIA_Addon_Erol_Trade(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 100;
	condition = DIA_Addon_Erol_Trade_Condition;
	information = DIA_Addon_Erol_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Ukaž mi, co nabízíš.";
};


func int DIA_Addon_Erol_Trade_Condition()
{
	if((MIS_Addon_Erol_BanditStuff == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000))
	{
		return TRUE;
	};
};


var int DIA_Addon_Erol_Trade_OneTime;

func void DIA_Addon_Erol_Trade_Info()
{
	B_GiveTradeInv(self);
	B_Say(other,self,"$TRADE_2");
	AI_Output(self,other,"DIA_Addon_Erol_Trade_10_00");	//Nabídka není moc velká.
	if(Erol_IsAtHome == FALSE)
	{
		Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
		B_LogEntry(Topic_OutTrader,LogText_Addon_ErolTrade);
		Npc_ExchangeRoutine(self,"Home");
		Erol_IsAtHome = TRUE;
	};
};


instance DIA_Addon_Erol_Teach(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 99;
	condition = DIA_Addon_Erol_Teach_Condition;
	information = DIA_Addon_Erol_Teach_Info;
	permanent = TRUE;
	description = "Ukaž mi, jak udeřit tvrději.";
};


func int DIA_Addon_Erol_Teach_Condition()
{
	if(Erol_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Teach_15_00");	//Ukaž mi jak uděřit tvrději.
	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_01");	//Chci něco vrátit.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_02");	//Pomoz mi zachránit mou reputaci tím, že mi vrátíš kamenné desky.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_03");	//A já ti ukážu, jak lépe využít svou sílu v souboji.
	}
	else if(Erol_Bonus == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_00");	//Dobře, sleduj, znám jeden dobrý trik.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_01");	//Když bouchneš, použij sílu celého těla, ne pouze paže.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_02");	//Otoč se bokem, natáhni rameno dopředu a současně vymršti svou paži.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_03");	//(směje se) Když to uděláš správně, poznáš ten rozdíl!
		B_RaiseAttribute(other,ATR_STRENGTH,1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_04");	//Jestli chceš být ještě lepší, musíš na sobě ještě více pracovat ...
		Info_ClearChoices(DIA_Addon_Erol_Teach);
		Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
		Info_AddChoice(DIA_Addon_Erol_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
		Info_AddChoice(DIA_Addon_Erol_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
	};
};

func void DIA_Addon_Erol_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_Erol_Teach);
};

func void DIA_Addon_Erol_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(DIA_Addon_Erol_Teach);
	Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
	Info_AddChoice(DIA_Addon_Erol_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice(DIA_Addon_Erol_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
};

func void DIA_Addon_Erol_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(DIA_Addon_Erol_Teach);
	Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
	Info_AddChoice(DIA_Addon_Erol_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice(DIA_Addon_Erol_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
};

