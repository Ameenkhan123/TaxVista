class Account < ApplicationRecord
  belongs_to :customers, optional: true
  has_many :account_transactions
end
