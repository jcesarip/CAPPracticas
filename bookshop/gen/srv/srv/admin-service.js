const cds = require('@sap/cds')


console.log("Arranca servicio AdminService")

module.exports = class AdminService extends cds.ApplicationService {
    init (){
        console.log("ApplicacitionService Iniciado...")
        
        this.on("READ","A_BusinessPartner", async(req) =>{
            console.log("READ Entidad BP");
            const apiBp = await cds.connect.to("BusinessPartnerA2X");
            return await apiBp.tx(req).send({
                query: req.query,
            })
        })
  
        return super.init();
    }
}

