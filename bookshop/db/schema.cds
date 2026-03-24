using {
    Currency,
    cuid,
    managed,
    sap
} from '@sap/cds/common';

namespace bookshop.com.co;

entity Books : managed {
    key ID           : UUID;
        //@assert.target asegura que la entidad relacionada exista en la  entidad  asociada.
        author       : Association to Authors @assert.target;
        title        : localized String       @mandatory;
        descr        : String(2000);
        genres       : Association to Genres;
        stock        : Stock;
        price        : Price;
        isbn         : ISBN;
        currency     : Currency;
        publisher_ID : String;
}

entity Authors : managed {
    key ID           : UUID;
        name         : String @mandatory;
        dateOfBirth  : Date;
        dateOfDeath  : Date;
        placeOfBirth : String;
        placeOfDeath : String;
        books        : Association to many Books
                           on books.author = $self;

}

entity Genres : sap.common.CodeList {
    key ID   : Integer;
        name : String;
}

entity Orders : cuid, managed, TechnicalInfo {
    orderNumber : String;
    customer    : String;
    totalPrice  : Price;
    currency    : Currency;
    items       : Composition of many OrderItems
                      on items.orderparent = $self;
}

entity OrderItems : cuid {
    key orderparent : Association to Orders;
        book        : Association to Books;
        quantity    : Integer;
        netAmount   : Decimal(9, 2)
}

entity Publisher {
    name : String;
    city : String;
    book : Association to Books;
}

aspect TechnicalInfo {
    isDigital : Boolean default false;
    weight    : Decimal(10, 2);
}

type Price : Decimal(9, 2);
type ISBN  : String(13);

type Stock : Integer @assert.range: [
    0,
    1000
];
