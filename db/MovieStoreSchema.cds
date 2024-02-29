using {cuid, Country} from '@sap/cds/common';

namespace msg.dstore.movies;

entity Movies@(restrict:[
	{grant: 'READ', to: 'GUEST'},
	{grant: '*' , to: 'ADMIN'}
]): cuid{
    title: String;
    description: String;
    director: association to one Directors;
    actors: composition of many LinkTable on actors.movie = $self;
    genre: association to one Genres;
    releaseDate: Date;
    duration: Integer;
    posterImage: LargeBinary @Core.MediaType: posterImageType;
    posterImageType: String @Core.IsMediaType;
    rating: Integer
}

// To implement many-to-many relationship between Movies and Actors.
entity LinkTable{
    key movie: association to Movies;
    key actor: association to Actors;
}
entity Directors@(restrict:[
	{grant: 'READ', to: 'GUEST'},
	{grant: '*' , to: 'ADMIN'}
]): cuid{
    name: String;
    birthDate: Date;
    country: Country;
    movies: association to many Movies on movies.director = $self;
}

entity Actors@(restrict:[
	{grant: 'READ', to: 'GUEST'},
	{grant: '*' , to: 'ADMIN'}
]): cuid{
    name: String;
    birthDate: String;
    country: Country;
    movies: Composition of many LinkTable on movies.actor = $self;
}

@readonly
entity Genres: cuid{
    name: String;
    movies : Association to many Movies on movies.genre = $self;
}