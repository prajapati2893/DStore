using BookStoreService as service from '../../srv/StoreService';
using from '../../db/BookStoreSchema.cds';

//Line item for rendering the table
annotate service.Books with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: '{i18n>textTitle}',
        Value: title,
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>textDescription}',
        Value: description,
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>textPrice}',
        Value: price,
        Criticality: criticality,
        CriticalityRepresentation : #WithoutIcon //showing the data in different colors of criticality
    },
    {
        $Type: 'UI.DataField',
        Value: currency_code,
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>textPage}',
        Value: pages,
    },
    {
        $Type: 'UI.DataField',
        Value: author.name,
        Label: '{i18n>textAuthor}',
    },
    {
        $Type: 'UI.DataField',
        Value: published,
        Label: '{i18n>textPublished}',
    },
]){
    //creating a dropdown (value list) for authors
    author @(
        Common: {
            Text : author.name,
            TextArrangement : #TextOnly,
            ValueListWithFixedValues,
            ValueList : {
                CollectionPath : 'Authors',
                Parameters: [{
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty:'author_ID', //author_ID in books entity is mapped to ID in authors entity
                    ValueListProperty: 'ID'
                },{
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                }
                ]
            },
        },
    );
    //creating dropdown(value list) for genre entity
    genre @(
        Common: {
            Text : genre.name,
            TextArrangement : #TextOnly,
            ValueListWithFixedValues,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Genre',
                Parameters: [{
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty:'genre_ID',
                    ValueListProperty: 'ID'
                },{
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                },
                ]
            },
        },
    );
    //creating dropdown(value list) for publishers entity
    publisher @(
        Common: {
            Text : publisher.name,
            TextArrangement : #TextOnly,
            ValueListWithFixedValues,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Publishers',
                Parameters: [{
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty:'publisher_ID',
                    ValueListProperty: 'ID'
                },{
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                },
                ]
            },
        },
    );
}

annotate service.Books with @(
    UI.FieldGroup #bookinformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textId}',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textTitle}',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textCoverImage}',
                Value: coverImage,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textDescription}',
                Value: description,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textPrice}',
                Value: price,
            },
            {
                $Type: 'UI.DataField',
                Value: currency_code,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textPage}',
                Value: pages,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textPublished}',
                Value: published,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textContent}',
                Value: content,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>textGenre}',
                Value: genre_ID,
            },
            //navigation link for publisher page
            {
                $Type: 'UI.DataFieldWithIntentBasedNavigation',
                Label: '{i18n>textPublisher}',
                Value: publisher_ID,
                SemanticObject: 'publishers',
                Action: 'manage',
                Mapping: [{
                    $Type: 'Common.SemanticObjectMappingType',
                    LocalProperty: publisher_ID,
                    SemanticObjectProperty: 'ID'
                }]
            },
            //navigation link for author page
            {
                $Type: 'UI.DataFieldWithIntentBasedNavigation',
                Label: '{i18n>textAuthor}',
                Value: author_ID,
                SemanticObject: 'authors',
                Action: 'manage',
                Mapping: [{
                    $Type: 'Common.SemanticObjectMappingType',
                    LocalProperty: author_ID,
                    SemanticObjectProperty: 'ID'
                }]
            }
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'bookInfoFacet',
        Label : 'Book Information',
        Target: '@UI.FieldGroup#bookinformation',
    }
    ],
    UI.HeaderInfo                 : {
        TypeName      : '{i18n>textHeaderInfoBook}',
        TypeNamePlural: '{i18n>textHeaderInfoBooks}',
        Title         : {Value: '{title}', },
    }
);
