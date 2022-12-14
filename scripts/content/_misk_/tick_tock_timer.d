
func void tick_tock_timer()
{
	TIMER125MS += 1;
	if(TIMER125MS == 8)
	{
		TIMER125MS = 0;
		TIMER1S += 1;
	};
	if(TIMER1S == 1)
	{
		if(FLAGPLAYERDRUNKEN)
		{
			TIMER30SDRUNKEN += 1;
			if(TIMER30SDRUNKEN == 120)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_G1DRUNKEN.MDS");
				FLAGPLAYERDRUNKEN = FALSE;
				TIMER30SDRUNKEN = 0;
			};
		};
	};
	TIMER1S = 0;
};

