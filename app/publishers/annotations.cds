using BookStoreService as service from '../../srv/StoreService';

annotate service.Publishers with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Address',
            Value : address,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Country',
            Value : country.name,
        },
    ]
);
annotate service.Publishers with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Address',
                Value : address,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Country',
                Value : country.name,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Publisher Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Other books',
            ID : 'Otherbooks',
            Target : 'books/@UI.LineItem#Otherbooks',
        }
    ],
    UI.HeaderInfo                 : {
        TypeName      : 'Publisher',
        TypeNamePlural: 'Publishers',
        Title         : {Value: '{name}', },
    }
);

annotate service.Books with @(
    UI.LineItem #Otherbooks : [
        {
            $Type: 'UI.DataField',
            Label: 'Title',
            Value: title,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: description,
        }
    ]
);
