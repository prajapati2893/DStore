using { Currency, Country, cuid } from '@sap/cds/common';

namespace msg.dstore.books;

entity Books @(restrict:[
	{grant: 'READ', to: 'GUEST'},
	{grant: ['READ','UPDATE'], to: 'USER'},
	{grant: '*' , to: 'ADMIN'}
]): cuid {
	title : String @mandatory;
	description : String;
	publisher : association to one Publishers @mandatory;
	author : association to one Authors @mandatory;
	genre : association to one Genres @mandatory;
	price : Decimal;
	currency : Currency;
	pages : Integer;
	published : Date;
	coverImage: LargeBinary @Core.MediaType: coverImageType;
	coverImageType: String @Core.IsMediaType;
	content: LargeBinary @Core.MediaType: contentType;
	contentType: String @Core.IsMediaType;
	rating: Integer;
};

entity Publishers @(restrict:[
	{grant: 'READ', to: 'GUEST'},
	{grant: ['READ','UPDATE'], to: 'USER'},
	{grant: '*' , to: 'ADMIN'}
]): cuid{
	name : String @Common.Label:'Name';
	address : String;
	books : association to many Books on books.publisher = $self;
	country : Country;
};

entity Authors @(restrict:[
	{grant: 'READ', to: 'GUEST'},
	{grant: ['READ','UPDATE'], to: 'USER'},
	{grant: '*' , to: 'ADMIN'}
]): cuid{
	name : String @Common.Label:'Name';
	country: Country;
	birthDate: Date;
	alive : Boolean;
	deathDate: Date;
	books: association to many Books on books.author = $self;
};

@readonly
entity Genres: cuid{
	name: String;
	books: association to many Books on books.genre = $self;
};