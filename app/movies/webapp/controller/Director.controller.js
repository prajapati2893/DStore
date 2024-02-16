sap.ui.define([
    "movies/controller/BaseController"
],function(BaseController){
    "use strict";
    return BaseController.extend("movies.controller.Director",{
        onInit: function(event){
            let router = this.getRouter();
            router.getRoute("director").attachMatched(this._onRouteMatched, this)
        },
        _onRouteMatched: function(event){
            let args = event.getParameter("arguments")
            let view = this.getView()
            view.bindElement({
                path: "/Directors("+args.directorId+")",
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
        onMovieItemPressed: function(event){
            //this function should reuse already defined functions
            let item = event.getParameter("listItem")// get item which fired press event
            let context = item.getBindingContext()
            this.getRouter().navTo("movie",{
                movieId : context.getProperty("ID")
            })
        }
    })
})