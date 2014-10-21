class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.text :address
      t.string :tel
      t.text :memo

      t.timestamps
    end
  end
end
