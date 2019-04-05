class ToDoItemsController < ApplicationController
  def index
  @todoitems = ToDoItem.all
  render json: @todoitems
  end

  def create
    u = User.find(params[:user_id])
    d = Day.find(params[:day_id])
    t = ToDoItem.create(description: params[:description], checked: params[:checked], priority: params[:priority],day: d, user: u)
    Categorytodo.find_or_create_by(to_do_item_id: t.id,category_id: params[:category_id])
    render json: t
  end

private
end
