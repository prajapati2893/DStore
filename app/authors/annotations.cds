using BookStoreService as service from '../../srv/StoreService';

//Line item is for rendering a table
annotate service.Authors with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: '{i18n>textName}',
        Value: name,
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>textCountry}',
        Value: country.name,
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>textBirthDate}',
        Value: birthDate,
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>textAlive}',
        Value: alive,
        Criticality: criticality
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>textDeathOn}',
        Value: deathDate,
    },
]);

annotate service.Authors with @(

    //a group of entities
    UI.FieldGroup #authorinformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textId}',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textName}',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textCountry}',
                Value: country.name,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textBirthDate}',
                Value: birthDate,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textDeathOn}',
                Value: deathDate,
                @UI.Hidden: {$edmJson: {$Eq: [
                    {$Path: 'alive'},
                    true
                ]}},
            },
        ],
    },
    //sections on the page
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'authorInformation',
        Label : '{i18n>textAuthorInformation}',
        Target: '@UI.FieldGroup#authorinformation',
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>textOtherBooks}',
        ID : 'OtherBooks',
        Target : 'books/@UI.LineItem#OtherBooks',
    } ],
    UI.HeaderInfo                 : {
        TypeName      : '{i18n>textHeaderInfoAuthor}',
        TypeNamePlural: '{i18n>textHeaderInfoAuthors}',
        Title         : {Value: '{name}', },
    }
);
annotate service.Books with @(
    UI.LineItem #OtherBooks : [
        {
            $Type: 'UI.DataField',
            Label: '{i18n>textTitle}',
            Value: title
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>textDescription}',
            Value: description
        }
    ]
);
