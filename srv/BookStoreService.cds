using { msg.dstore.books as bookSchema} from '../db/BookStoreSchema';
using {msg.dstore.movies as movieSchema} from '../db/MovieStoreSchema';

service BookStoreService{
    entity Books as projection on bookSchema.Books;
    entity Authors as projection on bookSchema.Authors;
    entity Publishers as projection on bookSchema.Publishers;
    @readonly
    entity Genre as projection on bookSchema.Genres;
}

service MovieStoreService {
    entity Movies as projection on movieSchema.Movie;
    entity Actors as projection on movieSchema.Actor;
    entity Directors as projection on movieSchema.Director;
    @readonly
    entity Genre as projection on movieSchema.Genre;
}