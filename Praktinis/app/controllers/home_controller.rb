# frozen_string_literal: true

# užpildo pagrindinį home langą kategorijų pavadinimais
class HomeController < ApplicationController
  def index
    @categories = Category.order(:title)
  end
end
