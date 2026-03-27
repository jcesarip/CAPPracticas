using from '@sap/cds-common-content';
using {bookshop.com.co as mysrvadmin} from '../db/schema';
using {BusinessPartnerA2X as externalBP} from './external/BusinessPartnerA2X';


service AdminService @(odata: '/admin') {
    entity Books             as projection on mysrvadmin.Books {
        *,
         to_publisher : Association to externalBP.A_BusinessPartner on to_publisher.BusinessPartner = $self.bpPublishier,
      
      
      
    };
    entity Authors           as projection on mysrvadmin.Authors;
    entity Genres            as projection on mysrvadmin.Genres;
    entity Orders            as projection on mysrvadmin.Orders;
    
    @cds.persistence.exists
    @cds.persistence.skip
    entity A_BusinessPartner as projection on externalBP.A_BusinessPartner {
        key BusinessPartner,
        BusinessPartnerFullName,
        BusinessPartnerGrouping,
        to_books : Association to many Books on to_books.bpPublishier = $self.BusinessPartner,
       
    };



    function getTotalRevenue() returns Decimal(9, 2)

    action   createGenres(genres: array of {
        ID   : Integer;
        name : String;
    })                         returns array of Genres;

}
