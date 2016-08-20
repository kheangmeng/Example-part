class MoviesController < ApplicationController
	before_action :set_movie, except: [:index,:new,:create]
  def index
#	@times = Time.new
#	@movies = ["Iron Man", "Superman", "Spider-Man","Bat-Man"]
	@movies = Movie.upcomming
  end	
  def new
  	@movie = Movie.new
  end
  def create

  	@movie = Movie.new(movie_params)
  	if @movie.save()
  		redirect_to @movie
  	else
  		render 'new'
  	end
  end

  def show
 # 	@movie = Movie.find(params[:id])
  end
  def edit
 # 	@movie = Movie.find(params[:id])
  end
  def update
 # 	@movie = Movie.find(params[:id])
  	#@move.update(params[:movie]) # anonymous can put more field to form submit
 # 	movie_params = params.require(:movie).
 # 								permit(:title,:total_gross,:rating,:description,:released_on)
  	if	@movie.update(movie_params)
  #	render "show"
  		redirect_to movie_path(@movie) #redirect_to @movie
  	else
  		redirect_to new
  	end
  end

  def destroy
  	@movie.destroy
  	redirect_to movies_path
  end
  private
  	def set_movie
  		@movie = Movie.find(params[:id])
  	end
  	def movie_params
  		  	movie_params = params.require(:movie).
  								permit(:title,:total_gross,:rating,:description,:released_on,:duration,:image_file_name,:cast,:director)
  	end
end
