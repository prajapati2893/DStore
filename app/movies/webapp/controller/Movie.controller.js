sap.ui.define([
    "movies/controller/BaseController"
    ],
    function (BaseController) {
        "use strict";
        return BaseController.extend("movies.controller.Movie", {
            onInit: function () {
                let router = this.getRouter()
                router.getRoute("movie").attachMatched(this.onRouteMatched,this);
            },
            onRouteMatched: function(event){
                let args = event.getParameter("arguments")
                let view = this.getView()
                console.log(args.movieId)
            }
        });
    }
);