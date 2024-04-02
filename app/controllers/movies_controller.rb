class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params.require(:movie).permit(:poster, :title, :plot, :genre_id, :release_year, :origin_country, :director_id, :status, :draft))

    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      flash[:notice] = @movie.errors.full_messages.first
      redirect_to new_movie_path
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(params.require(:movie).permit(:poster, :title, :plot, :genre_id, :release_year, :origin_country, :director_id))
      return  redirect_to movie_path
    end

    flash[:notice] = @movie.errors.full_messages.first
    redirect_to edit_movie_path
  end
end
