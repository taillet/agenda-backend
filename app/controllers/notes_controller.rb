class NotesController < ApplicationController
  def index
  @notes = Note.all
  render json: @notes
  end

  def create
    u = User.find(params[:user_id])
    d = Day.find_or_create_by(date: params[:day])
    t = Note.create(description: params[:description], title: params[:title],day: d, user: u)
    if params[:categories] != nil
      params[:categories].each do |category|
        if category['value'].is_a?(Integer)
          Categorynote.create(note_id: t.id, category_id: category['value'])
        elsif !category['value'].is_a?(Integer) && category['value'] != nil && category['value'] != ' ' && category['value'] != ''
          c = Category.create(name: category['label'])
          Categorynote.create(note_id: t.id, category_id: c.id)
        end
      end
    end
    render json: t
  end

  def update
    t = Note.find(params[:id])
    if params[:day] != nil
      d = Day.find_or_create_by(date: params[:day])
      t.update(day: d)
    end
    if params[:title] != nil
      t.update(title: params[:title])
    end
    if params[:description] != nil
      t.update(description: params[:description])
    end
    if params[:categories] != nil
      t.categorynotes.destroy_all if t.categorynotes
      params[:categories].each do |category|
        if category['value'].is_a?(Integer)
          Categorynote.create(note_id: t.id, category_id: category['value'])
        elsif !category['value'].is_a?(Integer) && category['value'] != nil && category['value'] != ' ' && category['value'] != ''
          c = Category.create(name: category['label'], color: '#E0FFFF')
          Categorynote.create(note_id: t.id, category_id: c.id)
        end
      end
    end
    render json: t
  end

  def destroy
  t = Note.find(params[:id])
  t.destroy
  render json: t
end

end
