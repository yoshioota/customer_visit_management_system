class CreateVisitHistories < ActiveRecord::Migration
  def change
    create_table :visit_histories do |t|
      t.integer :customer_id, null: false
      t.integer :visited_employee_id, null: false
      t.datetime :visited_at, null: false
      t.text :memo, null: false
      t.datetime :next_visit_at

      t.timestamps
    end

    add_index :visit_histories, :customer_id
    add_index :visit_histories, :visited_employee_id
  end
end
