class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.datetime :date
      t.string :company
      t.decimal :tax,  precision: 8, scale: 2 
      t.string :salesperson

      t.timestamps null: false
    end
  end
end
