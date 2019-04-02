class ToDoItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :checked, :start, :end, :priority, :user, :day, :categories

  def user
    {id: self.object.user.id, name: self.object.user.name}
  end

  def day
    {id: self.object.day.id, date: self.object.day.date}
  end

  def categories
    categories = Categorytodo.all.select do |categorytodo|
      categorytodo.to_do_item == self.object
    end
    cats = categories.map do |cat|
     {id: cat.category_id, name: Category.find(cat.category_id).name}
    end
    return cats
  end
end
