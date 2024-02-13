sap.ui.define([
    "movies/controller/BaseController"
],
    
    function (BaseController) {
        "use strict";

        return BaseController.extend("movies.controller.MoviesList", {
            onInit: function () {
                
            },
            onItemPress: function(event){
                let item = event.getParameter("listItem")// get item which fired press event
                let context = item.getBindingContext()
                this.getRouter().navTo("movie",{
                    movieId : context.getProperty("ID")
                })
            }
        });
    });
