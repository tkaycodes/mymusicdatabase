class AddRatingColumnToSong < ActiveRecord::Migration
  def change
    add_column :songs, :rating, :integer

  end
end
