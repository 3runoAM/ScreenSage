class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @movies = Movie.where(genre: @genre).where(draft: 0)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params.require(:genre).permit(:name))

    if @genre.save
      flash[:notice] = "Novo gênero criado."
      redirect_to new_genre_path
    else
      flash[:notice] = @genre.errors.full_messages.first
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(params.require(:genre).permit(:name))
      redirect_to genre_path
    else
      flash[:notice] = @genre.errors.full_messages.first
      redirect_to edit_genre_path(@genre.id)
    end
  end
end