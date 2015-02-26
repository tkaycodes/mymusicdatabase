class ChangeRatingColumnInSong < ActiveRecord::Migration
  def change
    change_column :songs, :rating, :integer, default: 0

  end
  
end
