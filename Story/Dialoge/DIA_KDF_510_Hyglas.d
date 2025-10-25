
instance DIA_Hyglas_Kap1_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap1_EXIT_Condition;
	information = DIA_Hyglas_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Feuer(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Feuer_Condition;
	information = DIA_Hyglas_Feuer_Info;
	permanent = FALSE;
	description = "Požaduji Zkoušku ohně.";
};


func int DIA_Hyglas_Feuer_Condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(other,DIA_Pyrokar_FIRE) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Feuer_Info()
{
	AI_Output(other,self,"DIA_Hyglas_Feuer_15_00");	//Požaduji Zkoušku ohně.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_01");	//Zkouška ohně pochází ze starých časů a už velice dlouho jí nikdo nepodstoupil.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_02");	//Co požaduješ, je velice nebezpečné. Raději si to ještě rozmysli.
};


instance DIA_Hyglas_Hallo(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Hallo_Condition;
	information = DIA_Hyglas_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hyglas_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Hallo_Info()
{
	AI_Output(self,other,"DIA_Hyglas_Hallo_14_00");	//Jsem mistr Hyglas, Strážce ohně a Opatrovník vědomostí.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_01");	//Takže mistr Parlan ti dal svolení ke studiu svitků.
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_02");	//Tudíž přesně to bys teď měl dělat. Studovat, abys ve svatých knihách našel osvícení.
	};
};


instance DIA_Hyglas_JOB(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_JOB_Condition;
	information = DIA_Hyglas_JOB_Info;
	permanent = FALSE;
	description = "Co studuješ ty, mistře?";
};


func int DIA_Hyglas_JOB_Condition()
{
	return TRUE;
};

func void DIA_Hyglas_JOB_Info()
{
	AI_Output(other,self,"DIA_Hyglas_JOB_15_00");	//Co studuješ ty, mistře?
	AI_Output(self,other,"DIA_Hyglas_JOB_14_01");	//Můj výzkum se zaměřuje na oheň - Innosovu sílu.
	AI_Output(self,other,"DIA_Hyglas_JOB_14_02");	//Je to jeho dar a zároveň mocná zbraň - a já vytvářím runy, které obsahují jeho moc.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Hyglas_JOB_15_03");	//Velmi poučné. Mohl bys mě to naučit?
		AI_Output(self,other,"DIA_Hyglas_JOB_14_04");	//Je to Innos, kdo dává dar magie. Jen jeho služebníkům, ohnivým mágům, je přáno vládnout jeho mocí.
	};
};


instance DIA_Hyglas_CONTEST(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_CONTEST_Condition;
	information = DIA_Hyglas_CONTEST_Info;
	permanent = FALSE;
	description = "Požádal jsem o Zkoušku ohně. Ulthar mi dal za úkol vytvořit runu ohnivého šípu.";
};


func int DIA_Hyglas_CONTEST_Condition()
{
	if(MIS_RUNE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_CONTEST_Info()
{
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_00");	//Požádal jsem o Zkoušku ohně. Ulthar mi dal za úkol vytvořit runu ohnivého šípu.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_01");	//A teď po mně chceš, abych tě naučil příslušnou formuli?
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_02");	//Neznám nikoho jiného, kdo by to dokázal.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//Hmm...
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//Dobrá, naučím tě tu formuli. Ale nejdřív budeš muset najít všechny potřebné ingredience.
	B_LogEntry(TOPIC_Rune,"Pokud si obstarám příslušné ingredience, naučí mě Hyglas zaklínadlo pro runu ohnivého šípu.");
};


instance DIA_Hyglas_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_FIREBOLT_Condition;
	information = DIA_Hyglas_FIREBOLT_Info;
	permanent = FALSE;
	description = "Jaké ingredience potřebuji na vytvoření runy ohnivého šípu?";
};


func int DIA_Hyglas_FIREBOLT_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hyglas_CONTEST) && (MIS_RUNE == LOG_Running) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_FIREBOLT_Info()
{
	AI_Output(other,self,"DIA_Hyglas_FIREBOLT_15_00");	//Jaké ingredience potřebuji na vytvoření runy ohnivého šípu?
	AI_Output(self,other,"DIA_Hyglas_FIREBOLT_14_01");	//Přečti si to - je to tam v těch knihách.
};


instance DIA_Hyglas_TALENT_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 990;
	condition = DIA_Hyglas_TALENT_FIREBOLT_Condition;
	information = DIA_Hyglas_TALENT_FIREBOLT_Info;
	permanent = TRUE;
	description = "Nauč mě vytvořit runu OHNIVÉHO ŠÍPU.";
};


func int DIA_Hyglas_TALENT_FIREBOLT_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hyglas_CONTEST) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE) && (Npc_HasItems(other,ItMi_RuneBlank) >= 1) && (Npc_HasItems(other,ItSc_Firebolt) >= 1) && (Npc_HasItems(other,ItMi_Sulfur) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_TALENT_FIREBOLT_Info()
{
	AI_Output(other,self,"DIA_Hyglas_TALENT_FIREBOLT_15_00");	//Nauč mě vytvořit runu OHNIVÉHO ŠÍPU.
	if(B_TeachPlayerTalentRunes(self,other,SPL_Firebolt))
	{
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_01");	//Pokud chceš sestavit runu ohnivého šípu, musíš na runovém stole spojit síru s runovým kamenem.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_02");	//Síla ze svitku s kouzlem ohnivého šípu vplyne do runy a ty získáš Innosův nástroj.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_03");	//Takže jakmile budeš mít všechny potřebné věci, přistup k runovému stolu a vytvoř svou runu.
	};
};


instance DIA_Hyglas_BLANK_RUNE(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_BLANK_RUNE_Condition;
	information = DIA_Hyglas_BLANK_RUNE_Info;
	permanent = FALSE;
	description = "Kde bych mohl najít runový kámen?";
};


func int DIA_Hyglas_BLANK_RUNE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hyglas_FIREBOLT) && (MIS_RUNE == LOG_Running) && (Npc_HasItems(other,ItMi_RuneBlank) < 1) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BLANK_RUNE_Info()
{
	AI_Output(other,self,"DIA_Hyglas_BLANK_RUNE_15_00");	//Kde bych mohl najít runový kámen?
	AI_Output(self,other,"DIA_Hyglas_BLANK_RUNE_14_01");	//Hele, jsi to ty, kdo požádal o Zkoušku ohně, ne já. Najít jej je součástí zkoušky.
};


instance DIA_Hyglas_GOTRUNE(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_GOTRUNE_Condition;
	information = DIA_Hyglas_GOTRUNE_Info;
	permanent = FALSE;
	description = "Vytvořil jsem tu runu.";
};


func int DIA_Hyglas_GOTRUNE_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_Ulthar_SUCCESS) == FALSE) && (Npc_HasItems(hero,ItRu_FireBolt) >= 1) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_GOTRUNE_Info()
{
	AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//Vytvořil jsem tu runu.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_01");	//Inu dobrá. Zdá se, že v této části zkoušky jsi obstál. Konec konců to nebylo až tak těžké.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_02");	//Jdi tedy za Utharem a ukaž mu své dílo.
	B_LogEntry(TOPIC_Rune,"Vytvořil jsem runu ohnivého šípu.");
};


instance DIA_Hyglas_TEACH(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 15;
	condition = DIA_Hyglas_TEACH_Condition;
	information = DIA_Hyglas_TEACH_Info;
	permanent = TRUE;
	description = "Uč mě.";
};


func int DIA_Hyglas_TEACH_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Hyglas_TEACH_15_00");	//Uč mě.
	Info_ClearChoices(DIA_Hyglas_TEACH);
	Info_AddChoice(DIA_Hyglas_TEACH,Dialog_Back,DIA_Hyglas_TEACH_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_Hyglas_TEACH_InstantFireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firestorm)),DIA_Hyglas_TEACH_Firestorm);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),DIA_Hyglas_TEACH_ChargeFireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Hyglas_TEACH_Pyrokinesis);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Hyglas_TEACH_Firerain);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		B_Say(self,other,"$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices(DIA_Hyglas_TEACH);
	};
};

func void DIA_Hyglas_TEACH_BACK()
{
	Info_ClearChoices(DIA_Hyglas_TEACH);
};

func void DIA_Hyglas_TEACH_InstantFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_Hyglas_TEACH_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void DIA_Hyglas_TEACH_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_Hyglas_TEACH_Firestorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firestorm);
};

func void DIA_Hyglas_TEACH_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};


instance DIA_Hyglas_Kap2_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap2_EXIT_Condition;
	information = DIA_Hyglas_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Kap3_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap3_EXIT_Condition;
	information = DIA_Hyglas_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_BringBook(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_BringBook_Condition;
	information = DIA_Hyglas_BringBook_Info;
	permanent = FALSE;
	description = "Co je nového?";
};


func int DIA_Hyglas_BringBook_Condition()
{
	if((Kapitel >= 3) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BringBook_Info()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_01");	//Hm, ano. Asi sis už všiml těch postav s černými rouchy.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_02");	//Setkal jsem se s nimi.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_03");	//To nás přivádí k jádru věci. V tuhle chvíli jsme svědky velice vzácné hvězdné konstelace.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_04");	//Abych byl přesnější, znamení Vola je v přesné korelaci se znamením Válečníka. Předpokládám, že víš, co to znamená.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_05");	//Hmm. No, abych byl upřímný...
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_06");	//Ano, dobrá, chápu. No, nemůžu ti teď vysvětlovat všechno, ale každopádně to předznamenává velké změny. A já nemám změny rád.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_07");	//Proto chci, abys mi z města přinesl jednu knihu. Jmenuje se "Posvátná moc hvězd". Možná ji budeš muset chvilku hledat, ale jsem si jist, že ji nakonec objevíš.
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Info_AddChoice(DIA_Hyglas_BringBook,"Najdi si tu knihu sám.",DIA_Hyglas_BringBook_GetItYourself);
	Info_AddChoice(DIA_Hyglas_BringBook,"Co z toho budu mít?",DIA_Hyglas_BringBook_GetForIt);
	Info_AddChoice(DIA_Hyglas_BringBook,"Uvidím, jestli se mi ji podaří najít.",DIA_Hyglas_BringBook_Yes);
};

func void DIA_Hyglas_BringBook_GetItYourself()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetItYourself_15_00");	//Najdi si tu knihu sám.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_01");	//Jak se opovažuješ se mnou mluvit tímto tónem? Tvoje chování postrádá úctu, kterou mi jsi povinován.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_02");	//Běž mi z očí a přemýšlej o svém chování.
	MIS_HyglasBringBook = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_GetForIt()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_00");	//Co z toho budu mít?
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_01");	//Co tím myslíš?
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_02");	//Rád bych věděl, co dostanu za to, když ti tu knihu přinesu.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_03");	//Nic. Co bys myslel, že dostaneš? Pokud máš čas dělat mi ve městě poslíčka, je přímo tvou povinností mi pomoci.
	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_Yes()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_Yes_15_00");	//Uvidím, jestli se mi ji podaří najít.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_01");	//To je správné - získám tak trochu času navíc, abych se mohl poohlédnout také po něčem jiném.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_02");	//Ale ať ti to netrvá moc dlouhou. Obávám se, že nemáme času nazbyt.
	MIS_HyglasBringBook = LOG_Running;
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Log_CreateTopic(TOPIC_HyglasBringBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HyglasBringBook,LOG_Running);
	B_LogEntry(TOPIC_HyglasBringBook,"Hyglas mě požádal, zda bych mu nenašel knihu 'Božská moc hvězd'. Zkusím se po ní podívat u městských obchodníků.");
};


instance DIA_Hyglas_HaveBook(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_HaveBook_Condition;
	information = DIA_Hyglas_HaveBook_Info;
	permanent = FALSE;
	description = "Mám pro tebe tu knihu.";
};


func int DIA_Hyglas_HaveBook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook) && (Npc_HasItems(other,ItWr_Astronomy_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_HaveBook_Info()
{
	AI_Output(other,self,"DIA_Hyglas_HaveBook_15_00");	//Mám pro tebe tu knihu.
	if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_01");	//Výborně, dej mi ji.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_02");	//Takže sis to nakonec přece jen rozmyslel. Velmi dobře. Tak kde ji máš?
	};
	B_GiveInvItems(other,self,ItWr_Astronomy_Mis,1);
	MIS_HyglasBringBook = LOG_SUCCESS;
	B_GivePlayerXP(XP_HyglasBringBook);
	AI_Output(self,other,"DIA_Hyglas_HaveBook_14_03");	//Můžeš jít. Já půjdu studovat.
};


instance DIA_Hyglas_Kap4_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap4_EXIT_Condition;
	information = DIA_Hyglas_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Kap4_PERM(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 49;
	condition = DIA_Hyglas_Kap4_PERM_Condition;
	information = DIA_Hyglas_Kap4_PERM_Info;
	permanent = TRUE;
	description = "Už jsi na něco přišel?";
};


func int DIA_Hyglas_Kap4_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_PERM_Info()
{
	AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_00");	//Už jsi na něco přišel?
	if(MIS_HyglasBringBook == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_01");	//No, nemohu si být úplně jistý, ale zdá se, že současná konstelace hvězd poukazuje na mnohá nebezpečí.
		AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_02");	//Co za nebezpečí?
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_03");	//Inu, vypadá to, že struktura mezi světy je velice slabá. K vytvoření díry do této struktury je teď zapotřebí jen zlomek síly, co obvykle.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_04");	//Takovéto portály pak mohou používat démoni ke vstupu do našeho světa, aniž by museli čelit nějakému odporu.
		Hyglas_SendsToKarras = TRUE;
	}
	else if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_05");	//Ne, stále čekám na tu knihu.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_06");	//Řekl jsem ti, že stále provádím výzkum, ale samozřejmě by mi to trvalo mnohem déle, kdybych neměl potřebný materiál.
	};
};


instance DIA_Hyglas_Kap5_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap5_EXIT_Condition;
	information = DIA_Hyglas_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_PICKPOCKET(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 900;
	condition = DIA_Hyglas_PICKPOCKET_Condition;
	information = DIA_Hyglas_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Hyglas_PICKPOCKET_Condition()
{
	return C_Beklauen(73,200);
};

func void DIA_Hyglas_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
	Info_AddChoice(DIA_Hyglas_PICKPOCKET,Dialog_Back,DIA_Hyglas_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hyglas_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hyglas_PICKPOCKET_DoIt);
};

func void DIA_Hyglas_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
};

func void DIA_Hyglas_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
};

