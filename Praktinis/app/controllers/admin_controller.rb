# frozen_string_literal: true

# Administratoriaus controller skirtas atlikti funkcijoms
class AdminController < ApplicationController
  protect_from_forgery with: :null_session

  @global_group = User.all
  def admin_group_update
    @msg = params[:message]
  end

  def admin_page
    @categories = Category.order(:title)
  end

  def user_display
    @users = User.all
    @msg = params[:message]
  end

  def query_users_action
    users = User.find_by(id: params[:id])
    raktazodis = params[:raktazodis]
    users = User.all
    @found_users = []
    if raktazodis.nil?
      @found_users = User.all
    else
      (0..users.length - 1).each do |i|
        @found_users.append(users[i]) if users[i].username.include? raktazodis
      end
    end
    redirect_to controller: 'admin', action: 'user_display', message: @found_users
  end

  # perziuroje spaudziamas Delete mygtukas
  def delete_user_action
    msg = params[:id]
    user = User.find_by(id: msg)
    user_to_delete = msg
    user.destroy
    redirect_to controller: 'admin', action: 'user_display', message: "#{user_to_delete} istrinta."
  end

  def item_display
    @category_list = Category.all
    @products = Product.all
    @msg = params[:message]
  end

  def query_items_action
    category = Category.find_by(id: params[:pasirinkta_kategorija])
    raktazodis = params[:raktazodis]
    products = Product.all
    @found_products = []
    if category.nil?
      if raktazodis.nil?
        @found_products = Product.all
      else
        (0..products.length - 1).each do |i|
          @found_products.append(products[i]) if products[i].title.include? raktazodis
        end
      end
    elsif raktazodis == ''
      (0..products.length - 1).each do |i|
        @found_products.append(products[i]) if products[i].category_id == category.id
      end
    else
      (0..products.length - 1).each do |i|
        if products[i].vardas.to_s.include?(raktazodis.to_s) && products[i].group_id == grupe.id
          @found_products.append(products[i])
        end
      end
    end
    redirect_to controller: 'admin', action: 'item_display', message: @found_products
  end

  def item_update
    @msg = params[:message]
    @category_list = Category.all
    @product_id = Product.find_by(id: @msg)
    @product_category = Category.find_by(id: @product_id.category_id)
  end

  def update_item_action
    redirect_to controller: 'admin', action: 'item_update', message: params[:id]
  end

  def update_item_to_db
    item = Product.find_by(id: params[:item_id])
    response = item.update_product(params[:item_id], params[:title], params[:category_id], params[:price],
                                   params[:description])
    redirect_to controller: 'admin', action: 'item_display', message: response
  end

  # perziuroje spaudziamas Delete mygtukas
  def delete_item_action
    msg = params[:id]
    item = Product.find_by(id: msg)
    item_to_delete = msg
    item.destroy
    redirect_to controller: 'admin', action: 'item_display', message: "#{item_to_delete} istrinta."
  end

  def item_new
    @msg = params[:message]
    @products = Product.all
    @category_list = Category.all
    @product_id = Product.find_by(id: @msg)
  end

  def new_item_to_db
    prod = Product.new
    response = prod.new_product(params[:title], params[:category_id], params[:price], params[:description])
    redirect_to controller: 'admin', action: 'item_display', message: response
  end
end
