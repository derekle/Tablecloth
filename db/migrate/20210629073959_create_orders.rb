class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :total
      t.boolean :ispaid
      t.references  :table
      t.references  :user
      t.text :menuitems
      t.timestamps
    end
  end
end
