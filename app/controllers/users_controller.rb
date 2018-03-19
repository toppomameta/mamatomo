class UsersController < ApplicationController
  def index
    # @customers = Customer.page(params[:page])

# 下記の2行に変更
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
       if  @user.save
         redirect_to @user
       else
         render :new
       end
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if  @user.update(customer_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(
      :family_name,
      :given_name,
      :email
      )
  end
end
