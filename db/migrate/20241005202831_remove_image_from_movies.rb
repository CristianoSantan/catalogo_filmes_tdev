class RemoveImageFromMovies < ActiveRecord::Migration[7.2]
  def change
    remove_column :movies, :image, :string
  end
end
