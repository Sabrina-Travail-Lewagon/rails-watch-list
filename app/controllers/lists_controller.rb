class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
    ## Partie pour le formulaire d'ajout du bookmark
    # On récupère l'id de la liste
    @list = List.find(params[:id])
    # On instancie le bookmark
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(set_params_list)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_params_list
    params.require(:list).permit(:name)
  end
end
