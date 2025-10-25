
instance ItWr_SaturasFirstMessage_Addon_Sealed(C_Item)
{
	name = "Zapečetěná zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage_Sealed;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Tato zpráva byla pečlivě zapečetěna.";
};


var int Use_SaturasFirstMessage_OneTime;

func void Use_SaturasFirstMessage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Vážený Vatrasi,");
	Doc_PrintLines(nDocID,0,"Už víme, jak dosáhnout portálu. Měl jsi pravdu. ");
	Doc_PrintLines(nDocID,0,"Jsou tam znaky uctívačů Adanose. Chci tě požádat, abys zkontroloval mé poznámky a to, co jsem našel.");
	Doc_PrintLines(nDocID,0,"Nikdy jsme neviděli takové kameny.");
	Doc_PrintLines(nDocID,0,"Země se třese bez nějakého důvodu.");
	Doc_PrintLines(nDocID,0,"Předpokládám, že brzy zjistíme příčinu.");
	Doc_PrintLines(nDocID,0,"Ornament, který jsem našel, má větší význam, než jsme mu prvně dávali. Zdá se, že je to artefakt-klíč. Ale není kompletní. Musíme to studovat důkladněji.");
	Doc_PrintLines(nDocID,0,"Pošli nám sem někoho z 'Kruhu vody'. A pokud možno, neposílej Cavalorna. ");
	Doc_PrintLines(nDocID,0,"Už jsem ho poučil, aby ten dopis doručil tobě. Myslím, že už pro nás udělal dost.");
	Doc_PrintLines(nDocID,0,"Doufám, že jsem udělal správnou věc.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Saturas");
	Doc_Show(nDocID);
	if((Use_SaturasFirstMessage_OneTime == FALSE) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"Dostal jsem tu zprávu od bandity, kterého asi Cavalorn poslal aby tu zpravu doručil Vatrasovi.  Nyní je to má povinnost.");
		Use_SaturasFirstMessage_OneTime = TRUE;
	};
	if(SC_KnowsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater,"Je tu uskupení, které si samo říká 'Kruh vody'. Mágové vody vnesli řád do tohoto 'Kruhu vody'.");
	};
	if(SC_IsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater,"Cavalorn patří do 'Kruhu vody'.");
	};
	SC_KnowsRanger = TRUE;
};

func void Use_SaturasFirstMessage_Sealed()
{
	CreateInvItems(self,ItWr_SaturasFirstMessage_Addon,1);
	SaturasFirstMessageOpened = TRUE;
	Use_SaturasFirstMessage();
};


instance ItWr_SaturasFirstMessage_Addon(C_Item)
{
	name = "Otevřená zpráva ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage;
	scemeName = "MAP";
	description = name;
	text[2] = "Saturasův dopis Vatrasovi";
};

instance ItMi_Ornament_Addon(C_Item)
{
	name = "Ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Zlomek kruhového ornamentu";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ItMi_Ornament_Addon_Vatras(C_Item)
{
	name = "Ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Zlomek kruhového ornamentu";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ItWr_Map_NewWorld_Ornaments_Addon(C_Item)
{
	name = "Nefariusova mapa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Ornaments;
	description = name;
	text[0] = "Tato mapa označuje místa";
	text[1] = "kde Nefarius předpokládá, že jsou další ornamenty.";
	text[2] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_NewWorld_Ornaments()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_Ornaments_Addon);
	};
	SC_SAW_ORNAMENT_MAP = TRUE;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Ornaments.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_Map_NewWorld_Dexter(C_Item)
{
	name = "Mapa Khorinisu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 210;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Dexter;
	description = name;
	text[0] = "Skip označil místo";
	text[1] = "kde najdu vůdce banditů,";
	text[2] = "Dextera.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_NewWorld_Dexter()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_Dexter);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Dexter.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


prototype Rangerring_Prototype(C_Item)
{
	name = "Akvamarínový prsten";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_HpMana;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Ranger_Addon;
	on_unequip = UnEquip_ItRi_Ranger_Addon;
	description = "Členský znak 'Kruhu vody'";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

func void Equip_ItRi_Ranger_Addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(ENTERED_ADDONWORLD == FALSE)
		{
			if(Npc_HasItems(hero,ItRi_Ranger_Addon) == FALSE)
			{
				RangerRingIsLaresRing = TRUE;
			};
		};
		SCIsWearingRangerRing = TRUE;
		Print(PRINT_Addon_SCIsWearingRangerRing);
	};
};

func void UnEquip_ItRi_Ranger_Addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(SC_IsRanger == FALSE)
		{
			SCIsWearingRangerRing = FALSE;
		};
		RangerRingIsLaresRing = FALSE;
	};
};


instance ItRi_Ranger_Lares_Addon(Rangerring_Prototype)
{
	text[1] = "Tento prsten patří Laresovi";
};

instance ItRi_Ranger_Addon(Rangerring_Prototype)
{
	text[1] = "Toto je můj prsten.";
};

instance ItRi_LanceRing(Rangerring_Prototype)
{
	text[1] = "Tento prsten patří Lancovi";
};

instance ItMi_PortalRing_Addon(C_Item)
{
	name = "Kruhový ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	description = "Kruhový ornament";
	text[2] = "Tento kroužek otevírá portál";
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
};

instance ItWr_Martin_MilizEmpfehlung_Addon(C_Item)
{
	name = "Martinův doporučující dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MartinMilizEmpfehlung_Addon;
	scemeName = "MAP";
	description = "Doporučující dopis pro Lorda Andreho";
	text[2] = "Tento dopis by mi měl pomoci";
	text[3] = "se dostat k domobraně.";
};


func void Use_MartinMilizEmpfehlung_Addon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vážený Sire Andre");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Doloženo tímto dopisem, posílám vám novou posilu do domobrany. ");
	Doc_PrintLines(nDocID,0,"Shledal jsem ho užitečným, pečlivým a důsledným při řešení složitých úkolů.");
	Doc_PrintLines(nDocID,0,"Jsem si jist, že bude dobře chránit krále a mír tohoto města.");
	Doc_PrintLine(nDocID,0,"Innos ochraňuj krále");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"        Martin");
	Doc_Show(nDocID);
};


instance ItWr_RavensKidnapperMission_Addon(C_Item)
{
	name = "Příkazy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RavensKidnapperMission_Addon;
	scemeName = "MAP";
	description = name;
	text[2] = "Vzal jsem tento dopis";
	text[3] = "od bandity Dextera.";
};


var int Use_RavensKidnapperMission_Addon_OneTime;

func void Use_RavensKidnapperMission_Addon()
{
	var int nDocID;
	if((Use_RavensKidnapperMission_Addon_OneTime == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople != 0))
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,"Nyní jsem dostal dopis. Raven, starý rudobaron, zajímá do otroctví občany Khorinisu. Raven se skrývá někde severo-východně od Krorinisu přes hory. Vatras by se měl podívat na tento dokument.");
		Use_RavensKidnapperMission_Addon_OneTime = TRUE;
	};
	SCKnowsMissingPeopleAreInAddonWorld = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"Dexteře, ty hajzle!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Když jsem byl ještě rudobaronem, nebyls tak neschopný. ");
	Doc_PrintLines(nDocID,0,"Jestli nedokážeš dovést více otroků z Khorinisu, budeš mít velký problém u nás v doupěti. ");
	Doc_PrintLines(nDocID,0,"Potřebuji více otroků nebo se mi tu chlepi začnou bouřit. A nemusím ti říkat, co to znamená?");
	Doc_PrintLines(nDocID,0,"Nebude mi trvat už dlouho a dostanu se do chrámu. A nemůžu si dovolit tedy žádné zaváhání.");
	Doc_PrintLines(nDocID,0,"Oh, a další problém:");
	Doc_PrintLines(nDocID,0,"Dříve nebo později budeme muset najít jinou cestu do Khorinisu. Piráti nám už dlouho nebudou pomáhat, když jim přestaneme platit.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Raven");
	Doc_Show(nDocID);
};


instance ItWr_Vatras_KDFEmpfehlung_Addon(C_Item)
{
	name = "Vatrasův doporučující dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_VatrasKDFEmpfehlung_Addon;
	scemeName = "MAP";
	description = "Vatrasův doporučující dopis";
	text[2] = "Tento dopis mi pomůže";
	text[3] = "vstoupit do kláštera mágů ohně";
	text[4] = "bez placení. ";
};


func void Use_VatrasKDFEmpfehlung_Addon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Bratři ohně,");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"právě jsem byl informován o tom, jaký poplatek žádáte za vstup do vaší komunity");
	Doc_PrintLines(nDocID,0,"Tento dopis má v rukou muž,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Vatras");
	Doc_Show(nDocID);
};


instance ItMi_LostInnosStatue_Daron(C_Item)
{
	name = "Innosova cenná soška";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_InnosStatue;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_LuciasLoveLetter_Addon(C_Item)
{
	name = "Dopis na rozloučenou od Lucie";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_LuciasLoveLetter_Addon;
	scemeName = "MAP";
	description = name;
};


func void Use_LuciasLoveLetter_Addon()
{
	var int nDocID;
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Lucia napsala Elvrichovi dopis na rozloučenou. On ji ale chce vidět.");
	MIS_LuciasLetter = LOG_Running;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Milý Elvrichu,");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nemám slova, kterými bych se ti mohla omluvit. Vím, že bude těžké to pochopit, ale dospěla jsem k závěru,");
	Doc_PrintLines(nDocID,0,"že to tak bude pro nás oba lepší. Najdeš si místo mě jinou, lepší holku.");
	Doc_PrintLines(nDocID,0,"Nikdy se nevrátím zpět, odkud jsem přišla. Zapoměň na mě. Holky jako já je pro tebe škoda. Sbohem.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Lucia");
	Doc_Show(nDocID);
};


prototype EffectItemPrototype_Addon(C_Item)
{
	name = "Kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Coal;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_AmbossEffekt_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FOREST_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_BIGFARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_Rake(C_Item)
{
	name = "Sochor";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rake;
	visual = "ItMi_Rake.3DS";
	material = MAT_WOOD;
	scemeName = "RAKE";
	on_state[1] = Use_Rake;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Use_Rake()
{
};


instance ItRi_Addon_BanditTrader(C_Item)
{
	name = "Prsten řádu";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 5;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Rytý prsten";
	text[2] = "zámořského cechu Araxos";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ItWr_Addon_BanditTrader(C_Item)
{
	name = "Dodávka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Addon_BanditTrader;
	scemeName = "MAP";
	description = name;
	text[2] = "Vzal jsem tento dopis od banditů";
	text[3] = "za Sekobovou farmou.";
};


var int Use_ItWr_Addon_BanditTrader_OneTime;

func void Use_ItWr_Addon_BanditTrader()
{
	var int nDocID;
	BanditTrader_Lieferung_Gelesen = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"15 krátkých mečů");
	Doc_PrintLines(nDocID,0,"20 mečů");
	Doc_PrintLines(nDocID,0,"25 bochníků chleba ");
	Doc_PrintLines(nDocID,0,"15 lahví vína");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Toto je poslední možnost. ");
	Doc_PrintLines(nDocID,0,"Vše je stále více a více nebezpečné.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Fernando");
	Doc_Show(nDocID);
	if((MIS_Vatras_FindTheBanditTrader != 0) && (Use_ItWr_Addon_BanditTrader_OneTime == FALSE))
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"Našel jsem dokument, který ukazuje, že Fernando je ten, kdo doručuje zbraně banditům.");
		Use_ItWr_Addon_BanditTrader_OneTime = TRUE;
	};
};


instance ItWr_Vatras2Saturas_FindRaven(C_Item)
{
	name = "Zapečetěná zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven_Sealed;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Vatrasova zpráva Saturasovi";
};


func void Use_Vatras2Saturas_FindRaven()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Vážený Saturasi");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Doufám, že už to budeš mít. Situace tady ve městě je čím dál tím horší. Je to jako klid před bouří. Prosím pospěš. Potřebuji tě zde.");
	Doc_PrintLines(nDocID,0,"Prostudoval jsem tvé poznámky a měl jsi pravdu. Symboly udělala nějaká kultura, která uctívala Adanose. Proto musíš být opatrný a nezaslepit se falešnými podezřeními.");
	Doc_PrintLines(nDocID,0,"Mizející občany má na svědomí bývalý rudobaron Raven. Portál nás zavede do země, kde se někde skrývá.");
	Doc_PrintLines(nDocID,0,"A ještě něco: Posílám ti pomoc. Nositel tohoto dokumentu je výjimečný. Má podivný třpyt v očích kdykoliv se na vás podívá. Nejsem ještě úplně přesvědčen, ale mohl by to být ON, i když jsme si ho představovali jinak.");
	Doc_PrintLines(nDocID,0,"Otestuj ho. Myslím, že je dobrý.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Vatras");
	Doc_Show(nDocID);
};

func void Use_Vatras2Saturas_FindRaven_Sealed()
{
	CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven_opened,1);
	Vatras2Saturas_FindRaven_Open = TRUE;
	Use_Vatras2Saturas_FindRaven();
};


instance ItWr_Vatras2Saturas_FindRaven_opened(C_Item)
{
	name = "Otevřená zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven;
	scemeName = "MAP";
	description = name;
	text[2] = "Vatrasova zpráva Saturasovi";
};

instance ItAm_Addon_WispDetector(C_Item)
{
	name = "Amulet z rudy";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_DexStrg;
	visual = "ItAm_Mana_01.3ds";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_WispDetector;
	on_unequip = UnEquip_WispDetector;
	description = "Amulet z rudy";
	text[2] = "Obsahuje bludičku";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


var int Equip_WispDetector_OneTime;

func void Equip_WispDetector()
{
	var C_Npc DetWsp;
	if(Equip_WispDetector_OneTime == FALSE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] = TRUE;
		WispSearching = WispSearch_NF;
		Equip_WispDetector_OneTime = TRUE;
	};
	DetWsp = Hlp_GetNpc(Wisp_Detector);
	AI_Teleport(DetWsp,"TOT");
	Wld_SpawnNpcRange(self,Wisp_Detector,1,500);
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",Wisp_Detector,Wisp_Detector,0,0,0,FALSE);
	Snd_Play("MFX_Transform_Cast");
};

func void UnEquip_WispDetector()
{
	var C_Npc DetWsp;
	DetWsp = Hlp_GetNpc(Wisp_Detector);
	if(Npc_IsDead(DetWsp) == FALSE)
	{
		Snd_Play("WSP_Dead_A1");
	};
	AI_Teleport(DetWsp,"TOT");
	B_RemoveNpc(DetWsp);
	AI_Teleport(DetWsp,"TOT");
};


instance ItFo_Addon_Krokofleisch_Mission(C_Item)
{
	name = "Maso z močálové krysy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Rawmeat;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	description = name;
	text[1] = "Smrdí rybinou";
	text[5] = NAME_Value;
	count[5] = Value_Rawmeat;
};

instance ItRi_Addon_MorgansRing_Mission(C_Item)
{
	name = "Morganův prsten";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = Equip_MorgansRing;
	on_unequip = UnEquip_MorgansRing;
	wear = WEAR_EFFECT;
	effect = "";
	description = name;
	text[1] = "Prsten je zdoben velkým množstvím run.";
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_MorgansRing()
{
	B_AddFightSkill(self,NPC_TALENT_1H,5);
	if((SHIELD_EQUIP == TRUE) && (SCATTY_TEACH_PERM2 == FALSE))
	{
		Mdl_RemoveOverlayMds(hero,"HUMANS_1HST1SH.MDS");
		Mdl_ApplyOverlayMds(hero,"HUMANS_1HST1SH.MDS");
	};
};

func void UnEquip_MorgansRing()
{
	B_AddFightSkill(self,NPC_TALENT_1H,-5);
	if((SHIELD_EQUIP == TRUE) && (SCATTY_TEACH_PERM2 == FALSE))
	{
		Mdl_RemoveOverlayMds(hero,"HUMANS_1HST1SH.MDS");
		Mdl_ApplyOverlayMds(hero,"HUMANS_1HST1SH.MDS");
	};
};


instance ItMi_Focus(C_Item)
{
	name = "Ohniskový kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "";
	description = name;
};

instance ItMi_Addon_Steel_Paket(C_Item)
{
	name = "Balík s ocelí";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Tento balík je opravdu těžký.";
	text[3] = "Obsahuje dost oceli.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_StonePlateCommon_Addon(C_Item)
{
	name = "Stará kamenná deska";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = value_StonePlateCommon;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_StonePlateCommon;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Šedá kamenná deska";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value_StonePlateCommon;
};


func void Use_StonePlateCommon()
{
	var int nDocID;
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,-1,70,50,90,50,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Kasta válečníků vyvolala hněv našich bohů.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"RHADEMES, následník QUAHODRONA byl poražen. Ale jeho zlo nás odsud vykázalo do exilu.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Jsme proti tomu bezmocní.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"ADANOSŮV hněv ničí JHARKENDAR!");
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"Maya_Stoneplate_02.TGA",0);
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_01(C_Item)
{
	name = "Červená kamenná deska";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_03.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_01;
	scemeName = "MAP";
	wear = WEAR_EFFECT;
	effect = "";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Červená kamenná deska";
	text[3] = "";
};


func void Use_Addon_Stone_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_02.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"My, zbylí vůdci koncilu pěti, jsme zapečetili vstup do chrámu. Aby MEČ neviděl již nikdy světlo denní.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_05(C_Item)
{
	name = "Žlutá kamenná deska";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_04.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_05;
	scemeName = "MAP";
	wear = WEAR_EFFECT;
	effect = "";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Žlutá kamenná deska";
	text[3] = "";
};


func void Use_Addon_Stone_05()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_01.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"Já, ten, kdo svolal koncil, jsem vybudoval první past. A pouze já znám správné dveře.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_03(C_Item)
{
	name = "Modrá kamenná deska";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_05.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_03;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "";
	description = name;
	text[2] = "Modrá kamenná deska";
	text[3] = "";
};


func void Use_Addon_Stone_03()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"KHARDIMON vymyslel druhou past. Pouze on, ten, kdo nikdy nesklouzl z cesty světla, dosáhl třetí komnaty.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_04(C_Item)
{
	name = "Zelená kamenná deska";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_01.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_04;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "";
	description = name;
	text[2] = "Zelená kamenná deska";
	text[3] = "";
};


func void Use_Addon_Stone_04()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_04.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"Třetí past byla vybudována QUARHODRONEM, a pouze on ví, jak otevřít dveře.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_02(C_Item)
{
	name = "Fialová kamenná deska";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_02.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_02;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "";
	description = name;
	text[2] = "Fialová kamenná deska";
	text[3] = "";
};


func void Use_Addon_Stone_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_05.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"QUARHODRON byl jedinný, kdo s pomocí KHARDIMONA zapečetil vstupní dveře chrámu. Nikdo rituál nepřežil.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Jen já jsem zůstal a vydal světu svědectví.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Ať RHADEMES hnije v chrámu navěky!");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Erfjkemvfj RHADEMES Fjewheege Egdgsmkd!");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMI_Addon_Kompass_Mis(C_Item)
{
	name = "Zlatý kompas";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_STONE;
	description = name;
};

instance ItSE_Addon_FrancisChest(C_Item)
{
	name = "Pokladnice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_GoldChest.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = FrancisChest;
	description = "Pokladnice";
	text[0] = "Pokladnice je docela težká";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void FrancisChest()
{
	CreateInvItems(hero,ItMi_GoldChest,1);
	CreateInvItems(hero,ItMw_FrancisDagger_Mis,1);
	CreateInvItems(hero,ItMi_Gold,153);
	CreateInvItems(hero,ItMi_GoldCup,1);
	CreateInvItems(hero,ItMi_SilverNecklace,1);
	CreateInvItems(hero,ITWR_Addon_FrancisAbrechnung_Mis,1);
	Snd_Play("Měšec");
	Print("Velice plný!");
};


instance ITWR_Addon_FrancisAbrechnung_Mis(C_Item)
{
	name = "Výplatní listina";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseFrancisAbrechnung_Mis;
};


func void UseFrancisAbrechnung_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Obchodní loď 'Mořská panna'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Hotovost celkem: 15560 zlata");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Posádka        : 9840");
	Doc_PrintLine(nDocID,0,"Úředníci       : 2500");
	Doc_PrintLine(nDocID,0,"Kapitán        : 1000");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"můj podíl      : 2220");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Zámořská loď 'Miriam'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Hotovost celkem: 4390 zlata");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Posádka        : 2390");
	Doc_PrintLine(nDocID,0,"Úředníci       :  500");
	Doc_PrintLine(nDocID,0,"Kapitán        :  500");
	Doc_PrintLine(nDocID,0,"----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"můj podíl      : 1000");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Obchodní loď 'Nico'");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Hotovost celkem: 9970 zlata");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Posádka        : 5610");
	Doc_PrintLine(nDocID,1,"Úředníci       : 1500");
	Doc_PrintLine(nDocID,1,"Kapitán        : 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"můj podíl      : 1860");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Obchodní loď 'Maria'");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Hotovost celkem: 7221 zlata");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Posádka        : 4400");
	Doc_PrintLine(nDocID,1,"Úředníci       :  750");
	Doc_PrintLine(nDocID,1,"Kapitán        : 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"můj podíl      : 1071");
	Doc_PrintLine(nDocID,1,"");
	Francis_HasProof = TRUE;
	Doc_Show(nDocID);
	B_Say(self,self,"$ADDON_THISLITTLEBASTARD");
};


instance ITWR_Addon_GregsLogbuch_Mis(C_Item)
{
	name = "Zápisník";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Gregův zápisník";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGregsLogbuch;
};


func void UseGregsLogbuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLines(nDocID,0,"Už tuto pláž nemůžu vystát. Písek je všude. Nemůžu dokonce spát, protože mě všude svědí. Čas přeje Ravenovi a jeho zlatu a nás zničí. Myslím, že budu muset tomu samozvanci domluvit.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Kdo si myslí, že je?  Myslí si, že mě odradí ti jeho kamarádíčci? Brzy pozná, s kým si to začal. A jeho přítelíček Bloodwyn bude prvním, kdo padne mou rukou.");
	Doc_PrintLines(nDocID,0,"Jestli brzy nezaplatí, budu muset být opravdu hodně  nepříjemný. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLines(nDocID,1,"Bandité se stávají stále drzejší. Stále ještě nemají zaplacenou poslední dodávku. Ale nemáme dost informací. Musím zjistit, co má Raven za lubem.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Vezmu vetšinu své posádky a zabezpečím rudu. Francis zůstane zde a opevní tábor. ");
	Doc_PrintLines(nDocID,1,"Abych zjistil, co mají za lubem, dal jsem Bonesovi bandití brnění. Proplíží se s ním do tábora banditů a zjistí, co se tam děje.");
	Greg_GaveArmorToBones = TRUE;
	Doc_Show(nDocID);
};


instance ITKE_Addon_Bloodwyn_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Bloodwynův klíč ";
	text[2] = "Pasuje k truhle";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_Addon_Heiler(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Klíč kamenného strážce";
	text[2] = "Pasuje k truhle";
	text[3] = "v podivné budově v bažinách";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_TempelTorKey(C_Item)
{
	name = "Kamenná deska Quarhodrona";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_TempelTorKey;
	text[2] = "Klíč k chrámu Adanose";
};


func void Use_TempelTorKey()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"  Jhehedra Akhantar");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Bloodwyn_Kopf(C_Item)
{
	name = "Bloodwynova hlava";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWR_Addon_TreasureMap(C_Item)
{
	name = "Mapa pokladů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_TreasureMap;
	description = name;
	text[0] = "";
	text[1] = "Jsou tu nějaké zaznačené místa.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_TreasureMap()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWR_Addon_TreasureMap);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AddonWorld_Treasures.tga",TRUE);
	Doc_SetLevel(Document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(Document,-47783,36300,43949,-32300);
	Doc_Show(Document);
};


instance ItMi_Addon_GregsTreasureBottle_MIS(C_Item)
{
	name = "Zpráva v lahvi";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Water.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_GregsBottle;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Uvnitř je kus papíru.";
};


func void Use_GregsBottle()
{
	B_PlayerFindItem(ItWR_Addon_TreasureMap,1);
};


instance itmi_erolskelch(C_Item)
{
	name = "Poškrábaný stříbrný kalich";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

