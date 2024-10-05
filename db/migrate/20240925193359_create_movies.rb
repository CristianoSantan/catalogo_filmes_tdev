class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year_release
      t.text :synopsis
      t.string :country_origin
      t.integer :duration
      t.string :image
      t.references :director, null: false, foreign_key: true
      t.references :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
