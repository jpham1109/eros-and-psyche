class CreateUserCrushes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_crushes do |t|
      t.integer :crush_level
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :crush, null: false, foreign_key: true

      t.timestamps
    end
  end
end
