# frozen_string_literal: true

class User < ApplicationRecord
  self.table_name = 'users'

  validates :id, presence: true
  validates :username, presence: true
  validates :password, length: { in: 6..20 }
  validates :user_type, length: { is: 0 }

  def authentification(given_username, given_password)
    user = User.find_by(username: given_username, password: given_password)
    if !user.nil?
      user
    else
      user
    end
  end

  def register_user(username, password, password2)
    user = User.find_by(username: username)
    if !user.nil?
      'Toks naudotojas jau egzistuoja'
    elsif password == password2
      usercount = User.count
      user = User.new(id: usercount + 1, username: username, password: password, user_type: '')
      user.save 'Naudotojas issaugotas'
    else
      'Slaptazodziai nesutapo'
    end
  end
end
