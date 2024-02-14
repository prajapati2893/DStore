using BookStoreService as service from '../../srv/StoreService';

annotate service.Authors with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: name,
    },
    {
        $Type: 'UI.DataField',
        Value: country_code,
    },
    {
        $Type: 'UI.DataField',
        Label: 'birthDate',
        Value: birthDate,
    },
    {
        $Type: 'UI.DataField',
        Label: 'alive',
        Value: alive,
    },
    {
        $Type: 'UI.DataField',
        Label: 'deathDate',
        Value: deathDate,
    },
]);

annotate service.Authors with @(
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: country_code,
            },
            {
                $Type: 'UI.DataField',
                Label: 'birthDate',
                Value: birthDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'alive',
                Value: alive,
            },
            {
                $Type: 'UI.DataField',
                Label: 'deathDate',
                Value: deathDate,
            },
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup1',
    }, ],
    UI.HeaderInfo                 : {
        TypeName      : 'author',
        TypeNamePlural: 'authors',
        Title         : {Value: '{name}', },
    }
);
