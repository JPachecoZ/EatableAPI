class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :category
      t.text :description
      t.string :picture_url

      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
