/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Objective:
    This stored procedure is designed to load data into the 'bronze' schema 
    from external CSV files. It executes the following operations:
    
    - Truncates all target tables in the 'bronze' schema prior to loading.
    - Utilizes the BULK INSERT command to import data from CSV files 
      into the corresponding bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

create or alter procedure bronze.load_bronze as
begin
   declare @start_time Datetime,@end_time datetime, @batch_start_time datetime, @batch_end_time datetime;
   begin try
         set @batch_start_time=getdate()
         print '========================================================================' 
         print' loading bronze layer' 
         print '========================================================================' 
          
          
         print'-------------------------------------------------------------------------' 
         print'loading CRM table' 
         print'-------------------------------------------------------------------------' 

         set @start_time=getdate();
         print'>> Truncating Table:bronze.crm_cust_info' 
         truncate table bronze.crm_cust_info; 
          
         print'>> Inserting Data Into:bronze.crm_cust_info' 
         bulk insert bronze.crm_cust_info 
         from 'C:\Users\Neya\OneDrive\Desktop\csv-files\bronze.crm_cust_info.csv' 
         with( 
         firstrow=2, 
         fieldterminator =',', 
         tablock 
         ); 
         set @end_time=getdate();
         print'>> Load Duration : ' + cast(datediff(second,@start_time, @end_time) as nvarchar) + 'Seconds';
         print '>> -------------------';



         set @start_time=getdate();
         print'>> Truncating Table:bronze.crm_prd_info' 
         truncate table bronze.crm_prd_info; 
          
          
         print'>> Inserting Data Into:bronze.crm_prd_info' 
         bulk insert bronze.crm_prd_info 
         from 'C:\Users\Neya\OneDrive\Desktop\csv-files\bronze.crm_prd_info.csv' 
         with( 
         firstrow=2, 
         fieldterminator =',', 
         tablock 
         ); 
         set @end_time=getdate();
         print'>> Load Duration : ' + cast(datediff(second,@start_time, @end_time) as nvarchar) + 'Seconds';
         print '>> -------------------';
          


         set @start_time=getdate();
         print'>> Truncating Table:bronze.crm_sales_details' 
         truncate table bronze.crm_sales_details; 
          
         print'>> Inserting Data Into:bronze.crm_sales_details' 
         bulk insert bronze.crm_sales_details 
         from 'C:\Users\Neya\OneDrive\Desktop\csv-files\bronze.crm_sales_details.csv' 
         with( 
         firstrow=2, 
         fieldterminator =',', 
         tablock 
         ); 
         set @end_time=getdate();
         print'>> Load Duration : ' + cast(datediff(second,@start_time, @end_time) as nvarchar) + 'Seconds';
         print '>> -------------------';




         print'-------------------------------------------------------------------------' 
         print'loading ERP table' 
         print'-------------------------------------------------------------------------' 
         
         

         set @start_time=getdate();
         print'>> Truncating Table:bronze.erp_cust_az12' 
         truncate table bronze.erp_cust_az12; 
          
         print'>> Inserting Data Into:bronze.erp_cust_az12' 
         bulk insert bronze.erp_cust_az12 
         from 'C:\Users\Neya\OneDrive\Desktop\csv-files\bronze.erp_cust_az12.csv' 
         with( 
         firstrow=2, 
         fieldterminator =',', 
         tablock 
         ); 
         set @end_time=getdate();
         print'>> Load Duration : ' + cast(datediff(second,@start_time, @end_time) as nvarchar) + 'Seconds';
         print '>> -------------------'; 
         
         
         set @start_time=getdate();
         print'>> Truncating Table:bronze.erp_loc_a101' 
         truncate table bronze.erp_loc_a101; 
          
         print'>> Inserting Data Into:bronze.erp_loc_a101' 
         bulk insert bronze.erp_loc_a101 
         from 'C:\Users\Neya\OneDrive\Desktop\csv-files\bronze.erp_loc_a101.csv' 
         with( 
         firstrow=2, 
         fieldterminator =',', 
         tablock 
         ); 
         set @end_time=getdate();
         print'>> Load Duration : ' + cast(datediff(second,@start_time, @end_time) as nvarchar) + 'Seconds';
         print '>> -------------------'; 
          
         
         

         set @start_time=getdate();
         print'>> Truncating Table:bronze.erp_px_cat_g1v2' 
         truncate table bronze.erp_px_cat_g1v2; 
          
         print'>> Inserting Data Into:bronze.erp_px_cat_g1v2' 
         bulk insert bronze.erp_px_cat_g1v2 
         from 'C:\Users\Neya\OneDrive\Desktop\csv-files\bronze.erp_px_cat_g1v2.csv' 
         with( 
         firstrow=2, 
         fieldterminator =',', 
         tablock 
         );
         set @end_time=getdate();
         print'>> Load Duration : ' + cast(datediff(second,@start_time, @end_time) as nvarchar) + 'Seconds';
         print '>> -------------------';


         set @batch_end_time=getdate()
         print '========================================================================'
         print' loading bronze layer is completed';
         print' Total load duration : '+ cast(datediff(second,@batch_start_time, @batch_end_time) as nvarchar) + 'Seconds';
         print '========================================================================'

     end try
     begin catch
     print '========================================================================'
     print 'Error occured during loading bronze layer'
     print'Error Message' + error_message();
     print'Error Message' + cast(error_number() as nvarchar);
     print'Error Message' + cast(error_state() as nvarchar);
     print '======================================================================='
     end catch
   end
