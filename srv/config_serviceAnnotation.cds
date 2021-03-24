using {SapNetworkGeoConfig} from './config_service';

/**
 * Annotations for Layers Entity
 */

annotate SapNetworkGeoConfig.Layers with @(
    Common : {Label : '{i18n>Layer}'},
    UI     : {
        SelectionFields                : [
            Name,
            LayerType_ID,
            ServiceType_ID
        ],
        HeaderInfo                     : {
            TypeName       : '{i18n>Layer}',
            TypeNamePlural : '{i18n>Layers}',
            Title          : {Value : Name},
            Description    : {Value : Description},

        },
        LineItem                       : {$value : [
            {Value : Name},
            {Value : LayerType_ID},
            {Value : ServiceType_ID},
            {Value : MinZoom}
        ]},
        Facets                         : [{
            
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup',
            Label  : '{i18n>GeneralInformation}' 
        }],
        FieldGroup : {Data : [

            {Value : ServiceType_ID},
            {Value : LayerType_ID},
            {Value : MinZoom},
            {
                $Type : 'UI.DataFieldWithUrl',
                Value : ServiceUrl,
                Url   : ServiceUrl
            },
            {Value : OdataFieldNameGeometry},
            {Value : OdataFieldNameProperties},
            {Value : LayoutJson},
            {Value : PaintJson},
            {Value : MarkerUrl},
            {Value : MarkerFallback},
            {Value : JsonConfig},
            
        ]}
    }
) {
    Name                     @title : '{i18n>Name}';
    Description              @(
        title : '{i18n>Description}',
        UI    : {MultiLineText : true}
    );
    ServiceType              @(
        title  : '{i18n>ServiceType}',
        Common : {
            Text                     : {
                $value                 : ServiceType.Name,
                ![@UI.TextArrangement] : #TextOnly
            },
            ValueListWithFixedValues : true,
            ValueList                : {
                CollectionPath : 'ServiceType',
                Parameters     : [
                    {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : ServiceType_ID,
                        ValueListProperty : 'ID'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'Name'
                    }
                ]
            }
        }
    );
    ServiceUrl               @(
        title : '{i18n>ServiceUrl}',
        UI    : {MultiLineText : true}
    );
    OdataFieldNameGeometry   @title : '{i18n>OdataFieldNameGeometry}';
    OdataFieldNameProperties @title : '{i18n>OdataFieldNameProperties}';
    LayerType                @(
        title  : '{i18n>LayerType}',
        Common : {
            Text                     : {
                $value                 : LayerType.Name,
                ![@UI.TextArrangement] : #TextOnly
            },
            ValueListWithFixedValues : true,
            ValueList                : {
                CollectionPath : 'LayerType',
                Parameters     : [
                    {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : LayerType_ID,
                        ValueListProperty : 'ID'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'Name'
                    }
                ]
            }
        }
    );
    MinZoom                  @title : '{i18n>MinZoom}';
    LayoutJson               @(
        title : '{i18n>LayoutJson}',
        UI    : {MultiLineText : true}
    );
    PaintJson                @(
        title : '{i18n>PaintJson}',
        UI    : {MultiLineText : true}
    );
    MarkerUrl                @title : '{i18n>MarkerUrl}';
    MarkerFallback           @title : '{i18n>MarkerFallback}';
    JsonConfig               @(
        title : '{i18n>JsonConfig}',
        UI    : {MultiLineText : true}
    );
}

/**
 * Annotations for Layers Entity
 */

annotate SapNetworkGeoConfig.LayerType with {
    ID   @(
        title  : '{i18n>Id}',
        UI     : {Hidden : true},
        Common : {Text : {
            $value                 : Name,
            ![@UI.TextArrangement] : #TextOnly
        }}
    );
    Name @(
        title : '{i18n>Name}',
        UI    : {HiddenFilter : true}
    );
};


/**
 * Annotations for Renderers Entity
 */

annotate SapNetworkGeoConfig.Renderers with @(
    Common : {Label : '{i18n>Renderer}'},
    UI     : {
        SelectionFields                : [
            Name,
            CloudFoundryDestination
        ],
        HeaderInfo                     : {
            TypeName       : '{i18n>Renderer}',
            TypeNamePlural : '{i18n>Renderers}',
            Title          : {Value : Name},
            Description    : {Value : Description},

        },
        LineItem                       : {$value : [
            {Value : Name},
            {Value : Description},
            {Value : License},
            {Value : LicenseToken},
            {Value : CloudFoundryDestination}
        ]},
        Facets                         : [{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#GeneralInformation',
        }],
        FieldGroup #GeneralInformation : {Data : [

            {Value : License},
            {Value : LicenseToken},
            {Value : CloudFoundryDestination},
            {
                $Type : 'UI.DataFieldWithUrl',
                Value : Url,
                Url   : Url
            },
            {Value : DefaultCenterLatitude},
            {Value : DefaultCenterLongitude},
            {Value : DefaultZoomLevel},
            {Value : JsonString},
            {Value : JsonConfig}
        ]}
    }
) {
    Name                    @title : '{i18n>Name}';
    Description             @title : '{i18n>Description}';
    License                 @title : '{i18n>License}';
    LicenseToken            @title : '{i18n>LicenseToken}';
    Url                     @(
        title : '{i18n>ServiceUrl}',
        UI    : {MultiLineText : true}
    );
    CloudFoundryDestination @title : '{i18n>CloudFoundryDestination}';
    DefaultCenterLatitude   @title : '{i18n>DefaultCenterLatitude}';
    DefaultCenterLongitude  @title : '{i18n>DefaultCenterLongitude}';
    DefaultZoomLevel        @title : '{i18n>DefaultZoomLevel}';
    JsonString              @title : '{i18n>JsonString}';
    JsonConfig              @(
        title : '{i18n>JsonConfig}',
        UI    : {MultiLineText : true}
    );
}

/**
 * Annotations for Business Object Types Entity
 */

annotate SapNetworkGeoConfig.BusinessObjectTypes with @(
    Common : {Label : '{i18n>BusinessObjectType}'},
    UI     : {
        SelectionFields                : [Name],
        HeaderInfo                     : {
            TypeName       : '{i18n>businessObjectType}',
            TypeNamePlural : '{i18n>businessObjectTypes}',
            Title          : {Value : Name},
            Description    : {Value : Description},

        },
        LineItem                       : {$value : [
            {Value : Name},
            {Value : Description}
        ]},
        Facets                         : [{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#GeneralInformation',
        }],
        FieldGroup #GeneralInformation : {Data : [

        {Value : JsonConfig}]}
    }
) {
    Name        @title : '{i18n>Name}';
    Description @title : '{i18n>Description}';
    JsonConfig  @(
        title : '{i18n>jsonConfig}',
        UI    : {MultiLineText : true}
    );
}

/**
 * Annotations for Business Object Types Entity
 */

annotate SapNetworkGeoConfig.Actions with @(
    Common : {Label : '{i18n>Action}'},
    UI     : {
        SelectionFields                : [
            Name,
            AppliesTo_ID,
            InteractionType_ID
        ],
        HeaderInfo                     : {
            TypeName       : '{i18n>Action}',
            TypeNamePlural : '{i18n>Actions}',
            Title          : {Value : Name},
            Description    : {Value : Description},

        },
        LineItem                       : {$value : [
            {Value : Name},
            {Value : Description},
            {Value : AppliesTo.Name},
            {Value : InteractionType.Name}

        ]},
        Facets                         : [{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#GeneralInformation',
        // Label  : '{i18n>GeneralInformation}'
        }],
        FieldGroup #GeneralInformation : {Data : [
            {Value : AppliesTo_ID},
            {Value : InteractionType_ID},
            {
                $Type : 'UI.DataFieldWithUrl',
                Value : LinkToApi,
                Url   : LinkToApi
            },
            {Value : JsonConfig}
        ]}
    }
) {
    Name            @title : '{i18n>Name}';
    Description     @title : '{i18n>Description}';
    AppliesTo       @(
        title  : '{i18n>AppliesTo}',
        Common : {
            Text                     : {
                $value                 : AppliesTo.Name,
                ![@UI.TextArrangement] : #TextOnly
            },
            ValueListWithFixedValues : true,
            ValueList                : {
                CollectionPath : 'AppliesList',
                Parameters     : [
                    {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : AppliesTo_ID,
                        ValueListProperty : 'Id'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'Name'
                    }
                ]
            }
        }
    );
    InteractionType @(
        title  : '{i18n>InteractionType}',
        Common : {
            Text                     : {
                $value                 : InteractionType.Name,
                ![@UI.TextArrangement] : #TextOnly
            },
            ValueListWithFixedValues : true,
            ValueList                : {
                CollectionPath : 'InteractionType',
                Parameters     : [
                    {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : InteractionType_ID,
                        ValueListProperty : 'Id'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'Name'
                    }
                ]
            }
        }
    );
    JsonConfig      @(
        title : '{i18n>JsonConfig}',
        UI    : {MultiLineText : true}
    );
    LinkToApi       @title : '{i18n>LinkToApi}'
}

/**
 * Annotations for AppliesList Entity
 */

annotate SapNetworkGeoConfig.AppliesList with {
    ID   @(
        title  : '{i18n>Id}',
        UI     : {Hidden : true},
        Common : {Text : {
            $value                 : Name,
            ![@UI.TextArrangement] : #TextOnly
        }}
    );
    Name @(
        title : '{i18n>Name}',
        UI    : {HiddenFilter : true}
    );
};

/**
 * Annotations for InteractionType Entity
 */

annotate SapNetworkGeoConfig.InteractionType with {
    ID   @(
        title  : '{i18n>Id}',
        UI     : {Hidden : true},
        Common : {Text : {
            $value                 : Name,
            ![@UI.TextArrangement] : #TextOnly
        }}
    );
    Name @(
        title : '{i18n>Name}',
        UI    : {HiddenFilter : true}
    );
};

/**
 * Annotations for ServiceType Entity
 */

annotate SapNetworkGeoConfig.ServiceType with {
    ID   @(
        title  : '{i18n>Id}',
        UI     : {Hidden : true},
        Common : {Text : {
            $value                 : Name,
            ![@UI.TextArrangement] : #TextOnly
        }}
    );
    Name @(
        title : '{i18n>Name}',
        UI    : {HiddenFilter : true}
    );
};
