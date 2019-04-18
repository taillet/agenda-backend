class EventsController < ApplicationController
  def index
  @events = Event.all
  render json: @events
  end

  def create
    u = User.find(params[:user_id])
    s = Day.find_or_create_by(date: params[:start])
    e = Day.find_or_create_by(date: params[:end])
    t = Event.create(description: params[:description], title: params[:title], priority: params[:priority], start: s.id, end: e.id, user: u)
    if params[:categories] != nil &&  params[:categories] != []
      params[:categories].each do |category|
        if category['value'].is_a?(Integer)
          Categoryevent.create(event_id: t.id, category_id: category['value'])
        elsif !category['value'].is_a?(Integer) && category['value'] != nil && category['value'] != ' ' && category['value'] != ''
          c = Category.create(name: category['label'], color: '#E0FFFF')
          Categoryevent.create(event_id: t.id, category_id: c.id)
        end
      end
    end
    render json: t
  end


    def destroy
    t = Event.find(params[:id])
    t.destroy
    render json: t
  end
end
