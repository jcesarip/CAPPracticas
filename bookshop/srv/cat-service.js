const cds = require('@sap/cds')


console.log("Arranca servicio CatalogService")

module.exports = class CatalogService extends cds.ApplicationService {
  init() {

    this.after('READ', 'Books', each => {
      if (each.stock > 30) {
        each.title += ` -- 11% discount!`
      }
    })

    this.on('submitOrder', async (req) => {
      let { book: id, quantity } = req.data
      if (quantity < 1) return req.error(400, `La cantidad debe ser uno o mas`);
      let succeeded  =  await UPDATE (Books,id)
        .with `stock = stock - ${quantity}`
        .where `stock >=${quantity}`

        if(succeeded) return
        else if(!this.exists(Books,id)) req.error(404, `Libro #${id} no existe`);
        else req.error(409,`${quantity} execede el stock del libro #${id}`)
    })

    return super.init()
  }
}
