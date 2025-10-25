
const int Value_Apple = 8;
const int HP_Apple = 3;
const int Value_Cheese = 30;
const int HP_Cheese = 15;
const int Value_Bacon = 50;
const int HP_Bacon = 20;
const int Value_Bread = 20;
const int HP_Bread = 10;
const int Value_Fish = 15;
const int HP_Fish = 3;
const int VALUE_FISH2 = 20;
const int HP_FISH2 = 10;
const int Value_Rawmeat = 3;
const int HP_RawMeat = 6;
const int Value_Meat = 6;
const int HP_Meat = 12;
const int Value_Stew = 8;
const int HP_Stew = 20;
const int Value_FishSoup = 20;
const int HP_FishSoup = 10;
const int Value_Sausage = 30;
const int HP_Sausage = 12;
const int Value_Honey = 30;
const int HP_Honey = 12;
const int Value_Water = 10;
const int HP_Water = 8;
const int Value_Beer = 20;
const int HP_Beer = 3;
const int Mana_Beer = 1;
const int Value_Booze = 15;
const int HP_Booze = 4;
const int Mana_Booze = 1;
const int Value_Wine = 20;
const int HP_Wine = 2;
const int Mana_Wine = 1;
const int Value_Milk = 15;
const int HP_Milk = 5;
const int Mana_Milk = 1;
const int VALUE_COOKHPI = 45;
const int HP_COOKHPI = 5;
const int VALUE_COOKHPII = 65;
const int HP_COOKHPII = 10;
const int VALUE_STR = 25;
const int HP_STR = 40;
const int VALUE_DEX = 25;
const int HP_DEX = 45;
const int VALUE_KWIN = 60;
const int HP_KWIN = 25;
const int VALUE_COOKWIN = 250;
const int MANA_COOKWIN = 3;
const int VALUE_HOLYWATERS = 80;
const int HP_HOLYWATERS = 2;

instance ItFo_Apple(C_Item)
{
	name = "Jablko";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Apple;
	visual = "ItFo_Apple.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Apple;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Apple;
	text[3] = "Čerstvé jablko,";
	text[4] = "křupavé a šťavnaté.";
	text[5] = NAME_Value;
	count[5] = Value_Apple;
};


func void Use_Apple()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Apple);
	if(Npc_IsPlayer(self))
	{
		Apple_Bonus = Apple_Bonus + 1;
		if(Apple_Bonus == 7)
		{
			Print(PRINT_Eat1);
		};
		if(Apple_Bonus == 15)
		{
			Print(PRINT_Eat2);
		};
		if(Apple_Bonus == 25)
		{
			Print(PRINT_Eat3);
			B_RaiseAttribute(self,ATR_STRENGTH,1);
			Snd_Play("LevelUp");
			Apple_Bonus = 0;
		};
	};
};


instance ITFO_KWIN(C_Item)
{
	name = "Hrozen";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Cheese;
	visual = "ItFo_kWin.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Cheese;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_KWIN;
	text[5] = NAME_Value;
	count[5] = VALUE_KWIN;
};


func void use_kwin()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_KWIN);
};


instance ITFO_HOLYWATER(C_Item)
{
	name = "Svěcená léčivá voda";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_HOLYWATERS;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = use_holywater;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_HOLYWATERS;
	text[4] = "Ta voda opravdu léčí";
	text[5] = NAME_Value;
	count[5] = VALUE_HOLYWATERS;
};


func void use_holywater()
{
	var string concatText;
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,HP_HOLYWATERS);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HOLYWATERS);
	concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(HP_HOLYWATERS));
	PrintScreen(concatText,40,-1,FONT_Screen,2);
};


instance ItFo_Cheese(C_Item)
{
	name = "Sýr";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Cheese;
	visual = "ItFo_Cheese.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Cheese;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Cheese;
	text[5] = NAME_Value;
	count[5] = Value_Cheese;
};


func void Use_Cheese()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Cheese);
};


instance ItFo_Bacon(C_Item)
{
	name = "Šunka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Bacon;
	visual = "ItFo_Bacon.3ds";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Bacon;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Bacon;
	text[5] = NAME_Value;
	count[5] = Value_Bacon;
};


func void Use_Bacon()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Bacon);
};


instance ItFo_Bread(C_Item)
{
	name = "Chléb";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Bread;
	visual = "ItFo_Bread.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Bread;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Bread;
	text[5] = NAME_Value;
	count[5] = Value_Bread;
};


func void Use_Bread()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Bread);
};


instance ItFo_Fish(C_Item)
{
	name = "Ryba";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Fish;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Fish;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Fish;
	text[5] = NAME_Value;
	count[5] = Value_Fish;
};


func void Use_Fish()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Fish);
};


instance ITFO_FISH2(C_Item)
{
	name = "Pečená ryba";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_FISH2;
	visual = "ITFO_FISH_GEBRATEN.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = use_fish2;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_FISH2;
	text[5] = NAME_Value;
	count[5] = VALUE_FISH2;
};


func void use_fish2()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FISH2);
};


instance ItFoMuttonRaw(C_Item)
{
	name = "Syrové maso";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Rawmeat;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_RawMeat;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_RawMeat;
	text[5] = NAME_Value;
	count[5] = Value_Rawmeat;
};


func void Use_RawMeat()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_RawMeat);
};


instance ItFoMutton(C_Item)
{
	name = "Opečené maso";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Meat;
	visual = "ItFoMutton.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_Meat;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Meat;
	text[5] = NAME_Value;
	count[5] = Value_Meat;
};


func void Use_Meat()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Meat);
};


instance ItFo_Stew(C_Item)
{
	name = "Vývar";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Stew;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_Stew;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Stew;
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};


func void Use_Stew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Stew);
};


instance ItFo_XPStew(C_Item)
{
	name = "Theklčin vývar";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Stew;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_XPStew;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Stew;
	text[2] = NAME_Bonus_Str;
	count[2] = 1;
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};


func void Use_XPStew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Stew);
	Snd_Play("LevelUp");
	B_RaiseAttribute(self,ATR_STRENGTH,1);
};


instance ItFo_CoragonsBeer(C_Item)
{
	name = "Pivo";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Beer;
	visual = "ItFo_Beer_NEW.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = Use_CoragonsBeerBeer;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Beer;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Beer;
	text[4] = "Coragonovo speciální pivo";
	text[5] = NAME_Value;
	count[5] = Value_Beer;
};


func void Use_CoragonsBeerBeer()
{
	var string concatText;
	B_RaiseAttribute(self,ATR_MANA_MAX,Mana_Beer);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Beer);
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,HP_Beer);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Beer);
	concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(HP_Beer));
	PrintScreen(concatText,55,-1,FONT_Screen,2);
};


instance ItFo_FishSoup(C_Item)
{
	name = "Rybí polévka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_FishSoup;
	visual = "ItFo_FishSoup.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_FishSoup;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_FishSoup;
	text[5] = NAME_Value;
	count[5] = Value_FishSoup;
};


func void Use_FishSoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FishSoup);
};


instance ItFo_Sausage(C_Item)
{
	name = "Klobása";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Sausage;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Sausage;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Sausage;
	text[5] = NAME_Value;
	count[5] = Value_Sausage;
};


func void Use_Sausage()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Sausage);
};


instance ItFo_Honey(C_Item)
{
	name = "Med";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Honey;
	visual = "ItFo_Honey.3DS";
	material = MAT_STONE;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Honey;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Honey;
	text[5] = NAME_Value;
	count[5] = Value_Honey;
};


func void Use_Honey()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Honey);
};


instance ItFo_Water(C_Item)
{
	name = "Voda";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Water;
	visual = "ItFo_Water.3ds";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Water;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Water;
	text[5] = NAME_Value;
	count[5] = Value_Water;
};


func void Use_Water()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Water);
};


instance ItFo_Beer(C_Item)
{
	name = "Pivo";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Beer;
	visual = "ItFo_Beer.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = Use_Beer;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Beer;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Beer;
	text[4] = "Temný paladin";
	text[5] = NAME_Value;
	count[5] = Value_Beer;
};


func void Use_Beer()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Beer);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Beer);
	if(Npc_IsPlayer(self))
	{
		COUNTERBEER += 1;
		if(COUNTERBEER == 10)
		{
			COUNTERBEER = 0;
			FLAGPLAYERDRUNKEN = TRUE;
			TIMER30SDRUNKEN = 0;
			Mdl_ApplyOverlayMds(self,"HUMANS_G1DRUNKEN.MDS");
		};
	};
};


instance ItFo_Booze(C_Item)
{
	name = "Gin";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Booze;
	visual = "ItFo_Booze.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Booze;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Booze;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Booze;
	text[5] = NAME_Value;
	count[5] = Value_Booze;
};


func void Use_Booze()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Booze);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Booze);
	if(Npc_IsPlayer(self))
	{
		COUNTERBOOZE += 1;
		if(COUNTERBOOZE == 6)
		{
			COUNTERBOOZE = 0;
			FLAGPLAYERDRUNKEN = TRUE;
			TIMER30SDRUNKEN = 0;
			Mdl_ApplyOverlayMds(self,"HUMANS_G1DRUNKEN.MDS");
		};
	};
};


instance ItFo_Wine(C_Item)
{
	name = "Víno";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Wine;
	visual = "ItFo_Wine.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Wine;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Wine;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Wine;
	text[5] = NAME_Value;
	count[5] = Value_Wine;
};


func void Use_Wine()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Wine);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Wine);
	if(Npc_IsPlayer(self))
	{
		COUNTERWINE += 1;
		if(COUNTERWINE == 8)
		{
			COUNTERWINE = 0;
			FLAGPLAYERDRUNKEN = TRUE;
			TIMER30SDRUNKEN = 0;
			Mdl_ApplyOverlayMds(self,"HUMANS_G1DRUNKEN.MDS");
		};
	};
};


instance ItFo_Milk(C_Item)
{
	name = "Mléko";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Milk;
	visual = "ItFo_Milk.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Milk;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Milk;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Milk;
	text[5] = NAME_Value;
	count[5] = Value_Milk;
};


func void Use_Milk()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Milk);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Milk);
};


instance ITFO_COOKHPI(C_Item)
{
	name = "Kompot z lesních bobulí";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_COOKHPI;
	visual = "ItFo_cookHPI.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = use_cookhpi;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_COOKHPI;
	text[4] = "Kompot z lesních bobulí";
	text[5] = NAME_Value;
	count[5] = VALUE_COOKHPI;
};


func void use_cookhpi()
{
	var string concatText;
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,HP_COOKHPI);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_COOKHPI);
	concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(HP_COOKHPI));
	PrintScreen(concatText,40,-1,FONT_Screen,2);
};


instance ITFO_COOKHPII(C_Item)
{
	name = "Kompot z lučních bobulí";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_COOKHPII;
	visual = "ItFo_cookHPII.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = use_cookhpii;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_COOKHPII;
	text[4] = "Kompot z lučních bobulí";
	text[5] = NAME_Value;
	count[5] = VALUE_COOKHPII;
};


func void use_cookhpii()
{
	var string concatText;
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,HP_COOKHPII);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_COOKHPII);
	concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(HP_COOKHPII));
	PrintScreen(concatText,40,-1,FONT_Screen,2);
};


instance ITFO_COOKSTR(C_Item)
{
	name = "Specialní pokrm ze žravých štěnic";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STR;
	visual = "ItFo_Stew_Sky.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = use_cookstr;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_STR;
	text[2] = NAME_Bonus_Str;
	count[2] = 2;
	text[5] = NAME_Value;
	count[5] = VALUE_STR;
};


func void use_cookstr()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_STR);
	Snd_Play("LevelUp");
	B_RaiseAttribute(self,ATR_STRENGTH,2);
};


instance ITFO_COOKWIN(C_Item)
{
	name = "Víno poznání";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Beer;
	visual = "ItFo_WineX.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = use_cookwin;
	description = name;
	text[2] = NAME_Bonus_Mana;
	count[2] = MANA_COOKWIN;
	text[4] = "Tohle víno je opravdu speciální";
	text[5] = NAME_Value;
	count[5] = VALUE_COOKWIN;
};


func void use_cookwin()
{
	var string concatText;
	B_RaiseAttribute(self,ATR_MANA_MAX,MANA_COOKWIN);
	Npc_ChangeAttribute(self,ATR_MANA,MANA_COOKWIN);
};


instance ITFO_COOKDEX(C_Item)
{
	name = "Specialní polévka z ústřic";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_DEX;
	visual = "ITFO_DEXSOUP.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = use_cookdex;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DEX;
	text[2] = NAME_Bonus_Dex;
	count[2] = 2;
	text[5] = NAME_Value;
	count[5] = VALUE_DEX;
};


func void use_cookdex()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DEX);
	Snd_Play("LevelUp");
	B_RaiseAttribute(self,ATR_DEXTERITY,2);
};

