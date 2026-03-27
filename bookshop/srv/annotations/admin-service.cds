using {AdminService as annotationAdmin} from '../admin-service';

annotate annotationAdmin.Books with @UI: {
    HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Book',
        TypeNamePlural : 'Books',
    },
    
    SelectionFields : [
        ID,
        author_ID,
        title,
        genre,
        stock,
    ],
    LineItem        : [
        {
            $Type: 'UI.DataField',
            Value: title,
            Label: 'Book Title'
        },
        {
            $Type: 'UI.DataField',
            Value: author_ID,
            Label: 'Authors ID'
        }
    ],
    SelectionVariant: [{

        $Type      : 'UI.SelectionVariantType',
        qualifiiier: 'Default'
    }],
}

