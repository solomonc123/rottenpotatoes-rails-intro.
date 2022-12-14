class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
		#think it works
    @all_ratings = Movie.all_ratings

    if params[:home] == nil
      @sort = session[:sort]
      @ratings_to_show = session[:ratings_to_show]
      redirect_to movies_path(:sort=>@sort, :ratings=>(@ratings_to_show),:home =>"1")
    else
      @ratings_to_show = []
      if params[:ratings] != nil
				@ratings_to_show = params[:ratings].keys
        # params[:ratings].each do |key,value|
        #   @ratings_to_show.append(key)
        # end
      end
      @movies = Movie.with_ratings(@ratings_to_show)

      if params[:sort] == 'title'
        @sort = 'title'
        @title_header = 'hilite p-3 mb-2 bg-warning text-dark'
        @movies = Movie.sortTitle(@ratings_to_show)
      end

      if params[:sort] == 'release_date'
        @sort = 'release_date'
        @release_date_header = 'hilite p-3 mb-2 bg-warning text-dark'
        @movies = Movie.sortDate(@ratings_to_show)
      end

      session[:sort] = @sort
      session[:ratings_to_show] = @ratings_to_show
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end
