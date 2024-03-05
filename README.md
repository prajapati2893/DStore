# DStore

This is a sample app to demonstrate SAPUI5 and Fiori Elements.

Database (/db):
The schema is defined in form of cds entities in the files 'BookStoreSchema.cds' and 'MovieStoreSchema.cds'.
/csv directory has the initial data to load in the database when the app is started.

By default in-memory database is used by CAP but we can also persist our database by providing a sqlite filename
in configuration file '.cdsrc.json' as
        "db":{
          "kind": "sqlite",
          "credentials": {
            "url":"db.sqlite"
          }
        }

Service (/srv):
Both the database models are used in the common service file 'StoreService.cds'.
BookStoreService file contains the custom logic to provide to service, apart from CRUD operations.

App (/app):
This contains the frontend of the application where the the exposed service is used.
Every app has their separate directories ie 'authors', 'books', 'publishers', 'movies'.
The apps 'books', 'authors', 'publishers' are build using Fiori Elements whereas 'movies' is build using UI5
and they are combined together in a common 'launchpage.html'.
service.cds file is importing the exposed service in the app directory.


Useful Links:
manifest descriptor
https://sapui5.hana.ondemand.com/sdk/#/topic/be0cf40f61184b358b5faedaec98b2da
Custom Logic
https://cap.cloud.sap/docs/node.js/core-services#srv-on-before-after
Purpose of different config files
https://cap.cloud.sap/docs/node.js/cds-env#sources-for-cds-env

Known Issue:
1. On navigating to publisher or author of a book, correct publisher or author is not getting filtered. Wrong parameters
   are passed to target page.
2. ID is also displayed along with names, in the dropdowns for author, publisher and genre.
3. While accessing the movies app, if unauthorized, error message box is not shown in UI.

Future Plan:
1. CRUD operations on movies app as well.