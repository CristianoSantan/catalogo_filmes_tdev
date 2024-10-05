class CreateDirectors < ActiveRecord::Migration[7.2]
  def change
    create_table :directors do |t|
      t.string :name
      t.string :nationality
      t.date :date_birth
      t.references :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
