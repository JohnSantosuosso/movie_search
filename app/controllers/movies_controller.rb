class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: movies
  end

  def create
    movie = Movie.create(movie_param)
    render json: movie
  end

  def update
    movie = Movie.find(params[:id])
    render json: movie
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    head :no_content, status: :ok
  end

  private
    def movie_param
      params.requrie(:movie).permit(:name, rating)
    end
end
