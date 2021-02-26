# frozen_string_literal: true

# Naudotojo controller skirtas tiek autentifikuoti asmenį tiek ir užpildyti informaciją
class UserController < ApplicationController
  skip_before_action :verify_authenticity_token

  # prisijungimai/atsijungimai
  def login
    @msg = params[:message]
  end

  # prisijungimas
  def login_user
    user = User.new
    response = user.authentification(params[:username], params[:password]) # autentifikuoja, jei rastas, proceed
    if response.nil?
      redirect_to controller: 'user', action: 'login', message: 'nil'
    elsif User.find_by(user_type: response['user_type'].to_s).user_type == 'admin'
      session[:user] = response
      redirect_to controller: 'admin', action: 'admin_page', message: 'admin' # jei naudotojas grupes admin narys
    else
      session[:user] = response
      redirect_to controller: 'user', action: 'user_page', message: 'user'
    end
  end

  def user_page
    @categories = Category.order(:title)
  end

  # kai spaudziamas mygtukas registruoti naudotoja
  def create_user_action
    user = User.new
    response = user.register_user(params[:username], params[:password], params[:password2])
    redirect_to controller: 'user', action: 'user_register', message: response
  end

  # atsijungimas
  def logout
    session[:user] = nil
    redirect_to controller: 'home', action: 'index', message: 'Atsijungta'
  end

  def user_cart
    @orders = Order.all
    @msg = params[:message]
  end
end
