using {CatalogService} from './cat-service';


/**
 * Annotations for MapConfiguration Entity
 */

annotate CatalogService.MapConfiguration with @(

    Common : {Label : '{i18n>MapConfiguration}'},
    UI     : {
        SelectionFields                : [
            name,
            mapRendererType_ID,
            baseMapType_ID
        ],
        HeaderInfo                     : {
            TypeName       : '{i18n>MapConfiguration}',
            TypeNamePlural : '{i18n>MapConfigurations}',
            Title          : {Value : name},
            Description    : {Value : description},
            ImageUrl       : baseMapType.ImageUrl,


        //  : baseMapType.summary},
        },
        LineItem                       : {$value : [
            {Value : name},
            {Value : description},
            {Value : baseMapType.bmType},
            // {Value : baseMapType.ImageUrl},
            {Value : defaultMapConfiguration, Criticality:level},
            {Value : defaultCenter},
            {Value : maxZoom},
            {Value : attribution},
            {Value : accessToken},
            {Value : mapRendererType.mrType}

        ]},

        HeaderFacets                   : [{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#MapConfigurations',
        }],
        FieldGroup #MapConfigurations  : {Data : [
            {Value : defaultMapConfiguration ,Criticality:level},
            {Value : baseMapType.bmType},
            {Value : baseMapType.bmDesc},
            {Value : mapRendererType.mrType},
            {Value : baseMapType.summary}
        ]},
        Facets                         : [{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#GeneralInformation',
            Label  : '{i18n>GeneralInformation}'
        }],
        FieldGroup #GeneralInformation : {Data: [
            // {Value : baseMapType.ImageUrl},
            {Value : name},
            {Value : description},
            {Value : baseMapType_ID},
            {Value : mapRendererType_ID},
            {Value : defaultCenter},
            {Value : defaultZoomLevel},
            {Value : accessToken},
            {Value : attribution}

        
        ]}
    }
) {
    ID                      @title : '{i18n>id}'  @readonly;
    name                    @title : '{i18n>name}'  @readonly;
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
    defaultCenter           @(
        title  : '{i18n>defaultCenter}',
        common : {ValueList:{
            CollectionPath:'BaseMaps',
            Parameters:[
                {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : MapConfiguration,
                        ValueListProperty : 'defaultZoomLevel'
                    }
            ]
        }}
    );
    defaultZoomLevel        @title : '{i18n>defaultZoomLevel}';
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
