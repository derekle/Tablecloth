class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :total
      t.boolean :ispaid

      t.timestamps
    end
  end
end
