class CreateCustomersEmployees < ActiveRecord::Migration
  def change
    create_table :customers_employees do |t|
      t.references :customer, null: false
      t.references :employee, null: false

      t.timestamps
    end

    add_index :customers_employees, [:customer_id, :employee_id], unique: true
  end
end
