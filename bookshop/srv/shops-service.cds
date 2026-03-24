using {bookshop.com.co as myshopservice} from '../db/schema';
using from '@sap/cds-common-content';

service ShopService  @(odata: '/shop') {
    @readonly
    @cds.search:{
        @Common.Text : author.name,
        author.name,
        title
    }
    entity Books  as
        projection on myshopservice.Books {
            *,
            author.name as authorName,
        }
        excluding {
            createdAt,
            modifiedAt
        }

    action submitOrder(book: Books:ID, quantity: Integer) returns {
        stockRemaining : Integer;
    };

    @readonly
    //By default search is limited to the elements of type String of an entity that aren't calculated or virtual. 
     @cds.search:{
        name,
        //El false es para que la busqueda nose realice por la descripcion del libro.
        descr: false
    }
    entity Author as projection on myshopservice.Authors;

    @insertonly
    entity Orders as projection on myshopservice.Orders;


}
