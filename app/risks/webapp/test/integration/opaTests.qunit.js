sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'riskmana/main/test/integration/FirstJourney',
		'riskmana/main/test/integration/pages/RisksList',
		'riskmana/main/test/integration/pages/RisksObjectPage'
    ],
    function(JourneyRunner, opaJourney, RisksList, RisksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('riskmana/main') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRisksList: RisksList,
					onTheRisksObjectPage: RisksObjectPage
                }
            },
            opaJourney.run
        );
    }
);