sap.ui.define([
    "sap/ui/core/mvc/Controller"
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller) {
        "use strict";

        return Controller.extend("movies.controller.Movies", {
            onInit: function () {
                
            },
            onItemPress: function(oevent){
                console.log("selected")
            }
        });
    });
