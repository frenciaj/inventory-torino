class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :nombre
      t.integer :espesor
      t.string :material
      t.integer :quantity

      t.timestamps
    end
  end
end
