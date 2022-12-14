
instance ItWr_SaturasFirstMessage_Addon_Sealed(C_Item)
{
	name = "Zape?et?n? zpr?va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage_Sealed;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Tato zpr?va byla pe?liv? zape?et?na.";
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
	Doc_PrintLine(nDocID,0,"V??en? Vatrasi,");
	Doc_PrintLines(nDocID,0,"U? v?me, jak dos?hnout port?lu. M?l jsi pravdu. ");
	Doc_PrintLines(nDocID,0,"Jsou tam znaky uct?va?? Adanose. Chci t? po??dat, abys zkontroloval m? pozn?mky a to, co jsem na?el.");
	Doc_PrintLines(nDocID,0,"Nikdy jsme nevid?li takov? kameny.");
	Doc_PrintLines(nDocID,0,"Zem? se t?ese bez n?jak?ho d?vodu.");
	Doc_PrintLines(nDocID,0,"P?edpokl?d?m, ?e brzy zjist?me p???inu.");
	Doc_PrintLines(nDocID,0,"Ornament, kter? jsem na?el, m? v?t?? v?znam, ne? jsme mu prvn? d?vali. Zd? se, ?e je to artefakt-kl??. Ale nen? kompletn?. Mus?me to studovat d?kladn?ji.");
	Doc_PrintLines(nDocID,0,"Po?li n?m sem n?koho z 'Kruhu vody'. A pokud mo?no, nepos?lej Cavalorna. ");
	Doc_PrintLines(nDocID,0,"U? jsem ho pou?il, aby ten dopis doru?il tob?. Mysl?m, ?e u? pro n?s ud?lal dost.");
	Doc_PrintLines(nDocID,0,"Douf?m, ?e jsem ud?lal spr?vnou v?c.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Saturas");
	Doc_Show(nDocID);
	if((Use_SaturasFirstMessage_OneTime == FALSE) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"Dostal jsem tu zpr?vu od bandity, kter?ho asi Cavalorn poslal aby tu zpravu doru?il Vatrasovi.  Nyn? je to m? povinnost.");
		Use_SaturasFirstMessage_OneTime = TRUE;
	};
	if(SC_KnowsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater,"Je tu uskupen?, kter? si samo ??k? 'Kruh vody'. M?gov? vody vnesli ??d do tohoto 'Kruhu vody'.");
	};
	if(SC_IsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater,"Cavalorn pat?? do 'Kruhu vody'.");
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
	name = "Otev?en? zpr?va ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage;
	scemeName = "MAP";
	description = name;
	text[2] = "Saturas?v dopis Vatrasovi";
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
	text[0] = "Zlomek kruhov?ho ornamentu";
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
	text[0] = "Zlomek kruhov?ho ornamentu";
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
	text[0] = "Tato mapa ozna?uje m?sta";
	text[1] = "kde Nefarius p?edpokl?d?, ?e jsou dal?? ornamenty.";
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
	text[0] = "Skip ozna?il m?sto";
	text[1] = "kde najdu v?dce bandit?,";
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
	name = "Akvamar?nov? prsten";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_HpMana;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Ranger_Addon;
	on_unequip = UnEquip_ItRi_Ranger_Addon;
	description = "?lensk? znak 'Kruhu vody'";
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
	text[1] = "Tento prsten pat?? Laresovi";
};

instance ItRi_Ranger_Addon(Rangerring_Prototype)
{
	text[1] = "Toto je m?j prsten.";
};

instance ItRi_LanceRing(Rangerring_Prototype)
{
	text[1] = "Tento prsten pat?? Lancovi";
};

instance ItMi_PortalRing_Addon(C_Item)
{
	name = "Kruhov? ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	description = "Kruhov? ornament";
	text[2] = "Tento krou?ek otev?r? port?l";
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
};

instance ItWr_Martin_MilizEmpfehlung_Addon(C_Item)
{
	name = "Martin?v doporu?uj?c? dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MartinMilizEmpfehlung_Addon;
	scemeName = "MAP";
	description = "Doporu?uj?c? dopis pro Lorda Andreho";
	text[2] = "Tento dopis by mi m?l pomoci";
	text[3] = "se dostat k domobran?.";
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
	Doc_PrintLines(nDocID,0,"V??en? Sire Andre");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dolo?eno t?mto dopisem, pos?l?m v?m novou posilu do domobrany. ");
	Doc_PrintLines(nDocID,0,"Shledal jsem ho u?ite?n?m, pe?liv?m a d?sledn?m p?i ?e?en? slo?it?ch ?kol?.");
	Doc_PrintLines(nDocID,0,"Jsem si jist, ?e bude dob?e chr?nit kr?le a m?r tohoto m?sta.");
	Doc_PrintLine(nDocID,0,"Innos ochra?uj kr?le");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"        Martin");
	Doc_Show(nDocID);
};


instance ItWr_RavensKidnapperMission_Addon(C_Item)
{
	name = "P??kazy";
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
		B_LogEntry(TOPIC_Addon_WhoStolePeople,"Nyn? jsem dostal dopis. Raven, star? rudobaron, zaj?m? do otroctv? ob?any Khorinisu. Raven se skr?v? n?kde severo-v?chodn? od Krorinisu p?es hory. Vatras by se m?l pod?vat na tento dokument.");
		Use_RavensKidnapperMission_Addon_OneTime = TRUE;
	};
	SCKnowsMissingPeopleAreInAddonWorld = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"Dexte?e, ty hajzle!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Kdy? jsem byl je?t? rudobaronem, nebyls tak neschopn?. ");
	Doc_PrintLines(nDocID,0,"Jestli nedok??e? dov?st v?ce otrok? z Khorinisu, bude? m?t velk? probl?m u n?s v doup?ti. ");
	Doc_PrintLines(nDocID,0,"Pot?ebuji v?ce otrok? nebo se mi tu chlepi za?nou bou?it. A nemus?m ti ??kat, co to znamen??");
	Doc_PrintLines(nDocID,0,"Nebude mi trvat u? dlouho a dostanu se do chr?mu. A nem??u si dovolit tedy ??dn? zav?h?n?.");
	Doc_PrintLines(nDocID,0,"Oh, a dal?? probl?m:");
	Doc_PrintLines(nDocID,0,"D??ve nebo pozd?ji budeme muset naj?t jinou cestu do Khorinisu. Pir?ti n?m u? dlouho nebudou pom?hat, kdy? jim p?estaneme platit.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Raven");
	Doc_Show(nDocID);
};


instance ItWr_Vatras_KDFEmpfehlung_Addon(C_Item)
{
	name = "Vatras?v doporu?uj?c? dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_VatrasKDFEmpfehlung_Addon;
	scemeName = "MAP";
	description = "Vatras?v doporu?uj?c? dopis";
	text[2] = "Tento dopis mi pom??e";
	text[3] = "vstoupit do kl??tera m?g? ohn?";
	text[4] = "bez placen?. ";
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
	Doc_PrintLines(nDocID,0,"Brat?i ohn?,");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"pr?v? jsem byl informov?n o tom, jak? poplatek ??d?te za vstup do va?? komunity");
	Doc_PrintLines(nDocID,0,"Tento dopis m? v rukou mu?,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Vatras");
	Doc_Show(nDocID);
};


instance ItMi_LostInnosStatue_Daron(C_Item)
{
	name = "Innosova cenn? so?ka";
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
	name = "Dopis na rozlou?enou od Lucie";
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
	B_LogEntry(TOPIC_Addon_Lucia,"Lucia napsala Elvrichovi dopis na rozlou?enou. On ji ale chce vid?t.");
	MIS_LuciasLetter = LOG_Running;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Mil? Elvrichu,");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nem?m slova, kter?mi bych se ti mohla omluvit. V?m, ?e bude t??k? to pochopit, ale dosp?la jsem k z?v?ru,");
	Doc_PrintLines(nDocID,0,"?e to tak bude pro n?s oba lep??. Najde? si m?sto m? jinou, lep?? holku.");
	Doc_PrintLines(nDocID,0,"Nikdy se nevr?t?m zp?t, odkud jsem p?i?la. Zapom?? na m?. Holky jako j? je pro tebe ?koda. Sbohem.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Lucia");
	Doc_Show(nDocID);
};


prototype EffectItemPrototype_Addon(C_Item)
{
	name = "K?men";
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
	name = "Prsten ??du";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 5;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Ryt? prsten";
	text[2] = "z?mo?sk?ho cechu Araxos";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ItWr_Addon_BanditTrader(C_Item)
{
	name = "Dod?vka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Addon_BanditTrader;
	scemeName = "MAP";
	description = name;
	text[2] = "Vzal jsem tento dopis od bandit?";
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
	Doc_PrintLines(nDocID,0,"15 kr?tk?ch me??");
	Doc_PrintLines(nDocID,0,"20 me??");
	Doc_PrintLines(nDocID,0,"25 bochn?k? chleba ");
	Doc_PrintLines(nDocID,0,"15 lahv? v?na");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Toto je posledn? mo?nost. ");
	Doc_PrintLines(nDocID,0,"V?e je st?le v?ce a v?ce nebezpe?n?.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Fernando");
	Doc_Show(nDocID);
	if((MIS_Vatras_FindTheBanditTrader != 0) && (Use_ItWr_Addon_BanditTrader_OneTime == FALSE))
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"Na?el jsem dokument, kter? ukazuje, ?e Fernando je ten, kdo doru?uje zbran? bandit?m.");
		Use_ItWr_Addon_BanditTrader_OneTime = TRUE;
	};
};


instance ItWr_Vatras2Saturas_FindRaven(C_Item)
{
	name = "Zape?et?n? zpr?va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven_Sealed;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Vatrasova zpr?va Saturasovi";
};


func void Use_Vatras2Saturas_FindRaven()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"V??en? Saturasi");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Douf?m, ?e u? to bude? m?t. Situace tady ve m?st? je ??m d?l t?m hor??. Je to jako klid p?ed bou??. Pros?m posp??. Pot?ebuji t? zde.");
	Doc_PrintLines(nDocID,0,"Prostudoval jsem tv? pozn?mky a m?l jsi pravdu. Symboly ud?lala n?jak? kultura, kter? uct?vala Adanose. Proto mus?? b?t opatrn? a nezaslepit se fale?n?mi podez?en?mi.");
	Doc_PrintLines(nDocID,0,"Mizej?c? ob?any m? na sv?dom? b?val? rudobaron Raven. Port?l n?s zavede do zem?, kde se n?kde skr?v?.");
	Doc_PrintLines(nDocID,0,"A je?t? n?co: Pos?l?m ti pomoc. Nositel tohoto dokumentu je v?jime?n?. M? podivn? t?pyt v o??ch kdykoliv se na v?s pod?v?. Nejsem je?t? ?pln? p?esv?d?en, ale mohl by to b?t ON, i kdy? jsme si ho p?edstavovali jinak.");
	Doc_PrintLines(nDocID,0,"Otestuj ho. Mysl?m, ?e je dobr?.");
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
	name = "Otev?en? zpr?va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven;
	scemeName = "MAP";
	description = name;
	text[2] = "Vatrasova zpr?va Saturasovi";
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
	text[2] = "Obsahuje bludi?ku";
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
	name = "Maso z mo??lov? krysy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Rawmeat;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	description = name;
	text[1] = "Smrd? rybinou";
	text[5] = NAME_Value;
	count[5] = Value_Rawmeat;
};

instance ItRi_Addon_MorgansRing_Mission(C_Item)
{
	name = "Morgan?v prsten";
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
	text[1] = "Prsten je zdoben velk?m mno?stv?m run.";
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
	name = "Ohniskov? k?men";
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
	name = "Bal?k s ocel?";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Tento bal?k je opravdu t??k?.";
	text[3] = "Obsahuje dost oceli.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_StonePlateCommon_Addon(C_Item)
{
	name = "Star? kamenn? deska";
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
	text[2] = "?ed? kamenn? deska";
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
		Doc_PrintLines(nDocID,0,"Kasta v?le?n?k? vyvolala hn?v na?ich boh?.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"RHADEMES, n?sledn?k QUAHODRONA byl pora?en. Ale jeho zlo n?s odsud vyk?zalo do exilu.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Jsme proti tomu bezmocn?.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"ADANOS?V hn?v ni?? JHARKENDAR!");
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
	name = "?erven? kamenn? deska";
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
	text[2] = "?erven? kamenn? deska";
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
		Doc_PrintLines(nDocID,0,"My, zbyl? v?dci koncilu p?ti, jsme zape?etili vstup do chr?mu. Aby ME? nevid?l ji? nikdy sv?tlo denn?.");
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
	name = "?lut? kamenn? deska";
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
	text[2] = "?lut? kamenn? deska";
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
		Doc_PrintLines(nDocID,0,"J?, ten, kdo svolal koncil, jsem vybudoval prvn? past. A pouze j? zn?m spr?vn? dve?e.");
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
	name = "Modr? kamenn? deska";
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
	text[2] = "Modr? kamenn? deska";
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
		Doc_PrintLines(nDocID,0,"KHARDIMON vymyslel druhou past. Pouze on, ten, kdo nikdy nesklouzl z cesty sv?tla, dos?hl t?et? komnaty.");
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
	name = "Zelen? kamenn? deska";
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
	text[2] = "Zelen? kamenn? deska";
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
		Doc_PrintLines(nDocID,0,"T?et? past byla vybudov?na QUARHODRONEM, a pouze on v?, jak otev??t dve?e.");
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
	name = "Fialov? kamenn? deska";
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
	text[2] = "Fialov? kamenn? deska";
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
		Doc_PrintLines(nDocID,0,"QUARHODRON byl jedinn?, kdo s pomoc? KHARDIMONA zape?etil vstupn? dve?e chr?mu. Nikdo ritu?l nep?e?il.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Jen j? jsem z?stal a vydal sv?tu sv?dectv?.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"A? RHADEMES hnije v chr?mu nav?ky!");
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
	name = "Zlat? kompas";
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
	text[0] = "Pokladnice je docela te?k?";
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
	Snd_Play("M??ec");
	Print("Velice pln?!");
};


instance ITWR_Addon_FrancisAbrechnung_Mis(C_Item)
{
	name = "V?platn? listina";
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
	Doc_PrintLine(nDocID,0,"Obchodn? lo? 'Mo?sk? panna'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Hotovost celkem: 15560 zlata");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Pos?dka        : 9840");
	Doc_PrintLine(nDocID,0,"??edn?ci       : 2500");
	Doc_PrintLine(nDocID,0,"Kapit?n        : 1000");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"m?j pod?l      : 2220");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Z?mo?sk? lo? 'Miriam'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Hotovost celkem: 4390 zlata");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Pos?dka        : 2390");
	Doc_PrintLine(nDocID,0,"??edn?ci       :  500");
	Doc_PrintLine(nDocID,0,"Kapit?n        :  500");
	Doc_PrintLine(nDocID,0,"----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"m?j pod?l      : 1000");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Obchodn? lo? 'Nico'");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Hotovost celkem: 9970 zlata");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Pos?dka        : 5610");
	Doc_PrintLine(nDocID,1,"??edn?ci       : 1500");
	Doc_PrintLine(nDocID,1,"Kapit?n        : 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"m?j pod?l      : 1860");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Obchodn? lo? 'Maria'");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Hotovost celkem: 7221 zlata");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Pos?dka        : 4400");
	Doc_PrintLine(nDocID,1,"??edn?ci       :  750");
	Doc_PrintLine(nDocID,1,"Kapit?n        : 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"m?j pod?l      : 1071");
	Doc_PrintLine(nDocID,1,"");
	Francis_HasProof = TRUE;
	Doc_Show(nDocID);
	B_Say(self,self,"$ADDON_THISLITTLEBASTARD");
};


instance ITWR_Addon_GregsLogbuch_Mis(C_Item)
{
	name = "Z?pisn?k";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Greg?v z?pisn?k";
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
	Doc_PrintLines(nDocID,0,"U? tuto pl?? nem??u vyst?t. P?sek je v?ude. Nem??u dokonce sp?t, proto?e m? v?ude sv?d?. ?as p?eje Ravenovi a jeho zlatu a n?s zni??. Mysl?m, ?e budu muset tomu samozvanci domluvit.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Kdo si mysl?, ?e je?  Mysl? si, ?e m? odrad? ti jeho kamar?d??ci? Brzy pozn?, s k?m si to za?al. A jeho p??tel??ek Bloodwyn bude prvn?m, kdo padne mou rukou.");
	Doc_PrintLines(nDocID,0,"Jestli brzy nezaplat?, budu muset b?t opravdu hodn?  nep??jemn?. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLines(nDocID,1,"Bandit? se st?vaj? st?le drzej??. St?le je?t? nemaj? zaplacenou posledn? dod?vku. Ale nem?me dost informac?. Mus?m zjistit, co m? Raven za lubem.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Vezmu vet?inu sv? pos?dky a zabezpe??m rudu. Francis z?stane zde a opevn? t?bor. ");
	Doc_PrintLines(nDocID,1,"Abych zjistil, co maj? za lubem, dal jsem Bonesovi bandit? brn?n?. Propl??? se s n?m do t?bora bandit? a zjist?, co se tam d?je.");
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
	description = "Bloodwyn?v kl?? ";
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
	description = "Kl?? kamenn?ho str??ce";
	text[2] = "Pasuje k truhle";
	text[3] = "v podivn? budov? v ba?in?ch";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_TempelTorKey(C_Item)
{
	name = "Kamenn? deska Quarhodrona";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_TempelTorKey;
	text[2] = "Kl?? k chr?mu Adanose";
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
	name = "Mapa poklad?";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_TreasureMap;
	description = name;
	text[0] = "";
	text[1] = "Jsou tu n?jak? zazna?en? m?sta.";
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
	name = "Zpr?va v lahvi";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Water.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_GregsBottle;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Uvnit? je kus pap?ru.";
};


func void Use_GregsBottle()
{
	B_PlayerFindItem(ItWR_Addon_TreasureMap,1);
};


instance itmi_erolskelch(C_Item)
{
	name = "Po?kr?ban? st??brn? kalich";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

