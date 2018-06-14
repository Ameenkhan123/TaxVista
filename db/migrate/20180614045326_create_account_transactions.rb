class CreateAccountTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :account_transactions do |t|
      t.string :account
      t.string :transfered_to_acc
      t.string :transfered_to_name
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
