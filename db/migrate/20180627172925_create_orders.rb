class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.boolean :is_delivered
      t.integer :nr_roses
      t.string :client_name
      t.datetime :delivery_date

      t.timestamps
    end
  end
end
