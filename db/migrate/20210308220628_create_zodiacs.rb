class CreateZodiacs < ActiveRecord::Migration[6.1]
  def change
    create_table :zodiacs do |t|

      t.timestamps
    end
  end
end
