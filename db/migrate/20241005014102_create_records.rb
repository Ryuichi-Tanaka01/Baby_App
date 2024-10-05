class CreateRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :breastmilk_amount
      t.boolean :has_urinated
      t.integer :flight_category_id
      t.string :remarks, limit: 255
      t.integer :recorder_id

      t.timestamps
    end
  end
end
