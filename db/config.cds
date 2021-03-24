namespace sap.net.geo.config;

using {
    cuid,
    managed
} from '@sap/cds/common';

// Type defintion for client Id
type ClientIdType : UUID;

/**
 * Renderer as part of the configuration Examples are: SAP
 * Visual Basic, Mapbox, Leaflet, Rizing Stringray (custom)
 */
entity Renderers : cuid, managed {
    ClientId                : ClientIdType;
    Name                    : localized String;
    Description             : localized String;
    License                 : String;
    LicenseToken            : String;
    CloudFoundryDestination : String;
    Url                     : String;
    DefaultCenterLatitude   : Double  @assert.range : [
        -180,
        180
    ];
    DefaultCenterLongitude  : Double  @assert.range : [
        -180,
        180
    ];
    DefaultZoomLevel        : Integer @assert.range : [
        0,
        100
    ];
    JsonString              : String;
    JsonConfig              : LargeString;
};

/**
 * Layers, these can reference Basemaps, reference layers or
 * business object layers. NSC Layers combine what Mapbox calls
 * source and layer into one object
 */
entity Layers : cuid, managed {
    ClientId                 : ClientIdType;
    Name                     : localized String           @mandatory;
    Description              : localized String;
    ServiceType              : Association to ServiceType @mandatory;
    ServiceUrl               : String;
    OdataFieldNameGeometry   : String default 'boGeometry';
    OdataFieldNameProperties : String default 'metaData';
    // layerType                : String enum {
    //     fill          = 'fill';
    //     line          = 'line';
    //     symbol        = 'symbol';
    //     circle        = 'circle';
    //     heatmap       = 'heatmap';
    //     fillextrusion = 'fill-extrusion';
    //     raster        = 'raster';
    //     hillshade     = 'hillshade';
    //     background    = 'background';
    //     sky           = 'sky'
    // };
    LayerType                : Association to LayerType   @mandatory;
    MinZoom                  : Integer default 100        @assert.range : [
        0,
        100
    ];
    LayoutJson               : LargeString;
    PaintJson                : LargeString;
    MarkerUrl                : String;
    MarkerFallback           : String;
    JsonConfig               : LargeString;

};

entity LayerType : cuid {
    key ID       : Integer;
        Name     : localized String @title : '{i18n>LayerType}';
        ToLayers : Association to many Layers
                       on ToLayers.LayerType = $self;

}

entity ServiceType : cuid {
    key ID       : Integer;
        Name     : localized String @title : '{i18n>ServiceType}';
        ToLayers : Association to many Layers
                       on ToLayers.ServiceType = $self;

}


/**
 * Action, these can be 'Create Work Order' or 'Track Shipment'
 */
entity Actions : cuid, managed {
    ClientId                    : ClientIdType;
    Name                        : localized String;
    Description                 : localized String;
    // appliesTo                   : String enum {
    //     global      = 'G'     @(title : 'Global');
    //                 businessObject = 'BO'@(title : 'BusinessObject');
    // };
    AppliesTo                   : Association to AppliesList;
    AppliesToBusinessObjectType : Association to BusinessObjectTypes;
    LinkToApi                   : String;
    // interactionType             : String enum {
    //     singleClick = 'Single'@(title : 'Single Click/ Tap');
    //                 rightClick = 'Right'@(title : 'Right Click');
    // };
    InteractionType             : Association to InteractionType;
    JsonConfig                  : LargeString;
};


entity AppliesList : cuid {
    key ID        : Integer;
        Name      : localized String @title : '{i18n>appliesto}';
        ToActions : Association to many Actions
                        on ToActions.AppliesTo = $self;

};

entity InteractionType : cuid {
    key ID        : Integer;
        Name      : localized String @title : '{i18n>interactionType}';
        ToActions : Association to many Actions
                        on ToActions.InteractionType = $self;

};

/**
 * Business Object Type: I.e. Work order
 */
entity BusinessObjectTypes : cuid, managed {
    ClientId    : ClientIdType;
    Name        : localized String;
    Description : localized String;
    JsonConfig  : LargeString;
};

/**
 * Scenarios or variants
 */
entity Scenarios : cuid, managed {
    ClientId        : ClientIdType;
    Name            : localized String;
    Description     : localized String;
    Renderer        : Association to Renderers;
    JsonConfig      : LargeString;
    BusinessObjects : Composition of many BusinessObjects_in_Scenarios
                          on BusinessObjects.Scenario = $self;
    Layers          : Composition of many Layers_in_Scenarios
                          on Layers.Scenario = $self;
    Actions         : Composition of many Actions_in_Scenarios
                          on Actions.Scenario = $self;
};

/**
 * n:m table to model Scenarios - BusinessObjects relationship
 */
entity BusinessObjects_in_Scenarios : managed {
    Scenario       : Association to Scenarios;
    BusinessObject : Association to BusinessObjectTypes;
}


/**
 * n:m table to model Scenarios - Layers relationship
 */
entity Layers_in_Scenarios : managed {
    Scenario : Association to Scenarios;
    Layer    : Association to Layers;
}

/**
 * n:m table to model Scenarios - Actions relationship
 */
entity Actions_in_Scenarios : managed {
    Scenario : Association to Scenarios;
    Action   : Association to Actions;
}
