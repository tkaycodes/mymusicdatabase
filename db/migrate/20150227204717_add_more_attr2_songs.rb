class AddMoreAttr2Songs < ActiveRecord::Migration
  def change
     add_column    :songs, :songalbum, :string
     add_column    :songs, :artistid, :string
     add_column    :songs, :albumid, :string
  end
end
