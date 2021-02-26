# frozen_string_literal: true

# leidžia atlikti funkcijas susijusias su duomenu baze ir produktais
class Product < ApplicationRecord
  self.table_name = 'products'
  validates :title, presence: true

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories, dependent: :destroy

  def update_product(item_id, title, category_id, price, description)
    produktas = Product.find_by(id: item_id)
    produktas.update_columns(title: title, description: description, price: price, category_id: category_id)
    'dp'
  end

  def new_product(title, category_id, price, description)
    user = Product.new(title: title, description: description, price: price, category_id: category_id)
    user.save
  end
end
