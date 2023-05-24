class BookmarksController < ApplicationController
  def new
    # On récupère l'id de la liste
    @list = List.find(params[:list_id])
    # On instancie le bookmark
    @bookmark = Bookmark.new
  end

  def create
    # On récupère l'id de la liste
    @list = List.find(params[:list_id])
    # Pas besoin de récupérer movie, il le fera dans l'instanciation,
    # On l'a mis dans les strongs params
    ## Non => @movie = Movie.find(bookmark_params[:movie_id])
    @bookmark = Bookmark.new(bookmark_params)
    # On va dire que list_id = list.id, pour qu'il l'enregistre
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      # On affiche le formulaire avec les messages d'erreur,
      # mis dans la validation des données, seront générées avec Simple_form
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
