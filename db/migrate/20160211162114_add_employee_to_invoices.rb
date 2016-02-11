class AddEmployeeToInvoices < ActiveRecord::Migration
  def change
  	add_column :invoices, :employee_id, :integer
  end
end
