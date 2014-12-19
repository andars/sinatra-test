require 'bcrypt'

unless DB.table_exists? (:users)
  DB.create_table :users do
    primary_key :id
    String :username, :null => false
    String :email
    String :password_hash, :null => false
  end
end

class User < Sequel::Model
  include BCrypt
  one_to_many :files, class: :AppFile 
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_pass)
    @password = Password.create(new_pass)
    self.password_hash = @password
  end
end


