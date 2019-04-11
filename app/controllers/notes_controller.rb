class NotesController < ApplicationController
  def index
  @notes = Note.all
  render json: @notes
  end

  def create
    u = User.find(params[:user_id])
    d = Day.find(params[:day_id])
    t = Note.create(description: params[:description], title: params[:title],day: d, user: u)
    Categorynote.find_or_create_by(note_id: t.id,category_id: params[:category_id])
    render json: t
  end

  def update
    t = Note.find(params[:id])
    if params[:title] != nil
      t.update(title: params[:title])
    end
    if params[:description] != nil
      t.update(description: params[:description])
    end
    if params[:day] != nil
      t.update(day: params[:day])
    end
    render json: t
  end

  def destroy
  t = Note.find(params[:id])
  t.destroy
  render json: t
end

end
