# frozen_string_literal: true

class BusinessOwner < ApplicationRecord # :nodoc:
  has_many :companies
end
