class Invoice < ApplicationRecord

  enum status: {
    draft: 0,
    queued_for_processing: 10,
    approved: 20,
    completed: 90,
    rejected: 100,
  }

  belongs_to :company
  has_many :payments
end
