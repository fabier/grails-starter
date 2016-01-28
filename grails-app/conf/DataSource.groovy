dataSource {
    pooled = true
    dbCreate = "update"
//    dbCreate = "validate"
//    dbCreate = "create-drop"
    driverClassName = "org.postgresql.Driver"
    url = "jdbc:postgresql://localhost:5432/XXXXXXXXXXXX"
    dialect = org.hibernate.dialect.PostgreSQL9Dialect
//    logSql = true
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'org.hibernate.cache.SingletonEhCacheRegionFactory'
}

// environment specific settings
environments {
    development {
        dataSource {
        }
    }
    test {
        dataSource {
        }
    }
    production {
        dataSource {
            dbCreate = "update"
        }
    }
}
