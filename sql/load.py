from db import get_mysql_db_connection
from transform import load_clean_csv
from load_db import export_df_to_db
import pandas as pd
import os


column_map={'property':["Property_Title", "Address", "Market", "Flood", "Street_Address","City", "State", "Zip",
        "Property_Type", "Highway","Train","Tax_Rate", "SQFT_Basement", "HTW", "Pool", "Commercial",
        "Water", "Sewage","Year_Built","SQFT_MU","SQFT_Total","Parking","Bed","Bath","BasementYesNo", "Layout", "Rent_Restricted", "Neighborhood_Rating","Latitude","Longitude",
        "Subdivision", "School_Average","Age"],
        'HOA':["HOA","HOA_Flag"],
        'leads':["Reviewed_Status","Most_Recent_Status","Source","Occupancy","Net_Yield","IRR","Selling_Reason","Seller_Retained_Broker","Final_Reviewer"],
        'Valuation':["Previous_Rent", "List_Price","Zestimate","ARV","Expected_Rent","Rent_Zestimate","Low_FMR","High_FMR","Redfin_Value"],
        'Rehab':["Underwriting_Rehab", "Rehab_Calculation", "Paint", "Flooring_Flag", "Foundation_Flag", "Roof_Flag", "HVAC_Flag", "Kitchen_Flag", "Bathroom_Flag", "Appliances_Flag", "Windows_Flag", "Landscaping_Flag", "Trashout_Flag"],
        'Taxes':["Taxes"]}

path=os.path.join(os.path.dirname(__file__),'fake_data.csv')
connection=get_mysql_db_connection()
cursor=connection.cursor()
df=load_clean_csv(path)
for table,cols in column_map.items():
    sub_df=df[cols].copy()
    export_df_to_db(sub_df,table,cursor)
     
connection.commit()
cursor.close()
connection.close()
