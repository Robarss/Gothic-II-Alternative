
instance ItKe_Xardas(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od truhlice,";
	text[3] = "která patří Xardasovi.";
};

instance ItWr_Canthars_KomproBrief_MIS(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Canthars_KomproBrief;
	scemeName = "MAP";
	description = "Cantharův dopis obchodnici Sarah.";
};


func void Use_Canthars_KomproBrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"  Poslední varování");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0," Už jsem ti několikrát přátelsky");
	Doc_PrintLine(nDocID,0," připomínal, že nutně potřebuji");
	Doc_PrintLine(nDocID,0," ty zbraně, které jsem si");
	Doc_PrintLine(nDocID,0," u tebe před týdnem");
	Doc_PrintLine(nDocID,0," objednal.");
	Doc_PrintLine(nDocID,0," Jestli mi ve velmi brzké době");
	Doc_PrintLine(nDocID,0," nepodáš žádnou zprávu, budu se k tobě");
	Doc_PrintLine(nDocID,0," muset začít chovat trochu jinak. Doufám,");
	Doc_PrintLine(nDocID,0," že si rozumíme!!!!!!!!!!!!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Onar");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMw_2h_Rod(C_Item)
{
	name = "Rodův obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Sld2hSchwert;
	damageTotal = Damage_Rod;
	damagetype = DAM_EDGE;
	range = Range_Sld2hSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Rod;
	visual = "ItMw_035_2h_sld_sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_CoragonsSilber(C_Item)
{
	name = "Coragonovo stříbro";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverCup;
	visual = "ItMi_SilverCup.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_TheklasPaket(C_Item)
{
	name = "Theklin balík";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_TheklasPacket;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_TheklasPacket()
{
	CreateInvItems(hero,ItPl_Mana_Herb_01,3);
	CreateInvItems(hero,ItPl_Health_Herb_02,1);
	CreateInvItems(hero,ItPl_Speed_Herb_01,1);
	CreateInvItems(hero,ItPl_Blueplant,2);
	Print(PRINT_GotPlants);
};


instance ItMi_MariasGoldPlate(C_Item)
{
	name = "Těžký zlatý talíř";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Na talíři jsou vyvedena";
	text[3] = "jména Onar a Maria.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_ValentinosRing(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtEdge;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ValentinosRing;
	on_unequip = UnEquip_ValentinosRing;
	wear = WEAR_EFFECT;
	effect = "";
	description = "Valentinův prsten";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ValentinosRing()
{
	self.protection[PROT_EDGE] += Ri_ProtEdge;
	self.protection[PROT_BLUNT] += Ri_ProtEdge;
};

func void UnEquip_ValentinosRing()
{
	self.protection[PROT_EDGE] -= Ri_ProtEdge;
	self.protection[PROT_BLUNT] -= Ri_ProtEdge;
};


instance ItKe_Dexter(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od truhlice,";
	text[3] = "která patří Dexterovi.";
};

instance ItWr_Kraeuterliste(C_Item)
{
	name = "Seznam";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Kraeuterliste;
	scemeName = "MAP";
	description = "Constantinův seznam bylin.";
};


func void Use_Kraeuterliste()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Alchymistické byliny");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Léčivá rostlina");
	Doc_PrintLine(nDocID,0,"Léčivá bylina");
	Doc_PrintLine(nDocID,0,"Léčivý kořen");
	Doc_PrintLine(nDocID,0,"Ohnivá kopřiva");
	Doc_PrintLine(nDocID,0,"Ohnivé býlí");
	Doc_PrintLine(nDocID,0,"Ohnivý kořen");
	Doc_PrintLine(nDocID,0,"Gobliní bobule");
	Doc_PrintLine(nDocID,0,"Dračí kořen");
	Doc_PrintLine(nDocID,0,"Chňapavčí býlí");
	Doc_PrintLine(nDocID,0,"Luční pohanka");
	Doc_PrintLine(nDocID,0,"Královský šťovík");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Poznámka: Ať ti ty byliny obstará nějaký schopný učeň, aspoň poznáš, jestli opravdu za něco stojí. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Zdraví Zuris.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_ManaRezept(C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ManaRezept;
	scemeName = "MAP";
	description = "Recept na esenci magie.";
};


func void Use_ManaRezept()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Magické lektvary");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"K přípravě magických lektvarů potřebuje alchymista:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"ohnivou kopřivu");
	Doc_PrintLine(nDocID,0,"ohnivé býlí");
	Doc_PrintLine(nDocID,0,"ohnivý kořen.");
	Doc_PrintLines(nDocID,0,"Dále si musí opatřit ještě ");
	Doc_PrintLine(nDocID,0,"luční pohanku");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mistr Neoras ");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Passierschein(C_Item)
{
	name = "Propustka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassierschein;
	scemeName = "MAP";
	description = name;
	text[3] = "S těmito dokumenty mne";
	text[4] = "stráže pustí do města.";
};


func void UsePassierschein()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Propustka");
	Doc_PrintLine(nDocID,0,"         Khorinis");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0," Nositel tohoto dokumentu");
	Doc_PrintLine(nDocID,0," se může po neomezenou dobu volně");
	Doc_PrintLine(nDocID,0," pohybovat v dolní části Khorinisu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Larius");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     královský místodržící");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMi_HerbPaket(C_Item)
{
	name = "Balíček trávy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Těžký a měkký balíček, který";
	text[3] = "je cítit trávou z bažin.";
	text[5] = NAME_Value;
	count[5] = 200;
};

instance ItKe_Storage(C_Item)
{
	name = "Klíč od skladiště";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od přístavního";
	text[3] = "skladiště.";
};


const int HP_Hering = 20;

instance ItFo_SmellyFish(C_Item)
{
	name = "Sleď";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_SmellyFish;
	description = "Sleď (herynek).";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Hering;
	text[5] = NAME_Value;
	count[5] = Value_Fish;
};


func void Use_SmellyFish()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Hering);
};


instance ItFo_HalvorFish_MIS(C_Item)
{
	name = "Podivná ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_HalvorFish;
	description = "Tato ryba vypadá zvláštně.";
	text[2] = "S touto rybou není něco v pořádku.";
	text[3] = "Jako by ji někdo rozřízl a pak zašil.";
};


func void Use_HalvorFish()
{
	CreateInvItems(hero,ItWr_HalvorMessage,1);
	Print(PRINT_FishLetter);
};


instance ItWr_HalvorMessage(C_Item)
{
	name = "Páchnoucí zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseHalvorMessage;
	scemeName = "MAP";
	description = name;
	text[2] = "Tato zpráva byla ukryta v rybě.";
};


func void UseHalvorMessage()
{
	var int nDocID;
	Knows_Halvor = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0," Koukejte držet hubu a krok! ");
	Doc_PrintLine(nDocID,0," Stráže začínají mít podezření.");
	Doc_PrintLine(nDocID,0," Nedělejte nic, dokud se vám zase neozvu!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Halvor");
	Doc_Show(nDocID);
};


instance ItMw_AlriksSword_Mis(C_Item)
{
	name = "Alrikův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_SWD;
	material = MAT_METAL;
	value = Value_Alrik;
	damageTotal = Damage_Alrik;
	damagetype = DAM_EDGE;
	range = Range_Alrik;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Alrik;
	visual = "ItMw_025_1h_Sld_Sword_01.3DS";
	on_equip = Equip_AlriksSword;
	on_unequip = UnEquip_AlriksSword;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_AlriksSword()
{
	B_AddFightSkill(self,NPC_TALENT_1H,10);
};

func void UnEquip_AlriksSword()
{
	B_AddFightSkill(self,NPC_TALENT_1H,-10);
};


instance ItWr_VatrasMessage(C_Item)
{
	name = "Zapečetěná zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessage;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Zpráva od Vatrase";
	text[3] = "pro mágy ohně.";
};


func void UseVatrasMessage()
{
	var int nDocID;
	CreateInvItems(self,ItWr_VatrasMessage_Open,1);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Milý Isgarothu,");
	Doc_PrintLines(nDocID,0,"Cítím, že tu s námi dlí ještě jedna moc, která je čím dál silnější.");
	Doc_PrintLines(nDocID,0,"Je to něco naprosto neznámého. Že by se k nám blížili Beliarovi vazalové?");
	Doc_PrintLines(nDocID,0,"Možná se pletu, ale věřím, že by bylo moudré tuhle věc svěřit otci Pyrokarovi. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nechť vyslyší naše modlitby.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Vatras");
	Doc_Show(nDocID);
};


instance ItWr_VatrasMessage_Open(C_Item)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessageOpen;
	scemeName = "MAP";
	description = name;
	text[2] = "Zpráva od Vatrase";
	text[3] = "pro mágy ohně.";
	text[4] = "Pečeť byla zlomena.";
};


func void UseVatrasMessageOpen()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Milý Isgarothu,");
	Doc_PrintLines(nDocID,0,"Cítím, že tu s námi dlí ještě jedna moc, která je čím dál silnější.");
	Doc_PrintLines(nDocID,0,"Je to něco naprosto neznámého. Že by se k nám blížili Beliarovi vazalové?");
	Doc_PrintLines(nDocID,0,"Možná se pletu, ale věřím, že by bylo moudré tuhle věc svěřit otci Pyrokarovi. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nechť vyslyší naše modlitby.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Vatras");
	Doc_Show(nDocID);
};


instance ItKe_Hotel(C_Item)
{
	name = "Klíč od pokoje";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od hotelového";
	text[3] = "pokoje.";
};

instance ItKe_ThiefGuildKey_MIS(C_Item)
{
	name = "Rezavý klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Tento klíč poznamenala slaná mořská voda.";
};

instance ItKe_ThiefGuildKey_Hotel_MIS(C_Item)
{
	name = "Rezavý klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od hotelového sklepa.";
};

instance ItKe_Innos_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od portálu, který vede";
	text[3] = "do Innosovy svatyně.";
};

instance ItKe_KlosterSchatz(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od klášterní ";
	text[3] = "pokladnice.";
};

instance ItKe_KlosterStore(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od klášterní ";
	text[3] = "spižírny.";
};

instance ItKe_KDFPlayer(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od klášterní ";
	text[3] = "síně.";
};

instance ItKe_KlosterBibliothek(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od klášterní ";
	text[3] = "knihovny.";
};

instance ItFo_Schafswurst(C_Item)
{
	name = "Skopová klobása";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Sausage;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Schafswurst;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Sausage;
	text[5] = NAME_Value;
	count[5] = Value_Sausage;
};


func void Use_Schafswurst()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Sausage);
};


instance ItPo_Perm_LittleMana(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 150;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_LittleMana;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "Esence ducha";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 3;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_LittleMana()
{
	B_RaiseAttribute(self,ATR_MANA_MAX,3);
	Npc_ChangeAttribute(self,ATR_MANA,3);
};


instance Holy_Hammer_MIS(C_Item)
{
	name = "Posvátné kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_HolyHammer;
	owner = Nov_608_Garwig;
	damageTotal = Damage_HolyHammer;
	damagetype = DAM_BLUNT;
	range = Range_HolyHammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_HolyHammer;
	visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	description = name;
	text[2] = "Zranění:                 ??";
	text[3] = "Požadovaná síla:         ??";
	text[4] = "Obouruční zbraň             ";
	text[5] = "Cena:  nelze určit";
};

instance ItKe_MagicChest(C_Item)
{
	name = "Starý klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Starý železný klíč.";
	text[3] = "Mohl by patřit k nějakému";
	text[4] = "visacímu zámku.";
};

instance ItWr_Passage_MIS(C_Item)
{
	name = "Návrh mírové smlouvy s paladiny";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassage;
	scemeName = "MAP";
	description = name;
	text[3] = "S touto zprávou budu moci";
	text[4] = "vidět lorda Hagena.";
};


func void UsePassage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Velevážený lorde Hagene,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Oba víme, jaká je Vaše situace, a proto navrhují následující ujednání: ");
	Doc_PrintLines(nDocID,0,"Zajistěte mně i mým mužům bezúhonnost před Innosem i před králem ");
	Doc_PrintLines(nDocID,0,"a my vám na oplátku pomůžeme ochraňovat město i okolní země. ");
	Doc_PrintLines(nDocID,0,"Já sám krom toho osobně dohlédnu, aby se moji muži drželi dál od okolních statků - samozřejmě kromě toho Onarova, kde budeme sídlit i nadále.");
	Doc_PrintLines(nDocID,0,"Vím, že na palubě lodi, kterou vypravujete k pevnině, je dost místa pro mě i pro některé z mých mužů. Proto chci plout s Vámi.");
	Doc_PrintLines(nDocID,0,"Prosím Vás, rozhodněte se moudře. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"podepsaný   generál Lee");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_BanditLetter_MIS(C_Item)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBanditLetter;
	scemeName = "MAP";
	description = name;
	text[3] = "";
	text[4] = "";
};


func void UseBanditLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Zastav každého muže, ");
	Doc_PrintLine(nDocID,0," který přichází z hor.");
	Doc_PrintLine(nDocID,0,"Jestli na něj narazíš, pak ");
	Doc_PrintLine(nDocID,0," to bude nejspíš náš starý známý.");
	Doc_PrintLine(nDocID,0,"Dej si pozor, ať mu nenaletíš - ");
	Doc_PrintLine(nDocID,0," je to nebezpečný čaroděj.   ");
	Doc_PrintLine(nDocID,0,"Buď stále ve střehu.");
	Doc_PrintLine(nDocID,0,"     ");
	Doc_PrintLine(nDocID,0,"Je možné, že se s ním spojí ten chlápek, ");
	Doc_PrintLine(nDocID,0," co ho hledáme. ");
	Doc_PrintLine(nDocID,0,"Spolu s tímhle dopisem ti posílám ");
	Doc_PrintLine(nDocID,0," třicet zlaťáků. ");
	Doc_PrintLine(nDocID,0,"Dalších třicet dostane ten, ");
	Doc_PrintLine(nDocID,0," kdo toho chlapa zabije. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Jeho hlavu dones do starého dolu u statku.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,".....D.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Poster_MIS(C_Item)
{
	name = "Zpráva o hledaném";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePoster;
	scemeName = "MAP";
	description = name;
	text[3] = "Ten portrét je můj!";
	text[4] = "";
};


func void UsePoster()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Gesucht.TGA",0);
	Doc_Show(nDocID);
};


instance ItKe_Bandit(C_Item)
{
	name = "Klíč od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč, který měl u sebe";
	text[3] = "bandita.";
};

instance ItRw_Bow_L_03_MIS(C_Item)
{
	name = "Lovecký luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Jagdbogen;
	damageTotal = Damage_Jagdbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Jagdbogen;
	visual = "ItRw_Bow_L_03.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = "Bosperův lovecký luk.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_Prot_Point_01_MIS(C_Item)
{
	name = "Constantinův prsten";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtPoint;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_01_MIS;
	on_unequip = UnEquip_ItRi_Prot_Point_01_MIS;
	wear = WEAR_EFFECT;
	effect = "";
	description = "Dřevěná zábrana ";
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] -= Ri_ProtPoint;
};


instance ItMi_EddasStatue(C_Item)
{
	name = "Innosova socha";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Innosi, Pane spravedlnosti, ";
	text[3] = "požehnej mi, veď mne";
	text[4] = "a chraň mne od všeho zlého.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_EVT_CRYPT_01(C_Item)
{
	name = "Starý mosazný klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od kostlivce v místnosti 1";
};

instance ItKe_EVT_CRYPT_02(C_Item)
{
	name = "Starý mosazný klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od kostlivce v místnosti 2";
};

instance ItKe_EVT_CRYPT_03(C_Item)
{
	name = "Starý mosazný klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od kostlivce v místnosti 3";
};


const int VALUE_ITAR_PAL_SKEL = 500;

instance ITAR_PAL_SKEL(C_Item)
{
	name = "Stará rytířská zbroj";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = value_itar_pal_skel;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_Skeleton.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Valentino(C_Item)
{
	name = "Klíč od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od Valentinovy";
	text[3] = "truhlice.";
};

instance ItKe_Buerger(C_Item)
{
	name = "Klíč od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Tohle leželo na parapetu.";
	text[3] = "";
};

instance ItKe_Richter(C_Item)
{
	name = "Klíč od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od soudcovy";
	text[3] = "truhlice.";
};

instance ItKe_Salandril(C_Item)
{
	name = "Klíč od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od truhlice,";
	text[3] = "která patří alchymistovi Salandrilovi.";
};

instance ItKe_PaladinTruhe(C_Item)
{
	name = "Klíč od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Malý mosazný klíček";
	text[3] = "od příbytku paladinů.";
};

instance ItKe_ThiefTreasure(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Malý klíček";
};

instance ItKe_Fingers(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Rezavý klíč ode dveří";
	text[3] = "do stok";
};

instance ItWr_Schuldenbuch(C_Item)
{
	name = "Kniha závazků";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Lehmarova účetní kniha.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchuldBuch;
};


func void UseSchuldBuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pohledávky a závazky");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Já mistr Thorben, khorinisský tesař, dlužím ctihodnému Lehmarovi 200 zlaťáků.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"             Thorben");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Já Coragon, khorinisský hostinský, dlužím ctihodnému Lehmarovi 150 zlaťáků.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"             Coragon");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Já Hanna, khorinisská hostinská, dlužím ctihodnému Lehmarovi 250 zlaťáků.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"               Hanna");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ItPl_Sagitta_Herb_MIS(C_Item)
{
	name = "Sluneční aloe";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Strength_Herb_01;
	visual = "ItPl_Strength_Herb_01.3DS";
	material = MAT_WOOD;
	scemeName = "FOOD";
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_Strength_Herb_01;
};

instance ITKE_ORLAN_HOTELZIMMER(C_Item)
{
	name = "Klíč od pokoje";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "v hospodě 'U Mrtvé harpyje'.";
	text[3] = "";
};

instance ItRw_DragomirsArmbrust_MIS(C_Item)
{
	name = "Dragomirova kuše";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_LeichteArmbrust;
	damageTotal = Damage_LeichteArmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_LeichteArmbrust;
	visual = "ITRW_CROSSBOW_SLD_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

