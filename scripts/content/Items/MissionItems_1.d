
instance ItKe_Xardas(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl?? od truhlice,";
	text[3] = "kter? pat?? Xardasovi.";
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
	description = "Canthar?v dopis obchodnici Sarah.";
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
	Doc_PrintLine(nDocID,0,"  Posledn? varov?n?");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0," U? jsem ti n?kolikr?t p??telsky");
	Doc_PrintLine(nDocID,0," p?ipom?nal, ?e nutn? pot?ebuji");
	Doc_PrintLine(nDocID,0," ty zbran?, kter? jsem si");
	Doc_PrintLine(nDocID,0," u tebe p?ed t?dnem");
	Doc_PrintLine(nDocID,0," objednal.");
	Doc_PrintLine(nDocID,0," Jestli mi ve velmi brzk? dob?");
	Doc_PrintLine(nDocID,0," nepod?? ??dnou zpr?vu, budu se k tob?");
	Doc_PrintLine(nDocID,0," muset za??t chovat trochu jinak. Douf?m,");
	Doc_PrintLine(nDocID,0," ?e si rozum?me!!!!!!!!!!!!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Onar");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMw_2h_Rod(C_Item)
{
	name = "Rod?v obouru?n? me?";
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
	name = "Coragonovo st??bro";
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
	name = "Theklin bal?k";
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
	name = "T??k? zlat? tal??";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Na tal??i jsou vyvedena";
	text[3] = "jm?na Onar a Maria.";
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
	description = "Valentin?v prsten";
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
	text[2] = "Kl?? od truhlice,";
	text[3] = "kter? pat?? Dexterovi.";
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
	description = "Constantin?v seznam bylin.";
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
	Doc_PrintLine(nDocID,0,"Alchymistick? byliny");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"L??iv? rostlina");
	Doc_PrintLine(nDocID,0,"L??iv? bylina");
	Doc_PrintLine(nDocID,0,"L??iv? ko?en");
	Doc_PrintLine(nDocID,0,"Ohniv? kop?iva");
	Doc_PrintLine(nDocID,0,"Ohniv? b?l?");
	Doc_PrintLine(nDocID,0,"Ohniv? ko?en");
	Doc_PrintLine(nDocID,0,"Goblin? bobule");
	Doc_PrintLine(nDocID,0,"Dra?? ko?en");
	Doc_PrintLine(nDocID,0,"Ch?apav?? b?l?");
	Doc_PrintLine(nDocID,0,"Lu?n? pohanka");
	Doc_PrintLine(nDocID,0,"Kr?lovsk? ??ov?k");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pozn?mka: A? ti ty byliny obstar? n?jak? schopn? u?e?, aspo? pozn??, jestli opravdu za n?co stoj?. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Zdrav? Zuris.");
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
	Doc_PrintLine(nDocID,0,"Magick? lektvary");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"K p??prav? magick?ch lektvar? pot?ebuje alchymista:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"ohnivou kop?ivu");
	Doc_PrintLine(nDocID,0,"ohniv? b?l?");
	Doc_PrintLine(nDocID,0,"ohniv? ko?en.");
	Doc_PrintLines(nDocID,0,"D?le si mus? opat?it je?t? ");
	Doc_PrintLine(nDocID,0,"lu?n? pohanku");
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
	text[3] = "S t?mito dokumenty mne";
	text[4] = "str??e pust? do m?sta.";
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
	Doc_PrintLine(nDocID,0," se m??e po neomezenou dobu voln?");
	Doc_PrintLine(nDocID,0," pohybovat v doln? ??sti Khorinisu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Larius");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     kr?lovsk? m?stodr??c?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMi_HerbPaket(C_Item)
{
	name = "Bal??ek tr?vy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "T??k? a m?kk? bal??ek, kter?";
	text[3] = "je c?tit tr?vou z ba?in.";
	text[5] = NAME_Value;
	count[5] = 200;
};

instance ItKe_Storage(C_Item)
{
	name = "Kl?? od skladi?t?";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl?? od p??stavn?ho";
	text[3] = "skladi?t?.";
};


const int HP_Hering = 20;

instance ItFo_SmellyFish(C_Item)
{
	name = "Sle?";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_SmellyFish;
	description = "Sle? (herynek).";
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
	name = "Podivn? ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_HalvorFish;
	description = "Tato ryba vypad? zvl??tn?.";
	text[2] = "S touto rybou nen? n?co v po??dku.";
	text[3] = "Jako by ji n?kdo roz??zl a pak za?il.";
};


func void Use_HalvorFish()
{
	CreateInvItems(hero,ItWr_HalvorMessage,1);
	Print(PRINT_FishLetter);
};


instance ItWr_HalvorMessage(C_Item)
{
	name = "P?chnouc? zpr?va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseHalvorMessage;
	scemeName = "MAP";
	description = name;
	text[2] = "Tato zpr?va byla ukryta v ryb?.";
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
	Doc_PrintLine(nDocID,0," Koukejte dr?et hubu a krok! ");
	Doc_PrintLine(nDocID,0," Str??e za??naj? m?t podez?en?.");
	Doc_PrintLine(nDocID,0," Ned?lejte nic, dokud se v?m zase neozvu!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Halvor");
	Doc_Show(nDocID);
};


instance ItMw_AlriksSword_Mis(C_Item)
{
	name = "Alrik?v me?";
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
	name = "Zape?et?n? zpr?va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessage;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Zpr?va od Vatrase";
	text[3] = "pro m?gy ohn?.";
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
	Doc_PrintLine(nDocID,0,"Mil? Isgarothu,");
	Doc_PrintLines(nDocID,0,"C?t?m, ?e tu s n?mi dl? je?t? jedna moc, kter? je ??m d?l siln?j??.");
	Doc_PrintLines(nDocID,0,"Je to n?co naprosto nezn?m?ho. ?e by se k n?m bl??ili Beliarovi vazalov??");
	Doc_PrintLines(nDocID,0,"Mo?n? se pletu, ale v???m, ?e by bylo moudr? tuhle v?c sv??it otci Pyrokarovi. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nech? vysly?? na?e modlitby.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Vatras");
	Doc_Show(nDocID);
};


instance ItWr_VatrasMessage_Open(C_Item)
{
	name = "Zpr?va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessageOpen;
	scemeName = "MAP";
	description = name;
	text[2] = "Zpr?va od Vatrase";
	text[3] = "pro m?gy ohn?.";
	text[4] = "Pe?e? byla zlomena.";
};


func void UseVatrasMessageOpen()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Mil? Isgarothu,");
	Doc_PrintLines(nDocID,0,"C?t?m, ?e tu s n?mi dl? je?t? jedna moc, kter? je ??m d?l siln?j??.");
	Doc_PrintLines(nDocID,0,"Je to n?co naprosto nezn?m?ho. ?e by se k n?m bl??ili Beliarovi vazalov??");
	Doc_PrintLines(nDocID,0,"Mo?n? se pletu, ale v???m, ?e by bylo moudr? tuhle v?c sv??it otci Pyrokarovi. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nech? vysly?? na?e modlitby.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Vatras");
	Doc_Show(nDocID);
};


instance ItKe_Hotel(C_Item)
{
	name = "Kl?? od pokoje";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl?? od hotelov?ho";
	text[3] = "pokoje.";
};

instance ItKe_ThiefGuildKey_MIS(C_Item)
{
	name = "Rezav? kl??";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Tento kl?? poznamenala slan? mo?sk? voda.";
};

instance ItKe_ThiefGuildKey_Hotel_MIS(C_Item)
{
	name = "Rezav? kl??";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl?? od hotelov?ho sklepa.";
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
	text[2] = "Kl?? od port?lu, kter? vede";
	text[3] = "do Innosovy svatyn?.";
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
	text[2] = "Kl?? od kl??tern? ";
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
	text[2] = "Kl?? od kl??tern? ";
	text[3] = "spi??rny.";
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
	text[2] = "Kl?? od kl??tern? ";
	text[3] = "s?n?.";
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
	text[2] = "Kl?? od kl??tern? ";
	text[3] = "knihovny.";
};

instance ItFo_Schafswurst(C_Item)
{
	name = "Skopov? klob?sa";
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
	name = "Posv?tn? kladivo";
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
	text[2] = "Zran?n?:                 ??";
	text[3] = "Po?adovan? s?la:         ??";
	text[4] = "Obouru?n? zbra?             ";
	text[5] = "Cena:  nelze ur?it";
};

instance ItKe_MagicChest(C_Item)
{
	name = "Star? kl??";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Star? ?elezn? kl??.";
	text[3] = "Mohl by pat?it k n?jak?mu";
	text[4] = "visac?mu z?mku.";
};

instance ItWr_Passage_MIS(C_Item)
{
	name = "N?vrh m?rov? smlouvy s paladiny";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassage;
	scemeName = "MAP";
	description = name;
	text[3] = "S touto zpr?vou budu moci";
	text[4] = "vid?t lorda Hagena.";
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
	Doc_PrintLine(nDocID,0,"Velev??en? lorde Hagene,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Oba v?me, jak? je Va?e situace, a proto navrhuj? n?sleduj?c? ujedn?n?: ");
	Doc_PrintLines(nDocID,0,"Zajist?te mn? i m?m mu??m bez?honnost p?ed Innosem i p?ed kr?lem ");
	Doc_PrintLines(nDocID,0,"a my v?m na opl?tku pom??eme ochra?ovat m?sto i okoln? zem?. ");
	Doc_PrintLines(nDocID,0,"J? s?m krom toho osobn? dohl?dnu, aby se moji mu?i dr?eli d?l od okoln?ch statk? - samoz?ejm? krom? toho Onarova, kde budeme s?dlit i nad?le.");
	Doc_PrintLines(nDocID,0,"V?m, ?e na palub? lodi, kterou vypravujete k pevnin?, je dost m?sta pro m? i pro n?kter? z m?ch mu??. Proto chci plout s V?mi.");
	Doc_PrintLines(nDocID,0,"Pros?m V?s, rozhodn?te se moud?e. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"podepsan?   gener?l Lee");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_BanditLetter_MIS(C_Item)
{
	name = "Zpr?va";
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
	Doc_PrintLine(nDocID,0,"Zastav ka?d?ho mu?e, ");
	Doc_PrintLine(nDocID,0," kter? p?ich?z? z hor.");
	Doc_PrintLine(nDocID,0,"Jestli na n?j naraz??, pak ");
	Doc_PrintLine(nDocID,0," to bude nejsp?? n?? star? zn?m?.");
	Doc_PrintLine(nDocID,0,"Dej si pozor, a? mu nenalet?? - ");
	Doc_PrintLine(nDocID,0," je to nebezpe?n? ?arod?j.   ");
	Doc_PrintLine(nDocID,0,"Bu? st?le ve st?ehu.");
	Doc_PrintLine(nDocID,0,"     ");
	Doc_PrintLine(nDocID,0,"Je mo?n?, ?e se s n?m spoj? ten chl?pek, ");
	Doc_PrintLine(nDocID,0," co ho hled?me. ");
	Doc_PrintLine(nDocID,0,"Spolu s t?mhle dopisem ti pos?l?m ");
	Doc_PrintLine(nDocID,0," t?icet zla??k?. ");
	Doc_PrintLine(nDocID,0,"Dal??ch t?icet dostane ten, ");
	Doc_PrintLine(nDocID,0," kdo toho chlapa zabije. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Jeho hlavu dones do star?ho dolu u statku.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,".....D.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Poster_MIS(C_Item)
{
	name = "Zpr?va o hledan?m";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePoster;
	scemeName = "MAP";
	description = name;
	text[3] = "Ten portr?t je m?j!";
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
	name = "Kl?? od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl??, kter? m?l u sebe";
	text[3] = "bandita.";
};

instance ItRw_Bow_L_03_MIS(C_Item)
{
	name = "Loveck? luk";
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
	text[4] = "Bosper?v loveck? luk.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_Prot_Point_01_MIS(C_Item)
{
	name = "Constantin?v prsten";
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
	description = "D?ev?n? z?brana ";
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
	text[3] = "po?ehnej mi, ve? mne";
	text[4] = "a chra? mne od v?eho zl?ho.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_EVT_CRYPT_01(C_Item)
{
	name = "Star? mosazn? kl??";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl?? od kostlivce v m?stnosti 1";
};

instance ItKe_EVT_CRYPT_02(C_Item)
{
	name = "Star? mosazn? kl??";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl?? od kostlivce v m?stnosti 2";
};

instance ItKe_EVT_CRYPT_03(C_Item)
{
	name = "Star? mosazn? kl??";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl?? od kostlivce v m?stnosti 3";
};


const int VALUE_ITAR_PAL_SKEL = 500;

instance ITAR_PAL_SKEL(C_Item)
{
	name = "Star? ryt??sk? zbroj";
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
	name = "Kl?? od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl?? od Valentinovy";
	text[3] = "truhlice.";
};

instance ItKe_Buerger(C_Item)
{
	name = "Kl?? od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Tohle le?elo na parapetu.";
	text[3] = "";
};

instance ItKe_Richter(C_Item)
{
	name = "Kl?? od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl?? od soudcovy";
	text[3] = "truhlice.";
};

instance ItKe_Salandril(C_Item)
{
	name = "Kl?? od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Kl?? od truhlice,";
	text[3] = "kter? pat?? alchymistovi Salandrilovi.";
};

instance ItKe_PaladinTruhe(C_Item)
{
	name = "Kl?? od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Mal? mosazn? kl??ek";
	text[3] = "od p??bytku paladin?.";
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
	text[2] = "Mal? kl??ek";
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
	text[2] = "Rezav? kl?? ode dve??";
	text[3] = "do stok";
};

instance ItWr_Schuldenbuch(C_Item)
{
	name = "Kniha z?vazk?";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Lehmarova ??etn? kniha.";
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
	Doc_PrintLines(nDocID,0,"Pohled?vky a z?vazky");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"J? mistr Thorben, khorinissk? tesa?, dlu??m ctihodn?mu Lehmarovi 200 zla??k?.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"             Thorben");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"J? Coragon, khorinissk? hostinsk?, dlu??m ctihodn?mu Lehmarovi 150 zla??k?.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"             Coragon");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"J? Hanna, khorinissk? hostinsk?, dlu??m ctihodn?mu Lehmarovi 250 zla??k?.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"               Hanna");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ItPl_Sagitta_Herb_MIS(C_Item)
{
	name = "Slune?n? aloe";
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
	name = "Kl?? od pokoje";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "v hospod? 'U Mrtv? harpyje'.";
	text[3] = "";
};

instance ItRw_DragomirsArmbrust_MIS(C_Item)
{
	name = "Dragomirova ku?e";
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

