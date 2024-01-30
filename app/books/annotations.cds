using BookStoreService as service from '../../srv/StoreService';

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
]);

annotate service.Books with {
    publisher @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Publishers',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: publisher_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'address',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'country_code',
            },
        ],
    }
};

annotate service.Books with {
    author @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Authors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: author_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'country_code',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'birthDate',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'alive',
            },
        ],
    }
};

annotate service.Books with {
    genre @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Genre',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: genre_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
        ],
    }
};

annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup1: {
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
                Value: genre.name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Publisher',
                Value: publisher.name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Author',
                Value: author.name,
            },
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'Book Information',
        Target: '@UI.FieldGroup#GeneratedGroup1',
    }, ],
    UI.HeaderInfo                 : {
        TypeName      : 'Book',
        TypeNamePlural: 'Books',
        Title         : {Value: '{title}', },
    }
);

annotate service.Books with @(UI.SelectionFields: [
    title,
    genre.name,
    author.name,
]);

annotate service.Books with {
    title @Common.Label: 'Title'
};

annotate service.Authors with {
    name @Common.Label: 'Author Name'
};

annotate service.Genre with {
    ID @Common.Label: 'genre/ID'
};

annotate service.Genre with {
    name @Common.Label: 'Genre'
};

annotate service.Books with @(
    LineItem: [ {
            Type: UI.DataFieldForAction,
            Label: 'Back',
            Value: 'my.namespace.BackAction'
        }],
    UI.HeaderFacets     : [],
    UI.FieldGroup #Title: {
        $Type: 'UI.FieldGroupType',
        Data : [],
    }
);

