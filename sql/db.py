import mysql.connector

def get_mysql_db_connection():
 return mysql.connector.connect(
  host='localhost',
  user='db_user',
  password="6equj5_db_user",
  database="home_db"

 )