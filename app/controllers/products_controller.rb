class ProductsController < ApplicationController
  def index
    @products = Product.order(created_at: :asc)
    render json: { products: @product }
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: { product: @product, location: product_url(@product) }, status: :created # 201
    else
      render json: { errors: @product.errors }, status: :unprocessable_entity # 422
    end
  end

  def show
    @product = Product.find(params[:id])
    render json: { product: @product }
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      render json: { product: @product }, status: :accepted # 202
    else
      render json: { errors: @product.errors }, status: :unprocessable_entity # 422
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      render json: { task: nil }, status: :accepted # 202
    else
      render json: { errors: @product.errors }, status: :unprocessable_entity # 422
    end
  end

  protected

  def task_params
    params.require( :product ).permit( :name, :description, :average_rating )
  end

end
