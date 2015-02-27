class AddMoreAttr2Songs < ActiveRecord::Migration
  def change
     column :songs, :songid, :string
     add_column :songs, :songid, :string

  end
end
