using { CatalogService as annotationCatalog } from '../cat-service';


annotate annotationCatalog.ListOfBooks with @UI:{
    SelectionFields  : [
        title,
        genre_ID,
    ],
    LineItem  : [
        {
            $Type: 'UI.DataField',
            Value: title,
            Label: 'Book Title'
        },
        {
            $Type: 'UI.DataField',
            Value: author_ID,
            Label: 'Authors Name'
        }
    ],
}
