class AddColumnsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :admin, :boolean
    add_column :employees, :name, :string
  end
end
