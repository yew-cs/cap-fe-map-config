using { com.sap.rizing as geo } from '../db/schema';

service CatalogService {
    entity BaseMaps as projection on geo.BaseMaps excluding{createdAt,createdBy,modifiedAt,modifiedBy}
    entity MapConfiguration as projection on geo.MapConfiguration excluding{createdAt,createdBy,modifiedAt,modifiedBy}
    entity MapRenderer as projection on geo.MapRenderer excluding{createdAt,createdBy,modifiedAt,modifiedBy}
}



