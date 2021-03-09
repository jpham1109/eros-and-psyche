class CreateCrushes < ActiveRecord::Migration[6.1]
  def change
    create_table :crushes do |t|
      t.string :name
      t.string :dob
      t.string :compatibility
      t.boolean :friend
      t.belongs_to :zodiac, null: false, foreign_key: true

      t.timestamps
    end
  end
end
