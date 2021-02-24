using {
        cuid,
        managed,
        sap
} from '@sap/cds/common';

namespace com.sap.rizing;

entity MapConfiguration : cuid, managed {
        name                    : String(30)                 @mandatory;
        description             : String(60);
        baseMapType             : Association to BaseMaps    @mandatory;
        defaultMapConfiguration : Boolean                    @mandatory;
        defaultCenter           : String                     @mandatory;
        defaultZoomLevel        : Integer                    @mandatory  @assert.range : [
                0,
                100
        ];
        maxZoom                 : Integer                    @assert.range :             [
                0,
                100
        ];
        attribution             : String(60);
        accessToken             : String(100);
        mapRendererType         : Association to MapRenderer @title        :             'Map Renderer Type';

}

entity BaseMaps : cuid, managed {
        key ID               : Integer;
            bmType           : String(111);
            bmDesc           : String(111);
            ImageUrl         : String;
            endPoint         : String;
            summary          : String;
            mapconfiguration : Association to many MapConfiguration
                                       on mapconfiguration.baseMapType = $self;
}

entity MapRenderer : cuid, managed {
        key ID               : Integer;
            mrType           : String(30);
            mapconfiguration : Association to many MapConfiguration
                                       on mapconfiguration.mapRendererType = $self;

}

extend MapConfiguration with {
    level : Integer;
}