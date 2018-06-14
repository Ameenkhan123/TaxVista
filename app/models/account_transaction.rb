class AccountTransaction < ApplicationRecord
  belongs_to :account, optional: true
end
