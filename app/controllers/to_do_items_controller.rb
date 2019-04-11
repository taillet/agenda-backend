class ToDoItemsController < ApplicationController
  def index
  @todoitems = ToDoItem.all
  render json: @todoitems
  end

  def create
    u = User.find(params[:user_id])
    d = Day.find(params[:day_id])
    t = ToDoItem.create(description: params[:description], checked: params[:checked], priority: params[:priority],day: d, user: u)
    render json: t
  end

  def update
    t = ToDoItem.find(params[:id])
    if params[:checked] != nil
      t.update(checked: params[:checked])
    end
    if params[:description] != nil
      t.update(description: params[:description])
    end
    if params[:priority] != nil
      t.update(priority: params[:priority])
    end
    if params[:categories] != nil
      t.categorytodos.destroy_all if t.categorytodos
      params[:categories].each do |category|
        if category['value'].is_a?(Integer)
          Categorytodo.create(to_do_item_id: t.id, category_id: category['value'])
        elsif !category['value'].is_a?(Integer)
          c = Category.create(name: category['label'])
          Categorytodo.create(to_do_item_id: t.id, category_id: c.id)
        end
      end
    end
    render json: t
  end

  def destroy
  t = ToDoItem.find(params[:id])
  t.destroy
  render json: t
end

def delete_all
  ToDoItem.all.each do |item|
    if item.checked == true
      item.destroy
    end
  end
end

end
