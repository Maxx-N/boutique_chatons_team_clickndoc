class UserUpdate < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :nom, :string
    remove_column :users, :prenom, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string 
  end
end