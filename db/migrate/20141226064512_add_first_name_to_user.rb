class AddFirstNameToUser < ActiveRecord::Migration
  def change
  	add_column :users, :firstname, :string 
  	add_column :users, :admin, :boolean
  end
end
