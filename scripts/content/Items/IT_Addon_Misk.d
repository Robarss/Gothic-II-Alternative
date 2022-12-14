
const int Value_Goldnugget = 18;
const int Value_WhitePearl = 120;
const int Value_Addon_Joint_01 = 60;

instance ItMi_GoldNugget_Addon(C_Item)
{
	name = "Zlat? nug?t";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Goldnugget;
	visual = "ItMi_GoldNugget_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance CA_ITMI_BRANCH(C_Item)
{
	name = "D?ev?n? v?tev";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "CA_ITMI_BRANCH.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Addon_WhitePearl(C_Item)
{
	name = "Perla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WhitePearl;
	visual = "ItMi_WhitePearl_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_Addon_Joint_01(C_Item)
{
	name = "Zelen? novic";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Addon_Joint_01;
	visual = "ItMi_Joint_US.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = Use_Addon_Joint_01;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};


var int FirstJoint;

func void Use_Addon_Joint_01()
{
	if(Npc_IsPlayer(self))
	{
		if(FirstJoint == FALSE)
		{
			FirstJoint = TRUE;
			B_GivePlayerXP(5);
		};
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
	};
};


instance ItMi_BaltramPaket(C_Item)
{
	name = "Beltramova z?silka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "T??k? bal?k";
	text[3] = "pln? dobr?ch v?c?";
	text[4] = "od farm??e Akila";
};

instance ItMi_Packet_Baltram4Skip_Addon(C_Item)
{
	name = "Bal?k pro Skipa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Tento t??k? bal?k";
	text[3] = "pln? dobr?ch v?c?";
	text[4] = "je ur?en pro pir?ta Skipa";
};

instance ItMi_BromorsGeld_Addon(C_Item)
{
	name = "Bromor?v zlat? poh?r";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Nugget;
	visual = "ItMi_GoldChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Jm?no 'Bromor' je vyryto";
	text[3] = "ostr?m p?edm?tem";
	text[4] = "na podstavci kalichu";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSe_ADDON_CavalornsBeutel(C_Item)
{
	name = "Cavalornova ko?en? bra?na";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Nugget;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_CavalornsBeutel;
	description = name;
	text[0] = "";
	text[1] = "Na tom vis? ?t?tek";
	text[2] = "se jm?nem 'Cavalorn'";
	text[3] = "a kus rudy se d? nal?zt uvnit?.";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_CavalornsBeutel()
{
	CreateInvItems(hero,ItMi_Nugget,1);
	Print(PRINT_FoundOreNugget);
	SC_OpenedCavalornsBeutel = TRUE;
	Log_CreateTopic(TOPIC_Addon_CavalornTheHut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut,LOG_Running);
	B_LogEntry(TOPIC_Addon_CavalornTheHut,"Uvnit? Cavalornovy chatr?e v Hornick?m ?dol? jsem na?el bra?nu s kusem rudy uvnit?. Cavalorn, ten stra? dareb?k, ji tu ur?it? zapomn?l.");
};


instance ItMi_Skull(C_Item)
{
	name = "Lebka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 10;
	visual = "DT_SKELETON_V01_HEAD.3ds";
	material = MAT_LEATHER;
	description = name;
};

instance ItMi_IECello(C_Item)
{
	name = "Cedr";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Cello.3ds";
	material = MAT_WOOD;
	scemeName = "CELLO";
	on_state[0] = Use_Cello;
	description = name;
};


func void Use_Cello()
{
};


instance ItMi_IECelloBow(C_Item)
{
	name = "Cedrov? luk";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_CelloBow.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ItMi_IEDrum(C_Item)
{
	name = "Buben";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Drum.3ds";
	material = MAT_WOOD;
	scemeName = "PAUKE";
	on_state[0] = Use_Drum;
	description = name;
};


func void Use_Drum()
{
};


instance ItMi_IEDrumScheit(C_Item)
{
	name = "D?evo na buben";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Drumscheit.3ds";
	material = MAT_WOOD;
	scemeName = "DRUMSCHEIT";
	on_state[0] = Use_Drumscheit;
	description = name;
};


func void Use_Drumscheit()
{
};


instance ItMi_IEDrumStick(C_Item)
{
	name = "Pali?ka k bubnu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DrumStick.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ItMi_IEDudelBlau(C_Item)
{
	name = "Modr? d?mka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DudelBlau.3ds";
	material = MAT_WOOD;
	scemeName = "DUDEL";
	on_state[0] = Use_Dudel;
	description = name;
};


func void Use_Dudel()
{
};


instance ItMi_IEDudelGelb(C_Item)
{
	name = "?lut? d?mka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DudelGelb.3ds";
	material = MAT_WOOD;
	scemeName = "DUDEL";
	on_state[0] = Use_Dudel;
	description = name;
};

instance ItMi_IEHarfe(C_Item)
{
	name = "Harfa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Harfe.3ds";
	material = MAT_WOOD;
	scemeName = "HARFE";
	on_state[0] = Use_Harfe;
	description = name;
};


func void Use_Harfe()
{
};


instance ItMi_IELaute(C_Item)
{
	name = "Loutna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Laute.3ds";
	material = MAT_WOOD;
	scemeName = "IELAUTE";
	on_state[0] = Use_Laute;
	description = name;
};


func void Use_Laute()
{
};


instance ItMi_Addon_Lennar_Paket(C_Item)
{
	name = "Rachot?c? bal?k";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = Use_LennarPaket;
	material = MAT_LEATHER;
	description = name;
	text[2] = "Uvnit? je mnoho pakl???,";
	text[3] = "";
	text[4] = "velmi mnoho.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_LennarPaket()
{
	B_PlayerFindItem(ItKE_lockpick,Lennar_picklock_amount);
	Snd_Play("Geldbeutel");
	LennarPaket_Open = TRUE;
};


instance ItMi_Zeitspalt_Addon(C_Item)
{
	name = "?ern? ruda";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Zeitspalt_Addon.3DS";
	scemeName = "MAPSEALED";
	on_state[0] = Use_Zeitspalt_Addon;
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[3] = "??inek nezn?m?";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};


func void Use_Zeitspalt_Addon()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
		Wld_StopEffect("SLOW_MOTION");
		Wld_PlayEffect("SLOW_MOTION",self,self,0,0,0,FALSE);
	};
};


instance ITMI_WOODBASIC(C_Item)
{
	name = "D?evo ze stromu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ITMI_BUKTREE.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Toto jsem vysekal z mlad?ho stromu,";
	text[3] = "";
	text[4] = "Mo?n? z toho n?co vyrob?m.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_WOODMAKER01(C_Item)
{
	name = "D?evo na v?robu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 150;
	visual = "SQ206_WOOD.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "P?ipraveno na v?robu st?eln?ch zbran? a munice.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_WOODMAKER02(C_Item)
{
	name = "T?tiva";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 250;
	visual = "KM_VOB_FIBER.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "P?ipraveno na v?robu st?eln?ch zbran?,";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_RUBY(C_Item)
{
	name = "Rub?n";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 3500;
	visual = "ITMI_RUBY.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Velice vz?cn? nerost";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_SMAR(C_Item)
{
	name = "Smaragd";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 3000;
	visual = "ITMI_EMERALD.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Velice vz?cn? nerost";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_DIAM(C_Item)
{
	name = "Diamant";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 6000;
	visual = "ITMI_DIAMOND.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Velice vz?cn? nerost";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_SAFI(C_Item)
{
	name = "Saf?r";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 3500;
	visual = "ITMI_SAPPHIRE.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Velice vz?cn? nerost";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_JANT(C_Item)
{
	name = "Jantar";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 2500;
	visual = "ITMI_TOPAZ.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Velice vz?cn? nerost";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_ELITCHALIGE(C_Item)
{
	name = "Rub?nov? zlat? poh?r";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2500;
	visual = "ITMI_EVENT_CURSEDGOLDCUP.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Velice cenn?";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

