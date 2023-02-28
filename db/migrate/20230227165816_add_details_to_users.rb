class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :band_name, :string
    add_column :users, :band_style, :string
    add_column :users, :location, :string
    add_column :users, :number_of_members, :integer
    add_column :users, :username, :string
    add_column :users, :url, :string
    add_column :users, :description, :string
  end
end
