class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = set_cocktail
  end

  def create
    @dose = Dose.new(params_dose)
    @dose.cocktail_id = set_cocktail.id 
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render :new
    end
  end

  def destroy
    Dose.find(params[:id]).destroy
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    Cocktail.find(params[:cocktail_id])
  end
end
