using { msg.dstore.books as bookSchema} from '../db/BookStoreSchema';
using {msg.dstore.movies as movieSchema} from '../db/MovieStoreSchema';


@impl: './BookStoreService.js' //provides custom logics of the service
service BookStoreService{
    @odata.draft.enabled //enabling the draft functionality
    entity Books as projection on bookSchema.Books{
        *,
        case
		    when price < 20 then 3
			when price < 30 then 0
			else 1
			end as criticality: Integer //calculated property
    }
    actions { 
        // bound action specific to Books entity
	    action resetRating();
        
    };
    @odata.draft.enabled
    entity Authors as projection on bookSchema.Authors{
        *,
        case
			when alive = true then 3
			else 1
			end as criticality: Integer //calculated property
    };
    @odata.draft.enabled
    entity Publishers as projection on bookSchema.Publishers;
    entity Genre as projection on bookSchema.Genres;
}

service MovieStoreService {
    entity Movies as projection on movieSchema.Movies;
    entity Actors as projection on movieSchema.Actors;
    entity Directors as projection on movieSchema.Directors;
    entity Genre as projection on movieSchema.Genres;
}