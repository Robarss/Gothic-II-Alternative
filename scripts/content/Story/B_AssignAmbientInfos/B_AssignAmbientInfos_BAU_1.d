
instance DIA_BAU_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_1_EXIT_Condition;
	information = DIA_BAU_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_1_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_1_JOIN_Condition;
	information = DIA_BAU_1_JOIN_Info;
	permanent = TRUE;
	description = "?ekni mi v?c o t?ch ?oldn???ch.";
};


func int DIA_BAU_1_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_1_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_1_JOIN_15_00");	//?ekni mi v?c o t?ch ?oldn???ch.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_01");	//Jedin?, co ti m??u poradit, je, aby ses jim zdaleka vyhnul.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_02");	//Jestli se n?kter?mu z nich nebude zamlouvat tv?j ksicht, prost? ti krapet vylep?? nos.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_03");	//Pak si m??e? u Leeho st??ovat, ale ten nos u? stejn? z?stane zlomenej.
};


instance DIA_BAU_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_1_PEOPLE_Condition;
	information = DIA_BAU_1_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tady tomu vel??";
};


func int DIA_BAU_1_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_1_PEOPLE_15_00");	//Kdo tady tomu vel??
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_01");	//Tohle je Onarova farma. On tady m? v?echno pod palcem.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_02");	//Dovol, abych ti dal men?? radu: Moc ty ?old?ky neprovokuj. S t?mahle nen? radno si zahr?vat.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_03");	//Sylvio je takovej zkorumpovanej mizera. Ale jejich v?dce, Lee, je docela v klidu.
};


instance DIA_BAU_1_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_1_LOCATION_Condition;
	information = DIA_BAU_1_LOCATION_Info;
	permanent = TRUE;
	description = "A co je tady pobl?? dal??ho?";
};


func int DIA_BAU_1_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_1_LOCATION_15_00");	//A co je tady pobl?? dal??ho?
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_01");	//Jen pole a farmy. A spousta ?old?k?. Ale v?t?ina jich je na v?chod? na Onarov? farm?.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_02");	//Na sever le?? Sekobova farma, ale tam chod? jen vyb?rat n?jem.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_03");	//Na jihoz?pad? naraz?? na cestu k Bengarov? farm?.
};


instance DIA_BAU_1_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_1_STANDARD_Condition;
	information = DIA_BAU_1_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nov?ho?";
};


func int DIA_BAU_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_1_STANDARD_15_00");	//Co je nov?ho?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_01");	//Onar si najal ?old?ky, aby udr?eli domobranu ve m?st?. Jinak by n?m odvedli i tu posledn? ovci!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_02");	//Nic moc. Po??d ty sam? probl?my. Domobrana, sk?eti a poln? ?k?dci.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_03");	//Za?aly se tu d?t divn? v?ci. P?ed p?r dny jsem v noci zahl?dl ?ernou siluetu. A nebyl to ?lov?k.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_04");	//??m d?l t?m ?ast?jc tu v?d?me sk?ety. Ob?as m?m dojem, jako by se jich za ka?d?ho mrtv?ho objevilo n?kolik dal??ch.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_05");	//Paladinov? vyrazili do Hornick?ho ?dol?. Co to v?echno m? znamenat? Nem??eme si dovolit ztratit jedin?ho mu?e, abysme udr?eli domobranu na uzd?.
	};
};

func void B_AssignAmbientInfos_BAU_1(var C_Npc slf)
{
	dia_bau_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_standard.npc = Hlp_GetInstanceID(slf);
};

