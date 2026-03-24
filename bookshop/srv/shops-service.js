const cds = require("@sap/cds");
const { SELECT, UPDATE, INSERT } = require("@sap/cds/lib/ql/cds-ql");

module.exports = class ShopService extends cds.ApplicationService {

    async function() {
        console.log("Estamos en  la funcion anonima");
        const { Books, Orders } = this.entities;

        this.on('submitOrder', async (req) => {
            const { bookID, quantity } = req.data;

            //Validar Stock
            const book = await SELECT.one.from(Books).where({ ID: bookID })
            if (!book || book.stock < quantity) {
                return req.error(409, `Stock insuficiente para el libro: ${book.title}`)
            }
            //Reducir Stock
            let newStock = book.stock - quantity;
            await UPDATE(Books).set({stock: newStock}).where({ID:bookID});

            //Crear Orden
            await INSERT.into(Orders).entries({
                customer: req.user.id || 'Anonymous',
                totalPrice: book.price  * quantity,
                items:[{
                    book_ID:bookID,quantity:quantity
                }]
            });
            return{stockRemaining: newStock}
        })
    }
}
