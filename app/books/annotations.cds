using BookStoreService as service from '../../srv/StoreService';
using from '../../db/BookStoreSchema.cds';

annotate service.Books with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: 'Title',
        Value: title,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Description',
        Value: description,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Price',
        Value: price,
    },
    {
        $Type: 'UI.DataField',
        Value: currency_code,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Pages',
        Value: pages,
    },
    {
        $Type: 'UI.DataField',
        Value: author.name,
        Label: 'Author',
    },
    {
        $Type: 'UI.DataField',
        Value: published,
        Label: 'Published',
    },
]){
    author @(
        Common: {
            Text : author.name,
            TextArrangement : #TextOnly,
            ValueListWithFixedValues,
            ValueList : {
                CollectionPath : 'Authors',
                Parameters: [{
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty:'author_ID',
                    ValueListProperty: 'ID'
                },{
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                }
                ]
            },
        },
    );
    genre @(
        Common: {
            Text : genre.name,
            TextArrangement : #TextOnly,
            ValueListWithFixedValues,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Genre',
                Label : 'Genre',
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
    publisher @(
        Common: {
            Text : publisher.name,
            TextArrangement : #TextOnly,
            ValueListWithFixedValues,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Publishers',
                Label : 'Publisher',
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
                Label: 'Title',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Cover Image',
                Value: coverImage,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Description',
                Value: description,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Price',
                Value: price,
            },
            {
                $Type: 'UI.DataField',
                Value: currency_code,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Pages',
                Value: pages,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Published',
                Value: published,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Cover Image',
                Value: coverImage,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Content',
                Value: content,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Genre',
                Value: genre_ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Publisher',
                Value: publisher_ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Author',
                Value: author_ID,
            },
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
        TypeName      : 'Book',
        TypeNamePlural: 'Books',
        Title         : {Value: '{title}', },
    }
);
