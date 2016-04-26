class UsersController < ApplicationController
  def index
    @users = User.order(name: :asc)
    render json: { users: @users }
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: { user: @user, location: user_url(@task) }, status: :created # 201
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity # 422
    end
  end

  def show
    @user = User.find(params[:id])
    render json: { user: @user }
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: { user: @user }, status: :accepted # 202
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity # 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: { user: nil }, status: :accepted # 202
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity # 422
    end
  end

  protected

  def user_params
    params.require( :user ).permit( :name, :email, :password )
  end

end
