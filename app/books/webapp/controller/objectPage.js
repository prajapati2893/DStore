
sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/UIComponent",
    "sap/base/Log"
  ], function (Controller, UIComponent, Log) {
    "use strict";
 
    return Controller.extend("msg.store.mobiles", {
      onInit: function () {
        // onBack();
        // Initialization logic can be added here
        // This method is automatically called when the controller is initialized
      },
 
      onBack: function () {
        // Check if the browser's history has a previous entry
        var oHistory = sap.ui.core.routing.History.getInstance();
      var sPreviousHash = oHistory.getPreviousHash();
        if (sPreviousHash!=undefined) {
            window.history.go(-1);
           
          // If there is a previous entry, navigate back
          //window.history.back();
        } else {
          // If there is no previous entry, navigate to a default route or handle as needed
          var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
          oRouter.navTo("BooksList"); // Replace with the name of your default route or handle as needed
        }
      }
 
 
    });
  });