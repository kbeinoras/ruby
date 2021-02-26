# frozen_string_literal: true

class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :products
end
