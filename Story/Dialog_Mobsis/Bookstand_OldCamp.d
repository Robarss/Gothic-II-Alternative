
func void Bookstand_Milten_03_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Už je pozdě.");
		Doc_PrintLines(nDocID,0,"Zřícení starého dolu přivedlo rudobarony na pokraj zkázy.");
		Doc_PrintLines(nDocID,0,"Gomez je jako soudek s prachem, který co nevidět vybuchne.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Corristo");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Myslí si, že za všechno může ten nový chlápek. Je to fakt podivín a udělal by nejlíp, kdyby se tu už víckrát neukázal.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Corristo");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Gomez je ještě naštvanější než kdy předtím a já myslím, že vím, co má za lubem. Musíme varovat mágy vody, než bude příliš pozdě. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Corristo");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Možná můžeme pohromě ještě zabránit. Radši ani nemyslet, co by se mohlo stát, kdyby byl volný důl... ");
		Doc_Show(nDocID);
	};
};

func void Bookstand_Milten_02_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Využil jsem nastalé svobody a trochu si to tu zvelebil. Kdo by si pomyslel, že jednou budu jediným mágem v táboře?");
		Doc_PrintLines(nDocID,0,"Ale nemůžu říct, že bych se sem vracel rád. Vlastně bych odsud nejradši co nejrychleji zase vypadl.");
		Doc_PrintLines(nDocID,0,"Tahle výprava prostě nemůže uspět.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Včera odsud odešli kopáči a vzali s sebou i Diega - vůbec mě nepřekvapilo, že se taky koukal vypařit. ");
		Doc_PrintLines(nDocID,1,"Určitě nikde nebude rubat krumpáčem. ");
		Doc_PrintLines(nDocID,1,"Já ale využiju chvíle volna a trochu se pocvičím v alchymii.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Milten");
		Doc_Show(nDocID);
	};
};

func void Bookstand_Milten_01_S1()
{
	var C_Npc her;
	var int Document;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		Document = Doc_CreateMap();
		Doc_SetPages(Document,1);
		Doc_SetPage(Document,0,"Map_OldWorld.tga",TRUE);
		Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
		Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
		Doc_Show(Document);
	};
};

func void Bookstand_Engor_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Akcie");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Našli jsme nějaké zboží, ale nic extra. Tady je seznam:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"3 bedny starých hadrů");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"8 beden rezavého železa");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"4 bedny rozbitých brnění");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"5  beden (zatuchlé) kůže a kožišin");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"2 bedny krumpáčů");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"3 bedny dalšího náčiní");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"16 beden kamení (ruda veškerá žádná)");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"1 bedna rezavých žiletek");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"4 bedny rozbitého nádobí ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"56 sudů na vodu");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"1 bedna něčeho z bažin (ať to bylo co bylo, teď je to shnilé)");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Engor");
		Doc_Show(nDocID);
	};
};

