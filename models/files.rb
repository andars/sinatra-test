unless DB.table_exists?(:files)
	DB.create_table :files do
		primary_key :id
		string :filename
		string :extension
		foreign_key :user_id, :users
	end
end
		

class AppFile < Sequel::Model(:files)
	many_to_one :user
end
