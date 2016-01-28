dataSource {
    pooled = true
    dbCreate = "update"
//    dbCreate = "validate"
//    dbCreate = "create-drop"
    driverClassName = "org.postgresql.Driver"
    url = "jdbc:postgresql://localhost:5432/XXXXXXXXXXXX"
    // This dialect creates a sequence per table, making id values being without gaps
    // You can also use :
    // dialect = org.hibernate.dialect.PostgreSQL9Dialect
    // if you prefer to have only one sequence throughout the database
    dialect = starter.TableNameSequencePostgreSQLDialect
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
