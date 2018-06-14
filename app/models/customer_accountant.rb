class CustomerAccountant < ApplicationRecord
  belongs_to :accountant, optional: true
  belongs_to :customer, optional: true
end
