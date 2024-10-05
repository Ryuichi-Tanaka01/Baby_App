class AddRecorderToRecords < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :records, :recorders, column: :recorder_id
  end
end
