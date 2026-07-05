class CreateMovieCasts < ActiveRecord::Migration[8.1]
  def change
    create_table :movies_casts do |t|
      t.string :name, null: false
      t.integer :yob
      t.string :external_url

      t.timestamps
    end
  end
end
