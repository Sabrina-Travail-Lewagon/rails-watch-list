class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # On récupère la liste des films
    @movies = @list.movies
    ## Partie pour le formulaire d'ajout du review
    # On récupère l'id de la liste
    # @list = List.find(params[:id])
    # On instancie la review
    @review = Review.new
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
    params.require(:list).permit(:name, :photo)
  end
end
