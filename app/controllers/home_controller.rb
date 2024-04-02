class HomeController < ApplicationController
  def index
    movies = Movie.all
    @released_movies = movies.filter do |movie| (movie.draft == 'Postado') && (movie.status == 'Lançado') end
    @unreleased_movies = movies.filter do |movie| (movie.draft == 'Postado') && (movie.status == 'Em breve') end
  end
end
