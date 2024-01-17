using { msg.dstore.books as bookSchema} from '../db/BookStoreSchema';
using {msg.dstore.movies as movieSchema} from '../db/MovieStoreSchema';

service BookStoreService{
    entity Books as projection on bookSchema.Book;
    entity Authors as projection on bookSchema.Author;
    entity Publishers as projection on bookSchema.Publisher;
    @readonly
    entity Genre as projection on bookSchema.Genre;
}

service MovieStoreService {
    entity Movies as projection on movieSchema.Movie;
    entity Actors as projection on movieSchema.Actor;
    entity Directors as projection on movieSchema.Director;
    @readonly
    entity Genre as projection on movieSchema.Genre;
}