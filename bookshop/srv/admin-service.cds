using from '@sap/cds-common-content';
using {bookshop.com.co as mysrvadmin} from '../db/schema';
using {BusinessPartnerA2X as externalBP} from './external/BusinessPartnerA2X';


service AdminService @(odata: '/admin') {

    entity Books             as projection on mysrvadmin.Books;

    entity Authors           as projection on mysrvadmin.Authors;
    entity Genres            as projection on mysrvadmin.Genres;
    entity Orders            as projection on mysrvadmin.Orders;
    entity A_BusinessPartner as projection on externalBP.A_BusinessPartner  {
            BusinessPartner  as BusinessPartner,
            BusinessPartnerName as PartnerName,
            BusinessPartnerOccupation as Ocupation
            
    };

    function getTotalRevenue() returns Decimal(9, 2)

    action   createGenres(genres: array of {
        ID   : Integer;
        name : String;
    })                         returns array of Genres;

}
