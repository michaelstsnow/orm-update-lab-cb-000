require_relative "../config/environment.rb"

class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

  attr_accessor :id, :name, :grade

  def initialize(name,grade,id=nil)
    @name=name
    @grade=grade
    @id=id
  end

  def self.create_table
    sql=<<-SQL
    CREATE TABLE IF NOT EXISTS students
    (id INTEGER PRIMARY KEY,
    name TEXT,
    grade TEXT)
    SQL

    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql=<<-SQL
    DROP TABLE IF EXISTS students
    SQL

    DB[:conn].execute(sql)
  end

  def save
    if self.id
    else
    end
    sql=<<-SQL
    INSERT INTO students IF NOT EXISTS (id,name,grade)
    VALUES (?,?,?)
    SQL

    DB[:conn].execute(sql,self.id,self.name,self.grade)

    @id=DB[:conn].execute("SELECT last_insert_rowid() FROM songs").flatten
  end

  def create
  end

  def self.new_from_db
  end

  def self.find_by_name
  end

  def update
  end


end
