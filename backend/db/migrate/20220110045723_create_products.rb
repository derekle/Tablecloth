class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.references :store, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.float :price
      t.boolean :active

      t.timestamps
    end
  end
end
