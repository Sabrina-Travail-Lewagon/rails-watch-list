class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    # On a besoin de récupérer l'id de la liste
    @list = List.find(params[:list_id])
    # On va mettre la valeur de l'id de la liste dans l'instance
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render "lists/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
