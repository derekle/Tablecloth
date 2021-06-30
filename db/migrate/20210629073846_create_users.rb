class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :table_id
      t.integer :order_id
      t.boolean :ismanager
      t.boolean :iscook
      t.boolean :ishost
      t.boolean :iswaitstaff
      t.boolean :isbusser
      t.boolean :isbartender

      t.timestamps
    end
  end
end
