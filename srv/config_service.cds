using {sap.net.geo.config as my} from '../db/config';

service SapNetworkGeoConfig @(path : '/netgeoconfig') {

    entity Actions                      as projection on my.Actions excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    entity BusinessObjectTypes          as projection on my.BusinessObjectTypes excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    entity Layers                       as projection on my.Layers excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    entity Renderers                    as projection on my.Renderers excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    entity Scenarios                    as projection on my.Scenarios excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    entity Actions_in_Scenarios         as projection on my.Actions_in_Scenarios excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    entity BusinessObjects_in_Scenarios as projection on my.BusinessObjects_in_Scenarios excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    entity Layers_in_Scenarios          as projection on my.Layers_in_Scenarios excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    entity LayerType                   as projection on my.LayerType;
    entity AppliesList                  as projection on my.AppliesList;
    entity InteractionType              as projection on my.InteractionType;
    entity ServiceType                  as projection on my.ServiceType;
    function get(clientId : String) returns String;


}
