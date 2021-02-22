using {com.sap.rizing as my} from '../db/schema';

service CatalogService {
    entity BaseMaps         as projection on my.BaseMaps excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    }

    entity MapConfiguration as
        select from my.MapConfiguration {
            *,
            case
                when
                    defaultMapConfiguration = true
                then
                    3
                when
                    defaultMapConfiguration = 'yes'
                then
                    3
                when
                    defaultMapConfiguration = 1
                then
                    3
                else
                    1

            end as level : Integer
        }
        excluding {
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy
        };

    entity MapRenderer      as projection on my.MapRenderer excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    }

}
