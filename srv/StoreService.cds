using { msg.dstore.books as bookSchema} from '../db/BookStoreSchema';
using {msg.dstore.movies as movieSchema} from '../db/MovieStoreSchema';

service BookStoreService{
    @odata.draft.enabled
    entity Books as projection on bookSchema.Books;
    @odata.draft.enabled
    entity Authors as projection on bookSchema.Authors;
    @odata.draft.enabled
    entity Publishers as projection on bookSchema.Publishers;
    @readonly
    entity Genre as projection on bookSchema.Genres;
}

service MovieStoreService {
    @odata.draft.enabled
    entity Movies as projection on movieSchema.Movies;
    entity Actors as projection on movieSchema.Actors;
    entity Directors as projection on movieSchema.Directors;
    entity Genre as projection on movieSchema.Genres;
}