using {
        cuid,
        managed,
        sap
} from '@sap/cds/common';

namespace com.sap.rizing;

entity MapConfiguration : cuid, managed {
        name                    : String(30);
        description             : localized String(60);
        baseMapType             : Association to BaseMaps;
        defaultMapConfiguration : Boolean;
        defaultCenter           : String;
        defaultZoomLevel        : Integer                    @assert.range : [
                0,
                100
        ];
        maxZoom                 : Integer                    @assert.range : [
                0,
                100
        ];
        attribution             : String(60);
        accessToken             : String(100);
        mapRendererType         : Association to MapRenderer @title        : 'Map Renderer Type';

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
