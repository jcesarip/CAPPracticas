sap.ui.define([
    "sap/ui/core/UIComponent",
    "sales/model/models",
    "sap/ui/model/resource/ResourceModel"
], (UIComponent, models,ResourceModel) => {
    "use strict";

    return UIComponent.extend("sales.Component", {
        metadata: {
            manifest: "json",
            interfaces: [
                "sap.ui.core.IAsyncContentCreation"
            ]
        },

        init() {
            // call the base component's init function
            UIComponent.prototype.init.apply(this, arguments);

            // set the device model
            this.setModel(models.createDeviceModel(), "device");

            // enable routing
            this.getRouter().initialize();

            const i18nModel = new ResourceModel({
                bundleName: "sales.i18n.i18n"
            });
            this.setModel(i18nModel, "i18n");
        }
    });
});