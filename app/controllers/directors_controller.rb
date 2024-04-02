class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
    @movies = Movie.where(director_id: params[:id]).where(draft: 0)
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(params.require(:director).permit(:name, :nationality, :birth_date, :favorite_genre_id))

    if @director.save
      redirect_to director_path(@director.id)
    else
      flash[:notice] = @director.errors.full_messages.first
      redirect_to new_director_path
    end
  end
  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])

    if @director.update(params.require(:director).permit(:name, :nationality, :birth_date, :favorite_genre_id))
      redirect_to director_path(@director.id)
    else
      flash[:notice] = @director.errors.full_messages.first
      redirect_to edit_director_path
    end

  end
end
