class CreateSakes < ActiveRecord::Migration[5.2]
  def change
    create_table :sakes do |t|
      t.string :name
      t.text :picture
      t.integer :price
      t.text :comment
      t.timestamps
    end
  end
end
