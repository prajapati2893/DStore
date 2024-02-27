sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        onRatingChanged: function(oEvent) {
            MessageToast.show("Rating Updated");
        },
        onReset: function(oEvent){
            let context = oEvent.getSource().getBindingContext()
            let id = context.getProperty("ID")
            let model = context.getModel()
            let path = `/Books(ID=${id},IsActiveEntity=true)/BookStoreService.resetRating(...)`
            model.bindContext(path).execute()
            .then(()=>{
                MessageToast.show("Rating reset");
            }).catch((error)=>{
                MessageToast.show("Error: "+error);
            })
        }
    };
});
