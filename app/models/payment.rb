# frozen_string_literal: true

class Payment < ApplicationRecord # :nodoc:

  enum status: {
    processing: 0,
    completed: 10,
    failed: 90,
  }

  belongs_to :payout_method
  belongs_to :company
  belongs_to :invoice
end
