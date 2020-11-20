class CocktailsController < ApplicationController
  
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = set_cocktail
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_cocktail
    Cocktail.find(params[:id])
  end

  def params_cocktail
    params.require(:cocktail).permit(:name, :doses, :ingredients, :photo)
  end
end
