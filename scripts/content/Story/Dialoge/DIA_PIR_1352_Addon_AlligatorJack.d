
instance DIA_Addon_AlligatorJack_Exit(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 999;
	condition = DIA_Addon_AlligatorJack_Exit_Condition;
	information = DIA_Addon_AlligatorJack_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_AlligatorJack_Exit_Condition()
{
	return TRUE;
};


var int DIA_Addon_AlligatorJack_Exit_Info_OneTime;

func void DIA_Addon_AlligatorJack_Exit_Info()
{
	if((MIS_KrokoJagd == LOG_SUCCESS) && (DIA_Addon_AlligatorJack_Exit_Info_OneTime == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_00");	//Jestli?e m? bude? hledat, jsem obvykle n?kde bl?? m?ho t?bora bl?zko palis?d.
		if(PIR_1354_Addon_Henry.aivar[AIV_TalkedToPlayer] == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_AlligatorJack_Exit_15_01");	//Palis?dy?
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_02");	//Prost? jdi na z?pad. Pochop??, co mysl?m.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DIA_Addon_AlligatorJack_Exit_Info_OneTime = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_AlligatorJack_PICKPOCKET(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 900;
	condition = DIA_Addon_AlligatorJack_PICKPOCKET_Condition;
	information = DIA_Addon_AlligatorJack_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Addon_AlligatorJack_PICKPOCKET_Condition()
{
	return C_Beklauen(100,333);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
	Info_AddChoice(DIA_Addon_AlligatorJack_PICKPOCKET,Dialog_Back,DIA_Addon_AlligatorJack_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_AlligatorJack_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_AlligatorJack_PICKPOCKET_DoIt);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
};


instance DIA_Addon_AlligatorJack_Hello(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Hello_Condition;
	information = DIA_Addon_AlligatorJack_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_Hello_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_00");	//Kdo tedy MَE? b?t? Nevypad?? jako ostatn?.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Hello_15_01");	//Jac? dal???
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_02");	//Mysl?m m?gy, kte?? si vykra?uj? v t?ch ruin?ch naho?e.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_03");	//Pat??? do toho spolku?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_04");	//P?kn? odv??n?, ?e se tu potuluje? s?m.
};


instance DIA_Addon_AlligatorJack_WerBistDu(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_WerBistDu_Condition;
	information = DIA_Addon_AlligatorJack_WerBistDu_Info;
	description = "Kdo jsi?";
};


func int DIA_Addon_AlligatorJack_WerBistDu_Condition()
{
	return TRUE;
};

func void DIA_Addon_AlligatorJack_WerBistDu_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WerBistDu_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_01");	//Pravd?podobn? si u? o m? sly?el.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_02");	//(py?n?) J? jsem Alligator Jack.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_03");	//Ob?van? ve v?ech zem?ch. J? a ostatn? jsme nejnebezpe?n?j?? pir?ti v okol?.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_04");	//Spole?n? s na??m kapit?nem Gregem jsme vylupovali obchodn? lod?.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_05");	//Stoj?? p?ed ?ivouc? legendou a to je co ??ct.
};


instance DIA_Addon_AlligatorJack_Vorschlag(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Vorschlag_Condition;
	information = DIA_Addon_AlligatorJack_Vorschlag_Info;
	description = "Zn?? n?koho, kdo se jmenuje Raven?";
};


func int DIA_Addon_AlligatorJack_Vorschlag_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Vorschlag_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_15_00");	//Zn?? n?koho, kdo se jmenuje Raven?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_01");	//Jasn?. Je v?dcem bandit? na v?chod?.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_02");	//Co od N?J chce??
	B_LogEntry(TOPIC_Addon_RavenKDW,"Raven a jeho banditi jsou schovan? u v?chodu z ?dol?.");
	Info_ClearChoices(DIA_Addon_AlligatorJack_Vorschlag);
	Info_AddChoice(DIA_Addon_AlligatorJack_Vorschlag,"Chci se k n?mu p?ipojit.",DIA_Addon_AlligatorJack_Vorschlag_join);
	Info_AddChoice(DIA_Addon_AlligatorJack_Vorschlag,"Mus?m ho zab?t.",DIA_Addon_AlligatorJack_Vorschlag_tot);
};

func void B_AlligatorJack_Besser()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_00");	//M?m lep?? n?pad.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_01");	//P?ipoj se k n?m.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_02");	//D?kladn? si to promysli.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_03");	//Jen co zkus?? dom?c? rum, sv?t se ti bude zd?t mnohem kr?sn?j??.
	Info_ClearChoices(DIA_Addon_AlligatorJack_Vorschlag);
};

func void DIA_Addon_AlligatorJack_Vorschlag_tot()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_tot_15_00");	//Mus?m ho zab?t.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_01");	//(sm?je se) Co? TY? Jak mysl??, ?e HO odstran???
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_02");	//Nen? ten chlap na tebe trochu velk? sousto?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_03");	//V?bec se k n?mu nedostane?. Bandit?, kter? shrom??dil, t? stejmou d??v, ne? ho jen spat???.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_04");	//Nedostne? se ani p?es prvn? p?edsunutou hl?dku.
	B_AlligatorJack_Besser();
};

func void DIA_Addon_AlligatorJack_Vorschlag_join()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_join_15_00");	//Chci se k n?mu p?ipojit.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_01");	//(opatrn?) Je to tak?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_02");	//Nevypad??, jako n?kdo, kdo by se cht?l p?idat k t?m bl?zn?m.
	B_AlligatorJack_Besser();
};


instance DIA_Addon_AlligatorJack_BDTRuestung(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_BDTRuestung_Condition;
	information = DIA_Addon_AlligatorJack_BDTRuestung_Info;
	description = "Pot?ebuji zbroj bandit?.";
};


func int DIA_Addon_AlligatorJack_BDTRuestung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Vorschlag) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_BDTRuestung_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_15_00");	//Pot?ebuji zbroj bandit?.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_01");	//A co s N??
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_02");	//Dostane? se jenom do probl?m?, jenom co t? n?kdo uvid? ji nosit.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_03");	//Ka?d? si bude myslet, ?e jsi bandita a bude se t? sna?it zab?t.
	Info_ClearChoices(DIA_Addon_AlligatorJack_BDTRuestung);
	Info_AddChoice(DIA_Addon_AlligatorJack_BDTRuestung,"M?? n?jak? n?pad, kde bych mohl sehnat takov? brn?n??",DIA_Addon_AlligatorJack_BDTRuestung_wo);
	Info_AddChoice(DIA_Addon_AlligatorJack_BDTRuestung,"To zn? dob?e.",DIA_Addon_AlligatorJack_BDTRuestung_gut);
};

func void DIA_Addon_AlligatorJack_BDTRuestung_gut()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00");	//To zn? dob?e.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01");	//Jo, ale pro n?koho, kdo je sebevrah.
};

func void DIA_Addon_AlligatorJack_BDTRuestung_wo()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00");	//M?? n?jak? n?pad, kde bych mohl sehnat takov? brn?n??
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01");	//Mysl?m, ?e m?me jednu v pir?tsk?m t?bo?e.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03");	//Ale nev?m, jestli tam je?t? je.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Pir?ti kdysi m?li zbroj bandit?. Aligator Jack mi nem??e ??ct jestli je?t? existuje.");
	Info_ClearChoices(DIA_Addon_AlligatorJack_BDTRuestung);
};


instance DIA_Addon_AlligatorJack_Greg(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Greg_Condition;
	information = DIA_Addon_AlligatorJack_Greg_Info;
	description = "Tv?j kapit?n se jmenuje Greg?";
};


func int DIA_Addon_AlligatorJack_Greg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_00");	//Tv?j kapit?n se jmenuje Greg?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_01");	//Jo. Je nejv?t?? pir?t, kter?ho kdy oce?n splodil.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_02");	//Mysl?m, ?e zn?m tv?ho kapit?na. Potkal jsem ho v Khorinisu.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_03");	//(sm?je se) Greg? V khorinisu? Nesmysl!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_04");	//Greg je pry? na mo?sk?m n?jezdu s p?r chlapci.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_05");	//Jedin? v?c, kter? by mohla Grega p?iv?st do Khorinisu je v?ze?sk? gal?ra kr?le.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_06");	//Je jedn?m z nejhledan?j??ch m??? v zemi.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_07");	//Nep?jde dobrovoln? do m?sta a nenech? kr?lovsk? str??e, aby ho hodily do kobek.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_08");	//Kdy? mysl??.
};


instance DIA_Addon_AlligatorJack_PIRLager(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_PIRLager_Condition;
	information = DIA_Addon_AlligatorJack_PIRLager_Info;
	description = "Kde je tv?j pir?tsk? t?bor?";
};


func int DIA_Addon_AlligatorJack_PIRLager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_PIRLager_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_00");	//Kde je tv?j pir?tsk? t?bor?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_01");	//Vid?? ten tunel tady? Kdy? ho bude? sledovat a pokra?ovat z?padn?, d??v nebo pozd?ji dojde? k na?? pl??i.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_02");	//Tam m?me na?e chatr?e.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_03");	//Pokud chce?, m??u ti uk?zat cestu. Ale mus?? pro m? ud?lat malou laskavost.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_04");	//A co to m? b?t?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_05");	//P?edt?m, ne? se m??u vr?tit do t?bora, mus?m nalovit n?jak? maso pro kluky.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_06");	//Jsi siln? mlad?k.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_07");	//M??u pot?ebovat pomoc s lovem. M?? z?jem?
	Log_CreateTopic(TOPIC_Addon_RatHunt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RatHunt,LOG_Running);
	B_LogEntry(TOPIC_Addon_RatHunt,"Alligatorovi Jackovi se m??e hodit pomoc s loven?m.");
};


instance DIA_Addon_AlligatorJack_WasJagen(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_WasJagen_Condition;
	information = DIA_Addon_AlligatorJack_WasJagen_Info;
	description = "Co lov???";
};


func int DIA_Addon_AlligatorJack_WasJagen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_WasJagen_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_00");	//Co lov???
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_01");	//Nic, obvykle jen aligatory. Ale nem??eme je sn?st.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_02");	//Krom? toho, tu ??dn? nezbyli.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_03");	//Proto lov?m, co se d? j?st. Mo??lov? krysy.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_04");	//Co?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_05");	//V?t?ina potvor okolo chutn? jako lidsk? noha, nebo jsou moc tuh?, jako alligato?? maso.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_06");	//Tlust? ba?inn? krysy jsou jedin? v?c, co se d? j?st.
	B_LogEntry(TOPIC_Addon_RatHunt,"Jedina v?c, co je tady pravd?podobn? k j?dlu je mo?alov? krysa.");
};


instance DIA_Addon_AlligatorJack_Pirates(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Pirates_Condition;
	information = DIA_Addon_AlligatorJack_Pirates_Info;
	permanent = FALSE;
	description = "?ekni mi v?ce o pir?tech.";
};


func int DIA_Addon_AlligatorJack_Pirates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Pirates_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Pirates_15_00");	//?ekni mi v?ce o pir?tech.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_01");	//?ili jsme tu cel? roky. Za star?ch ?as?, p?ed v?lkou, ka?d? odsud a? po kontinent v?d?l, kdo jsme.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_02");	//Na?e vlajka na obzoru sta?ila, aby vyd?sila obchodn? lod?.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_03");	//Ale tyto dny skon?ili. Jsou to t?dny, co jsme m?li obchodn? lo? p?ed st??n?.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_04");	//Kapit?n Greg se ?el pod?vat znovu, jestli n?hodou nem??e jednu polapit.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_05");	//Zbytek z n?s sed? okolo t?bora a to?? palcema, dokud se nevr?t?.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_06");	//Doufejme, ?e p?inese n?jakou dobrou ko?ist.
};


instance DIA_Addon_AlligatorJack_LetsGoHunting(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_LetsGoHunting_Condition;
	information = DIA_Addon_AlligatorJack_LetsGoHunting_Info;
	permanent = TRUE;
	description = "Jdeme na lov.";
};


func int DIA_Addon_AlligatorJack_LetsGoHunting_Condition()
{
	if((MIS_KrokoJagd == FALSE) && Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WasJagen) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_LetsGoHunting_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00");	//Jdeme na lov.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_01");	//Dob?e. I pro dva je to dost pr?ce.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02");	//Jsi p?ipraven?
	Info_ClearChoices(DIA_Addon_AlligatorJack_LetsGoHunting);
	Info_AddChoice(DIA_Addon_AlligatorJack_LetsGoHunting,"Ne, je?t? ne.",DIA_Addon_AlligatorJack_LetsGoHunting_No);
	Info_AddChoice(DIA_Addon_AlligatorJack_LetsGoHunting,"Ano.",DIA_Addon_AlligatorJack_LetsGoHunting_Yes);
};


const int AlligatorJack_Inter1 = 1;
const int AlligatorJack_Kessel = 2;
const int AlligatorJack_Inter2 = 3;
const int AlligatorJack_Canyon = 4;

func void DIA_Addon_AlligatorJack_LetsGoHunting_Yes()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00");	//Ano.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01");	//Dob?e. Dr? se za mnou.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"HUNT1");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	AlligatorJack_JagdStart = AlligatorJack_Inter1;
	MIS_KrokoJagd = LOG_Running;
};

func void DIA_Addon_AlligatorJack_LetsGoHunting_No()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00");	//Ne, je?t? ne.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01");	//Pak si posp??.
	Info_ClearChoices(DIA_Addon_AlligatorJack_LetsGoHunting);
};


instance DIA_Addon_AlligatorJack_AlligatorJackInter1(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition;
	information = DIA_Addon_AlligatorJack_AlligatorJackInter1_Info;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Inter1) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter1_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00");	//Roklina.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01");	//Tady mo?n? najdeme n?jak? zv??ata.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02");	//Poj? za mnou.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT2");
	AlligatorJack_JagdStart = AlligatorJack_Kessel;
};


instance DIA_Addon_AlligatorJack_TheHunt(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_TheHunt_Condition;
	information = DIA_Addon_AlligatorJack_TheHunt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_TheHunt_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Kessel) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WATERHOLE_07") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TheHunt_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_00");	//To je to, ?eho jsem se ob?val.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_15_01");	//Co?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_02");	//Masa z t?ch potvor je jenom polovina, ne? pot?ebuju.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_03");	//Te? mus?me j?t tak? do ka?onu.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_04");	//D?vej bacha. Hloub?ji v ka?onu u? je to trochu nebezpe?n?j??.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_05");	//Pokud m?? r?d sv?j ?ivot, tak se m? dr?.
	Wld_InsertNpc(Waran,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(Waran,"ADW_ENTRANCE_2_VALLEY_10");
	Info_ClearChoices(DIA_Addon_AlligatorJack_TheHunt);
	Info_AddChoice(DIA_Addon_AlligatorJack_TheHunt,"CO je v ka?onu?",DIA_Addon_AlligatorJack_TheHunt_Enough);
	Info_AddChoice(DIA_Addon_AlligatorJack_TheHunt,"Dobr?, jdeme.",DIA_Addon_AlligatorJack_TheHunt_Running);
};

func void DIA_Addon_AlligatorJack_TheHunt_Enough()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Enough_15_00");	//CO je v ka?onu?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01");	//Pokud to bude mo?n?, tak se tomu vyhneme.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_02");	//Jsou tam b?itvy. P?kn? vytrval?. Dr? se od nich d?l, pokud chce? ??t.
};

func void DIA_Addon_AlligatorJack_TheHunt_Running()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00");	//Dobr?, jdeme.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01");	//Jasn?.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT3");
	AlligatorJack_JagdStart = AlligatorJack_Inter2;
};


instance DIA_Addon_AlligatorJack_AlligatorJackInter2(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition;
	information = DIA_Addon_AlligatorJack_AlligatorJackInter2_Info;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Inter2) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter2_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00");	//Poj? sem.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT4");
	AlligatorJack_JagdStart = AlligatorJack_Canyon;
};


instance DIA_Addon_AlligatorJack_HuntEnd(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_HuntEnd_Condition;
	information = DIA_Addon_AlligatorJack_HuntEnd_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_HuntEnd_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Canyon) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_HuntEnd_Info()
{
	if(AlligatorJack_KrokosKilled == 0)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_00");	//Te? mi ?ekni, pro? jsem t? vlastn? bral sebou?
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_01");	//Nezabil jsi ani jednu mo??lovou krysu.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_02");	//Hmm, dobr?, mo?n? se uk??e? v?c pot?ebn? p???t?.
	}
	else if(AlligatorJack_KrokosKilled == 1)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_03");	//Velmi dob?e! M??eme pot?ebovat n?koho, jako si ty.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_04");	//Na tv?m prvn?m lovu jsi ulovil jednu z t?ch potvor. To nen? ?patn?.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_05");	//M?? opravdov? talent.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_06");	//Zatracen?, pokud bude? pokra?ovat jako te?, m??u z?stat v t?bo?e.
	};
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_07");	//Tady, vem tohle krys? maso a dones to tomu povale?i Morganovi.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_08");	//Najde? ho v na?em t?bo?e.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_09");	//Pravd?podobn? se povaluje n?kde okolo pl??e. Mysl?m, ?e t? u? o?ek?v?.
	if(PIR_1354_Addon_Henry.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_10");	//U vchodu do t?bora najde? pravd?podobn? Henryho. Star? se o hl?d?ni v p??pad?, ?e by za?to?ili bandit?.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_11");	//Jestli t? nepust? dovnit?, tak mu ?ekni, ?e t? pos?l?m.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_12");	//To by ho m?lo ud?lat p??pustn?j??m.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_13");	//Henry m??e b?t trochu nep??jemn? a r?d ??fuje.
	};
	MIS_AlligatorJack_BringMeat = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_BringMeat,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BringMeat,LOG_Running);
	B_LogEntry(TOPIC_Addon_BringMeat,"Alligator Jack mi dal 10 kousk? masa. M?m je p?in?st Morganovi.");
	B_LogEntry(TOPIC_Addon_RatHunt,"Lov byl usp??n?. Zabyli jsme n?kolik ba?inn?ch krys.");
	B_GiveInvItems(self,other,ItFoMuttonRaw,10);
	MIS_KrokoJagd = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_KrokoJagd);
};


instance DIA_Addon_AlligatorJack_Angus(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Angus_Condition;
	information = DIA_Addon_AlligatorJack_Angus_Info;
	permanent = FALSE;
	description = "Zn?? Anguse a jeho kamar?da Hanka?";
};


func int DIA_Addon_AlligatorJack_Angus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_AngusnHank) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Angus_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_00");	//Zn?? Anguse a jeho kamar?da Hanka?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_03");	//Docela dlouho jsem je nevid?l.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_04");	//Vlastn? si mysl?m, ?e se u? znovu neobjev?.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_05");	//Pro??
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_06");	//Tihle idioti se jen poflakovali kolem jezera a byli st?le vyd??en?.
};


instance DIA_Addon_AlligatorJack_Lake(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Lake_Condition;
	information = DIA_Addon_AlligatorJack_Lake_Info;
	permanent = FALSE;
	description = "U kter?ho jezera se potloukali?";
};


func int DIA_Addon_AlligatorJack_Lake_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Angus) == TRUE) && (MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Lake_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_00");	//U kter?ho jezera se potloukali?
	if(MIS_KrokoJagd == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_01");	//Pamatuje? n?? lov?
		AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_02");	//Ano.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_03");	//Jezero v roklin?. Tam jsem je v?t?inou vid?l.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_04");	//Na jezeru ve velk? kotlin?.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_05");	//Jenom jdi na v?chod z na?eho t?bora. Nem??e? to minout.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_06");	//M? to hodn? mal?ch vodop?d?.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_07");	//Ale bu? opatrn?. Jestli nic nem??, ale c?t?? such? p?sek pod sv?ma nohama,tak si se ?patn? oto?il a vstoupil do ka?onu.
	};
	B_LogEntry(TOPIC_Addon_SkipsGrog,"Jak se zd? jeskyn? je na v?chod od t?bora. Na pravo jezera.");
};


instance DIA_Addon_AlligatorJack_CanLearn(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_CanLearn_Condition;
	information = DIA_Addon_AlligatorJack_CanLearn_Info;
	permanent = TRUE;
	description = "M??e? m? n?co nau?it?";
};


func int DIA_Addon_AlligatorJack_CanLearn_Condition()
{
	if(AlligatorJack_Addon_TeachPlayer == FALSE)
	{
		if((Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_HuntEnd) == TRUE) || (GregIsBack == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_AlligatorJack_CanLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_CanLearn_15_00");	//M??e? m? n?co nau?it?
	if(MIS_KrokoJagd > LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_01");	//Jasn?, jsem dobr? lovec.M??u ti uk?zat jak st?hnout zv??ata a jak vyndat jejich zuby.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_02");	//M??i ti to uk?zat, jestli chce?.
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher,"Alligator Jack m? m??e nau?it jak st?hnout ze zv??at k??i a vyndat jejich zuby. M??e m? tak? nau?it st??let z luku.");
		AlligatorJack_Addon_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_03");	//Nejd?iv mi mus?? uk?zat, jak si p?ipraven? na lov.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_04");	//Kdy? budeme na lovu spole?n?, mo?n? to zvl?dnu.
	};
};

func void B_AJ_Teach()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_Teach);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,Dialog_Back,DIA_Addon_AlligatorJack_Teach_Back);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Addon_AlligatorJack_Teach_Bow_5);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Addon_AlligatorJack_Teach_Bow_1);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,B_BuildLearnString("Stahov?n? k??e",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ReptileSkin)),DIA_Addon_AlligatorJack_Teach_FUR);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,B_BuildLearnString("V?jmut? zub?",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Addon_AlligatorJack_Teach_Teeth);
};


instance DIA_Addon_AlligatorJack_Teach(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Teach_Condition;
	information = DIA_Addon_AlligatorJack_Teach_Info;
	permanent = TRUE;
	description = "U? m?!";
};


func int DIA_Addon_AlligatorJack_Teach_Condition()
{
	if(AlligatorJack_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Teach_15_00");	//U? m?!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_12_01");	//Co chce? v?d?t?
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_Teach);
};

func void DIA_Addon_AlligatorJack_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,75);
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,75);
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_FUR()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	{
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ReptileSkin))
		{
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_Fur_12_00");	//V?dy jedin? ?ez pod?l b?icha, nebo to zni?? kvalitu.
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Teeth()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth);
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};

func void B_AlliJack_AlliKlar()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Anheuern_12_01");	//Jasn?.
};


instance DIA_Addon_AlligatorJack_Anheuern(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 11;
	condition = DIA_Addon_AlligatorJack_Anheuern_Condition;
	information = DIA_Addon_AlligatorJack_Anheuern_Info;
	permanent = FALSE;
	description = "Poj?me lovit.";
};


func int DIA_Addon_AlligatorJack_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Anheuern_15_00");	//Poj?me lovit.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos(self);
	B_Addon_PiratesFollowAgain();
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_Addon_AlligatorJack_ComeOn(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 12;
	condition = DIA_Addon_AlligatorJack_ComeOn_Condition;
	information = DIA_Addon_AlligatorJack_ComeOn_Info;
	permanent = TRUE;
	description = "Jdeme na lov.";
};


func int DIA_Addon_AlligatorJack_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_KommMit_15_00");	//Jdeme na lov.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_AlliJack_AlliKlar();
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_AlligatorJack_GoHome(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 13;
	condition = DIA_Addon_AlligatorJack_GoHome_Condition;
	information = DIA_Addon_AlligatorJack_GoHome_Info;
	permanent = TRUE;
	description = "U? t? nepot?ebuji";
};


func int DIA_Addon_AlligatorJack_GoHome_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_DontNeedYou_15_00");	//U? t? nepot?ebuji.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_AlligatorJack_TooFar(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 14;
	condition = DIA_Addon_AlligatorJack_TooFar_Condition;
	information = DIA_Addon_AlligatorJack_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TooFar_Info()
{
	B_Say(self,other,"$RUNAWAY");
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

