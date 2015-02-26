class AddUniqueIdToSong < ActiveRecord::Migration
  def change
    add_column :songs, :songid, :string
  end
end
