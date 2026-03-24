using {bookshop.com.co as myCatalogService} from '../db/schema';
using { BusinessPartnerA2X as myBusinessPartner } from './external/BusinessPartnerA2X';

service CatalogService @(odata: '/browse') {

   entity ListOfBooks as
      projection on myCatalogService.Books {
         *,
         currency.symbol as currency
      }
      excluding {
         descr
      };

   entity Books       as
      projection on myCatalogService.Books {
         *,
         author.name as author,

      }
      excluding {
         createdAt,
         createdBy
      }

   action submitOrder(book: Books:ID, quantity: Integer);

}
