class CreateRecorders < ActiveRecord::Migration[7.2]
  def change
    create_table :recorders do |t|
      t.string :name, limit: 255, null: false  # nameカラムを追加
      t.timestamps
    end
  end
end
