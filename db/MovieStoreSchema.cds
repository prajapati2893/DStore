using {cuid, Country} from '@sap/cds/common';

namespace msg.dstore.movies;

entity Movie: cuid{
    title: String;
    description: String;
    director: association to one Director;
    starcast: association to many Actor;
    genre: association to one Genre;
    releaseDate: Date;
    duration: Integer;
    posterImage: LargeBinary @Core.MediaType: posterImageType;
    posterImageType: String @Core.IsMediaType;
}

entity Director: cuid{
    name: String;
    birthDate: Date;
    country: Country;
    movies: association to many Movie on movies.director = $self;
}

entity Actor: cuid{
    name: String;
    birthDate: String;
    country: Country;
    movies: association to many Movie on movies.starcast = $self;
}

entity Genre: cuid{
    name: String;
    movies : Association to many Movie on movies.genre = $self;
}