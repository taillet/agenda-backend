class ToDoItemsController < ApplicationController
  def index
  @todoitems = ToDoItem.all
  render json: @todoitems
  end
end
