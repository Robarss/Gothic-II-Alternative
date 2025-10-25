
func void B_DIA_Addon_Myxir_TeachRequest()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Nauč mě cizí jazyk.
};

func void B_DIA_Addon_Myxir_TeachL1()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_00");	//Začněme něčím jednoduchým. Můžu tě naučit jazyk rolníků.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_01");	//Texty, které jsou napsány v jazyce rolníků jsou obvykle o světských zájmech, jako práce, láska a opatřování potravin.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_02");	//Byl to obvyklý jazyk ve městě. Takže budeš schopen porozumět většině textů, které se zde nacházejí.
};

func void B_DIA_Addon_Myxir_TeachL2()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_00");	//Jazyk rolníků už znáš. Jazyk válečníků je něco težšího.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_01");	//Texty, které jsou napsány v jazyce válečníků, jsou obvykle o zbraních a válce. Naučíš se tam užitečné věci.
};

func void B_DIA_Addon_Myxir_TeachL3()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_00");	//Vrchní jazyk kněží je docela složitý na naučení. Ale já ti ho s radostí vysvětlím.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_01");	//Jazyk kněží jsou všechny svaté texty, které vysvětlují příběh a magii stavitelů.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_02");	//Každý z těchto textů je opravdový poklad, pokud jim porozumíš.
};

func void B_DIA_Addon_Myxir_TeachNoMore()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachNoMore_12_00");	//Už není nic, co bych ti mohl ukázat. Mistrovsky jsi ovládl jazyk stavitelů.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X()
{
	AI_Output(self,other,"DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00");	//Jdi a vyzkoušej své nové znalosti. Uvidíš - písmo stavitelů už pro tebe není nerozluštitelnou záhadou.
};

