sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'msg/dstore/books/books/test/integration/FirstJourney',
		'msg/dstore/books/books/test/integration/pages/BooksList',
		'msg/dstore/books/books/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, BooksList, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('msg/dstore/books/books') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBooksList: BooksList,
					onTheBooksObjectPage: BooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);