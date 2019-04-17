class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def create
    t = Category.create(name: params[:name], color: "#ABB8C3")
    render json: t
  end

  def update
      t = Category.find(params[:id])
      t.update(color: params[:color])
    render json: t
  end

  def destroy
    t = Category.find(params[:id])
    t.destroy
    render json: t
  end
end
