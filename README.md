# Reformation

A detailed dashboard for internet sales data powered by infrastructe in AWS, the data warehouse is built in RDS SQL Server and Tabluae is used for dashboard.

The code is categorically placed in diffrent folders-
1. Terraform has the code for infrastructure in AWS as of the date of upload the resources created in AWS are free.
2. DatabaseScripts has the SQL script to create objects and relations in SQL Database.
3. DataForWarehouse zipped folder has the data which needs to be loaded into the respective tables.
4. Dashboard has the tableau dashboard.


How to run the code:
1. Begin the installation with Terraform, update the variables file according to your environment. Once the deployment is done login to the console and get the RDS end point.
2. Using SSMS use the end point as the server name and using SQL authentication the credentials for the connection can be found in rds.tf file.
3. Once connected to SSMS use Reformation database in connection and run the script from the folder DatabseScripts namely reformation_db_create.sql.
4. In the Zipped folder DataForWarehouse, extract the files and load them to the respective tables. The name of the file is the table name to which it needs to be loaded.
5. Using Import/Export wizard load the tables FactInterntSales, DimCustomer, DimDate, DimProduct, DimSalesTerritory, DimGeography, DimProductSubCategory, DimProductCategory tables.
6. From Tabluau app open the InternetSales.twb for dashboard access.
