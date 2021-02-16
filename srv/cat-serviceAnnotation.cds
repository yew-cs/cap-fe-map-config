// using {CatalogService} from './cat-service';

// annotate CatalogService.MapConfiguration with @(
//                                                 // Capabilities : {
//                                                 //     // entity-level
//                                                 //     InsertRestrictions.Insertable : false  ,
//                                                 //     UpdateRestrictions.Updatable  : false,
//                                                 //     DeleteRestrictions.Deletable  : false
//                                                 // },
//                                               UI : {
//     HeaderInfo       : {
//         TypeName       : 'Map Configuration',
//         TypeNamePlural : 'Map Configurations',
//         Title          : {Value : name},
//         Description    : {Value : description}
//     },
//     SelectionFields  : [
//         name,
//         baseMapType.ID,
//         mapRendererType.ID
//     ],
//     LineItem         : [
//         // { Value: ID },
//         {Value : name},
//         {Value : description},
//         {Value : baseMapType.bmType},
//         {Value : defaultMapConfiguration},
//         {Value : defaultCenter},
//         {Value : defaultZoomLevel},
//         {Value : maxZoom},
//         {Value : attribution},
//         {Value : accessToken},
//         {Value : mapRendererType.mrType},

//     ],
//     Facets           : [{
//         $Type  : 'UI.CollectionFacet',
//         Label  : 'Map Info',
//         Facets : [{
//             $Type  : 'UI.ReferenceFacet',
//             Target : '@UI.FieldGroup#Main',
//             Label  : 'Main Facet'
//         }]
//     }],
//     FieldGroup #Main : {Data : [
//         // { Value: ID },
//         // { Value: name },
//         {Value : baseMapType.ImageUrl },
//         {Value : baseMapType.bmType},
//         {Value : baseMapType.bmDesc},
//         {Value : baseMapType.endPoint},
//         {Value : baseMapType.summary},
//         {Value : defaultMapConfiguration},
//         {Value : mapRendererType.mrType}
//     ]}
// })
// {
//     ImageUrl           @(UI : {IsImageURL : true});
//     baseMapType_ID     @(Common : {
//         ValueListWithFixedValues : true,
//         ValueList                : {
//             SearchSupported : true,
//             CollectionPath  : 'BaseMaps',
//             Parameters      : [{
//                 $Type             : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : baseMapType_ID,
//                 ValueListProperty : 'bmType'
//             }]
//         }
//     });
//     mapRendererType_ID @(Common : {
//         ValueListWithFixedValues : true,
//         ValueList                : {
//             SearchSupported : true,
//             CollectionPath  : 'MapRenderer',
//             Parameters      : [{
//                 $Type             : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : mapRendererType_ID,
//                 ValueListProperty : 'mrType'
//             }]
//         }
//     });
// };
using {CatalogService} from './cat-service';


/**
 * Annotations for MapConfiguration Entity
 */

annotate CatalogService.MapConfiguration with @(

    Common : {Label : '{i18n>MapConfiguration}'},
    UI     : {
        SelectionFields              : [
            name,
            mapRendererType_ID,
            baseMapType_ID
        ],
        HeaderInfo                   : {
            TypeName       : '{i18n>MapConfiguration}',
            TypeNamePlural : '{i18n>MapConfigurations}',
            Title          : {Value : name},
            Description    : {Value : description},
            ImageUrl       : baseMapType.ImageUrl,
        //  : baseMapType.summary},
        },
        LineItem                     : {$value : [
            {Value : name},
            {Value : description},
            {Value : baseMapType.bmType},
            // {Value : baseMapType.ImageUrl},
            {Value : defaultMapConfiguration},
            {Value : defaultCenter},
            {Value : maxZoom},
            {Value : attribution},
            {Value : accessToken},
            {Value : mapRendererType.mrType}

        ]},
        
        Facets                       : [{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#MapConfiguration',
            Label  : '{i18n>MapConfiguration}'
        }],
        FieldGroup #MapConfiguration : {Data : [
            {Value : name},
            {Value : description},
            {Value : baseMapType.bmType},
            {Value : baseMapType.bmDesc},
            {Value : baseMapType.endPoint},
            {Value : baseMapType.summary},
            {Value : defaultMapConfiguration},
            {Value : mapRendererType.mrType}
        ]}
    }
) {
    ID                      @title : '{i18n>id}';
    name                    @title : '{i18n>name}';
    description             @title : '{i18n>description}';
    baseMapType             @(
        title  : '{i18n>baseMapType}',
        Common : {
            ValueListWithFixedValues : true,
            ValueList                : {
                CollectionPath : 'BaseMaps',
                Parameters     : [
                    {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : baseMapType_ID,
                        ValueListProperty : 'ID'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'bmType'
                    }
                ]
            }
        }
    );

    defaultMapConfiguration @title : '{i18n>defaultMapConfiguration}';
    defaultCenter           @title : '{i18n>defaultCenter}';
    maxZoom                 @title : '{i18n>maxZoom}';
    attribution             @title : '{i18n>attribution}';
    accessToken             @title : '{i18n>accessToken}';
    mapRendererType         @(
        title  : '{i18n>mapRendererType}',
        Common : {
            ValueListWithFixedValues : true,
            ValueList                : {
                CollectionPath : 'MapRenderer',
                Parameters     : [
                    {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : mapRendererType_ID,
                        ValueListProperty : 'ID'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'mrType'
                    }
                ]
            }
        }
    );

};


/**
 * Annotations for MapRenderer Entity
 */

annotate CatalogService.MapRenderer with {
    ID     @(
        title  : '{i18n>ID}',
        UI     : {Hidden : true},
        Common : {Text : {
            $value                 : mrType,
            ![@UI.TextArrangement] : #TextOnly
        }}
    );
    mrType @(
        title : '{i18n>mrType}',
        UI    : {HiddenFilter : true}
    );
};

/**
 * Annotations for BaseMap Entity
 */

annotate CatalogService.BaseMaps with {
    ID       @(
        title  : '{i18n>ID}',
        UI     : {Hidden : true},
        Common : {Text : {
            $value                 : bmType,
            ![@UI.TextArrangement] : #TextOnly
        }}
    );
    ImageUrl @(
        title : '{i18n>Image}',
        UI    : {IsImageURL : true}
    );
    bmType   @(
        title : '{i18n>bmType}',
        UI    : {HiddenFilter : true}
    );
    bmDesc   @title : '{i18n>bmDesc}';
    endPoint @title : '{i18n>endPoint}';
    summary  @title : '{i18n>summary}';
};
