sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'publishers/test/integration/FirstJourney',
		'publishers/test/integration/pages/PublishersList',
		'publishers/test/integration/pages/PublishersObjectPage',
		'publishers/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, PublishersList, PublishersObjectPage, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('publishers') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePublishersList: PublishersList,
					onThePublishersObjectPage: PublishersObjectPage,
					onTheBooksObjectPage: BooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);