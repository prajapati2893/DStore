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
    }
    ],
    UI.HeaderInfo                 : {
        TypeName      : 'Author',
        TypeNamePlural: 'Authors',
        Title         : {Value: '{name}', },
    }
);
