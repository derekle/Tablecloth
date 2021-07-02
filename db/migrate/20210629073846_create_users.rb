class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.integer :table_id
      t.integer :order_id
      t.string :employee_type
      t.timestamps
    end
  end
end
