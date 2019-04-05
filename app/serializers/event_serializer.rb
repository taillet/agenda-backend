class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :checked, :start, :end, :priority, :user, :day, :categories

  def user
    {id: self.object.user.id, name: self.object.user.name}
  end

  def day
    {id: self.object.day.id, date: self.object.day.date}
  end

  def categories
    categories = Categoryevent.all.select do |categoryevent|
      categoryevent.event == self.object
    end
    cats = categories.map do |cat|
     {id: cat.category_id, name: Category.find(cat.category_id).name}
    end
    return cats
  end
end
