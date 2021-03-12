class CreateCrushes < ActiveRecord::Migration[6.1]
  def change
    create_table :crushes do |t|
      t.string :name
      t.string :dob
      t.string :compatibility
      t.boolean :friend
      t.string :sign 
      t.string :symbol
      t.string :element
      t.string :quality
      t.string :details
      t.string :positive
      t.string :negative
      t.belongs_to :zodiac, null: false, foreign_key: true

      t.timestamps
    end
  end
end
