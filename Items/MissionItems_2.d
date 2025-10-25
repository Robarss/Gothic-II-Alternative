
instance ItMi_StoneOfKnowlegde_MIS(C_Item)
{
	name = "Kámen vědění";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
};

instance ItWr_PaladinLetter_MIS(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePaladinLetter;
	scemeName = "MAP";
	description = "Dopis lordu Hagenovi";
};


func void UsePaladinLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Lorde Hagene!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Expedice do Hornického údolí selhala. Utrpěli jsme těžké ztráty a ti, kteří přežili, jsou nyní lapeni na hradě a obklíčeni skřety. ");
	Doc_PrintLines(nDocID,0,"Také na nás mnohokrát zaútočili draci. Zničili všechny země v okolí hradu. S Innosovou pomocí snad vytrváme, dokud nedorazí posily. Stejně nám nic jiného nezbývá, neboť žádný výpad podniknout nemůžeme. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Nechť nás Innos ochraňuje.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Garond");
	Doc_Show(nDocID);
};


instance ItWr_LetterForGorn_MIS(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLetterForGorn;
	scemeName = "MAP";
	description = "Miltenova zpráva pro Gorna";
};


func void UseLetterForGorn()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Gorne!");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLines(nDocID,0,"Garond souhlasil, že tě propustí - za 1000 zlaťáků. ");
	Doc_PrintLines(nDocID,0,"Takže jestli máš někde ulitý nějaký zlato, bylo by načase se s tím vytasit. ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Milten ");
	Doc_Show(nDocID);
};


instance ItKe_PrisonKey_MIS(C_Item)
{
	name = "Klíč od sklepení";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od hradního";
	text[3] = "sklepení.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_OC_Store(C_Item)
{
	name = "Klíč od skladiště";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klíč od hradního";
	text[3] = "skladiště.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_ErzBaronFlur(C_Item)
{
	name = "Klíč ode dveří";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "K prvním dveřím";
	text[2] = "Na povrchu je vyryto toto jméno:";
	text[3] = "Gomez";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_ErzBaronRaum(C_Item)
{
	name = "Klíč ode dveří";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Ke druhým dveřím.";
	text[2] = "Na povrchu je vyryto toto jméno:";
	text[3] = "Gomez";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GornsTreasure_MIS(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 250;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = UseGornsTreasure;
	description = "Gornův měšec.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseGornsTreasure()
{
	B_PlayerFindItem(ItMi_Gold,250);
	Gorns_Beutel = TRUE;
};


instance ItWr_Silvestro_MIS(C_Item)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItwr_Silvestro;
	scemeName = "MAP";
	description = "Zpráva od Silvestra";
};


func void UseItwr_Silvestro()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Od královského paladina Silvestra ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tak nás čeká další den plný kutání. Dnes se chceme probourat skrze zeď a prodolovat se hlouběji do kamene.");
	Doc_PrintLines(nDocID,0,"Trápí mě ale jakési neblahé tušení, takže si radši všechnu rudu někam schovám.");
	Doc_PrintLines(nDocID,0,"Diego to tady jako jediný z nás zná. Musím mu věřit. Určitě ty bedny ukryje někam do bezpečí - ale nedovolím, aby to udělal sám.");
	Doc_PrintLines(nDocID,0,"Rudu musíme ochránit za každou cenu, a tak s ním posílám ještě dva rytíře.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ať žije král!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Silvestro");
	Doc_Show(nDocID);
};


instance ItAt_ClawLeader(C_Item)
{
	name = "Chňapavčí drápy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = "Drápy vůdce stáda";
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSe_Olav(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = UseOlav;
	description = "Olavův vak";
	text[0] = "";
	text[1] = "";
	text[2] = "Uvnitř cinká několik mincí.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseOlav()
{
	B_PlayerFindItem(ItMi_Gold,25);
};


instance ItMi_GoldPlate_MIS(C_Item)
{
	name = "Zlatý talíř";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Pass_MIS(C_Item)
{
	name = "Klíč od průsmyku";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Malý klíček, který";
	text[1] = "otvírá bránu v průsmyku.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Bromor(C_Item)
{
	name = "Bromorův klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Klíč od pokoje";
	text[1] = "majitele nevěstince.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_RUNE_MIS(C_Item)
{
	name = "Klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Malý klíček od truhlice.";
	text[1] = "Tento klíč patří ke truhlici";
	text[2] = "pod mostem.";
	text[3] = "Obsahuje runový kámen.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Bloody_MIS(C_Item)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBloodMIS;
	scemeName = "MAP";
	description = "Jed krvavé mouchy";
};


func void UseBloodMIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Žihadlo krvavé mouchy obsahuje prudký jed, a proto se ho nikdo, kdo má všech pět pohromadě, nedotýká.");
	Doc_PrintLines(nDocID,0,"Pokud tedy nezná tajemství, jak je spolehlivě vyjmout. ");
	Doc_PrintLines(nDocID,0,"Žihadlo lze čistě otevřít, pokud je ostrým nožem po délce opatrně naříznete");
	Doc_PrintLines(nDocID,0,"a sloupnete tak svrchní kůži. Pak už jen stačí odstranit tkáň kolem jedových žláz. ");
	Doc_PrintLines(nDocID,0,"Zvláštní tekutina z této tkáně má léčivé účinky,");
	Doc_PrintLines(nDocID,0,"ale lidské tělo se vůči nim bohužel časem stává imunní.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Damarok");
	Doc_Show(nDocID);
	if(Knows_Bloodfly == FALSE)
	{
		Knows_Bloodfly = TRUE;
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"Nyní vím, jak ze žihadel krvavých much získat léčivou tekutinu. ");
		B_GivePlayerXP(XP_Ambient);
	};
};


instance ItWr_Pfandbrief_MIS(C_Item)
{
	name = "Smlouva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePfandbrief;
	scemeName = "MAP";
	description = name;
};


func void UsePfandbrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Při platbě nevyrovnaných dluhů lze  ");
	Doc_PrintLine(nDocID,0,"přijmout do zástavy i nějakou věc, pokud");
	Doc_PrintLine(nDocID,0,"její hodnota daný závazek vyrovná.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"V zástavě: zdobený zlatý kalich ");
	Doc_PrintLines(nDocID,0,"ze sbírky krvavých kalichů.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"podepsán");
	Doc_PrintLine(nDocID,0,"Lutero, kupec  ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Lehmar, majitel zastavárny");
	Doc_Show(nDocID);
};


instance ItWr_Map_OldWorld_Oremines_MIS(C_Item)
{
	name = "Garondova mapa dolů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_OldWorld_Oremines;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_OldWorld_Oremines()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_OldWorld_Oremines_MIS);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorld_Oremines.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


instance ItWr_Manowar(C_Item)
{
	name = "Text";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseManowar;
	scemeName = "MAP";
	description = "Texty písní.";
};


func void UseManowar()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dominikovo volání");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Sklidíme Jeho slávu. ");
	Doc_PrintLines(nDocID,0,"Innos stojí při mně i při mých bratrech.");
	Doc_PrintLines(nDocID,0,"Každého, kdo se mě pokusí zastavit, podříznu jak ovci,");
	Doc_PrintLines(nDocID,0,"neboť On mi v srdci zažehl oheň.");
	Doc_PrintLines(nDocID,0,"Můj meč slouží jen Jemu samotnému.  ");
	Doc_PrintLines(nDocID,0,"A dnes se bude Jeho jméno všude rozléhat.");
	Doc_PrintLines(nDocID,0,"Každého, kdo se mi postaví,");
	Doc_PrintLines(nDocID,0,"vlastnoručně skolím,");
	Doc_PrintLines(nDocID,0,"neboť já jsem Innosovým válečníkem.");
	Doc_Show(nDocID);
};


instance ItWr_KDWLetter(C_Item)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseKDWLetter;
	scemeName = "MAP";
	description = "Zpráva.";
};


func void UseKDWLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Opustili jsme tábor. Teď, když bariéra padla, pátráme po středu celé zkázy. Možná tam najdeme odpovědi, po kterých se pídíme už po dlouhá léta. Jen Adanos ví, kam nás cesta zavede.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Adanos nás provázej.");
	Doc_PrintLine(nDocID,0,"Saturas");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_GilbertLetter(C_Item)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseGilbertLetter;
	scemeName = "MAP";
	description = "Zpráva.";
};


func void UseGilbertLetter()
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
	Doc_PrintLines(nDocID,0,"Začíná mě to pěkně štvát. Už jsem se tu schovával dost dlouho a jestli jsem dobře slyšel, bariéra konečně padla.  ");
	Doc_PrintLines(nDocID,0,"Teď už mě nikdo nebude hledat. Mám plné zuby téhle hnusné jeskyně i toho zatraceného údolí. Je načase vrátit se domů.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Gilbert");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItRi_Tengron(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Hp;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Tengron;
	on_unequip = UnEquip_ItRi_Tengron;
	wear = WEAR_EFFECT;
	effect = "";
	description = NAME_ADDON_TengronsRing;
	text[2] = NAME_Bonus_HP;
	count[2] = Ri_Hp;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp;
};

func void UnEquip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_Hp;
	if(self.attribute[ATR_HITPOINTS] > (Ri_Hp + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};

