require 'pg'

# Database configuration
db_name = 'your_database_name'
user = 'your_username'

begin
  # Connect to the PostgreSQL server
  conn = PG.connect(user: user)

  # Drop the database if it exists
  conn.exec("DROP DATABASE IF EXISTS #{db_name};")

  # Create a new database
  conn.exec("CREATE DATABASE #{db_name};")

  # Close the connection to the server
  conn.close

  # Connect to the newly created database
  conn = PG.connect(dbname: db_name, user: user)

  # Create a table with two columns: english_word and italian_word
  conn.exec <<-SQL
    CREATE TABLE translations (
      english_word VARCHAR(255),
      italian_word VARCHAR(255)
    );
  SQL

  puts "Database and table created successfully."

rescue PG::Error => e
  puts e.message
ensure
  conn.close if conn
end

