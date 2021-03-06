class UsersController < ApplicationController
  before_filter :authenticate

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    authorize! :show, User, :message => 'Not authorized as an administrator.'
  end

end