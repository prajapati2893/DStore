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
        }
    ],
    UI.HeaderInfo                 : {
        TypeName      : 'publisher',
        TypeNamePlural: 'publishers',
        Title         : {Value: '{name}', },
    }
);