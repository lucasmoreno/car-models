class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string  :name,          null: false
      t.integer :webmotors_id,  null: false

      t.timestamps null: false
    end
  end
end
