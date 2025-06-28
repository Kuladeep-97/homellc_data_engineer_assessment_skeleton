CREATE DATABASE IF NOT EXISTS home_db;
USE home_db;

CREATE TABLE IF NOT EXISTS property(
    id INT AUTO_INCREMENT PRIMARY KEY,
    Property_Title TEXT,
    age INT,
    Address TEXT,
    Market VARCHAR(40),
    Flood VARCHAR(40),
    Street_Address TEXT,
    City VARCHAR(50),
    State VARCHAR(2),
    Zip VARCHAR(20),
    Property_Type VARCHAR(50),
    Highway VARCHAR(10),
    Train VARCHAR(10),
    Tax_Rate DECIMAL(5,2),
    SQFT_Basement INT,
    HTW VARCHAR(5),
    Pool VARCHAR(5),
    Commercial VARCHAR(5),
    Water VARCHAR(10),
    Sewage VARCHAR(10),
    Year_Built YEAR,
    SQFT_MU INT,
    SQFT_Total INT,
    Parking VARCHAR(50),
    Bed INT,
    Bath INT,
    BasementYesNo VARCHAR(5),
    Layout VARCHAR(50),
    Rent_Restricted VARCHAR(5),
    Neighborhood_Rating INT,
    Latitude DECIMAL(10,7),
    Longitude DECIMAL(11,7),
    Subdivision VARCHAR(50),
    School_Average DECIMAL(4,2)

);

CREATE TABLE IF NOT EXISTS leads(
    id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    Reviewed_Status VARCHAR(50),
    Most_Recent_Status VARCHAR(50),
    Source VARCHAR(50),
    Occupancy VARCHAR(10),
    Net_Yield DECIMAL(5,2),
    IRR  DECIMAL(5,2),
    Selling_Reason VARCHAR(50),
    Seller_Retained_Broker VARCHAR(5),
    Final_Reviewer VARCHAR(100),
    FOREIGN KEY (property_id) REFERENCES property(id)
);
 
CREATE TABLE IF NOT EXISTS HOA(
 id INT AUTO_INCREMENT PRIMARY KEY,
 property_id INT,
 HOA INT,
 HOA_Flag VARCHAR(5),
 FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE IF NOT EXISTS Rehab(
    id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    Underwriting_Rehab INT,
    Rehab_Calculation INT,
    Paint VARCHAR(5),
    Flooring_Flag VARCHAR(5),
    Foundation_Flag VARCHAR(5),
    Roof_Flag VARCHAR(5),
    HVAC_Flag VARCHAR(5),
    Kitchen_Flag VARCHAR(5),
    Bathroom_Flag VARCHAR(5),
    Appliances_Flag VARCHAR(5),
    Windows_Flag VARCHAR(5),
    Landscaping_Flag VARCHAR(5),
    Trashout_Flag VARCHAR(5),
    FOREIGN KEY (property_id) REFERENCES property(id)

);

CREATE TABLE IF NOT EXISTS Taxes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    Taxes INT,
    FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE IF NOT EXISTS Valuation(
    id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    Previous_Rent INT,
    List_Price INT,
    Zestimate INT,
    ARV INT,
    Expected_Rent INT,
    Rent_Zestimate INT,
    Low_FMR INT,
    High_FMR INT,
    Redfin_Value INT,
    FOREIGN KEY (property_id) REFERENCES property(id)
);