sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/proyectoregistro/projec1/test/integration/FirstJourney',
		'com/proyectoregistro/projec1/test/integration/pages/RegistrosList',
		'com/proyectoregistro/projec1/test/integration/pages/RegistrosObjectPage'
    ],
    function(JourneyRunner, opaJourney, RegistrosList, RegistrosObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/proyectoregistro/projec1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRegistrosList: RegistrosList,
					onTheRegistrosObjectPage: RegistrosObjectPage
                }
            },
            opaJourney.run
        );
    }
);