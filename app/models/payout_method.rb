# frozen_string_literal: true

class PayoutMethod < ApplicationRecord # :nodoc:
  enum method_type: {
    bank_transfer: 0,
    stripe: 10,
    razorpay_x: 20,
  }

  belongs_to :company
  has_many :payments
end
