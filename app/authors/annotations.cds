using BookStoreService as service from '../../srv/StoreService';

annotate service.Authors with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: 'Name',
        Value: name,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Country',
        Value: country.name,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Birth Date',
        Value: birthDate,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Living',
        Value: alive,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Died on',
        Value: deathDate,
    },
]);

annotate service.Authors with @(
    UI.FieldGroup #authorinformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'ID',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Name',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Country',
                Value: country.name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Birth Date',
                Value: birthDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Alive',
                Value: alive,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Death Date',
                Value: deathDate,
            },
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'authorInformation',
        Label : 'Author Information',
        Target: '@UI.FieldGroup#authorinformation',
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'Other Books',
        ID : 'OtherBooks',
        Target : 'books/@UI.LineItem#OtherBooks',
    } ],
    UI.HeaderInfo                 : {
        TypeName      : 'Author',
        TypeNamePlural: 'Authors',
        Title         : {Value: '{name}', },
    }
);
annotate service.Books with @(
    UI.LineItem #OtherBooks : [
        {
            $Type: 'UI.DataField',
            Label: 'Title',
            Value: title
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: description
        }
    ]
);
