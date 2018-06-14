class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :firm_name
      t.string :firm_type
      t.string :no_of_employees
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
