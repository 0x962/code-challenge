# frozen_string_literal: true

class Company < ApplicationRecord # :nodoc:
  has_rich_text :description

  belongs_to :business_owner
  has_many :payout_methods
  has_many :payments
  has_many :invoices

  accepts_nested_attributes_for :business_owner

  def location
    [line1, line2, city, state, zip_code].compact.join(", ")
  end

  def generate_test_invoices
    return if invoices.any?

    5.times do
      Invoice.create(company: self, amount:  rand(1...10000), status: Invoice.statuses[:draft])
    end
  end

end
