class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :status
      t.integer :order_id
      t.integer :menuitem_id
      t.integer :user_id

      t.timestamps
    end
  end
end
