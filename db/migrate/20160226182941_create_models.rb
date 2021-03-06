class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.references  :manufacturer,  null: false, index: true, foreign_key: true
      t.string      :name,          null: false

      t.timestamps null: false
    end
  end
end
