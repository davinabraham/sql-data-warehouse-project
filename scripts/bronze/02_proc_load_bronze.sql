
/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    Loads CSV data into the six tables in the bronze schema.
    Truncates each table before loading.
    Reports individual and total load durations.
===============================================================================
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    batch_start_time TIMESTAMP;
    batch_end_time TIMESTAMP;
BEGIN
    BEGIN
        batch_start_time := clock_timestamp();

        RAISE NOTICE '================================================';
        RAISE NOTICE 'Loading Bronze Layer';
        RAISE NOTICE '================================================';

        RAISE NOTICE '------------------------------------------------';
        RAISE NOTICE 'Loading CRM Tables';
        RAISE NOTICE '------------------------------------------------';

        -- CRM: Customer information
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        RAISE NOTICE '>> Inserting Data Into: bronze.crm_cust_info';
        COPY bronze.crm_cust_info
        FROM '/Users/Shared/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
        WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

        end_time := clock_timestamp();
        RAISE NOTICE '>> Load Duration: % seconds',
            EXTRACT(EPOCH FROM (end_time - start_time));
        RAISE NOTICE '>> -------------';

        -- CRM: Product information
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating Table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        RAISE NOTICE '>> Inserting Data Into: bronze.crm_prd_info';
        COPY bronze.crm_prd_info
        FROM '/Users/Shared/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
        WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

        end_time := clock_timestamp();
        RAISE NOTICE '>> Load Duration: % seconds',
            EXTRACT(EPOCH FROM (end_time - start_time));
        RAISE NOTICE '>> -------------';

        -- CRM: Sales details
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating Table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        RAISE NOTICE '>> Inserting Data Into: bronze.crm_sales_details';
        COPY bronze.crm_sales_details
        FROM '/Users/Shared/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
        WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

        end_time := clock_timestamp();
        RAISE NOTICE '>> Load Duration: % seconds',
            EXTRACT(EPOCH FROM (end_time - start_time));
        RAISE NOTICE '>> -------------';

        RAISE NOTICE '------------------------------------------------';
        RAISE NOTICE 'Loading ERP Tables';
        RAISE NOTICE '------------------------------------------------';

        -- ERP: Location
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating Table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        RAISE NOTICE '>> Inserting Data Into: bronze.erp_loc_a101';
        COPY bronze.erp_loc_a101
        FROM '/Users/Shared/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
        WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

        end_time := clock_timestamp();
        RAISE NOTICE '>> Load Duration: % seconds',
            EXTRACT(EPOCH FROM (end_time - start_time));
        RAISE NOTICE '>> -------------';

        -- ERP: Customer information
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating Table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        RAISE NOTICE '>> Inserting Data Into: bronze.erp_cust_az12';
        COPY bronze.erp_cust_az12
        FROM '/Users/Shared/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
        WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

        end_time := clock_timestamp();
        RAISE NOTICE '>> Load Duration: % seconds',
            EXTRACT(EPOCH FROM (end_time - start_time));
        RAISE NOTICE '>> -------------';

        -- ERP: Product categories
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating Table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        RAISE NOTICE '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
        COPY bronze.erp_px_cat_g1v2
        FROM '/Users/Shared/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
        WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

        end_time := clock_timestamp();
        RAISE NOTICE '>> Load Duration: % seconds',
            EXTRACT(EPOCH FROM (end_time - start_time));
        RAISE NOTICE '>> -------------';

        batch_end_time := clock_timestamp();

        RAISE NOTICE '==========================================';
        RAISE NOTICE 'Loading Bronze Layer is Completed';
        RAISE NOTICE 'Total Load Duration: % seconds',
            EXTRACT(EPOCH FROM (batch_end_time - batch_start_time));
        RAISE NOTICE '==========================================';

    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE '==========================================';
        RAISE NOTICE 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        RAISE NOTICE 'Error Message: %', SQLERRM;
        RAISE NOTICE 'Error State: %', SQLSTATE;
        RAISE NOTICE '==========================================';
        RAISE;
    END;
END;
$$;

CALL bronze.load_bronze();



