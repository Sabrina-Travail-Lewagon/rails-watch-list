class BookmarksController < ApplicationController
  def new
    # On récupère l'id de la liste
    @list = List.find(params[:list_id])
    # On instancie le bookmark
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    # @movie = Movie.find(bookmark_params[:movie_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def index
    @bookmarks = Bookmark.all
    
  end

  def destroy
    raise
    @bookmark = Bookmark.find(params[:list_id])
    @bookmark.destroy
    redirect_to lists_path, status: :see_other
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)  # Ajoutez :movie_id à la liste des paramètres autorisés
  end
end
