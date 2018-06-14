class CreateCustomerAccountants < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_accountants do |t|
      t.references :accountant, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
