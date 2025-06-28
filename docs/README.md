# Data Engineering Assessment

Welcome! This exercise is designed to evaluate your core skills in **data engineering**:

- **SQL databases**: Data modeling, normalization, and scripting
- **Python and ETL**: Data cleaning, transformation, and loading workflows

---

## 📚 How This Document Works

Each section is structured with:

- **Problem:** Background and context for the task
- **Task:** What you are required to do (including any bonus “extra” tasks)
- **Solution:** Where you must document your approach, decisions, and provide instructions for reviewers

> **Tech Stack:**  
> Please use only Python (for ETL/data processing) and SQL/MySQL (for database).  
> Only use extra libraries if they do not replace core logic, and clearly explain your choices in your solution.

---

## 0. Setup

1. **Fork and clone this repository:**
    ```bash
    git clone https://github.com/<your-username>/homellc_data_engineer_assessment_skeleton.git
    ```
2. **Start the MySQL database in Docker:**
    ```bash
    docker-compose -f docker-compose.initial.yml up --build -d
    ```
    - Database is available on `localhost:3306`
    - Credentials/configuration are in the Docker Compose file
    - **Do not change** database name or credentials

3. For MySQL Docker image reference:  
   [MySQL Docker Hub](https://hub.docker.com/_/mysql)

---

### Problem

You are provided with property-related data in a CSV file.
- Each row relates to a property.
- There are multiple Columns related to this property.
- The database is not normalized and lacks relational structure.


### Task

- **Normalize the data:**
  - Develop a Python ETL script to read, clean, transform, and load   data into your normalized MySQL tables.
  - Refer the field config document for the relation of business logic
  - Use primary keys and foreign keys to properly capture relationships

- **Deliverable:**
  - Write necessary python and sql scripts
  - Place the scripts inside the `sql/` directory
  - The scripts should take the initial csv to your final, normalized schema when executed
  - Clearly document how to run your script, dependencies, and how it integrates with your database.

**Tech Stack:**  
- Python (include a `requirements.txt`)
Use **MySQL** and SQL for all database work  
- You may use any CLI or GUI for development, but the final changes must be submitted as python/ SQL scripts 
- **Do not** use ORM migrations—write all SQL by hand

### Solution

> **Document your database design and solution here:**  
> - Explain your schema and any design decisions-
The dataset is normalized into 6 different tables with 'property' table as central.
'property(id) is used as the foreign key for all the other tables.This is done to capture 1:1 relationship between property and its associated tables(leads,HOA,Rehab,Taxes,and Valuation).'Varchar' and 'text' data types are used to preserve strings.Text is used where indexing is not crucial and the length is large.'VARCHAR' is used for preserving smaller strings according to the contraints and which can be indexed.'INT' type is used for numbers with no decimal points and 'DECIMAL' type is used for number with decimal points in order to preserve the precision.
Schema is written clearly for each table such that no other data types other than the defined type can be migrated to the target database tables.

This design was chosen beacuse of its centralized key structure which is very easy to query and join property and its related tables.Data integrity is maintained throughout the tables due to the usage of foreign key.This design is very modular and scalable.

> - Give clear instructions on how to run and test your script

This project was developed using Visual Studio Code with WSL (Ubuntu) integration, which is recommended for a smooth cross-platform development experience on Windows.

1.Build the Docker container by using the following command-
  sudo docker-compose -f docker-compose.initial.yml up --build -d

2.Create and activate the PYTHON virtual environment and install all the python dependencies using the below code-

      python3 -m venv env
      source env/bin/activate
      pip install -r requirements.txt

3.Test the connection to the docker container using below code and enter the password given-
      sudo docker exec -it mysql_ctn mysql -u db_user -p
 # password:6equj5_db_user

4.Run sql commands to test and validate the tables, example SQL query below -
        USE home_db;
        SELECT COUNT(*) FROM property;
   

> **Document your ETL logic here:**  
> - Outline your approach and design  

There are four python files for the ETL process-
1.db.py- This file contains the function create the connection instance with mysql
2.transform.py-The ETL process extracts raw csv file and all the non numerical columns with empty values are replaced by 'NA'.All the numerical columns given in this dataset('fake_data.csv') was found to have no missing values hence only the non numerical columns with missing values were transformed.And an extra column called 'Age'(2025-'Year_Built')is added into dataframe as this is a better metric for measuring worth of properties compared to'year_built'.
3.load_db.py- This is the function which inserts records to the mysql database
4.load.py-This is the final file which initiates the migration of tables.Functions from all the other ETL .py files are imported to this file and for starting the entire ETL process just this file has to be run

> - Provide instructions and code snippets for running the ETL 
 Make sure the docker container is running and the python virtual environment is setup- The code for this is already specified in the above section-"Give clear instructions on how to run and test your script"

 After both docker container and python virtual are setup.
 Run the below command to run and complete the migration-
 
        python sql/load.py

This command will migrate all the files to the target database

> - List any requirements

This project was developed using Visual Studio Code with WSL (Ubuntu) integration, which is recommended for a smooth cross-platform development experience on Windows.

Versions used -
 Python 3.12 (in a virtual environment)
 Docker Engine and Docker Compose
 MySQL 8.0
 pandas, mysql-connector-python-(see requirements.txt)
pandas, mysql-connector-python, etc. (see requirements.txt)
 all the other required libraries are mentioned in requirement.txt

## Submission Guidelines

- Edit this README with your solutions and instructions for each section
- Place all scripts/code in their respective folders (`sql/`, `scripts/`, etc.)
- Ensure all steps are fully **reproducible** using your documentation

---

**Good luck! We look forward to your submission.**
