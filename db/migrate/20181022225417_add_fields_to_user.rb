class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :about_me, :text
  	add_column :users, :favorite_movie, :string
  	add_column :users, :favorite_wine, :string
  end
end
