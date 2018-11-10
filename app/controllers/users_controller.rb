# frozen_string_literal: true

# ユーザーコントローラ
class UsersController < ApplicationController
  def index
    @users = User.all
  end
end
