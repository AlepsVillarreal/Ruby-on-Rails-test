class UsersController < ApplicationController
  before_action :authenticate_user! #Para que no cualquier usuario pueda ver los usuarios. Ahora tienes que estar loggeado
  
  def index
    @users = User.includes(:profile)
  end
  
  # GET to /users/:id
  def show
    @user = User.find( params[:id] )
  end
end
