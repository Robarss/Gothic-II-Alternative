
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
	description = "(Tyto 3 kamen? tabulky by ?li ukr?st .)";
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
	description = "Co se d?je?";
};


func int DIA_Addon_Erol_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Hallo_15_00");	//Co se d?je?
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_01");	//(rozmrzele) Co se d?je? Pod?vej se na ten nepo??dek tam pod mostem.
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_02");	//(rozmrzele) Za cel? ?ivot jsem nevid?l nic podobn?ho. N?kdo by je z tama m?l vykou?it, to ti ?eknu.
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
	AI_Output(self,other,"DIA_Addon_Erol_what_10_01");	//Byl jsem na cest?ch se sv?mi asistenty, kdy? n?jac? p???ern? mu?i sko?ili na m?j voz?k a ka?d?ho srazili dol?.
	AI_Output(self,other,"DIA_Addon_Erol_what_10_02");	//D?ky bohu se um?m trochu br?nit, a tak m? nedostali.
	Log_CreateTopic(TOPIC_Addon_Erol,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol,LOG_Running);
	B_LogEntry(TOPIC_Addon_Erol,"Obchodn?k Erol byl p?epaden bandity. Vzali mu ve?ker? jeho zbo??. Bandit? pod mostem nedaleko hospody U mrtv? harpyje st?le maj? jeho cenn? kamenn? desky. Erol by je cht?l z?skat zp?t");
	MIS_Addon_Erol_BanditStuff = LOG_Running;
	Info_ClearChoices(DIA_Addon_Erol_what);
	Info_AddChoice(DIA_Addon_Erol_what,"To pod mostem je tv??",DIA_Addon_Erol_what_dein);
	Info_AddChoice(DIA_Addon_Erol_what,"Co to bylo za mu?e?",DIA_Addon_Erol_what_wer);
};

func void DIA_Addon_Erol_what_back()
{
	Info_ClearChoices(DIA_Addon_Erol_what);
};

func void DIA_Addon_Erol_what_dein()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_dein_15_00");	//To pod mostem je tv??
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_01");	//K?ra, zbo??, prost? v?e.
	if(Npc_HasItems(other,itmi_erolskelch) > 0)
	{
		AI_Output(other,self,"DIA_Addon_Erol_what_dein_Add_15_00");	//Vzal jsem n?co ze tv?ho zbo?? ...
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_01");	//Nech si to. Nic z toho pro m? nem? ??dnou cenu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_02");	//Nic z toho pro m? nem? ??dnou cenu.
	};
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_02");	//Jedinou pro m? nenahraditelnou v?c? jsou t?i kamenn? desky. Samoz?ejm?, ?e mi je vzali.
	Info_AddChoice(DIA_Addon_Erol_what,Dialog_Back,DIA_Addon_Erol_what_back);
	Info_AddChoice(DIA_Addon_Erol_what,"Kamenn? desky?",DIA_Addon_Erol_what_Was);
};

func void DIA_Addon_Erol_what_Was()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_Was_15_00");	//Kamenn? desky?
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_01");	//M?gov? Vody ve m?st? je cht?j? ode m? koupit a j? jsem jim je sl?bil.
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_02");	//Mus?m je m?t zp?t za ka?dou cenu, nebo velice po?kod? moji dobrou reputaci.
	Info_AddChoice(DIA_Addon_Erol_what,"Kde jsi z?skal tyto kamenn? desky?",DIA_Addon_Erol_what_woher);
	Info_AddChoice(DIA_Addon_Erol_what,"Co s nimi cht?j? M?gov? vody d?lat?",DIA_Addon_Erol_what_KDW);
};

func void DIA_Addon_Erol_what_KDW()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_KDW_15_00");	//Co s nimi cht?j? m?gov? Vody d?lat?
	AI_Output(self,other,"DIA_Addon_Erol_what_KDW_10_01");	//Cht?j? je studovat a pov??ili m?, abych jim je p?inesl.
};

func void DIA_Addon_Erol_what_woher()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_woher_15_00");	//Odkud m?? tyto kamenn? desky?
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_01");	//Na?el jsem je bl?zko star?ch budov vypadaj?c?ch jako mausolea a ostatn? v n?kter?ch jeskyn?ch.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_02");	//Do dnes jsem byl schopen dodat mnoho v?c?, o kter? m?gov? ??dali.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_03");	//Tady dole jsou celkem vz?cn?. Severov?chodn? od Khorinisu jsem jich ale na?el spoustu.
	Info_AddChoice(DIA_Addon_Erol_what,"Pro? prost? nenajde? dal???",DIA_Addon_Erol_what_neue);
};

func void DIA_Addon_Erol_what_neue()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_neue_15_00");	//Pro? prost? nenajde? dal???
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_01");	//Vyvrtnul jsem si kotn?k v boji s bandity.
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_02");	//M??u chodit, ale nechci cestovat tak daleko se ?patnou nohou.
};

func void DIA_Addon_Erol_what_wer()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_wer_15_00");	//Co to bylo za mu?e?
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_01");	//Banditi. Kdo jin?? Sko?ili na m? z mostu.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_02");	//Ka?d?, kdo chce p?ej?t most, je jimi okraden.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_03");	//V?d?l jsem, ?e jsou naho?e, proto jsem ?el pod n?m.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_04");	//Ale m?j voz?k a m? zbo?? asi vzbudily p??li? mnoho poku?en?, zd? se.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_05");	//Ti bastardi sko?ili z mostu - p??mo na m?j voz?k.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_06");	//Zkou?el jsem se za nimi v noci pl??it ...
};


instance DIA_Addon_Erol_FernandosWeapons(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_FernandosWeapons_Condition;
	information = DIA_Addon_Erol_FernandosWeapons_Info;
	description = "Pot?ebuji informace o z?silk?ch zbran? bandit?m.";
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
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_15_00");	//Pot?ebuji informace o z?silk?ch zbran? bandit?m.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_01");	//Z?silka zbran?? Jasn?, jedna tu je. N?jak? hajzl z m?sta jim prodal mnoho zbran?. Taktak je mohli odn?st.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_02");	//N?kte?? z nich jsou i ti, kte?? na m? za?to?ili u mostu.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_03");	//Ostatn? museli cestovat n?kam na pastvinu za Bengarovou farmou.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_04");	//Mo?n? cht?li dos?hnout pr?smyku.
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons,Dialog_Back,DIA_Addon_Erol_FernandosWeapons_back);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons,"Kde je ta pastvina?",DIA_Addon_Erol_FernandosWeapons_bengar);
};

func void DIA_Addon_Erol_FernandosWeapons_bengar()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_bengar_15_00");	//Kde je ta pastvina?
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_01");	//P?ibli?n? uprost?ed ostrova Khorinis le?? Orlanova hospoda. Naz?v? se "U mrtv? harpyje".
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_02");	//Z tama vede cesta na jih. Tam n?kde je ta pastvina a pobl?? tak? vchod do Hornick?ho ?dol?.
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
	description = "O kamenn?ch desk?ch ...";
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
	AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_00");	//O kamenn?ch desk?ch ...
	if(Npc_HasItems(other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		StoneplatesCount = Npc_HasItems(other,ItWr_StonePlateCommon_Addon);
		if(StoneplatesCount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_01");	//M?m jednu z nich.
			B_GivePlayerXP(XP_Addon_BringStoneplate);
			B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,1);
			StoneplatesCounter = StoneplatesCounter + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_02");	//M?m n?kter? z nich.
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
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_03");	//Velmi ti d?kuji.
		if(StoneplatesCounter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_04");	//U? pouze dv? chyb?.
		}
		else if(StoneplatesCounter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_05");	//U? jen jedna chyb?.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_06");	//To sta??, nyn? m??u dodr?et sv?j slib m?g?m Vody ve m?st? a pak j?t dom?.
			MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_07");	//Zaplat?m ti za n?, samoz?ejm?.
		StoneplatesGeld = Addon_ErolsStoneplatesOffer * Npc_HasItems(self,ItWr_StonePlateCommon_Addon);
		CreateInvItems(self,ItMi_Gold,StoneplatesGeld);
		B_GiveInvItems(self,other,ItMi_Gold,StoneplatesGeld);
		Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
		if(MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_08");	//Jdu dom?. Jestli chce?, tak se ke mn? m??e? p?idat.
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_09");	//Mo?n? ti budu schopen n?co prodat, kdy? se dostanu dom?.
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
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_11");	//Ne, tento druh kamenn?ch desek je magicky nabit?.
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_12");	//M?gov? Vody tyto bohu?el necht?j? koupit.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_13");	//Kolik ti jich chyb??
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_14");	//Abych si zachr?nil svou reputaci ve m?st? u m?g? Vody, pot?ebuji 3 kamenn? desky.
	};
};


instance DIA_Addon_Erol_Buerger(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Buerger_Condition;
	information = DIA_Addon_Erol_Buerger_Info;
	description = "Jsi ob?anem m?sta?";
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
	AI_Output(other,self,"DIA_Addon_Erol_Buerger_15_00");	//Jsi ob?anem m?sta?
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_01");	//U? ne dlouho, m?j synu. Nem?m r?d tyto zkorumpovan? lidi z Horn? ?tvrti v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_02");	//M?val jsem velk? vliv. Jen abys v?d?l. Ale to bylo p?ed mnoha m?s?ci.
};


instance DIA_Addon_Erol_PreTeach(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_PreTeach_Condition;
	information = DIA_Addon_Erol_PreTeach_Info;
	description = "Tys dok?zal zahnat bandity?";
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
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_00");	//Tys dok?zal zahnat bandity?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_01");	//Ano. Jsem si jist, ?e jsou st?le na most?.
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_02");	//M??e? mi uk?zat, jak ud??it tak tvrd? jako ty?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_03");	//Jist??e m??u.
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
	description = "Uka? mi sv? zbo??.";
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
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_00");	//Nem??u ti nic prodat, v?echno, co jsem m?l, le?? pod mostem.
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_01");	//M??u za??t prod?vat znova, a? se vr?t?m dom?.
	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_02");	//Ale dokud nedostanu zp?t m? kamenn? desky, nem??u odsud odej?t.
	};
};


instance DIA_Addon_Erol_SLD(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_SLD_Condition;
	information = DIA_Addon_Erol_SLD_Info;
	description = "To je TV?J d?m?";
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
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_00");	//(p?ekvapen?) To je TV?J d?m?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_01");	//Ano. Pro?? Co je na tom ?patn?ho?
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_02");	//Nem?? probl?my se ?old?ky?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_03");	//Dokud jsem nevyru?oval je a jejich pr?ci, nech?vali m? napokoji.
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_04");	//Krom? toho, jsou tam m? dob?? z?kazn?ci a j? jsem jim zaplatil, aby dohl?dli na m?j majetek, zat?mco jsem pry?.
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
	description = "Uka? mi, co nab?z??.";
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
	AI_Output(self,other,"DIA_Addon_Erol_Trade_10_00");	//Nab?dka nen? moc velk?.
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
	description = "Uka? mi, jak ude?it tvrd?ji.";
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
	AI_Output(other,self,"DIA_Addon_Erol_Teach_15_00");	//Uka? mi jak ud??it tvrd?ji.
	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_01");	//Chci n?co vr?tit.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_02");	//Pomoz mi zachr?nit mou reputaci t?m, ?e mi vr?t?? kamenn? desky.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_03");	//A j? ti uk??u, jak l?pe vyu??t svou s?lu v souboji.
	}
	else if(Erol_Bonus == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_00");	//Dob?e, sleduj, zn?m jeden dobr? trik.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_01");	//Kdy? bouchne?, pou?ij s?lu cel?ho t?la, ne pouze pa?e.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_02");	//Oto? se bokem, nat?hni rameno dop?edu a sou?asn? vymr?ti svou pa?i.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_03");	//(sm?je se) Kdy? to ud?l?? spr?vn?, pozn?? ten rozd?l!
		B_RaiseAttribute(other,ATR_STRENGTH,1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_04");	//Jestli chce? b?t je?t? lep??, mus?? na sob? je?t? v?ce pracovat ...
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

