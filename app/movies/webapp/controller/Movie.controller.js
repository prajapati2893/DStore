sap.ui.define([
    "movies/controller/BaseController",
    "sap/ui/model/json/JSONModel"
    ],
    function (BaseController, JSONModel) {
        "use strict";
        return BaseController.extend("movies.controller.Movie", {
            onInit: function () {
                let router = this.getRouter()
                router.getRoute("movie").attachMatched(this._onRouteMatched,this);
            },
            _onRouteMatched: function(event){
                let args = event.getParameter("arguments")
                let view = this.getView()
                view.bindElement({
                    path:"/Movies(" + args.movieId +")",
                    events:{
                        dataRequested:function(event){
                            view.setBusy(true)
                        },
                        dataReceived:function(event){
                            view.setBusy(false)
                        }
                    }
                });
            },
            onActorItemPressed: function(event){
                let item = event.getParameter("listItem")// get item which fired press event
                let context = item.getBindingContext()
                this.getRouter().navTo("actor",{
                    actorId : context.getProperty("actor_ID")
                })
            },
            onMovieItemPressed: function(event){
                //this function should reuse already defined functions
                let item = event.getParameter("listItem")// get item which fired press event
                let context = item.getBindingContext()
                this.getRouter().navTo("movie",{
                    movieId : context.getProperty("ID")
                })
            },
            onDirectorPressed: function(event){
                let context = event.getSource().getBindingContext()// get item which fired press event
                this.getRouter().navTo("director",{
                    directorId : context.getProperty('director/ID')
                })
            },
            onRatingChanged: function(event){
                console.log(event.getParameter("value"))
            }
        });
    }
);