class CreateFlightCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :flight_categories do |t|
      t.string :color

      t.timestamps
    end
  end
end
