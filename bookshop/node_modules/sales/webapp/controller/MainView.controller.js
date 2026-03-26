sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageToast"
], (Controller, MessageToast) => {
    "use strict";

    return Controller.extend("sales.controller.MainView", {
        onInit() {

        
        },
        onPress() {
            MessageToast.show("Esto te llevara a la siguiente pagina");
        },
        async onOpenDialog() {
            this.oDialog ??= await this.loadFragment({
                name: "sales.view.fragments.Advise"
            });
            this.oDialog.open();
      
        },
        onCerrarButton() {
            this.byId("idDialog").close();
        },
        onListItemPress(){
            const oRoter =  this.getOwnerComponent().getRouter();
            oRoter.navTo("RouteDetails");
        }
    });
});