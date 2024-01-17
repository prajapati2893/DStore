using { Currency, Country, cuid } from '@sap/cds/common';

namespace msg.dstore.books;

entity Book: cuid {
	title : String;
	description : String;
	publisher : association to one Publisher;
	author : association to one Author;
	genre : association to one Genre;
	price : Decimal;
	currency : Currency;
	pages : Integer;
	published : Date;
	coverImage: LargeBinary @Core.MediaType: coverImageType;
	coverImageType: String @Core.IsMediaType;
	content: LargeBinary @Core.MediaType: contentType;
	contentType: String @Core.IsMediaType;
};

entity Publisher: cuid{
	name : String;
	address : String;
	books : association to many Book;
	country : Country;
};

entity Author: cuid{
	name : String;
	country: Country;
	birthDate: Date;
	alive : Boolean;
	deathDate: Date;
	books: association to many Book
};

entity Genre: cuid{
	name: String
};