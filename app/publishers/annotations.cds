using BookStoreService as service from '../../srv/StoreService';

annotate service.Publishers with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>textName}',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>textAddress}',
            Value : address,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>textCountry}',
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
                Label : '{i18n>textId}',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>textName}',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>textAddress}',
                Value : address,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>textCountry}',
                Value : country.name,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>textPublisherInfo}',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>textOtherBooks}',
            ID : 'Otherbooks',
            Target : 'books/@UI.LineItem#Otherbooks',
        }
    ],
    UI.HeaderInfo                 : {
        TypeName      : '{i18n>textHeaderInfo}',
        TypeNamePlural: '{i18n>textHeaderInfoPlural}',
        Title         : {Value: '{name}', },
    }
);

annotate service.Books with @(
    UI.LineItem #Otherbooks : [
        {
            $Type: 'UI.DataField',
            Label: '{i18n>textTitle}',
            Value: title,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>textDescription}',
            Value: description,
        }
    ]
);
