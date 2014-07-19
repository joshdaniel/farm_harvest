class CreateCrops < ActiveRecord::Migration
  def change
    create_table :crops do |t|
      t.string :name
      t.float :quantity
      t.string :unit_type
      t.string :comments

      t.timestamps
    end
  end
end
