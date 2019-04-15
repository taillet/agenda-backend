class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :checked, :start, :end, :priority, :user, :categories

  def user
    {id: self.object.user.id, name: self.object.user.name}
  end

  def start
    s = Day.find_by(id: self.object.start)
    return {id: s.id, date: s.date}
  end

  def end
    e = Day.find_by(id: self.object.end)
    return {id: e.id, date: e.date}
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
