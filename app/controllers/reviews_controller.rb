class ReviewsController < ApplicationController
  def index
    @review = Review.order(created_at: :asc)
    render json: { reviews: @reviews }
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      render json: { review: @review, location: review_url(@review) }, status: :created # 201
    else
      render json: { errors: @review.errors }, status: :unprocessable_entity # 422
    end
  end

  def show
    @review = Review.find(params[:id])
    render json: { review: @review }
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      render json: { review: @review }, status: :accepted # 202
    else
      render json: { errors: @review.errors }, status: :unprocessable_entity # 422
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      render json: { review: nil }, status: :accepted # 202
    else
      render json: { errors: @review.errors }, status: :unprocessable_entity # 422
    end
  end

  protected

  def review_params
    params.require( :review ).permit( :title, :rating, :description, :was_helpful )
  end
end
