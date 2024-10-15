class ChangeFlightCategoryIdNullInRecords < ActiveRecord::Migration[7.2]
  def change
    change_column_null :records, :flight_category_id, true
  end
end
