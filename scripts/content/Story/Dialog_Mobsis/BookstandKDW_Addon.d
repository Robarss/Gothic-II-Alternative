
func void Use_Runemaking_KDW_CIRC1_S1()
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
		Doc_PrintLine(nDocID,0,"Runy m?g? vody");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy m?g? vody a ingredience na jejich vytvo?en?.  ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Torn?do");
		Doc_PrintLine(nDocID,0,"K??dla krvav? mouchy");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ledov? kop?");
		Doc_PrintLine(nDocID,0,"K?emen");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Gejz?r");
		Doc_PrintLine(nDocID,0,"Akvamar?n");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Bou?ka");
		Doc_PrintLine(nDocID,0,"K?emen");
		Doc_PrintLine(nDocID,0,"K??dla krvav? mouchy");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Vodn? p?st");
		Doc_PrintLine(nDocID,0,"Akvamar?n");
		Doc_PrintLine(nDocID,0,"Kamenn? krystal");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Na vytvo?en? runy je pot?eba alespo? jedna ingredience. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ten, kdo chce runu p?ipravit, mus? zn?t kouzelnou formuli a m?t svotek s doty?n?m kouzlem.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Teprve pak m??ete runu vytvo?it na runov?m stole.");
		Doc_Show(nDocID);
	};
};

func void Use_Runemaking_KDW_CIRC2_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC3_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC4_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC5_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC6_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

