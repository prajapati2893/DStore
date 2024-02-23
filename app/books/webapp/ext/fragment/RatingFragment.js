sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        onRatingChanged: function(oEvent) {
            MessageToast.show("Rating Updated");
        },
        onReset: function(oEvent){
            let model = oEvent.getSource().getBindingContext().getModel()
            // console.log(model.bindContext("/Books/msg.dstore.resetRating(...)").execute())
        }
    };
});
